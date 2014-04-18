/* File: codegen.cc
 * ----------------
 * Implementation for the CodeGenerator class. The methods don't do anything
 * too fancy, mostly just create objects of the various Tac instruction
 * classes and append them to the list.
 */

#include "codegen.h"
#include <cstring>
#include "tac.h"
#include "mips.h"
#include "ast_decl.h"
#include "errors.h"


void CodeGenerator::PopulateRegMap()
{
    int offset_t0 = static_cast<int>(Mips::t0);
    for (int i = 0; i < code->NumElements(); i++) {
        Instruction *ins = code->Nth(i);
        memset(ins->register_map, 0, sizeof(Reg_map));
        for (Location *v: in[i]) {
            int r = static_cast<int>(v->GetRegister());
            ins->register_map[r - offset_t0] = v;
        }
    }
}

void CodeGenerator::MarkSuccessor()
{
    int len = code->NumElements();
    bool in_func = false;
    delete[] succ;
    succ = new std::unordered_set<int>[len];
    PopulateLabelTable();
    for (int i = 0; i < len - 1; i++) {
        Instruction *line = code->Nth(i);
        if (in_func) {
            if (line->IsEndFunc()) {
                in_func = false; // EndFunc has no successors
            } else if (line->IsGoto()) {
                Goto *g = static_cast<Goto*>(line);
                const char *lbl = g->GetLabel();
                succ[i].insert(labelTable->Lookup(lbl));
            } else if (line->IsIfz()) {
                IfZ *g = static_cast<IfZ*>(line);
                const char *lbl = g->GetLabel();
                succ[i].insert(labelTable->Lookup(lbl));
                succ[i].insert(i + 1);
            } else {
                succ[i].insert(i + 1);
            }
        } else if (line->IsBeginFunc()) {
            in_func = true;
            succ[i].insert(i + 1);
        }
    }
}

// assume that set1 and set2 are sorted
static void Set_Union(std::vector<Location *> &set1, std::vector<Location *> &set2,
        std::vector<Location *> &result)
{
    result.clear();
    result.resize(set1.size()+set2.size());
    std::vector<Location*>::iterator it;
    it = std::set_union(set1.begin(), set1.end(), set2.begin(), set2.end(),
            result.begin());
    result.resize(it-result.begin());
}

static void Set_Diff(std::vector<Location *> &set1, std::vector<Location *> &set2,
        std::vector<Location *> &result)
{
    result.clear();
    result.resize(set1.size());
    std::vector<Location *>::iterator it;
    it = std::set_difference(set1.begin(), set1.end(), set2.begin(), set2.end(),
            result.begin());
    result.resize(it-result.begin());
}

static bool operator == (const std::vector<Location*> &op1,
        const std::vector<Location *> &op2)
{
    if(op1.size() != op2.size()) {
        return false;
    }else {
        return std::equal(op1.cbegin(), op1.cend(), op2.cbegin());
    }
}

void CodeGenerator::_LivenessAnalysis(int start_line, int end_line)
{
    bool changed = true;
    while(changed) {
        changed = false;
        // OUT[tac]=Union(IN[SUCC(tac)])
        for(int i = start_line; i <= end_line; ++i) {
            std::vector<Location*> tmp, tmp_res; 
            for(auto it = succ[i].begin(); it != succ[i].end(); ++it) {
                Set_Union(tmp, in[*it], tmp_res);
                tmp.assign(tmp_res.begin(), tmp_res.end());
            }
            out[i].assign(tmp_res.begin(), tmp_res.end());
            // IN'=OUT-KILL+GEN
            std::vector<Location*> tmp_in;
            Instruction *ins = code->Nth(i);
            Location *dst = ins->GetDst();
            if(dst != NULL && kill[i].empty()) {
                kill[i].push_back(dst);
            }
            Location *acc1 = ins->GetAccess1();
            Location *acc2 = ins->GetAccess2();
            std::vector<Location *> gen;
            if(acc1 != NULL) {
                gen.push_back(acc1);
            }
            if(acc2 != NULL) {
                gen.push_back(acc2);
            }
            std::sort(gen.begin(), gen.end());
            Set_Diff(out[i], kill[i], tmp_res);
            Set_Union(tmp_res, gen, tmp_in);
            if(!(tmp_in == in[i])) {
                in[i].assign(tmp_in.begin(), tmp_in.end());
                changed = true;
            }
        }
    }
}

