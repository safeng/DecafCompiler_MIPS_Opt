	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Squash.Grow:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = "But I don't like squash\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "But I don't like squash\n"
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -8($fp)	# spill _tmp0 from $v0 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill _tmp0 to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -12($fp)	# spill _tmp1 from $v0 to $fp-12
	# _tmp2 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -16($fp)	# spill _tmp2 from $v0 to $fp-16
	# _tmp3 = _tmp1 * _tmp2
	  lw $v0, -12($fp)	# fill _tmp1 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp2 to $v1 from $fp-16
	  mul $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp3 from $v0 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -20($fp)	# fill _tmp3 to $v0 from $fp-20
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
	# VTable for class Squash
	  .data
	  .align 2
	  Squash:		# label for class Squash vtable
	  .word _Vegetable.Eat
	  .word _Squash.Grow
	  .text
  _Vegetable.Eat:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp4 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -16($fp)	# spill _tmp4 from $v0 to $fp-16
	# _tmp5 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -20($fp)	# spill _tmp5 from $v0 to $fp-20
	# _tmp6 = _tmp4 % _tmp5
	  lw $v0, -16($fp)	# fill _tmp4 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp5 to $v1 from $fp-20
	  rem $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp6 from $v0 to $fp-24
	# *(this + 4) = _tmp6
	  lw $v0, -24($fp)	# fill _tmp6 to $v0 from $fp-24
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# _tmp7 = "Yum! "
	  .data			# create string constant marked with label
	  _string2: .asciiz "Yum! "
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -28($fp)	# spill _tmp7 from $v0 to $fp-28
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -28($fp)	# fill _tmp7 to $v0 from $fp-28
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -32($fp)	# spill _tmp8 from $v0 to $fp-32
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -32($fp)	# fill _tmp8 to $v0 from $fp-32
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -36($fp)	# spill _tmp9 from $v0 to $fp-36
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp9 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = *(veg)
	  lw $v0, 8($fp)	# fill veg to $v0 from $fp+8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp10 from $v0 to $fp-40
	# _tmp11 = *(_tmp10 + 4)
	  lw $v0, -40($fp)	# fill _tmp10 to $v0 from $fp-40
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp11 from $v0 to $fp-44
	# PushParam w
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill w to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam veg
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 8($fp)	# fill veg to $v0 from $fp+8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  lw $v0, -44($fp)	# fill _tmp11 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# Return 
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
  _Vegetable.Grow:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp12 = "Grow, little vegetables, grow!\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Grow, little vegetables, grow!\n"
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -8($fp)	# spill _tmp12 from $v0 to $fp-8
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill _tmp12 to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp13 from $v0 to $fp-12
	# _tmp14 = *(_tmp13)
	  lw $v0, -12($fp)	# fill _tmp13 to $v0 from $fp-12
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp14 from $v0 to $fp-16
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp14
	  lw $v0, -16($fp)	# fill _tmp14 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Vegetable
	  .data
	  .align 2
	  Vegetable:		# label for class Vegetable vtable
	  .word _Vegetable.Eat
	  .word _Vegetable.Grow
	  .text
  _Grow:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp15 = "mmm... veggies!\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "mmm... veggies!\n"
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -8($fp)	# spill _tmp15 from $v0 to $fp-8
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill _tmp15 to $v0 from $fp-8
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
	# VTable for class Seeds
	  .data
	  .align 2
	  Seeds:		# label for class Seeds vtable
	  .text
  main:
	# BeginFunc 264
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 264	# decrement sp to make space for locals/temps
	# _tmp16 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -12($fp)	# spill _tmp16 from $v0 to $fp-12
	# _tmp17 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp17 from $v0 to $fp-16
	# _tmp18 = _tmp16 < _tmp17
	  lw $v0, -12($fp)	# fill _tmp16 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp17 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp18 from $v0 to $fp-20
	# IfZ _tmp18 Goto _L0
	  lw $v0, -20($fp)	# fill _tmp18 to $v0 from $fp-20
	  beqz $v0, _L0	# branch if _tmp18 is zero 
	# _tmp19 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -24($fp)	# spill _tmp19 from $v0 to $fp-24
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -24($fp)	# fill _tmp19 to $v0 from $fp-24
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp20 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -28($fp)	# spill _tmp20 from $v0 to $fp-28
	# _tmp21 = _tmp20 + _tmp16
	  lw $v0, -28($fp)	# fill _tmp20 to $v0 from $fp-28
	  lw $v1, -12($fp)	# fill _tmp16 to $v1 from $fp-12
	  add $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp21 from $v0 to $fp-32
	# _tmp22 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -36($fp)	# spill _tmp22 from $v0 to $fp-36
	# _tmp23 = _tmp21 * _tmp22
	  lw $v0, -32($fp)	# fill _tmp21 to $v0 from $fp-32
	  lw $v1, -36($fp)	# fill _tmp22 to $v1 from $fp-36
	  mul $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp23 from $v0 to $fp-40
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -40($fp)	# fill _tmp23 to $v0 from $fp-40
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp24 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -44($fp)	# spill _tmp24 from $v0 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp24) = _tmp16
	  lw $v0, -12($fp)	# fill _tmp16 to $v0 from $fp-12
	  lw $v1, -44($fp)	# fill _tmp24 to $v1 from $fp-44
	  sw $v0, 0($v1) 	# store with offset
	# _tmp25 = _tmp24 + _tmp22
	  lw $v0, -44($fp)	# fill _tmp24 to $v0 from $fp-44
	  lw $v1, -36($fp)	# fill _tmp22 to $v1 from $fp-36
	  add $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp25 from $v0 to $fp-48
	# veggies = _tmp25
	  lw $v0, -48($fp)	# fill _tmp25 to $v0 from $fp-48
	  sw $v0, -8($fp)	# spill veggies from $v0 to $fp-8
	# _tmp26 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -52($fp)	# spill _tmp26 from $v0 to $fp-52
	# _tmp27 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -56($fp)	# spill _tmp27 from $v0 to $fp-56
	# _tmp28 = _tmp26 < _tmp27
	  lw $v0, -52($fp)	# fill _tmp26 to $v0 from $fp-52
	  lw $v1, -56($fp)	# fill _tmp27 to $v1 from $fp-56
	  slt $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp28 from $v0 to $fp-60
	# _tmp29 = *(veggies + -4)
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp29 from $v0 to $fp-64
	# _tmp30 = _tmp26 < _tmp29
	  lw $v0, -52($fp)	# fill _tmp26 to $v0 from $fp-52
	  lw $v1, -64($fp)	# fill _tmp29 to $v1 from $fp-64
	  slt $v0, $v0, $v1	
	  sw $v0, -68($fp)	# spill _tmp30 from $v0 to $fp-68
	# _tmp31 = _tmp30 == _tmp27
	  lw $v0, -68($fp)	# fill _tmp30 to $v0 from $fp-68
	  lw $v1, -56($fp)	# fill _tmp27 to $v1 from $fp-56
	  seq $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp31 from $v0 to $fp-72
	# _tmp32 = _tmp28 || _tmp31
	  lw $v0, -60($fp)	# fill _tmp28 to $v0 from $fp-60
	  lw $v1, -72($fp)	# fill _tmp31 to $v1 from $fp-72
	  or $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp32 from $v0 to $fp-76
	# IfZ _tmp32 Goto _L1
	  lw $v0, -76($fp)	# fill _tmp32 to $v0 from $fp-76
	  beqz $v0, _L1	# branch if _tmp32 is zero 
	# _tmp33 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string7	# load label
	  sw $v0, -80($fp)	# spill _tmp33 from $v0 to $fp-80
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -80($fp)	# fill _tmp33 to $v0 from $fp-80
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp34 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -84($fp)	# spill _tmp34 from $v0 to $fp-84
	# _tmp35 = _tmp34 * _tmp26
	  lw $v0, -84($fp)	# fill _tmp34 to $v0 from $fp-84
	  lw $v1, -52($fp)	# fill _tmp26 to $v1 from $fp-52
	  mul $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp35 from $v0 to $fp-88
	# _tmp36 = veggies + _tmp35
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v1, -88($fp)	# fill _tmp35 to $v1 from $fp-88
	  add $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp36 from $v0 to $fp-92
	# _tmp37 = 12
	  li $v0, 12		# load constant value 12 into $v0
	  sw $v0, -96($fp)	# spill _tmp37 from $v0 to $fp-96
	# PushParam _tmp37
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -96($fp)	# fill _tmp37 to $v0 from $fp-96
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp38 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -100($fp)	# spill _tmp38 from $v0 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp39 = Squash
	  la $v0, Squash	# load label
	  sw $v0, -104($fp)	# spill _tmp39 from $v0 to $fp-104
	# *(_tmp38) = _tmp39
	  lw $v0, -104($fp)	# fill _tmp39 to $v0 from $fp-104
	  lw $v1, -100($fp)	# fill _tmp38 to $v1 from $fp-100
	  sw $v0, 0($v1) 	# store with offset
	# *(_tmp36) = _tmp38
	  lw $v0, -100($fp)	# fill _tmp38 to $v0 from $fp-100
	  lw $v1, -92($fp)	# fill _tmp36 to $v1 from $fp-92
	  sw $v0, 0($v1) 	# store with offset
	# _tmp40 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -108($fp)	# spill _tmp40 from $v0 to $fp-108
	# _tmp41 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -112($fp)	# spill _tmp41 from $v0 to $fp-112
	# _tmp42 = _tmp40 < _tmp41
	  lw $v0, -108($fp)	# fill _tmp40 to $v0 from $fp-108
	  lw $v1, -112($fp)	# fill _tmp41 to $v1 from $fp-112
	  slt $v0, $v0, $v1	
	  sw $v0, -116($fp)	# spill _tmp42 from $v0 to $fp-116
	# _tmp43 = *(veggies + -4)
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -120($fp)	# spill _tmp43 from $v0 to $fp-120
	# _tmp44 = _tmp40 < _tmp43
	  lw $v0, -108($fp)	# fill _tmp40 to $v0 from $fp-108
	  lw $v1, -120($fp)	# fill _tmp43 to $v1 from $fp-120
	  slt $v0, $v0, $v1	
	  sw $v0, -124($fp)	# spill _tmp44 from $v0 to $fp-124
	# _tmp45 = _tmp44 == _tmp41
	  lw $v0, -124($fp)	# fill _tmp44 to $v0 from $fp-124
	  lw $v1, -112($fp)	# fill _tmp41 to $v1 from $fp-112
	  seq $v0, $v0, $v1	
	  sw $v0, -128($fp)	# spill _tmp45 from $v0 to $fp-128
	# _tmp46 = _tmp42 || _tmp45
	  lw $v0, -116($fp)	# fill _tmp42 to $v0 from $fp-116
	  lw $v1, -128($fp)	# fill _tmp45 to $v1 from $fp-128
	  or $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp46 from $v0 to $fp-132
	# IfZ _tmp46 Goto _L2
	  lw $v0, -132($fp)	# fill _tmp46 to $v0 from $fp-132
	  beqz $v0, _L2	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string8	# load label
	  sw $v0, -136($fp)	# spill _tmp47 from $v0 to $fp-136
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -136($fp)	# fill _tmp47 to $v0 from $fp-136
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp48 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -140($fp)	# spill _tmp48 from $v0 to $fp-140
	# _tmp49 = _tmp48 * _tmp40
	  lw $v0, -140($fp)	# fill _tmp48 to $v0 from $fp-140
	  lw $v1, -108($fp)	# fill _tmp40 to $v1 from $fp-108
	  mul $v0, $v0, $v1	
	  sw $v0, -144($fp)	# spill _tmp49 from $v0 to $fp-144
	# _tmp50 = veggies + _tmp49
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v1, -144($fp)	# fill _tmp49 to $v1 from $fp-144
	  add $v0, $v0, $v1	
	  sw $v0, -148($fp)	# spill _tmp50 from $v0 to $fp-148
	# _tmp51 = 12
	  li $v0, 12		# load constant value 12 into $v0
	  sw $v0, -152($fp)	# spill _tmp51 from $v0 to $fp-152
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -152($fp)	# fill _tmp51 to $v0 from $fp-152
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -156($fp)	# spill _tmp52 from $v0 to $fp-156
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = Vegetable
	  la $v0, Vegetable	# load label
	  sw $v0, -160($fp)	# spill _tmp53 from $v0 to $fp-160
	# *(_tmp52) = _tmp53
	  lw $v0, -160($fp)	# fill _tmp53 to $v0 from $fp-160
	  lw $v1, -156($fp)	# fill _tmp52 to $v1 from $fp-156
	  sw $v0, 0($v1) 	# store with offset
	# *(_tmp50) = _tmp52
	  lw $v0, -156($fp)	# fill _tmp52 to $v0 from $fp-156
	  lw $v1, -148($fp)	# fill _tmp50 to $v1 from $fp-148
	  sw $v0, 0($v1) 	# store with offset
	# _tmp54 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -164($fp)	# spill _tmp54 from $v0 to $fp-164
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -164($fp)	# fill _tmp54 to $v0 from $fp-164
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _Grow
	  jal _Grow          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -168($fp)	# spill _tmp55 from $v0 to $fp-168
	# _tmp56 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -172($fp)	# spill _tmp56 from $v0 to $fp-172
	# _tmp57 = _tmp55 < _tmp56
	  lw $v0, -168($fp)	# fill _tmp55 to $v0 from $fp-168
	  lw $v1, -172($fp)	# fill _tmp56 to $v1 from $fp-172
	  slt $v0, $v0, $v1	
	  sw $v0, -176($fp)	# spill _tmp57 from $v0 to $fp-176
	# _tmp58 = *(veggies + -4)
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -180($fp)	# spill _tmp58 from $v0 to $fp-180
	# _tmp59 = _tmp55 < _tmp58
	  lw $v0, -168($fp)	# fill _tmp55 to $v0 from $fp-168
	  lw $v1, -180($fp)	# fill _tmp58 to $v1 from $fp-180
	  slt $v0, $v0, $v1	
	  sw $v0, -184($fp)	# spill _tmp59 from $v0 to $fp-184
	# _tmp60 = _tmp59 == _tmp56
	  lw $v0, -184($fp)	# fill _tmp59 to $v0 from $fp-184
	  lw $v1, -172($fp)	# fill _tmp56 to $v1 from $fp-172
	  seq $v0, $v0, $v1	
	  sw $v0, -188($fp)	# spill _tmp60 from $v0 to $fp-188
	# _tmp61 = _tmp57 || _tmp60
	  lw $v0, -176($fp)	# fill _tmp57 to $v0 from $fp-176
	  lw $v1, -188($fp)	# fill _tmp60 to $v1 from $fp-188
	  or $v0, $v0, $v1	
	  sw $v0, -192($fp)	# spill _tmp61 from $v0 to $fp-192
	# IfZ _tmp61 Goto _L3
	  lw $v0, -192($fp)	# fill _tmp61 to $v0 from $fp-192
	  beqz $v0, _L3	# branch if _tmp61 is zero 
	# _tmp62 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string9	# load label
	  sw $v0, -196($fp)	# spill _tmp62 from $v0 to $fp-196
	# PushParam _tmp62
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -196($fp)	# fill _tmp62 to $v0 from $fp-196
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp63 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -200($fp)	# spill _tmp63 from $v0 to $fp-200
	# _tmp64 = _tmp63 * _tmp55
	  lw $v0, -200($fp)	# fill _tmp63 to $v0 from $fp-200
	  lw $v1, -168($fp)	# fill _tmp55 to $v1 from $fp-168
	  mul $v0, $v0, $v1	
	  sw $v0, -204($fp)	# spill _tmp64 from $v0 to $fp-204
	# _tmp65 = veggies + _tmp64
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v1, -204($fp)	# fill _tmp64 to $v1 from $fp-204
	  add $v0, $v0, $v1	
	  sw $v0, -208($fp)	# spill _tmp65 from $v0 to $fp-208
	# _tmp66 = *(_tmp65)
	  lw $v0, -208($fp)	# fill _tmp65 to $v0 from $fp-208
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -212($fp)	# spill _tmp66 from $v0 to $fp-212
	# _tmp67 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -216($fp)	# spill _tmp67 from $v0 to $fp-216
	# _tmp68 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -220($fp)	# spill _tmp68 from $v0 to $fp-220
	# _tmp69 = _tmp67 < _tmp68
	  lw $v0, -216($fp)	# fill _tmp67 to $v0 from $fp-216
	  lw $v1, -220($fp)	# fill _tmp68 to $v1 from $fp-220
	  slt $v0, $v0, $v1	
	  sw $v0, -224($fp)	# spill _tmp69 from $v0 to $fp-224
	# _tmp70 = *(veggies + -4)
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -228($fp)	# spill _tmp70 from $v0 to $fp-228
	# _tmp71 = _tmp67 < _tmp70
	  lw $v0, -216($fp)	# fill _tmp67 to $v0 from $fp-216
	  lw $v1, -228($fp)	# fill _tmp70 to $v1 from $fp-228
	  slt $v0, $v0, $v1	
	  sw $v0, -232($fp)	# spill _tmp71 from $v0 to $fp-232
	# _tmp72 = _tmp71 == _tmp68
	  lw $v0, -232($fp)	# fill _tmp71 to $v0 from $fp-232
	  lw $v1, -220($fp)	# fill _tmp68 to $v1 from $fp-220
	  seq $v0, $v0, $v1	
	  sw $v0, -236($fp)	# spill _tmp72 from $v0 to $fp-236
	# _tmp73 = _tmp69 || _tmp72
	  lw $v0, -224($fp)	# fill _tmp69 to $v0 from $fp-224
	  lw $v1, -236($fp)	# fill _tmp72 to $v1 from $fp-236
	  or $v0, $v0, $v1	
	  sw $v0, -240($fp)	# spill _tmp73 from $v0 to $fp-240
	# IfZ _tmp73 Goto _L4
	  lw $v0, -240($fp)	# fill _tmp73 to $v0 from $fp-240
	  beqz $v0, _L4	# branch if _tmp73 is zero 
	# _tmp74 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string10	# load label
	  sw $v0, -244($fp)	# spill _tmp74 from $v0 to $fp-244
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -244($fp)	# fill _tmp74 to $v0 from $fp-244
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp75 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -248($fp)	# spill _tmp75 from $v0 to $fp-248
	# _tmp76 = _tmp75 * _tmp67
	  lw $v0, -248($fp)	# fill _tmp75 to $v0 from $fp-248
	  lw $v1, -216($fp)	# fill _tmp67 to $v1 from $fp-216
	  mul $v0, $v0, $v1	
	  sw $v0, -252($fp)	# spill _tmp76 from $v0 to $fp-252
	# _tmp77 = veggies + _tmp76
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v1, -252($fp)	# fill _tmp76 to $v1 from $fp-252
	  add $v0, $v0, $v1	
	  sw $v0, -256($fp)	# spill _tmp77 from $v0 to $fp-256
	# _tmp78 = *(_tmp77)
	  lw $v0, -256($fp)	# fill _tmp77 to $v0 from $fp-256
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -260($fp)	# spill _tmp78 from $v0 to $fp-260
	# _tmp79 = *(_tmp78)
	  lw $v0, -260($fp)	# fill _tmp78 to $v0 from $fp-260
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -264($fp)	# spill _tmp79 from $v0 to $fp-264
	# _tmp80 = *(_tmp79)
	  lw $v0, -264($fp)	# fill _tmp79 to $v0 from $fp-264
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -268($fp)	# spill _tmp80 from $v0 to $fp-268
	# PushParam _tmp66
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -212($fp)	# fill _tmp66 to $v0 from $fp-212
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -260($fp)	# fill _tmp78 to $v0 from $fp-260
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp80
	  lw $v0, -268($fp)	# fill _tmp80 to $v0 from $fp-268
	  jalr $v0            	# jump to function
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
