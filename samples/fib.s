	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _fib:
	# BeginFunc 68
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 68	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -8($fp)	# spill _tmp0 from $v0 to $fp-8
	# _tmp1 = base < _tmp0
	  lw $v0, 4($fp)	# fill base to $v0 from $fp+4
	  lw $v1, -8($fp)	# fill _tmp0 to $v1 from $fp-8
	  slt $v0, $v0, $v1	
	  sw $v0, -12($fp)	# spill _tmp1 from $v0 to $fp-12
	# _tmp2 = base == _tmp0
	  lw $v0, 4($fp)	# fill base to $v0 from $fp+4
	  lw $v1, -8($fp)	# fill _tmp0 to $v1 from $fp-8
	  seq $v0, $v0, $v1	
	  sw $v0, -16($fp)	# spill _tmp2 from $v0 to $fp-16
	# _tmp3 = _tmp1 || _tmp2
	  lw $v0, -12($fp)	# fill _tmp1 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp2 to $v1 from $fp-16
	  or $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp3 from $v0 to $fp-20
	# IfZ _tmp3 Goto _L0
	  lw $v0, -20($fp)	# fill _tmp3 to $v0 from $fp-20
	  beqz $v0, _L0	# branch if _tmp3 is zero 
	# Return base
	  lw $v0, 4($fp)	# fill base to $v0 from $fp+4
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# _tmp4 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -40($fp)	# spill _tmp4 from $v0 to $fp-40
	# f0 = _tmp4
	  lw $v0, -40($fp)	# fill _tmp4 to $v0 from $fp-40
	  sw $v0, -28($fp)	# spill f0 from $v0 to $fp-28
	# _tmp5 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -44($fp)	# spill _tmp5 from $v0 to $fp-44
	# f1 = _tmp5
	  lw $v0, -44($fp)	# fill _tmp5 to $v0 from $fp-44
	  sw $v0, -32($fp)	# spill f1 from $v0 to $fp-32
	# _tmp6 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -48($fp)	# spill _tmp6 from $v0 to $fp-48
	# i = _tmp6
	  lw $v0, -48($fp)	# fill _tmp6 to $v0 from $fp-48
	  sw $v0, -24($fp)	# spill i from $v0 to $fp-24
  _L2:
	# _tmp7 = i < base
	  lw $v0, -24($fp)	# fill i to $v0 from $fp-24
	  lw $v1, 4($fp)	# fill base to $v1 from $fp+4
	  slt $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp7 from $v0 to $fp-52
	# _tmp8 = i == base
	  lw $v0, -24($fp)	# fill i to $v0 from $fp-24
	  lw $v1, 4($fp)	# fill base to $v1 from $fp+4
	  seq $v0, $v0, $v1	
	  sw $v0, -56($fp)	# spill _tmp8 from $v0 to $fp-56
	# _tmp9 = _tmp7 || _tmp8
	  lw $v0, -52($fp)	# fill _tmp7 to $v0 from $fp-52
	  lw $v1, -56($fp)	# fill _tmp8 to $v1 from $fp-56
	  or $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp9 from $v0 to $fp-60
	# IfZ _tmp9 Goto _L3
	  lw $v0, -60($fp)	# fill _tmp9 to $v0 from $fp-60
	  beqz $v0, _L3	# branch if _tmp9 is zero 
	# _tmp10 = f0 + f1
	  lw $v0, -28($fp)	# fill f0 to $v0 from $fp-28
	  lw $v1, -32($fp)	# fill f1 to $v1 from $fp-32
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp10 from $v0 to $fp-64
	# f2 = _tmp10
	  lw $v0, -64($fp)	# fill _tmp10 to $v0 from $fp-64
	  sw $v0, -36($fp)	# spill f2 from $v0 to $fp-36
	# f0 = f1
	  lw $v0, -32($fp)	# fill f1 to $v0 from $fp-32
	  sw $v0, -28($fp)	# spill f0 from $v0 to $fp-28
	# f1 = f2
	  lw $v0, -36($fp)	# fill f2 to $v0 from $fp-36
	  sw $v0, -32($fp)	# spill f1 from $v0 to $fp-32
	# _tmp11 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -68($fp)	# spill _tmp11 from $v0 to $fp-68
	# _tmp12 = i + _tmp11
	  lw $v0, -24($fp)	# fill i to $v0 from $fp-24
	  lw $v1, -68($fp)	# fill _tmp11 to $v1 from $fp-68
	  add $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp12 from $v0 to $fp-72
	# i = _tmp12
	  lw $v0, -72($fp)	# fill _tmp12 to $v0 from $fp-72
	  sw $v0, -24($fp)	# spill i from $v0 to $fp-24
	# Goto _L2
	  b _L2		# unconditional branch
  _L3:
	# Return f2
	  lw $v0, -36($fp)	# fill f2 to $v0 from $fp-36
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L1:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp13 = "\nThis program computes Fibonacci numbers (slowly..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "\nThis program computes Fibonacci numbers (slowly.. but correctly!)\n"
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -12($fp)	# spill _tmp13 from $v0 to $fp-12
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp13 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L4:
	# _tmp14 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp14 from $v0 to $fp-16
	# IfZ _tmp14 Goto _L5
	  lw $v0, -16($fp)	# fill _tmp14 to $v0 from $fp-16
	  beqz $v0, _L5	# branch if _tmp14 is zero 
	# _tmp15 = "\nEnter the fibonacci number you want: (-1 to qui..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "\nEnter the fibonacci number you want: (-1 to quit) "
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -20($fp)	# spill _tmp15 from $v0 to $fp-20
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -20($fp)	# fill _tmp15 to $v0 from $fp-20
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -24($fp)	# spill _tmp16 from $v0 to $fp-24
	# n = _tmp16
	  lw $v0, -24($fp)	# fill _tmp16 to $v0 from $fp-24
	  sw $v0, -8($fp)	# spill n from $v0 to $fp-8
	# _tmp17 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -28($fp)	# spill _tmp17 from $v0 to $fp-28
	# _tmp18 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -32($fp)	# spill _tmp18 from $v0 to $fp-32
	# _tmp19 = _tmp18 - _tmp17
	  lw $v0, -32($fp)	# fill _tmp18 to $v0 from $fp-32
	  lw $v1, -28($fp)	# fill _tmp17 to $v1 from $fp-28
	  sub $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp19 from $v0 to $fp-36
	# _tmp20 = n == _tmp19
	  lw $v0, -8($fp)	# fill n to $v0 from $fp-8
	  lw $v1, -36($fp)	# fill _tmp19 to $v1 from $fp-36
	  seq $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp20 from $v0 to $fp-40
	# IfZ _tmp20 Goto _L6
	  lw $v0, -40($fp)	# fill _tmp20 to $v0 from $fp-40
	  beqz $v0, _L6	# branch if _tmp20 is zero 
	# Goto _L5
	  b _L5		# unconditional branch
  _L6:
	# _tmp21 = "Fib("
	  .data			# create string constant marked with label
	  _string3: .asciiz "Fib("
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -44($fp)	# spill _tmp21 from $v0 to $fp-44
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -44($fp)	# fill _tmp21 to $v0 from $fp-44
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill n to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp22 = ") = "
	  .data			# create string constant marked with label
	  _string4: .asciiz ") = "
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -48($fp)	# spill _tmp22 from $v0 to $fp-48
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -48($fp)	# fill _tmp22 to $v0 from $fp-48
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill n to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _fib
	  jal _fib           	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -52($fp)	# spill _tmp23 from $v0 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp23 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp24 = "\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "\n"
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -56($fp)	# spill _tmp24 from $v0 to $fp-56
	# PushParam _tmp24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -56($fp)	# fill _tmp24 to $v0 from $fp-56
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L4
	  b _L4		# unconditional branch
  _L5:
	# _tmp25 = "Goodbye!\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Goodbye!\n"
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -60($fp)	# spill _tmp25 from $v0 to $fp-60
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -60($fp)	# fill _tmp25 to $v0 from $fp-60
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintInt:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  lw $a0, 4($fp)	# fill a from $fp+4
	# LCall _PrintInt
	  li $v0, 1
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function

  _ReadInteger:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 5
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function


  _PrintBool:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  li $v0, 4
	  beq $a0, $0, PrintBoolFalse
	  la $a0, _PrintBoolTrueString
	  j PrintBoolEnd
  PrintBoolFalse:
 	  la $a0, _PrintBoolFalseString
  PrintBoolEnd:
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function

      .data			# create string constant marked with label
      _PrintBoolTrueString: .asciiz "true"
      .text

      .data			# create string constant marked with label
      _PrintBoolFalseString: .asciiz "false"
      .text

  _PrintString:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  li $v0, 4
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function

  _Alloc:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra,fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  li $v0, 9
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function

  _Halt:
	  li $v0, 10
	  syscall
	# EndFunc


  _StringEqual:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  lw $a1, 8($fp)        # fill a from $fp+8
	  beq $a0,$a1,Lrunt10
  Lrunt12:
	  lbu  $v0,($a0)
	  lbu  $a2,($a1)
	  bne $v0,$a2,Lrunt11
	  addiu $a0,$a0,1
	  addiu $a1,$a1,1
	  bne $v0,$0,Lrunt12
      li  $v0,1
      j Lrunt10
  Lrunt11:
	  li  $v0,0
  Lrunt10:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function



  _ReadLine:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  li $a0, 101
	  li $v0, 9
	  syscall
	  addi $a0, $v0, 0
	  li $v0, 8
	  li $a1,101 
	  syscall
	  addiu $v0,$a0,0       # pointer to begin of string
  Lrunt21:
	  lb $a1,($a0)          # load character at pointer
	  addiu $a0,$a0,1       # forward pointer
	  bnez $a1,Lrunt21      # loop until end of string is reached
	  lb $a1,-2($a0)        # load character before end of string
	  li $a2,10             # newline character	  bneq $a1,$a2,Lrunt20  # do not remove last character if not newline
	  sb $0,-2($a0)         # Add the terminating character in its place
  Lrunt20:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function