void CodeGenerator::LivenessAnalysis()
{
    delete[] in;
    delete[] out;
    delete[] kill;
    int len = code->NumElements();
    in = new std::vector<Location*>[len];
    out = new std::vector<Location*>[len];
    kill = new std::vector<Location*>[len];
    bool in_func = false;
    int start_line = 0, end_line = 0;
    /* locate a function and do liveness analysis inside each function */
    for(int i = 0; i < len; ++i) {
        Instruction *ins = code->Nth(i);
        if(in_func) {
            if (ins->IsEndFunc()) {
                in_func = false;
                end_line = i;
                // liveness analysis for one function
                _LivenessAnalysis(start_line, end_line);
            }
        }else if(ins->IsBeginFunc()) {
            in_func = true;
            start_line = i;
        }
    }
}

/* Return constructed graph for the function */
CodeGenerator::InterferenceGraph* CodeGenerator::
        _BuildInterferenceGraph(int start_line, int end_line)
{
    InterferenceGraph *graph = new InterferenceGraph;
    for(int i = start_line; i <= end_line; ++i) {
        Instruction *ins = code->Nth(i);
        std::vector<Location *> inter_set;
        Set_Union(out[i], kill[i], inter_set);
        // for each pair of nodes in inter_set add edges between them
        int len = (int)inter_set.size();
        for(int j = 0; j < len; ++j) {
            for(int k = j+1; k < len; ++k) {
                auto it = graph->find(inter_set[j]);
                if(it == graph->end()) {
                    std::list<Location *> neigh = {inter_set[k]};
                    graph->insert(std::make_pair(inter_set[j], neigh));
                }else
                {
                    it->second.push_back(inter_set[k]);
                }
                auto it2 = graph->find(inter_set[k]);
                if(it2 == graph->end()) {
                    std::list<Location *> neigh = {inter_set[j]};
                    graph->insert(std::make_pair(inter_set[k], neigh));
                }else {
                    it2->second.push_back(inter_set[j]);
                }
            }
        }
    }
    return graph;
}

void CodeGenerator::_RegisterAlloc(InterferenceGraph *graph,
        int start_line, int end_line)
{
    std::unordered_map<Location *, std::list<Location*> > remove_list;
    std::stack<Location *> node_stk;
    int k = Mips::NumGeneralPurposeRegs;
    while(graph->size() > 0)
    {
        auto max_edge_var = graph->end();
        int max_edge = 0;
        auto it = graph->begin();
        for(; it != graph->end(); ++it) {
            int effective_size = 0; // number of edges not removed
            for (auto it_lst = it->second.begin(); it_lst != it->second.end();
                    ++it_lst) {
                if(remove_list.find(*it_lst) == remove_list.end()) {
                    effective_size++;
                }
            }
            if(effective_size < k) {
                break;
            }else {
                if(effective_size > max_edge) {
                    max_edge_var = it;
                    max_edge = effective_size;
                }
            }
        }

        auto node_to_remove = graph->end();
        if (it != node_to_remove) {
            node_to_remove = it;
        }else {
            node_to_remove = max_edge_var;
        }
        // push the node to stack and remove all relevant edges
        remove_list.insert(std::make_pair(node_to_remove->first, node_to_remove->second));
        node_stk.push(node_to_remove->first);
        graph->erase(node_to_remove);
    }

    // in the order of the stack add nodes and edges back
    int t0 = static_cast<int>(Mips::t0);
    std::unordered_set<int> gen_reg_set;
    for(int i = t0; i<k; ++i) {
        gen_reg_set.insert(i);
    }
    while(!node_stk.empty()) {
        Location *node = node_stk.top();
        node_stk.pop();
        auto it = remove_list.find(node);
        Assert(it != remove_list.end());
        graph->insert(std::make_pair(node, it->second));
        // find a reg that is not used by the current neighbors that are
        // allocated with registers
        std::unordered_set<int> tmp_reg(gen_reg_set);
        for(auto it_lst = it->second.begin(); it_lst!=it->second.end(); ++it_lst) {
            auto it_neigh = graph->find(*it_lst);
            if(it_neigh != graph->end() && it_neigh->first->GetRegister()) {
                Mips::Register reg = it_neigh->first->GetRegister();
                auto it_reg = tmp_reg.find(static_cast<int>(reg));
                if(it_reg != tmp_reg.end()) {
                    tmp_reg.erase(it_reg);
                }
            }
        }
        // allocate register
        if(!tmp_reg.empty()) {
            // pick a free reg from regs left
            node->SetRegister(static_cast<Mips::Register>(*tmp_reg.begin()));
        }//else spilled
        remove_list.erase(it);
    }
}

