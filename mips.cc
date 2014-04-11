/* File: mips.cc
 * -------------
 * Implementation of Mips class, which is responsible for TAC->MIPS
 * translation, register allocation, etc.
 *
 * Julie Zelenski academic year 2001-02 for CS143
 * Loosely based on some earlier work by Steve Freund
 *
 * A simple final code generator to translate Tac to MIPS.
 * It uses simplistic algorithms, in particular, its register handling
 * and spilling strategy is inefficient to the point of begin mocked
 * by elementary school children.
 *
 * Dan Bentley, April 2002
 * A simpler final code generator to translate Tac to MIPS.
 * It uses algorithms without loops or conditionals, to make there be a
 * very clear and obvious translation between one and the other.
 * Specifically, it always loads operands off stacks, and stores the
 * result back.  This breaks bad code immediately, theoretically helping
 * students.
 */

#include "mips.h"
#include "tac.h"
#include <stdarg.h>
#include <string.h>



// Helper to check if two variable locations are one and the same
// (same name, segment, and offset)
static bool LocationsAreSame(Location *var1, Location *var2)
{
   return (var1 == var2 ||
	     (var1 && var2
		&& !strcmp(var1->GetName(), var2->GetName())
		&& var1->GetSegment()  == var2->GetSegment()
		&& var1->GetOffset() == var2->GetOffset()));
}


/* Method: SpillRegister
 * ---------------------
 * Used to spill a register from reg to dst.  All it does is emit a store
 * from that register to its location on the stack.
 */
void Mips::SpillRegister(Location *dst, Register reg)
{
  Assert(dst);
  const char *offsetFromWhere = dst->GetSegment() == fpRelative? regs[fp].name : regs[gp].name;
  Assert(dst->GetOffset() % 4 == 0); // all variables are 4 bytes in size
  Emit("sw %s, %d(%s)\t# spill %s from %s to %s%+d", regs[reg].name,
       dst->GetOffset(), offsetFromWhere, dst->GetName(), regs[reg].name,
       offsetFromWhere,dst->GetOffset());
}

/* Method: FillRegister
 * --------------------
 * Fill a register from location src into reg.
 * Simply load a word into a register.
 */
void Mips::FillRegister(Location *src, Register reg)
{
  Assert(src);
  const char *offsetFromWhere = src->GetSegment() == fpRelative? regs[fp].name : regs[gp].name;
  Assert(src->GetOffset() % 4 == 0); // all variables are 4 bytes in size
  Emit("lw %s, %d(%s)\t# fill %s to %s from %s%+d", regs[reg].name,
       src->GetOffset(), offsetFromWhere, src->GetName(), regs[reg].name,
       offsetFromWhere,src->GetOffset());
}



/* Method: Emit
 * ------------
 * General purpose helper used to emit assembly instructions in
 * a reasonable tidy manner.  Takes printf-style formatting strings
 * and variable arguments.
 */
void Mips::Emit(const char *fmt, ...)
{
  va_list args;
  char buf[1024];
  
  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);
  if (buf[strlen(buf) - 1] != ':') printf("\t"); // don't tab in labels
  if (buf[0] != '#') printf("  ");   // outdent comments a little
  printf("%s", buf);
  if (buf[strlen(buf)-1] != '\n') printf("\n"); // end with a newline
}



/* Method: EmitLoadConstant
 * ------------------------
 * Used to assign variable an integer constant value.  Slaves dst into
 * a register and then emits an li (load immediate) instruction with the
 * constant value.
 */
void Mips::EmitLoadConstant(Location *dst, int val)
{
  Register reg = dst->GetRegister() ? dst->GetRegister() : rd;
  Emit("li %s, %d\t\t# load constant value %d into %s", regs[reg].name,
	 val, val, regs[reg].name);
  if (!dst->GetRegister()) SpillRegister(dst, reg);
}

/* Method: EmitLoadStringConstant
 * ------------------------------
 * Used to assign a variable a pointer to string constant. Emits
 * assembly directives to create a new null-terminated string in the
 * data segment and assigns it a unique label. Slaves dst into a register
 * and loads that label address into the register.
 */
void Mips::EmitLoadStringConstant(Location *dst, const char *str)
{
  static int strNum = 1;
  char label[16];
  sprintf(label, "_string%d", strNum++);
  Emit(".data\t\t\t# create string constant marked with label");
  Emit("%s: .asciiz %s", label, str);
  Emit(".text");
  EmitLoadLabel(dst, label);
}


/* Method: EmitLoadLabel
 * ---------------------
 * Used to load a label (ie address in text/data segment) into a variable.
 * Slaves dst into a register and emits an la (load address) instruction
 */
