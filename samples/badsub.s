	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 124
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# _tmp0 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -16($fp)	# spill _tmp0 from $v0 to $fp-16
	# _tmp1 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp1 from $v0 to $fp-20
	# _tmp2 = _tmp0 < _tmp1
	  lw $v0, -16($fp)	# fill _tmp0 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp1 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp2 from $v0 to $fp-24
	# IfZ _tmp2 Goto _L0
	  lw $v0, -24($fp)	# fill _tmp2 to $v0 from $fp-24
	  beqz $v0, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -28($fp)	# spill _tmp3 from $v0 to $fp-28
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -28($fp)	# fill _tmp3 to $v0 from $fp-28
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -32($fp)	# spill _tmp4 from $v0 to $fp-32
	# _tmp5 = _tmp4 + _tmp0
	  lw $v0, -32($fp)	# fill _tmp4 to $v0 from $fp-32
	  lw $v1, -16($fp)	# fill _tmp0 to $v1 from $fp-16
	  add $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp5 from $v0 to $fp-36
	# _tmp6 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -40($fp)	# spill _tmp6 from $v0 to $fp-40
	# _tmp7 = _tmp5 * _tmp6
	  lw $v0, -36($fp)	# fill _tmp5 to $v0 from $fp-36
	  lw $v1, -40($fp)	# fill _tmp6 to $v1 from $fp-40
	  mul $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp7 from $v0 to $fp-44
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -44($fp)	# fill _tmp7 to $v0 from $fp-44
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -48($fp)	# spill _tmp8 from $v0 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $v0, -16($fp)	# fill _tmp0 to $v0 from $fp-16
	  lw $v1, -48($fp)	# fill _tmp8 to $v1 from $fp-48
	  sw $v0, 0($v1) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $v0, -48($fp)	# fill _tmp8 to $v0 from $fp-48
	  lw $v1, -40($fp)	# fill _tmp6 to $v1 from $fp-40
	  add $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp9 from $v0 to $fp-52
	# arr = _tmp9
	  lw $v0, -52($fp)	# fill _tmp9 to $v0 from $fp-52
	  sw $v0, -8($fp)	# spill arr from $v0 to $fp-8
	# _tmp10 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -56($fp)	# spill _tmp10 from $v0 to $fp-56
	# i = _tmp10
	  lw $v0, -56($fp)	# fill _tmp10 to $v0 from $fp-56
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
  _L1:
	# _tmp11 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -60($fp)	# spill _tmp11 from $v0 to $fp-60
	# _tmp12 = i < _tmp11
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -60($fp)	# fill _tmp11 to $v1 from $fp-60
	  slt $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp12 from $v0 to $fp-64
	# _tmp13 = i == _tmp11
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -60($fp)	# fill _tmp11 to $v1 from $fp-60
	  seq $v0, $v0, $v1	
	  sw $v0, -68($fp)	# spill _tmp13 from $v0 to $fp-68
	# _tmp14 = _tmp12 || _tmp13
	  lw $v0, -64($fp)	# fill _tmp12 to $v0 from $fp-64
	  lw $v1, -68($fp)	# fill _tmp13 to $v1 from $fp-68
	  or $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp14 from $v0 to $fp-72
	# IfZ _tmp14 Goto _L2
	  lw $v0, -72($fp)	# fill _tmp14 to $v0 from $fp-72
	  beqz $v0, _L2	# branch if _tmp14 is zero 
	# _tmp15 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -76($fp)	# spill _tmp15 from $v0 to $fp-76
	# _tmp16 = i < _tmp15
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -76($fp)	# fill _tmp15 to $v1 from $fp-76
	  slt $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp16 from $v0 to $fp-80
	# _tmp17 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp17 from $v0 to $fp-84
	# _tmp18 = i < _tmp17
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -84($fp)	# fill _tmp17 to $v1 from $fp-84
	  slt $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp18 from $v0 to $fp-88
	# _tmp19 = _tmp18 == _tmp15
	  lw $v0, -88($fp)	# fill _tmp18 to $v0 from $fp-88
	  lw $v1, -76($fp)	# fill _tmp15 to $v1 from $fp-76
	  seq $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp19 from $v0 to $fp-92
	# _tmp20 = _tmp16 || _tmp19
	  lw $v0, -80($fp)	# fill _tmp16 to $v0 from $fp-80
	  lw $v1, -92($fp)	# fill _tmp19 to $v1 from $fp-92
	  or $v0, $v0, $v1	
	  sw $v0, -96($fp)	# spill _tmp20 from $v0 to $fp-96
	# IfZ _tmp20 Goto _L3
	  lw $v0, -96($fp)	# fill _tmp20 to $v0 from $fp-96
	  beqz $v0, _L3	# branch if _tmp20 is zero 
	# _tmp21 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -100($fp)	# spill _tmp21 from $v0 to $fp-100
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -100($fp)	# fill _tmp21 to $v0 from $fp-100
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp22 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -104($fp)	# spill _tmp22 from $v0 to $fp-104
	# _tmp23 = _tmp22 * i
	  lw $v0, -104($fp)	# fill _tmp22 to $v0 from $fp-104
	  lw $v1, -12($fp)	# fill i to $v1 from $fp-12
	  mul $v0, $v0, $v1	
	  sw $v0, -108($fp)	# spill _tmp23 from $v0 to $fp-108
	# _tmp24 = arr + _tmp23
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -108($fp)	# fill _tmp23 to $v1 from $fp-108
	  add $v0, $v0, $v1	
	  sw $v0, -112($fp)	# spill _tmp24 from $v0 to $fp-112
	# *(_tmp24) = i
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -112($fp)	# fill _tmp24 to $v1 from $fp-112
	  sw $v0, 0($v1) 	# store with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp25 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -116($fp)	# spill _tmp25 from $v0 to $fp-116
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -116($fp)	# fill _tmp25 to $v0 from $fp-116
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -120($fp)	# spill _tmp26 from $v0 to $fp-120
	# _tmp27 = i + _tmp26
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -120($fp)	# fill _tmp26 to $v1 from $fp-120
	  add $v0, $v0, $v1	
	  sw $v0, -124($fp)	# spill _tmp27 from $v0 to $fp-124
	# i = _tmp27
	  lw $v0, -124($fp)	# fill _tmp27 to $v0 from $fp-124
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L1
	  b _L1		# unconditional branch
  _L2:
	# _tmp28 = "Done\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Done\n"
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -128($fp)	# spill _tmp28 from $v0 to $fp-128
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -128($fp)	# fill _tmp28 to $v0 from $fp-128
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