void CodeGenerator::GraphColoring()
{
    bool in_func = false;
    int start_line = 0, end_line = 0;
    /* locate a function and do liveness analysis inside each function */
    for(int i = 0; i < code->NumElements(); ++i) {
        Instruction *ins = code->Nth(i);
        if(in_func) {
            if (ins->IsEndFunc()) {
                in_func = false;
                end_line = i;
                InterferenceGraph *graph = 
                    _BuildInterferenceGraph(start_line, end_line);
                _RegisterAlloc(graph, start_line, end_line);
                delete graph;
            }
        }else if(ins->IsBeginFunc()) {
            in_func = true;
            start_line = i;
        }
    }
}

void CodeGenerator::Optimise()
{
    MarkSuccessor();
    LivenessAnalysis();
    GraphColoring();
    PopulateRegMap();
}

CodeGenerator::CodeGenerator() :
    labelTable(NULL), succ(NULL), in(NULL), out(NULL), kill(NULL)
{
    code = new List<Instruction*>();
    curGlobalOffset = 0;
}

void CodeGenerator::PopulateLabelTable()
{
    delete labelTable;
    labelTable = new Hashtable<int>;

    for(int i = 0; i < code->NumElements(); ++i) {
        Instruction * ins = code->Nth(i);
        Label *lb = dynamic_cast<Label*>(ins);
        if(lb){
            labelTable->Enter(lb->GetLabel(), i);
        }
    }
}

char *CodeGenerator::NewLabel()
{
    static int nextLabelNum = 0;
    char temp[10];
    sprintf(temp, "_L%d", nextLabelNum++);
    return strdup(temp);
}


Location *CodeGenerator::GenTempVar()
{
    static int nextTempNum;
    char temp[10];
    Location *result = NULL;
    sprintf(temp, "_tmp%d", nextTempNum++);
    return GenLocalVariable(temp);
}


Location *CodeGenerator::GenLocalVariable(const char *varName)
{
    curStackOffset -= VarSize;
    return new Location(fpRelative, curStackOffset+4,  varName);
}

Location *CodeGenerator::GenGlobalVariable(const char *varName)
{
    curGlobalOffset += VarSize;
    return new Location(gpRelative, curGlobalOffset -4, varName);
}


Location *CodeGenerator::GenLoadConstant(int value)
{
    Location *result = GenTempVar();
    code->Append(new LoadConstant(result, value));
    return result;
}

Location *CodeGenerator::GenLoadConstant(const char *s)
{
    Location *result = GenTempVar();
    code->Append(new LoadStringConstant(result, s));
    return result;
}

Location *CodeGenerator::GenLoadLabel(const char *label)
{
    Location *result = GenTempVar();
    code->Append(new LoadLabel(result, label));
    return result;
}


void CodeGenerator::GenAssign(Location *dst, Location *src)
{
    code->Append(new Assign(dst, src));
}


Location *CodeGenerator::GenLoad(Location *ref, int offset)
{
    Location *result = GenTempVar();
    code->Append(new Load(result, ref, offset));
    return result;
}