void Mips::EmitLoadLabel(Location *dst, const char *label)
{
  Register reg = dst->GetRegister() ? dst->GetRegister() : rd;
  Emit("la %s, %s\t# load label", regs[reg].name, label);
  if (!dst->GetRegister()) SpillRegister(dst, reg);
}
 

/* Method: EmitCopy
 * ----------------
 * Used to copy the value of one variable to another.  Slaves both
 * src and dst into registers and then emits a move instruction to
 * copy the contents from src to dst.
 */
void Mips::EmitCopy(Location *dst, Location *src)
{
  Register reg = src->GetRegister() ? src->GetRegister() : rd;
  if (!src->GetRegister()) FillRegister(src, reg);
  if (dst->GetRegister())
    Emit("move %s, %s\t# copy regs", regs[dst->GetRegister()].name, regs[reg].name);
  else SpillRegister(dst, reg);
}


/* Method: EmitLoad
 * ----------------
 * Used to assign dst the contents of memory at the address in reference,
 * potentially with some positive/negative offset (defaults to 0).
 * Slaves both ref and dst to registers, then emits a lw instruction
 * using constant-offset addressing mode y(rx) which accesses the address
 * at an offset of y bytes from the address currently contained in rx.
 */
void Mips::EmitLoad(Location *dst, Location *reference, int offset)
{
  Register regref = reference->GetRegister() ? reference->GetRegister() : rs;
  Register reg = dst->GetRegister() ? dst->GetRegister() : rd;
  if (!reference->GetRegister()) FillRegister(reference, regref);
  Emit("lw %s, %d(%s) \t# load with offset", regs[reg].name,
	 offset, regs[regref].name);
  if (!dst->GetRegister()) SpillRegister(dst, reg);
}


/* Method: EmitStore
 * -----------------
 * Used to write value to  memory at the address in reference,
 * potentially with some positive/negative offset (defaults to 0).
 * Slaves both ref and dst to registers, then emits a sw instruction
 * using constant-offset addressing mode y(rx) which writes to the address
 * at an offset of y bytes from the address currently contained in rx.
 */
void Mips::EmitStore(Location *reference, Location *value, int offset)
{
  Register reg = value->GetRegister() ? value->GetRegister() : rs;
  Register regref = reference->GetRegister() ? reference->GetRegister() : rt;
  if (!value->GetRegister()) FillRegister(value, reg);
  if (!reference->GetRegister()) FillRegister(reference, regref);
  Emit("sw %s, %d(%s) \t# store with offset",
	 regs[reg].name, offset, regs[regref].name);
}


/* Method: EmitBinaryOp
 * --------------------
 * Used to perform a binary operation on 2 operands and store result
 * in dst. All binary forms for arithmetic, logical, relational, equality
 * use this method. Slaves both operands and dst to registers, then
 * emits the appropriate instruction by looking up the mips name
 * for the particular op code.
 */
void Mips::EmitBinaryOp(OpCode code, Location *dst, 
			Location *op1, Location *op2)
{
  Register reg = dst->GetRegister() ? dst->GetRegister() : rd;
  Register reg1 = op1->GetRegister() ? op1->GetRegister() : rs;
  Register reg2 = op2->GetRegister() ? op2->GetRegister() : rt;
  if (!op1->GetRegister()) FillRegister(op1, reg1);
  if (!op2->GetRegister()) FillRegister(op2, reg2);
  Emit("%s %s, %s, %s\t", NameForTac(code), regs[reg].name,
	 regs[reg1].name, regs[reg2].name);
  if (!dst->GetRegister()) SpillRegister(dst, reg);
}


/* Method: EmitLabel
 * -----------------
 * Used to emit label marker. Before a label, we spill all registers since
 * we can't be sure what the situation upon arriving at this label (ie
 * starts new basic block), and rather than try to be clever, we just
 * wipe the slate clean.
 */
void Mips::EmitLabel(const char *label)
{ 
  Emit("%s:", label);
}


/* Method: EmitGoto
 * ----------------
 * Used for an unconditional transfer to a named label. Before a goto,
 * we spill all registers, since we don't know what the situation is
 * we are heading to (ie this ends current basic block) and rather than
 * try to be clever, we just wipe slate clean.
 */
void Mips::EmitGoto(const char *label)
{
  Emit("b %s\t\t# unconditional branch", label);
}


/* Method: EmitIfZ
 * ---------------
 * Used for a conditional branch based on value of test variable.
 * We slave test var to register and use in the emitted test instruction,
 * either beqz. See comments above on Goto for why we spill
 * all registers here.
 */
