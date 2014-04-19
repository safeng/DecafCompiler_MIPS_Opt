/* File: tac.cc
 * ------------
 * Implementation of Location class and Instruction class/subclasses.
 */

#include "ast_decl.h"
#include "tac.h"
#include "mips.h"
#include <string.h>
#include <deque>

static int OFFSET = static_cast<int>(Mips::t0);

Location::Location(Segment s, int o, const char *name):
    variableName(strdup(name)),
    segment(s),
    offset(o),
    assigned(false),
    reg(Mips::zero)
{}

Location::Location(Location *base, int refOff):
    variableName(base->variableName),
    segment(base->segment),
    offset(base->offset),
    reference(base),
    refOffset(refOff),
    assigned(false),
    reg(Mips::zero)
{}

void Instruction::Print()
{
    printf("\t%s ;", printed);
    printf("\n");
}

void Instruction::Emit(Mips *mips)
{
    if (*printed) mips->Emit("# %s", printed);
    EmitSpecific(mips);
}

LoadConstant::LoadConstant(Location *d, int v):
    dst(d),
    val(v)
{
    sprintf(printed, "%s = %d", dst->GetName(), val);
}

void LoadConstant::EmitSpecific(Mips *mips)
{
    mips->EmitLoadConstant(dst, val);
}

LoadStringConstant::LoadStringConstant(Location *d, const char *s):
    dst(d)
{
    const char *quote = (*s == '"') ? "" : "\"";
    str = new char[strlen(s) + 2*strlen(quote) + 1];
    sprintf(str, "%s%s%s", quote, s, quote);
    quote = (strlen(str) > 50) ? "...\"" : "";
    sprintf(printed, "%s = %.50s%s", dst->GetName(), str, quote);
}

void LoadStringConstant::EmitSpecific(Mips *mips)
{
    mips->EmitLoadStringConstant(dst, str);
}

LoadLabel::LoadLabel(Location *d, const char *l):
    dst(d),
    label(strdup(l))
{
    sprintf(printed, "%s = %s", dst->GetName(), label);
}

void LoadLabel::EmitSpecific(Mips *mips)
{
    mips->EmitLoadLabel(dst, label);
}

Assign::Assign(Location *d, Location *s):
    dst(d),
    src(s)
{
    sprintf(printed, "%s = %s", dst->GetName(), src->GetName());
}

void Assign::EmitSpecific(Mips *mips)
{
    mips->EmitCopy(dst, src);
}

Load::Load(Location *d, Location *s, int off):
    dst(d),
    src(s),
    offset(off)
{
    if (offset) {
        sprintf(printed, "%s = *(%s + %d)", dst->GetName(),
                src->GetName(), offset);
    } else {
        sprintf(printed, "%s = *(%s)", dst->GetName(), src->GetName());
    }
}

void Load::EmitSpecific(Mips *mips)
{
    mips->EmitLoad(dst, src, offset);
}

Store::Store(Location *d, Location *s, int off):
    dst(d),
    src(s),
    offset(off)
{
    if (offset) {
        sprintf(printed, "*(%s + %d) = %s", dst->GetName(), offset,
                src->GetName());
    } else {
        sprintf(printed, "*(%s) = %s", dst->GetName(), src->GetName());
    }
}

void Store::EmitSpecific(Mips *mips)
{
    mips->EmitStore(dst, src, offset);
}

const char * const BinaryOp::opName[Mips::NumOps] = {
    "+", "-", "*", "/", "%", "==", "<", "&&", "||"
};

Mips::OpCode BinaryOp::OpCodeForName(const char *name)
{
    for (int i = 0; i < Mips::NumOps; i++)
        if (opName[i] && !strcmp(opName[i], name))
            return (Mips::OpCode)i;
    Failure("Unrecognized Tac operator: '%s'\n", name);
    return Mips::Add; // can't get here, but compiler doesn't know that
}

BinaryOp::BinaryOp(Mips::OpCode c, Location *d, Location *o1,
                   Location *o2):
    code(c),
    dst(d),
    op1(o1),
    op2(o2)
{
    sprintf(printed, "%s = %s %s %s", dst->GetName(), op1->GetName(),
            opName[code], op2->GetName());
}

void BinaryOp::EmitSpecific(Mips *mips) {
    mips->EmitBinaryOp(code, dst, op1, op2);
}

Label::Label(const char *l) : label(strdup(l)) {
    Assert(label != NULL);
    *printed = '\0';
}

void Label::Print() {
    printf("%s:\n", label);
}