void CodeGenerator::GenStore(Location *dst,Location *src, int offset)
{
    code->Append(new Store(dst, src, offset));
}


Location *CodeGenerator::GenBinaryOp(const char *opName, Location *op1,
                                     Location *op2)
{
    Location *result = GenTempVar();
    code->Append(new BinaryOp(BinaryOp::OpCodeForName(opName), result, op1, op2));
    return result;
}


void CodeGenerator::GenLabel(const char *label)
{
    code->Append(new Label(label));
}

void CodeGenerator::GenIfZ(Location *test, const char *label)
{
    code->Append(new IfZ(test, label));
}

void CodeGenerator::GenGoto(const char *label)
{
    code->Append(new Goto(label));
}

void CodeGenerator::GenReturn(Location *val)
{
    code->Append(new Return(val));
}


BeginFunc *CodeGenerator::GenBeginFunc(FnDecl *fn)
{
    List<VarDecl*> *formals = fn->GetFormals();
    BeginFunc *result = new BeginFunc(fn);
    code->Append(insideFn = result);
    int start = OffsetToFirstParam;
    if (fn->IsMethodDecl()) start += VarSize;
    for (int i = 0; i < formals->NumElements(); i++)
        formals->Nth(i)->rtLoc = new Location(fpRelative, i*VarSize + start, formals->Nth(i)->GetName());
    curStackOffset = OffsetToFirstLocal;
    return result;
}

void CodeGenerator::GenEndFunc()
{
    code->Append(new EndFunc());
    insideFn->SetFrameSize(OffsetToFirstLocal-curStackOffset);
    insideFn = NULL;
}

void CodeGenerator::GenPushParam(Location *param)
{
    code->Append(new PushParam(param));
}

void CodeGenerator::GenPopParams(int numBytesOfParams)
{
    Assert(numBytesOfParams >= 0 && numBytesOfParams % VarSize == 0); // sanity check
    if (numBytesOfParams > 0)
        code->Append(new PopParams(numBytesOfParams));
}

Location *CodeGenerator::GenLCall(const char *label, bool fnHasReturnValue)
{
    Location *result = fnHasReturnValue ? GenTempVar() : NULL;
    code->Append(new LCall(label, result));
    return result;
}

Location *CodeGenerator::GenFunctionCall(const char *fnLabel, List<Location*> *args, bool hasReturnValue)
{
    for (int i = args->NumElements()-1; i >= 0; i--) // push params right to left
        GenPushParam(args->Nth(i));
    Location *result = GenLCall(fnLabel, hasReturnValue);
    GenPopParams(args->NumElements()*VarSize);
    return result;
}

Location *CodeGenerator::GenACall(Location *fnAddr, bool fnHasReturnValue)
{
    Location *result = fnHasReturnValue ? GenTempVar() : NULL;
    code->Append(new ACall(fnAddr, result));
    return result;
}

Location *CodeGenerator::GenMethodCall(Location *rcvr,
                                       Location *meth, List<Location*> *args, bool fnHasReturnValue)
{
    for (int i = args->NumElements()-1; i >= 0; i--)
        GenPushParam(args->Nth(i));
    GenPushParam(rcvr);	// hidden "this" parameter
    Location *result= GenACall(meth, fnHasReturnValue);
    GenPopParams((args->NumElements()+1)*VarSize);
    return result;
}


static struct _builtin {
    const char *label;
    int numArgs;
    bool hasReturn;
} builtins[] =
{{"_Alloc", 1, true},
    {"_ReadLine", 0, true},
    {"_ReadInteger", 0, true},
    {"_StringEqual", 2, true},
    {"_PrintInt", 1, false},
    {"_PrintString", 1, false},
    {"_PrintBool", 1, false},
    {"_Halt", 0, false}};