void Mips::EmitIfZ(Location *test, const char *label)
{ 
  Register reg = test->GetRegister() ? test->GetRegister() : rs;
  if (!test->GetRegister()) FillRegister(test, reg);
  Emit("beqz %s, %s\t# branch if %s is zero ", regs[reg].name, label,
	 test->GetName());
}


/* Method: EmitParam
 * -----------------
 * Used to push a parameter on the stack in anticipation of upcoming
 * function call. Decrements the stack pointer by 4. Slaves argument into
 * register and then stores contents to location just made at end of
 * stack.
 */
void Mips::EmitParam(Location *arg)
{
  Register reg = arg->GetRegister() ? arg->GetRegister() : rs;
  Emit("subu $sp, $sp, 4\t# decrement sp to make space for param");
  if (!arg->GetRegister()) FillRegister(arg, reg);
  Emit("sw %s, 4($sp)\t# copy param value to stack", regs[reg].name);
}


/* Method: EmitCallInstr
 * ---------------------
 * Used to effect a function call. All necessary arguments should have
 * already been pushed on the stack, this is the last step that
 * transfers control from caller to callee.  See comments on Goto method
 * above for why we spill all registers before making the jump. We issue
 * jal for a label, a jalr if address in register. Both will save the
 * return address in $ra. If there is an expected result passed, we slave
 * the var to a register and copy function return value from $v0 into that
 * register.  
 */
void Mips::EmitCallInstr(Location *result, const char *fn, bool isLabel)
{
  Emit("%s %-15s\t# jump to function", isLabel? "jal": "jalr", fn);
  if (result != NULL) {
    Register reg = result->GetRegister() ? result->GetRegister() : rd;
    Emit("move %s, %s\t\t# copy function return value from $v0",
    regs[reg].name, regs[v0].name);
    if (!result->GetRegister()) SpillRegister(result, reg);
  }
}


// Two covers for the above method for specific LCall/ACall variants
void Mips::EmitLCall(Location *dst, const char *label)
{ 
  EmitCallInstr(dst, label, true);
}

void Mips::EmitACall(Location *dst, Location *fn)
{
  Register reg = fn->GetRegister() ? fn->GetRegister() : rs;
  if (!fn->GetRegister()) FillRegister(fn, reg);
  EmitCallInstr(dst, regs[reg].name, false);
}

/*
 * We remove all parameters from the stack after a completed call
 * by adjusting the stack pointer upwards.
 */
void Mips::EmitPopParams(int bytes)
{
  if (bytes != 0)
    Emit("add $sp, $sp, %d\t# pop params off stack", bytes);
}


/* Method: EmitReturn
 * ------------------
 * Used to emit code for returning from a function (either from an
 * explicit return or falling off the end of the function body).
 * If there is an expression to return, we slave that variable into
 * a register and move its contents to $v0 (the standard register for
 * function result).  Before exiting, we spill dirty registers (to
 * commit contents of slaved registers to memory, necessary for
 * consistency, see comments at SpillForEndFunction above). We also
 * do the last part of the callee's job in function call protocol,
 * which is to remove our locals/temps from the stack, remove
 * saved registers ($fp and $ra) and restore previous values of
 * $fp and $ra so everything is returned to the state we entered.
 * We then emit jr to jump to the saved $ra.
 */
 void Mips::EmitReturn(Location *returnVal)
{ 
  if (returnVal != NULL) 
    {
      if (returnVal->GetRegister()) 
        Emit("move $v0, %s\t\t# assign return value into $v0",
	     regs[returnVal->GetRegister()].name);
      else FillRegister(returnVal, v0);
    }
  Emit("move $sp, $fp\t\t# pop callee frame off stack");
  Emit("lw $ra, -4($fp)\t# restore saved ra");
  Emit("lw $fp, 0($fp)\t# restore saved fp");
  Emit("jr $ra\t\t# return from function");
}


/* Method: EmitBeginFunction
 * -------------------------
 * Used to handle the callee's part of the function call protocol
 * upon entering a new function. We decrement the $sp to make space
 * and then save the current values of $fp and $ra (since we are
 * going to change them), then set up the $fp and bump the $sp down
 * to make space for all our locals/temps.
 */
void Mips::EmitBeginFunction(int stackFrameSize)
{
  Assert(stackFrameSize >= 0);
  Emit("subu $sp, $sp, 8\t# decrement sp to make space to save ra, fp");
  Emit("sw $fp, 8($sp)\t# save fp");
  Emit("sw $ra, 4($sp)\t# save ra");
  Emit("addiu $fp, $sp, 8\t# set up new fp");

  if (stackFrameSize != 0)
    Emit("subu $sp, $sp, %d\t# decrement sp to make space for locals/temps",
	   stackFrameSize);
}


