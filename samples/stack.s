	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Stack.Init:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp0 = 100
	  li $v0, 100		# load constant value 100 into $v0
	  sw $v0, -8($fp)	# spill _tmp0 from $v0 to $fp-8
	# _tmp1 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -12($fp)	# spill _tmp1 from $v0 to $fp-12
	# _tmp2 = _tmp0 < _tmp1
	  lw $v0, -8($fp)	# fill _tmp0 to $v0 from $fp-8
	  lw $v1, -12($fp)	# fill _tmp1 to $v1 from $fp-12
	  slt $v0, $v0, $v1	
	  sw $v0, -16($fp)	# spill _tmp2 from $v0 to $fp-16
	# IfZ _tmp2 Goto _L0
	  lw $v0, -16($fp)	# fill _tmp2 to $v0 from $fp-16
	  beqz $v0, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -20($fp)	# spill _tmp3 from $v0 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -20($fp)	# fill _tmp3 to $v0 from $fp-20
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
	  sw $v0, -24($fp)	# spill _tmp4 from $v0 to $fp-24
	# _tmp5 = _tmp4 + _tmp0
	  lw $v0, -24($fp)	# fill _tmp4 to $v0 from $fp-24
	  lw $v1, -8($fp)	# fill _tmp0 to $v1 from $fp-8
	  add $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp5 from $v0 to $fp-28
	# _tmp6 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -32($fp)	# spill _tmp6 from $v0 to $fp-32
	# _tmp7 = _tmp5 * _tmp6
	  lw $v0, -28($fp)	# fill _tmp5 to $v0 from $fp-28
	  lw $v1, -32($fp)	# fill _tmp6 to $v1 from $fp-32
	  mul $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp7 from $v0 to $fp-36
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp7 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -40($fp)	# spill _tmp8 from $v0 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $v0, -8($fp)	# fill _tmp0 to $v0 from $fp-8
	  lw $v1, -40($fp)	# fill _tmp8 to $v1 from $fp-40
	  sw $v0, 0($v1) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $v0, -40($fp)	# fill _tmp8 to $v0 from $fp-40
	  lw $v1, -32($fp)	# fill _tmp6 to $v1 from $fp-32
	  add $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp9 from $v0 to $fp-44
	# *(this + 8) = _tmp9
	  lw $v0, -44($fp)	# fill _tmp9 to $v0 from $fp-44
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 8($v1) 	# store with offset
	# _tmp10 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -48($fp)	# spill _tmp10 from $v0 to $fp-48
	# *(this + 4) = _tmp10
	  lw $v0, -48($fp)	# fill _tmp10 to $v0 from $fp-48
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# _tmp11 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -52($fp)	# spill _tmp11 from $v0 to $fp-52
	# _tmp12 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -56($fp)	# spill _tmp12 from $v0 to $fp-56
	# _tmp13 = *(_tmp12 + 4)
	  lw $v0, -56($fp)	# fill _tmp12 to $v0 from $fp-56
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -60($fp)	# spill _tmp13 from $v0 to $fp-60
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp11 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp13
	  lw $v0, -60($fp)	# fill _tmp13 to $v0 from $fp-60
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Stack.Push:
	# BeginFunc 60
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 60	# decrement sp to make space for locals/temps
	# _tmp14 = *(this + 8)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp14 from $v0 to $fp-8
	# _tmp15 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp15 from $v0 to $fp-12
	# _tmp16 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp16 from $v0 to $fp-16
	# _tmp17 = _tmp15 < _tmp16
	  lw $v0, -12($fp)	# fill _tmp15 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp16 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp17 from $v0 to $fp-20
	# _tmp18 = *(_tmp14 + -4)
	  lw $v0, -8($fp)	# fill _tmp14 to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -24($fp)	# spill _tmp18 from $v0 to $fp-24
	# _tmp19 = _tmp15 < _tmp18
	  lw $v0, -12($fp)	# fill _tmp15 to $v0 from $fp-12
	  lw $v1, -24($fp)	# fill _tmp18 to $v1 from $fp-24
	  slt $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp19 from $v0 to $fp-28
	# _tmp20 = _tmp19 == _tmp16
	  lw $v0, -28($fp)	# fill _tmp19 to $v0 from $fp-28
	  lw $v1, -16($fp)	# fill _tmp16 to $v1 from $fp-16
	  seq $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp20 from $v0 to $fp-32
	# _tmp21 = _tmp17 || _tmp20
	  lw $v0, -20($fp)	# fill _tmp17 to $v0 from $fp-20
	  lw $v1, -32($fp)	# fill _tmp20 to $v1 from $fp-32
	  or $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp21 from $v0 to $fp-36
	# IfZ _tmp21 Goto _L1
	  lw $v0, -36($fp)	# fill _tmp21 to $v0 from $fp-36
	  beqz $v0, _L1	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -40($fp)	# spill _tmp22 from $v0 to $fp-40
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -40($fp)	# fill _tmp22 to $v0 from $fp-40
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp23 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -44($fp)	# spill _tmp23 from $v0 to $fp-44
	# _tmp24 = _tmp23 * _tmp15
	  lw $v0, -44($fp)	# fill _tmp23 to $v0 from $fp-44
	  lw $v1, -12($fp)	# fill _tmp15 to $v1 from $fp-12
	  mul $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp24 from $v0 to $fp-48
	# _tmp25 = _tmp14 + _tmp24
	  lw $v0, -8($fp)	# fill _tmp14 to $v0 from $fp-8
	  lw $v1, -48($fp)	# fill _tmp24 to $v1 from $fp-48
	  add $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp25 from $v0 to $fp-52
	# *(_tmp25) = i
	  lw $v0, 8($fp)	# fill i to $v0 from $fp+8
	  lw $v1, -52($fp)	# fill _tmp25 to $v1 from $fp-52
	  sw $v0, 0($v1) 	# store with offset
	# _tmp26 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -56($fp)	# spill _tmp26 from $v0 to $fp-56
	# _tmp27 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -60($fp)	# spill _tmp27 from $v0 to $fp-60
	# _tmp28 = _tmp26 + _tmp27
	  lw $v0, -56($fp)	# fill _tmp26 to $v0 from $fp-56
	  lw $v1, -60($fp)	# fill _tmp27 to $v1 from $fp-60
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp28 from $v0 to $fp-64
	# *(this + 4) = _tmp28
	  lw $v0, -64($fp)	# fill _tmp28 to $v0 from $fp-64
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Stack.Pop:
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp29 = *(this + 8)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp29 from $v0 to $fp-12
	# _tmp30 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp30 from $v0 to $fp-16
	# _tmp31 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp31 from $v0 to $fp-20
	# _tmp32 = _tmp30 - _tmp31
	  lw $v0, -16($fp)	# fill _tmp30 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp31 to $v1 from $fp-20
	  sub $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp32 from $v0 to $fp-24
	# _tmp33 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -28($fp)	# spill _tmp33 from $v0 to $fp-28
	# _tmp34 = _tmp32 < _tmp33
	  lw $v0, -24($fp)	# fill _tmp32 to $v0 from $fp-24
	  lw $v1, -28($fp)	# fill _tmp33 to $v1 from $fp-28
	  slt $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp34 from $v0 to $fp-32
	# _tmp35 = *(_tmp29 + -4)
	  lw $v0, -12($fp)	# fill _tmp29 to $v0 from $fp-12
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp35 from $v0 to $fp-36
	# _tmp36 = _tmp32 < _tmp35
	  lw $v0, -24($fp)	# fill _tmp32 to $v0 from $fp-24
	  lw $v1, -36($fp)	# fill _tmp35 to $v1 from $fp-36
	  slt $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp36 from $v0 to $fp-40
	# _tmp37 = _tmp36 == _tmp33
	  lw $v0, -40($fp)	# fill _tmp36 to $v0 from $fp-40
	  lw $v1, -28($fp)	# fill _tmp33 to $v1 from $fp-28
	  seq $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp37 from $v0 to $fp-44
	# _tmp38 = _tmp34 || _tmp37
	  lw $v0, -32($fp)	# fill _tmp34 to $v0 from $fp-32
	  lw $v1, -44($fp)	# fill _tmp37 to $v1 from $fp-44
	  or $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp38 from $v0 to $fp-48
	# IfZ _tmp38 Goto _L2
	  lw $v0, -48($fp)	# fill _tmp38 to $v0 from $fp-48
	  beqz $v0, _L2	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -52($fp)	# spill _tmp39 from $v0 to $fp-52
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp39 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp40 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -56($fp)	# spill _tmp40 from $v0 to $fp-56
	# _tmp41 = _tmp40 * _tmp32
	  lw $v0, -56($fp)	# fill _tmp40 to $v0 from $fp-56
	  lw $v1, -24($fp)	# fill _tmp32 to $v1 from $fp-24
	  mul $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp41 from $v0 to $fp-60
	# _tmp42 = _tmp29 + _tmp41
	  lw $v0, -12($fp)	# fill _tmp29 to $v0 from $fp-12
	  lw $v1, -60($fp)	# fill _tmp41 to $v1 from $fp-60
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp42 from $v0 to $fp-64
	# _tmp43 = *(_tmp42)
	  lw $v0, -64($fp)	# fill _tmp42 to $v0 from $fp-64
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp43 from $v0 to $fp-68
	# val = _tmp43
	  lw $v0, -68($fp)	# fill _tmp43 to $v0 from $fp-68
	  sw $v0, -8($fp)	# spill val from $v0 to $fp-8
	# _tmp44 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -72($fp)	# spill _tmp44 from $v0 to $fp-72
	# _tmp45 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -76($fp)	# spill _tmp45 from $v0 to $fp-76
	# _tmp46 = _tmp44 - _tmp45
	  lw $v0, -72($fp)	# fill _tmp44 to $v0 from $fp-72
	  lw $v1, -76($fp)	# fill _tmp45 to $v1 from $fp-76
	  sub $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp46 from $v0 to $fp-80
	# *(this + 4) = _tmp46
	  lw $v0, -80($fp)	# fill _tmp46 to $v0 from $fp-80
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# Return val
	  lw $v0, -8($fp)	# fill val to $v0 from $fp-8
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
  _Stack.NumElems:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp47 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp47 from $v0 to $fp-8
	# Return _tmp47
	  lw $v0, -8($fp)	# fill _tmp47 to $v0 from $fp-8
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
	# VTable for class Stack
	  .data
	  .align 2
	  Stack:		# label for class Stack vtable
	  .word _Stack.Init
	  .word _Stack.Push
	  .word _Stack.Pop
	  .word _Stack.NumElems
	  .text
  main:
	# BeginFunc 136
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp48 = 12
	  li $v0, 12		# load constant value 12 into $v0
	  sw $v0, -12($fp)	# spill _tmp48 from $v0 to $fp-12
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp48 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp49 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -16($fp)	# spill _tmp49 from $v0 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp50 = Stack
	  la $v0, Stack	# load label
	  sw $v0, -20($fp)	# spill _tmp50 from $v0 to $fp-20
	# *(_tmp49) = _tmp50
	  lw $v0, -20($fp)	# fill _tmp50 to $v0 from $fp-20
	  lw $v1, -16($fp)	# fill _tmp49 to $v1 from $fp-16
	  sw $v0, 0($v1) 	# store with offset
	# s = _tmp49
	  lw $v0, -16($fp)	# fill _tmp49 to $v0 from $fp-16
	  sw $v0, -8($fp)	# spill s from $v0 to $fp-8
	# _tmp51 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -24($fp)	# spill _tmp51 from $v0 to $fp-24
	# _tmp52 = *(_tmp51)
	  lw $v0, -24($fp)	# fill _tmp51 to $v0 from $fp-24
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -28($fp)	# spill _tmp52 from $v0 to $fp-28
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  lw $v0, -28($fp)	# fill _tmp52 to $v0 from $fp-28
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -32($fp)	# spill _tmp53 from $v0 to $fp-32
	# _tmp54 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp54 from $v0 to $fp-36
	# _tmp55 = *(_tmp54 + 4)
	  lw $v0, -36($fp)	# fill _tmp54 to $v0 from $fp-36
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp55 from $v0 to $fp-40
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -32($fp)	# fill _tmp53 to $v0 from $fp-32
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp55
	  lw $v0, -40($fp)	# fill _tmp55 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp56 = 7
	  li $v0, 7		# load constant value 7 into $v0
	  sw $v0, -44($fp)	# spill _tmp56 from $v0 to $fp-44
	# _tmp57 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -48($fp)	# spill _tmp57 from $v0 to $fp-48
	# _tmp58 = *(_tmp57 + 4)
	  lw $v0, -48($fp)	# fill _tmp57 to $v0 from $fp-48
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -52($fp)	# spill _tmp58 from $v0 to $fp-52
	# PushParam _tmp56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -44($fp)	# fill _tmp56 to $v0 from $fp-44
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp58
	  lw $v0, -52($fp)	# fill _tmp58 to $v0 from $fp-52
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp59 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -56($fp)	# spill _tmp59 from $v0 to $fp-56
	# _tmp60 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -60($fp)	# spill _tmp60 from $v0 to $fp-60
	# _tmp61 = *(_tmp60 + 4)
	  lw $v0, -60($fp)	# fill _tmp60 to $v0 from $fp-60
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp61 from $v0 to $fp-64
	# PushParam _tmp59
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -56($fp)	# fill _tmp59 to $v0 from $fp-56
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp61
	  lw $v0, -64($fp)	# fill _tmp61 to $v0 from $fp-64
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp62 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp62 from $v0 to $fp-68
	# _tmp63 = *(_tmp62 + 12)
	  lw $v0, -68($fp)	# fill _tmp62 to $v0 from $fp-68
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -72($fp)	# spill _tmp63 from $v0 to $fp-72
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp64 = ACall _tmp63
	  lw $v0, -72($fp)	# fill _tmp63 to $v0 from $fp-72
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -76($fp)	# spill _tmp64 from $v0 to $fp-76
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -76($fp)	# fill _tmp64 to $v0 from $fp-76
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp65 = " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -80($fp)	# spill _tmp65 from $v0 to $fp-80
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -80($fp)	# fill _tmp65 to $v0 from $fp-80
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp66 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp66 from $v0 to $fp-84
	# _tmp67 = *(_tmp66 + 8)
	  lw $v0, -84($fp)	# fill _tmp66 to $v0 from $fp-84
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -88($fp)	# spill _tmp67 from $v0 to $fp-88
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp68 = ACall _tmp67
	  lw $v0, -88($fp)	# fill _tmp67 to $v0 from $fp-88
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -92($fp)	# spill _tmp68 from $v0 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -92($fp)	# fill _tmp68 to $v0 from $fp-92
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp69 = " "
	  .data			# create string constant marked with label
	  _string5: .asciiz " "
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -96($fp)	# spill _tmp69 from $v0 to $fp-96
	# PushParam _tmp69
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -96($fp)	# fill _tmp69 to $v0 from $fp-96
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -100($fp)	# spill _tmp70 from $v0 to $fp-100
	# _tmp71 = *(_tmp70 + 8)
	  lw $v0, -100($fp)	# fill _tmp70 to $v0 from $fp-100
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -104($fp)	# spill _tmp71 from $v0 to $fp-104
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp72 = ACall _tmp71
	  lw $v0, -104($fp)	# fill _tmp71 to $v0 from $fp-104
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -108($fp)	# spill _tmp72 from $v0 to $fp-108
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -108($fp)	# fill _tmp72 to $v0 from $fp-108
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = " "
	  .data			# create string constant marked with label
	  _string6: .asciiz " "
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -112($fp)	# spill _tmp73 from $v0 to $fp-112
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -112($fp)	# fill _tmp73 to $v0 from $fp-112
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp74 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -116($fp)	# spill _tmp74 from $v0 to $fp-116
	# _tmp75 = *(_tmp74 + 8)
	  lw $v0, -116($fp)	# fill _tmp74 to $v0 from $fp-116
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -120($fp)	# spill _tmp75 from $v0 to $fp-120
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp76 = ACall _tmp75
	  lw $v0, -120($fp)	# fill _tmp75 to $v0 from $fp-120
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -124($fp)	# spill _tmp76 from $v0 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -124($fp)	# fill _tmp76 to $v0 from $fp-124
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp77 = " "
	  .data			# create string constant marked with label
	  _string7: .asciiz " "
	  .text
	  la $v0, _string7	# load label
	  sw $v0, -128($fp)	# spill _tmp77 from $v0 to $fp-128
	# PushParam _tmp77
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -128($fp)	# fill _tmp77 to $v0 from $fp-128
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp78 = *(s)
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -132($fp)	# spill _tmp78 from $v0 to $fp-132
	# _tmp79 = *(_tmp78 + 12)
	  lw $v0, -132($fp)	# fill _tmp78 to $v0 from $fp-132
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -136($fp)	# spill _tmp79 from $v0 to $fp-136
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp80 = ACall _tmp79
	  lw $v0, -136($fp)	# fill _tmp79 to $v0 from $fp-136
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -140($fp)	# spill _tmp80 from $v0 to $fp-140
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -140($fp)	# fill _tmp80 to $v0 from $fp-140
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
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
