	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _foo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L0
	  lw $v0, 8($fp)	# fill c to $v0 from $fp+8
	  beqz $v0, _L0	# branch if c is zero 
	# _tmp0 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -8($fp)	# spill _tmp0 from $v0 to $fp-8
	# _tmp1 = a + _tmp0
	  lw $v0, 4($fp)	# fill a to $v0 from $fp+4
	  lw $v1, -8($fp)	# fill _tmp0 to $v1 from $fp-8
	  add $v0, $v0, $v1	
	  sw $v0, -12($fp)	# spill _tmp1 from $v0 to $fp-12
	# Return _tmp1
	  lw $v0, -12($fp)	# fill _tmp1 to $v0 from $fp-12
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill a to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -16($fp)	# spill _tmp2 from $v0 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp2 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L1:
	# _tmp3 = 18
	  li $v0, 18		# load constant value 18 into $v0
	  sw $v0, -20($fp)	# spill _tmp3 from $v0 to $fp-20
	# Return _tmp3
	  lw $v0, -20($fp)	# fill _tmp3 to $v0 from $fp-20
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -12($fp)	# spill _tmp4 from $v0 to $fp-12
	# a = _tmp4
	  lw $v0, -12($fp)	# fill _tmp4 to $v0 from $fp-12
	  sw $v0, 0($gp)	# spill a from $v0 to $gp+0
	# _tmp5 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -16($fp)	# spill _tmp5 from $v0 to $fp-16
	# _tmp6 = a / _tmp5
	  lw $v0, 0($gp)	# fill a to $v0 from $gp+0
	  lw $v1, -16($fp)	# fill _tmp5 to $v1 from $fp-16
	  div $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp6 from $v0 to $fp-20
	# b = _tmp6
	  lw $v0, -20($fp)	# fill _tmp6 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill b from $v0 to $fp-8
	# _tmp7 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -24($fp)	# spill _tmp7 from $v0 to $fp-24
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -24($fp)	# fill _tmp7 to $v0 from $fp-24
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 0($gp)	# fill a to $v0 from $gp+0
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _foo
	  jal _foo           	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -28($fp)	# spill _tmp8 from $v0 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -32($fp)	# spill _tmp9 from $v0 to $fp-32
	# _tmp10 = b + _tmp9
	  lw $v0, -8($fp)	# fill b to $v0 from $fp-8
	  lw $v1, -32($fp)	# fill _tmp9 to $v1 from $fp-32
	  add $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp10 from $v0 to $fp-36
	# _tmp11 = a < b
	  lw $v0, 0($gp)	# fill a to $v0 from $gp+0
	  lw $v1, -8($fp)	# fill b to $v1 from $fp-8
	  slt $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp11 from $v0 to $fp-40
	# _tmp12 = a == b
	  lw $v0, 0($gp)	# fill a to $v0 from $gp+0
	  lw $v1, -8($fp)	# fill b to $v1 from $fp-8
	  seq $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp12 from $v0 to $fp-44
	# _tmp13 = _tmp11 || _tmp12
	  lw $v0, -40($fp)	# fill _tmp11 to $v0 from $fp-40
	  lw $v1, -44($fp)	# fill _tmp12 to $v1 from $fp-44
	  or $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp13 from $v0 to $fp-48
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -48($fp)	# fill _tmp13 to $v0 from $fp-48
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp10 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _foo
	  jal _foo           	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -52($fp)	# spill _tmp14 from $v0 to $fp-52
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -56($fp)	# spill _tmp15 from $v0 to $fp-56
	# _tmp16 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -60($fp)	# spill _tmp16 from $v0 to $fp-60
	# _tmp17 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -64($fp)	# spill _tmp17 from $v0 to $fp-64
	# _tmp18 = _tmp16 && _tmp17
	  lw $v0, -60($fp)	# fill _tmp16 to $v0 from $fp-60
	  lw $v1, -64($fp)	# fill _tmp17 to $v1 from $fp-64
	  and $v0, $v0, $v1	
	  sw $v0, -68($fp)	# spill _tmp18 from $v0 to $fp-68
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -68($fp)	# fill _tmp18 to $v0 from $fp-68
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -56($fp)	# fill _tmp15 to $v0 from $fp-56
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp19 = LCall _foo
	  jal _foo           	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -72($fp)	# spill _tmp19 from $v0 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp20 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -76($fp)	# spill _tmp20 from $v0 to $fp-76
	# _tmp21 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -80($fp)	# spill _tmp21 from $v0 to $fp-80
	# _tmp22 = _tmp20 == _tmp21
	  lw $v0, -76($fp)	# fill _tmp20 to $v0 from $fp-76
	  lw $v1, -80($fp)	# fill _tmp21 to $v1 from $fp-80
	  seq $v0, $v0, $v1	
	  sw $v0, -84($fp)	# spill _tmp22 from $v0 to $fp-84
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -84($fp)	# fill _tmp22 to $v0 from $fp-84
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -72($fp)	# fill _tmp19 to $v0 from $fp-72
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _foo
	  jal _foo           	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -88($fp)	# spill _tmp23 from $v0 to $fp-88
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