/* Method: EmitEndFunction
 * -----------------------
 * Used to end the body of a function. Does an implicit return in fall off
 * case to clean up stack frame, return to caller etc. See comments on
 * EmitReturn above.
 */
void Mips::EmitEndFunction()
{ 
  Emit("# (below handles reaching end of fn body with no explicit return)");
  EmitReturn(NULL);
}



/* Method: EmitVTable
 * ------------------
 * Used to layout a vtable. Uses assembly directives to set up new
 * entry in data segment, emits label, and lays out the function
 * labels one after another.
 */
void Mips::EmitVTable(const char *label, List<const char*> *methodLabels)
{
  Emit(".data");
  Emit(".align 2");
  Emit("%s:\t\t# label for class %s vtable", label, label);
  for (int i = 0; i < methodLabels->NumElements(); i++)
    Emit(".word %s\n", methodLabels->Nth(i));
  Emit(".text");
}


/* Method: EmitPreamble
 * --------------------
 * Used to emit the starting sequence needed for a program. Not much
 * here, but need to indicate what follows is in text segment and
 * needs to be aligned on word boundary. main is our only global symbol.
 */
void Mips::EmitPreamble()
{
  Emit("# standard Decaf preamble ");
  Emit(".text");
  Emit(".align 2");
  Emit(".globl main");
}


/* Method: NameForTac
 * ------------------
 * Returns the appropriate MIPS instruction (add, seq, etc.) for
 * a given OpCode (Add, Equals, etc.). 
 * Asserts if asked for name of an unset/out of bounds code.
 */
const char *Mips::NameForTac(OpCode code)
{
  Assert(code >=0 && code < NumOps);
  const char *name = mipsName[code];
  Assert(name != NULL);
  return name;
}

/* Constructor
 * ----------
 * Constructor sets up the mips names and register descriptors to
 * the initial starting state.
 */
Mips::Mips() {
  mipsName[Add] = "add";
  mipsName[Sub] = "sub";
  mipsName[Mul] = "mul";
  mipsName[Div] = "div";
  mipsName[Mod] = "rem";
  mipsName[Eq] = "seq";
  mipsName[Less] = "slt";
  mipsName[And] = "and";
  mipsName[Or] = "or";
  regs[zero] = (RegContents){"$zero", false};
  regs[at] = (RegContents){"$at", false};
  regs[v0] = (RegContents){"$v0", false};
  regs[v1] = (RegContents){"$v1", false};
  regs[a0] = (RegContents){"$a0", false};
  regs[a1] = (RegContents){"$a1", false};
  regs[a2] = (RegContents){"$a2", false};
  regs[a3] = (RegContents){"$a3", false};
  regs[k0] = (RegContents){"$k0", false};
  regs[k1] = (RegContents){"$k1", false};
  regs[gp] = (RegContents){"$gp", false};
  regs[sp] = (RegContents){"$sp", false};
  regs[fp] = (RegContents){"$fp", false};
  regs[ra] = (RegContents){"$ra", true};
  regs[t0] = (RegContents){"$t0", true};
  regs[t1] = (RegContents){"$t1", true};
  regs[t2] = (RegContents){"$t2", true};
  regs[t3] = (RegContents){"$t3", true};
  regs[t4] = (RegContents){"$t4", true};
  regs[t5] = (RegContents){"$t5", true};
  regs[t6] = (RegContents){"$t6", true};
  regs[t7] = (RegContents){"$t7", true};
  regs[t8] = (RegContents){"$t8", true};
  regs[t9] = (RegContents){"$t9", true};
  regs[s0] = (RegContents){"$s0", true};
  regs[s1] = (RegContents){"$s1", true};
  regs[s2] = (RegContents){"$s2", true};
  regs[s3] = (RegContents){"$s3", true};
  regs[s4] = (RegContents){"$s4", true};
  regs[s5] = (RegContents){"$s5", true};
  regs[s6] = (RegContents){"$s6", true};
  regs[s7] = (RegContents){"$s7", true};
  rs = v0; rt = v1; rd = v0;
}
const char *Mips::mipsName[NumOps];

void Mips::SaveCaller(Location *location) {
    if (location->GetRegister())
	SpillRegister(location, location->GetRegister());
}

void Mips::RestoreCaller(Location *location) {
    if (location->GetRegister())
	FillRegister(location, location->GetRegister());
}