Location *CodeGenerator::GenBuiltInCall(BuiltIn bn,Location *arg1, Location *arg2)
{
    Assert(bn >= 0 && bn < NumBuiltIns);
    struct _builtin *b = &builtins[bn];
    Location *result = NULL;

    if (b->hasReturn) result = GenTempVar();
    // verify appropriate number of non-NULL arguments given
    Assert((b->numArgs == 0 && !arg1 && !arg2)
           || (b->numArgs == 1 && arg1 && !arg2)
           || (b->numArgs == 2 && arg1 && arg2));
    if (arg2) code->Append(new PushParam(arg2));
    if (arg1) code->Append(new PushParam(arg1));
    code->Append(new LCall(b->label, result));
    GenPopParams(VarSize*b->numArgs);
    return result;
}


void CodeGenerator::GenVTable(const char *className, List<const char *> *methodLabels)
{
    code->Append(new VTable(className, methodLabels));
}


void CodeGenerator::DoFinalCodeGen()
{
    Optimise();
    if (IsDebugOn("tac")) { // if debug don't translate to mips, just print Tac
        for (int i = 0; i < code->NumElements(); i++)
            code->Nth(i)->Print();
    }  else {
        Mips mips;
        mips.EmitPreamble();
        for (int i = 0; i < code->NumElements(); i++)
            code->Nth(i)->Emit(&mips);
    }
}



Location *CodeGenerator::GenArrayLen(Location *array)
{
    return GenLoad(array, -4);
}

Location *CodeGenerator::GenNew(const char *vTableLabel, int instanceSize)
{
    Location *size = GenLoadConstant(instanceSize);
    Location *result = GenBuiltInCall(Alloc, size);
    Location *vt = GenLoadLabel(vTableLabel);
    GenStore(result, vt);
    return result;
}


Location *CodeGenerator::GenDynamicDispatch(Location *rcvr, int vtableOffset, List<Location*> *args, bool hasReturnValue)
{
    Location *vptr = GenLoad(rcvr); // load vptr
    Assert(vtableOffset >= 0);
    Location *m = GenLoad(vptr, vtableOffset*4);
    return GenMethodCall(rcvr, m, args, hasReturnValue);
}

// all variables (ints, bools, ptrs, arrays) are 4 bytes in for code generation
// so this simplifies the math for offsets
Location *CodeGenerator::GenSubscript(Location *array, Location *index)
{
    Location *zero = GenLoadConstant(0);
    Location *isNegative = GenBinaryOp("<", index, zero);
    Location *count = GenLoad(array, -4);
    Location *isWithinRange = GenBinaryOp("<", index, count);
    Location *pastEnd = GenBinaryOp("==", isWithinRange, zero);
    Location *outOfRange = GenBinaryOp("||", isNegative, pastEnd);
    const char *pastError = NewLabel();
    GenIfZ(outOfRange, pastError);
    GenHaltWithMessage(err_arr_out_of_bounds);
    GenLabel(pastError);
    Location *four = GenLoadConstant(VarSize);
    Location *offset = GenBinaryOp("*", four, index);
    Location *elem = GenBinaryOp("+", array, offset);
    return new Location(elem, 0);
}



Location *CodeGenerator::GenNewArray(Location *numElems)
{
    Location *one = GenLoadConstant(1);
    Location *isNonpositive = GenBinaryOp("<", numElems, one);
    const char *pastError = NewLabel();
    GenIfZ(isNonpositive, pastError);
    GenHaltWithMessage(err_arr_bad_size);
    GenLabel(pastError);

    // need (numElems+1)*VarSize total bytes (extra 1 is for length)
    Location *arraySize = GenLoadConstant(1);
    Location *num = GenBinaryOp("+", arraySize, numElems);
    Location *four = GenLoadConstant(VarSize);
    Location *bytes = GenBinaryOp("*", num, four);
    Location *result = GenBuiltInCall(Alloc, bytes);
    GenStore(result, numElems);
    return GenBinaryOp("+", result, four);
}

void CodeGenerator::GenHaltWithMessage(const char *message)
{
    Location *msg = GenLoadConstant(message);
    GenBuiltInCall(PrintString, msg);
    GenBuiltInCall(Halt, NULL);
}