void Label::EmitSpecific(Mips *mips) {
    mips->EmitLabel(label);
}

Goto::Goto(const char *l) : label(strdup(l))
{
    sprintf(printed, "Goto %s", label);
}

void Goto::EmitSpecific(Mips *mips)
{
    mips->EmitGoto(label);
}


IfZ::IfZ(Location *te, const char *l):
    test(te),
    label(strdup(l))
{
    sprintf(printed, "IfZ %s Goto %s", test->GetName(), label);
}

void IfZ::EmitSpecific(Mips *mips) {
    mips->EmitIfZ(test, label);
}

BeginFunc::BeginFunc(FnDecl *fn) :
    func(fn)
{
    sprintf(printed,"BeginFunc (unassigned)");
}

void BeginFunc::SetFrameSize(int numBytesForAllLocalsAndTemps)
{
    frameSize = numBytesForAllLocalsAndTemps;
    sprintf(printed,"BeginFunc %d", frameSize);
}

void BeginFunc::EmitSpecific(Mips *mips)
{
    mips->EmitBeginFunction(frameSize);

    for (int i = 0; i<Mips::NumGeneralPurposeRegs; i++) {
        if (register_map[i] != NULL) {
            int reg = i + OFFSET;
            mips->FillRegister(register_map[i],
                               static_cast<Mips::Register>(reg));
        }
    }
}

EndFunc::EndFunc() : Instruction()
{
    sprintf(printed, "EndFunc");
}

void EndFunc::EmitSpecific(Mips *mips) {
    mips->EmitEndFunction();
}

Return::Return(Location *v):
    val(v)
{
    sprintf(printed, "Return %s", val? val->GetName() : "");
}

void Return::EmitSpecific(Mips *mips)
{
    mips->EmitReturn(val);
}

PushParam::PushParam(Location *p):
    param(p)
{
    sprintf(printed, "PushParam %s", param->GetName());
}

void PushParam::EmitSpecific(Mips *mips)
{
    mips->EmitParam(param);
}

PopParams::PopParams(int nb):
    numBytes(nb)
{
    sprintf(printed, "PopParams %d", numBytes);
}

void PopParams::EmitSpecific(Mips *mips)
{
    mips->EmitPopParams(numBytes);
}

LCall::LCall(const char *l, Location *d):
    label(strdup(l)),
    dst(d)
{
    sprintf(printed, "%s%sLCall %s", dst? dst->GetName() : "",
            dst ? " = " : "", label);
}

void LCall::EmitSpecific(Mips *mips)
{
    // save
    for (int i = 0; i < Mips::NumGeneralPurposeRegs; i++) {
        if (register_map[i] != NULL) {
            int reg = i + OFFSET;
            mips->SpillRegister(register_map[i],
                                static_cast<Mips::Register>(reg));
        }
    }
    mips->EmitLCall(dst, label);
    // restore
    for (int i = 0; i<Mips::NumGeneralPurposeRegs; i++) {
        if (register_map[i] != NULL) {
            int reg = i + OFFSET;
            mips->FillRegister(register_map[i],
                               static_cast<Mips::Register>(reg));
        }
    }
}

ACall::ACall(Location *ma, Location *d):
    dst(d),
    methodAddr(ma)
{
    sprintf(printed, "%s%sACall %s", dst ? dst->GetName() : "",
            dst ? " = " : "", methodAddr->GetName());
}

void ACall::EmitSpecific(Mips *mips)
{
    for (int i = 0; i < Mips::NumGeneralPurposeRegs; i++) {
        if (register_map[i] != NULL) {
            int reg = i + OFFSET;
            mips->SpillRegister(register_map[i],
                                static_cast<Mips::Register>(reg));
        }
    }
    mips->EmitACall(dst, methodAddr);
    for (int i = 0; i < Mips::NumGeneralPurposeRegs; i++) {
        if (register_map[i] != NULL) {
            int reg = i + OFFSET;
            mips->FillRegister(register_map[i],
                               static_cast<Mips::Register>(reg));
        }
    }
}

VTable::VTable(const char *l, List<const char *> *m):
    methodLabels(m),
    label(strdup(l))
{
    sprintf(printed, "VTable for class %s", l);
}

void VTable::Print()
{
    printf("VTable %s =\n", label);
    for (int i = 0; i < methodLabels->NumElements(); i++) {
        printf("\t%s,\n", methodLabels->Nth(i));
    }
    printf("; \n");
}

void VTable::EmitSpecific(Mips *mips)
{
    mips->EmitVTable(label, methodLabels);
}
