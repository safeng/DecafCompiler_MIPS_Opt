	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Matrix.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.Set:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.Get:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.PrintMatrix:
	# BeginFunc 68
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 68	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp0 from $v0 to $fp-16
	# i = _tmp0
	  lw $v0, -16($fp)	# fill _tmp0 to $v0 from $fp-16
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L0:
	# _tmp1 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -20($fp)	# spill _tmp1 from $v0 to $fp-20
	# _tmp2 = i < _tmp1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -20($fp)	# fill _tmp1 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp2 from $v0 to $fp-24
	# IfZ _tmp2 Goto _L1
	  lw $v0, -24($fp)	# fill _tmp2 to $v0 from $fp-24
	  beqz $v0, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -28($fp)	# spill _tmp3 from $v0 to $fp-28
	# j = _tmp3
	  lw $v0, -28($fp)	# fill _tmp3 to $v0 from $fp-28
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
  _L2:
	# _tmp4 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -32($fp)	# spill _tmp4 from $v0 to $fp-32
	# _tmp5 = j < _tmp4
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -32($fp)	# fill _tmp4 to $v1 from $fp-32
	  slt $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp5 from $v0 to $fp-36
	# IfZ _tmp5 Goto _L3
	  lw $v0, -36($fp)	# fill _tmp5 to $v0 from $fp-36
	  beqz $v0, _L3	# branch if _tmp5 is zero 
	# _tmp6 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp6 from $v0 to $fp-40
	# _tmp7 = *(_tmp6 + 8)
	  lw $v0, -40($fp)	# fill _tmp6 to $v0 from $fp-40
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp7 from $v0 to $fp-44
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp8 = ACall _tmp7
	  lw $v0, -44($fp)	# fill _tmp7 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -48($fp)	# spill _tmp8 from $v0 to $fp-48
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -48($fp)	# fill _tmp8 to $v0 from $fp-48
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\t"
	  .data			# create string constant marked with label
	  _string1: .asciiz "\t"
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -52($fp)	# spill _tmp9 from $v0 to $fp-52
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp9 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -56($fp)	# spill _tmp10 from $v0 to $fp-56
	# _tmp11 = j + _tmp10
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -56($fp)	# fill _tmp10 to $v1 from $fp-56
	  add $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp11 from $v0 to $fp-60
	# j = _tmp11
	  lw $v0, -60($fp)	# fill _tmp11 to $v0 from $fp-60
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# Goto _L2
	  b _L2		# unconditional branch
  _L3:
	# _tmp12 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -64($fp)	# spill _tmp12 from $v0 to $fp-64
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -64($fp)	# fill _tmp12 to $v0 from $fp-64
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -68($fp)	# spill _tmp13 from $v0 to $fp-68
	# _tmp14 = i + _tmp13
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -68($fp)	# fill _tmp13 to $v1 from $fp-68
	  add $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp14 from $v0 to $fp-72
	# i = _tmp14
	  lw $v0, -72($fp)	# fill _tmp14 to $v0 from $fp-72
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L0
	  b _L0		# unconditional branch
  _L1:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.SeedMatrix:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp15 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp15 from $v0 to $fp-16
	# i = _tmp15
	  lw $v0, -16($fp)	# fill _tmp15 to $v0 from $fp-16
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L4:
	# _tmp16 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -20($fp)	# spill _tmp16 from $v0 to $fp-20
	# _tmp17 = i < _tmp16
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -20($fp)	# fill _tmp16 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp17 from $v0 to $fp-24
	# IfZ _tmp17 Goto _L5
	  lw $v0, -24($fp)	# fill _tmp17 to $v0 from $fp-24
	  beqz $v0, _L5	# branch if _tmp17 is zero 
	# _tmp18 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -28($fp)	# spill _tmp18 from $v0 to $fp-28
	# j = _tmp18
	  lw $v0, -28($fp)	# fill _tmp18 to $v0 from $fp-28
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
  _L6:
	# _tmp19 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -32($fp)	# spill _tmp19 from $v0 to $fp-32
	# _tmp20 = j < _tmp19
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -32($fp)	# fill _tmp19 to $v1 from $fp-32
	  slt $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp20 from $v0 to $fp-36
	# IfZ _tmp20 Goto _L7
	  lw $v0, -36($fp)	# fill _tmp20 to $v0 from $fp-36
	  beqz $v0, _L7	# branch if _tmp20 is zero 
	# _tmp21 = i + j
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  add $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp21 from $v0 to $fp-40
	# _tmp22 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp22 from $v0 to $fp-44
	# _tmp23 = *(_tmp22 + 4)
	  lw $v0, -44($fp)	# fill _tmp22 to $v0 from $fp-44
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -48($fp)	# spill _tmp23 from $v0 to $fp-48
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -40($fp)	# fill _tmp21 to $v0 from $fp-40
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp23
	  lw $v0, -48($fp)	# fill _tmp23 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp24 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -52($fp)	# spill _tmp24 from $v0 to $fp-52
	# _tmp25 = j + _tmp24
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -52($fp)	# fill _tmp24 to $v1 from $fp-52
	  add $v0, $v0, $v1	
	  sw $v0, -56($fp)	# spill _tmp25 from $v0 to $fp-56
	# j = _tmp25
	  lw $v0, -56($fp)	# fill _tmp25 to $v0 from $fp-56
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# Goto _L6
	  b _L6		# unconditional branch
  _L7:
	# _tmp26 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -60($fp)	# spill _tmp26 from $v0 to $fp-60
	# _tmp27 = i + _tmp26
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -60($fp)	# fill _tmp26 to $v1 from $fp-60
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp27 from $v0 to $fp-64
	# i = _tmp27
	  lw $v0, -64($fp)	# fill _tmp27 to $v0 from $fp-64
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L4
	  b _L4		# unconditional branch
  _L5:
	# _tmp28 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -68($fp)	# spill _tmp28 from $v0 to $fp-68
	# _tmp29 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -72($fp)	# spill _tmp29 from $v0 to $fp-72
	# _tmp30 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -76($fp)	# spill _tmp30 from $v0 to $fp-76
	# _tmp31 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp31 from $v0 to $fp-80
	# _tmp32 = *(_tmp31 + 4)
	  lw $v0, -80($fp)	# fill _tmp31 to $v0 from $fp-80
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp32 from $v0 to $fp-84
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -76($fp)	# fill _tmp30 to $v0 from $fp-76
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -72($fp)	# fill _tmp29 to $v0 from $fp-72
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -68($fp)	# fill _tmp28 to $v0 from $fp-68
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp32
	  lw $v0, -84($fp)	# fill _tmp32 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp33 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -88($fp)	# spill _tmp33 from $v0 to $fp-88
	# _tmp34 = 6
	  li $v0, 6		# load constant value 6 into $v0
	  sw $v0, -92($fp)	# spill _tmp34 from $v0 to $fp-92
	# _tmp35 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -96($fp)	# spill _tmp35 from $v0 to $fp-96
	# _tmp36 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -100($fp)	# spill _tmp36 from $v0 to $fp-100
	# _tmp37 = *(_tmp36 + 4)
	  lw $v0, -100($fp)	# fill _tmp36 to $v0 from $fp-100
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -104($fp)	# spill _tmp37 from $v0 to $fp-104
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -96($fp)	# fill _tmp35 to $v0 from $fp-96
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp34
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -92($fp)	# fill _tmp34 to $v0 from $fp-92
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -88($fp)	# fill _tmp33 to $v0 from $fp-88
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp37
	  lw $v0, -104($fp)	# fill _tmp37 to $v0 from $fp-104
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp38 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -108($fp)	# spill _tmp38 from $v0 to $fp-108
	# _tmp39 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -112($fp)	# spill _tmp39 from $v0 to $fp-112
	# _tmp40 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -116($fp)	# spill _tmp40 from $v0 to $fp-116
	# _tmp41 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -120($fp)	# spill _tmp41 from $v0 to $fp-120
	# _tmp42 = *(_tmp41 + 4)
	  lw $v0, -120($fp)	# fill _tmp41 to $v0 from $fp-120
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -124($fp)	# spill _tmp42 from $v0 to $fp-124
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -116($fp)	# fill _tmp40 to $v0 from $fp-116
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -112($fp)	# fill _tmp39 to $v0 from $fp-112
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -108($fp)	# fill _tmp38 to $v0 from $fp-108
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp42
	  lw $v0, -124($fp)	# fill _tmp42 to $v0 from $fp-124
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp43 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -128($fp)	# spill _tmp43 from $v0 to $fp-128
	# _tmp44 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -132($fp)	# spill _tmp44 from $v0 to $fp-132
	# _tmp45 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -136($fp)	# spill _tmp45 from $v0 to $fp-136
	# _tmp46 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -140($fp)	# spill _tmp46 from $v0 to $fp-140
	# _tmp47 = *(_tmp46 + 4)
	  lw $v0, -140($fp)	# fill _tmp46 to $v0 from $fp-140
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -144($fp)	# spill _tmp47 from $v0 to $fp-144
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -136($fp)	# fill _tmp45 to $v0 from $fp-136
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -132($fp)	# fill _tmp44 to $v0 from $fp-132
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp43
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -128($fp)	# fill _tmp43 to $v0 from $fp-128
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp47
	  lw $v0, -144($fp)	# fill _tmp47 to $v0 from $fp-144
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp48 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -148($fp)	# spill _tmp48 from $v0 to $fp-148
	# _tmp49 = 6
	  li $v0, 6		# load constant value 6 into $v0
	  sw $v0, -152($fp)	# spill _tmp49 from $v0 to $fp-152
	# _tmp50 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -156($fp)	# spill _tmp50 from $v0 to $fp-156
	# _tmp51 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -160($fp)	# spill _tmp51 from $v0 to $fp-160
	# _tmp52 = *(_tmp51 + 4)
	  lw $v0, -160($fp)	# fill _tmp51 to $v0 from $fp-160
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -164($fp)	# spill _tmp52 from $v0 to $fp-164
	# PushParam _tmp50
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -156($fp)	# fill _tmp50 to $v0 from $fp-156
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp49
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -152($fp)	# fill _tmp49 to $v0 from $fp-152
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -148($fp)	# fill _tmp48 to $v0 from $fp-148
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  lw $v0, -164($fp)	# fill _tmp52 to $v0 from $fp-164
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp53 = 7
	  li $v0, 7		# load constant value 7 into $v0
	  sw $v0, -168($fp)	# spill _tmp53 from $v0 to $fp-168
	# _tmp54 = 7
	  li $v0, 7		# load constant value 7 into $v0
	  sw $v0, -172($fp)	# spill _tmp54 from $v0 to $fp-172
	# _tmp55 = 7
	  li $v0, 7		# load constant value 7 into $v0
	  sw $v0, -176($fp)	# spill _tmp55 from $v0 to $fp-176
	# _tmp56 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -180($fp)	# spill _tmp56 from $v0 to $fp-180
	# _tmp57 = *(_tmp56 + 4)
	  lw $v0, -180($fp)	# fill _tmp56 to $v0 from $fp-180
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -184($fp)	# spill _tmp57 from $v0 to $fp-184
	# PushParam _tmp55
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -176($fp)	# fill _tmp55 to $v0 from $fp-176
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -172($fp)	# fill _tmp54 to $v0 from $fp-172
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -168($fp)	# fill _tmp53 to $v0 from $fp-168
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp57
	  lw $v0, -184($fp)	# fill _tmp57 to $v0 from $fp-184
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Matrix
	  .data
	  .align 2
	  Matrix:		# label for class Matrix vtable
	  .word _Matrix.Init
	  .word _Matrix.Set
	  .word _Matrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
  _DenseMatrix.Init:
	# BeginFunc 284
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 284	# decrement sp to make space for locals/temps
	# _tmp58 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -16($fp)	# spill _tmp58 from $v0 to $fp-16
	# _tmp59 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp59 from $v0 to $fp-20
	# _tmp60 = _tmp58 < _tmp59
	  lw $v0, -16($fp)	# fill _tmp58 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp59 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp60 from $v0 to $fp-24
	# IfZ _tmp60 Goto _L8
	  lw $v0, -24($fp)	# fill _tmp60 to $v0 from $fp-24
	  beqz $v0, _L8	# branch if _tmp60 is zero 
	# _tmp61 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -28($fp)	# spill _tmp61 from $v0 to $fp-28
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -28($fp)	# fill _tmp61 to $v0 from $fp-28
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp62 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -32($fp)	# spill _tmp62 from $v0 to $fp-32
	# _tmp63 = _tmp62 + _tmp58
	  lw $v0, -32($fp)	# fill _tmp62 to $v0 from $fp-32
	  lw $v1, -16($fp)	# fill _tmp58 to $v1 from $fp-16
	  add $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp63 from $v0 to $fp-36
	# _tmp64 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -40($fp)	# spill _tmp64 from $v0 to $fp-40
	# _tmp65 = _tmp63 * _tmp64
	  lw $v0, -36($fp)	# fill _tmp63 to $v0 from $fp-36
	  lw $v1, -40($fp)	# fill _tmp64 to $v1 from $fp-40
	  mul $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp65 from $v0 to $fp-44
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -44($fp)	# fill _tmp65 to $v0 from $fp-44
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp66 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -48($fp)	# spill _tmp66 from $v0 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp66) = _tmp58
	  lw $v0, -16($fp)	# fill _tmp58 to $v0 from $fp-16
	  lw $v1, -48($fp)	# fill _tmp66 to $v1 from $fp-48
	  sw $v0, 0($v1) 	# store with offset
	# _tmp67 = _tmp66 + _tmp64
	  lw $v0, -48($fp)	# fill _tmp66 to $v0 from $fp-48
	  lw $v1, -40($fp)	# fill _tmp64 to $v1 from $fp-40
	  add $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp67 from $v0 to $fp-52
	# *(this + 4) = _tmp67
	  lw $v0, -52($fp)	# fill _tmp67 to $v0 from $fp-52
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# _tmp68 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -56($fp)	# spill _tmp68 from $v0 to $fp-56
	# i = _tmp68
	  lw $v0, -56($fp)	# fill _tmp68 to $v0 from $fp-56
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L9:
	# _tmp69 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -60($fp)	# spill _tmp69 from $v0 to $fp-60
	# _tmp70 = i < _tmp69
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -60($fp)	# fill _tmp69 to $v1 from $fp-60
	  slt $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp70 from $v0 to $fp-64
	# IfZ _tmp70 Goto _L10
	  lw $v0, -64($fp)	# fill _tmp70 to $v0 from $fp-64
	  beqz $v0, _L10	# branch if _tmp70 is zero 
	# _tmp71 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp71 from $v0 to $fp-68
	# _tmp72 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -72($fp)	# spill _tmp72 from $v0 to $fp-72
	# _tmp73 = i < _tmp72
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -72($fp)	# fill _tmp72 to $v1 from $fp-72
	  slt $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp73 from $v0 to $fp-76
	# _tmp74 = *(_tmp71 + -4)
	  lw $v0, -68($fp)	# fill _tmp71 to $v0 from $fp-68
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp74 from $v0 to $fp-80
	# _tmp75 = i < _tmp74
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -80($fp)	# fill _tmp74 to $v1 from $fp-80
	  slt $v0, $v0, $v1	
	  sw $v0, -84($fp)	# spill _tmp75 from $v0 to $fp-84
	# _tmp76 = _tmp75 == _tmp72
	  lw $v0, -84($fp)	# fill _tmp75 to $v0 from $fp-84
	  lw $v1, -72($fp)	# fill _tmp72 to $v1 from $fp-72
	  seq $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp76 from $v0 to $fp-88
	# _tmp77 = _tmp73 || _tmp76
	  lw $v0, -76($fp)	# fill _tmp73 to $v0 from $fp-76
	  lw $v1, -88($fp)	# fill _tmp76 to $v1 from $fp-88
	  or $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp77 from $v0 to $fp-92
	# IfZ _tmp77 Goto _L11
	  lw $v0, -92($fp)	# fill _tmp77 to $v0 from $fp-92
	  beqz $v0, _L11	# branch if _tmp77 is zero 
	# _tmp78 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -96($fp)	# spill _tmp78 from $v0 to $fp-96
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -96($fp)	# fill _tmp78 to $v0 from $fp-96
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp79 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -100($fp)	# spill _tmp79 from $v0 to $fp-100
	# _tmp80 = _tmp79 * i
	  lw $v0, -100($fp)	# fill _tmp79 to $v0 from $fp-100
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp80 from $v0 to $fp-104
	# _tmp81 = _tmp71 + _tmp80
	  lw $v0, -68($fp)	# fill _tmp71 to $v0 from $fp-68
	  lw $v1, -104($fp)	# fill _tmp80 to $v1 from $fp-104
	  add $v0, $v0, $v1	
	  sw $v0, -108($fp)	# spill _tmp81 from $v0 to $fp-108
	# _tmp82 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -112($fp)	# spill _tmp82 from $v0 to $fp-112
	# _tmp83 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -116($fp)	# spill _tmp83 from $v0 to $fp-116
	# _tmp84 = _tmp82 < _tmp83
	  lw $v0, -112($fp)	# fill _tmp82 to $v0 from $fp-112
	  lw $v1, -116($fp)	# fill _tmp83 to $v1 from $fp-116
	  slt $v0, $v0, $v1	
	  sw $v0, -120($fp)	# spill _tmp84 from $v0 to $fp-120
	# IfZ _tmp84 Goto _L12
	  lw $v0, -120($fp)	# fill _tmp84 to $v0 from $fp-120
	  beqz $v0, _L12	# branch if _tmp84 is zero 
	# _tmp85 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -124($fp)	# spill _tmp85 from $v0 to $fp-124
	# PushParam _tmp85
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -124($fp)	# fill _tmp85 to $v0 from $fp-124
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp86 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -128($fp)	# spill _tmp86 from $v0 to $fp-128
	# _tmp87 = _tmp86 + _tmp82
	  lw $v0, -128($fp)	# fill _tmp86 to $v0 from $fp-128
	  lw $v1, -112($fp)	# fill _tmp82 to $v1 from $fp-112
	  add $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp87 from $v0 to $fp-132
	# _tmp88 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -136($fp)	# spill _tmp88 from $v0 to $fp-136
	# _tmp89 = _tmp87 * _tmp88
	  lw $v0, -132($fp)	# fill _tmp87 to $v0 from $fp-132
	  lw $v1, -136($fp)	# fill _tmp88 to $v1 from $fp-136
	  mul $v0, $v0, $v1	
	  sw $v0, -140($fp)	# spill _tmp89 from $v0 to $fp-140
	# PushParam _tmp89
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -140($fp)	# fill _tmp89 to $v0 from $fp-140
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp90 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -144($fp)	# spill _tmp90 from $v0 to $fp-144
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp90) = _tmp82
	  lw $v0, -112($fp)	# fill _tmp82 to $v0 from $fp-112
	  lw $v1, -144($fp)	# fill _tmp90 to $v1 from $fp-144
	  sw $v0, 0($v1) 	# store with offset
	# _tmp91 = _tmp90 + _tmp88
	  lw $v0, -144($fp)	# fill _tmp90 to $v0 from $fp-144
	  lw $v1, -136($fp)	# fill _tmp88 to $v1 from $fp-136
	  add $v0, $v0, $v1	
	  sw $v0, -148($fp)	# spill _tmp91 from $v0 to $fp-148
	# *(_tmp81) = _tmp91
	  lw $v0, -148($fp)	# fill _tmp91 to $v0 from $fp-148
	  lw $v1, -108($fp)	# fill _tmp81 to $v1 from $fp-108
	  sw $v0, 0($v1) 	# store with offset
	# _tmp92 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -152($fp)	# spill _tmp92 from $v0 to $fp-152
	# _tmp93 = i + _tmp92
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -152($fp)	# fill _tmp92 to $v1 from $fp-152
	  add $v0, $v0, $v1	
	  sw $v0, -156($fp)	# spill _tmp93 from $v0 to $fp-156
	# i = _tmp93
	  lw $v0, -156($fp)	# fill _tmp93 to $v0 from $fp-156
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L9
	  b _L9		# unconditional branch
  _L10:
	# _tmp94 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -160($fp)	# spill _tmp94 from $v0 to $fp-160
	# i = _tmp94
	  lw $v0, -160($fp)	# fill _tmp94 to $v0 from $fp-160
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L13:
	# _tmp95 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -164($fp)	# spill _tmp95 from $v0 to $fp-164
	# _tmp96 = i < _tmp95
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -164($fp)	# fill _tmp95 to $v1 from $fp-164
	  slt $v0, $v0, $v1	
	  sw $v0, -168($fp)	# spill _tmp96 from $v0 to $fp-168
	# IfZ _tmp96 Goto _L14
	  lw $v0, -168($fp)	# fill _tmp96 to $v0 from $fp-168
	  beqz $v0, _L14	# branch if _tmp96 is zero 
	# _tmp97 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -172($fp)	# spill _tmp97 from $v0 to $fp-172
	# j = _tmp97
	  lw $v0, -172($fp)	# fill _tmp97 to $v0 from $fp-172
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
  _L15:
	# _tmp98 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -176($fp)	# spill _tmp98 from $v0 to $fp-176
	# _tmp99 = j < _tmp98
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -176($fp)	# fill _tmp98 to $v1 from $fp-176
	  slt $v0, $v0, $v1	
	  sw $v0, -180($fp)	# spill _tmp99 from $v0 to $fp-180
	# IfZ _tmp99 Goto _L16
	  lw $v0, -180($fp)	# fill _tmp99 to $v0 from $fp-180
	  beqz $v0, _L16	# branch if _tmp99 is zero 
	# _tmp100 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -184($fp)	# spill _tmp100 from $v0 to $fp-184
	# _tmp101 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -188($fp)	# spill _tmp101 from $v0 to $fp-188
	# _tmp102 = i < _tmp101
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -188($fp)	# fill _tmp101 to $v1 from $fp-188
	  slt $v0, $v0, $v1	
	  sw $v0, -192($fp)	# spill _tmp102 from $v0 to $fp-192
	# _tmp103 = *(_tmp100 + -4)
	  lw $v0, -184($fp)	# fill _tmp100 to $v0 from $fp-184
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -196($fp)	# spill _tmp103 from $v0 to $fp-196
	# _tmp104 = i < _tmp103
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -196($fp)	# fill _tmp103 to $v1 from $fp-196
	  slt $v0, $v0, $v1	
	  sw $v0, -200($fp)	# spill _tmp104 from $v0 to $fp-200
	# _tmp105 = _tmp104 == _tmp101
	  lw $v0, -200($fp)	# fill _tmp104 to $v0 from $fp-200
	  lw $v1, -188($fp)	# fill _tmp101 to $v1 from $fp-188
	  seq $v0, $v0, $v1	
	  sw $v0, -204($fp)	# spill _tmp105 from $v0 to $fp-204
	# _tmp106 = _tmp102 || _tmp105
	  lw $v0, -192($fp)	# fill _tmp102 to $v0 from $fp-192
	  lw $v1, -204($fp)	# fill _tmp105 to $v1 from $fp-204
	  or $v0, $v0, $v1	
	  sw $v0, -208($fp)	# spill _tmp106 from $v0 to $fp-208
	# IfZ _tmp106 Goto _L17
	  lw $v0, -208($fp)	# fill _tmp106 to $v0 from $fp-208
	  beqz $v0, _L17	# branch if _tmp106 is zero 
	# _tmp107 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -212($fp)	# spill _tmp107 from $v0 to $fp-212
	# PushParam _tmp107
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -212($fp)	# fill _tmp107 to $v0 from $fp-212
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp108 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -216($fp)	# spill _tmp108 from $v0 to $fp-216
	# _tmp109 = _tmp108 * i
	  lw $v0, -216($fp)	# fill _tmp108 to $v0 from $fp-216
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -220($fp)	# spill _tmp109 from $v0 to $fp-220
	# _tmp110 = _tmp100 + _tmp109
	  lw $v0, -184($fp)	# fill _tmp100 to $v0 from $fp-184
	  lw $v1, -220($fp)	# fill _tmp109 to $v1 from $fp-220
	  add $v0, $v0, $v1	
	  sw $v0, -224($fp)	# spill _tmp110 from $v0 to $fp-224
	# _tmp111 = *(_tmp110)
	  lw $v0, -224($fp)	# fill _tmp110 to $v0 from $fp-224
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -228($fp)	# spill _tmp111 from $v0 to $fp-228
	# _tmp112 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -232($fp)	# spill _tmp112 from $v0 to $fp-232
	# _tmp113 = j < _tmp112
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -232($fp)	# fill _tmp112 to $v1 from $fp-232
	  slt $v0, $v0, $v1	
	  sw $v0, -236($fp)	# spill _tmp113 from $v0 to $fp-236
	# _tmp114 = *(_tmp111 + -4)
	  lw $v0, -228($fp)	# fill _tmp111 to $v0 from $fp-228
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -240($fp)	# spill _tmp114 from $v0 to $fp-240
	# _tmp115 = j < _tmp114
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -240($fp)	# fill _tmp114 to $v1 from $fp-240
	  slt $v0, $v0, $v1	
	  sw $v0, -244($fp)	# spill _tmp115 from $v0 to $fp-244
	# _tmp116 = _tmp115 == _tmp112
	  lw $v0, -244($fp)	# fill _tmp115 to $v0 from $fp-244
	  lw $v1, -232($fp)	# fill _tmp112 to $v1 from $fp-232
	  seq $v0, $v0, $v1	
	  sw $v0, -248($fp)	# spill _tmp116 from $v0 to $fp-248
	# _tmp117 = _tmp113 || _tmp116
	  lw $v0, -236($fp)	# fill _tmp113 to $v0 from $fp-236
	  lw $v1, -248($fp)	# fill _tmp116 to $v1 from $fp-248
	  or $v0, $v0, $v1	
	  sw $v0, -252($fp)	# spill _tmp117 from $v0 to $fp-252
	# IfZ _tmp117 Goto _L18
	  lw $v0, -252($fp)	# fill _tmp117 to $v0 from $fp-252
	  beqz $v0, _L18	# branch if _tmp117 is zero 
	# _tmp118 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string7	# load label
	  sw $v0, -256($fp)	# spill _tmp118 from $v0 to $fp-256
	# PushParam _tmp118
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -256($fp)	# fill _tmp118 to $v0 from $fp-256
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L18:
	# _tmp119 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -260($fp)	# spill _tmp119 from $v0 to $fp-260
	# _tmp120 = _tmp119 * j
	  lw $v0, -260($fp)	# fill _tmp119 to $v0 from $fp-260
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  mul $v0, $v0, $v1	
	  sw $v0, -264($fp)	# spill _tmp120 from $v0 to $fp-264
	# _tmp121 = _tmp111 + _tmp120
	  lw $v0, -228($fp)	# fill _tmp111 to $v0 from $fp-228
	  lw $v1, -264($fp)	# fill _tmp120 to $v1 from $fp-264
	  add $v0, $v0, $v1	
	  sw $v0, -268($fp)	# spill _tmp121 from $v0 to $fp-268
	# _tmp122 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -272($fp)	# spill _tmp122 from $v0 to $fp-272
	# *(_tmp121) = _tmp122
	  lw $v0, -272($fp)	# fill _tmp122 to $v0 from $fp-272
	  lw $v1, -268($fp)	# fill _tmp121 to $v1 from $fp-268
	  sw $v0, 0($v1) 	# store with offset
	# _tmp123 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -276($fp)	# spill _tmp123 from $v0 to $fp-276
	# _tmp124 = j + _tmp123
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -276($fp)	# fill _tmp123 to $v1 from $fp-276
	  add $v0, $v0, $v1	
	  sw $v0, -280($fp)	# spill _tmp124 from $v0 to $fp-280
	# j = _tmp124
	  lw $v0, -280($fp)	# fill _tmp124 to $v0 from $fp-280
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# Goto _L15
	  b _L15		# unconditional branch
  _L16:
	# _tmp125 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -284($fp)	# spill _tmp125 from $v0 to $fp-284
	# _tmp126 = i + _tmp125
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -284($fp)	# fill _tmp125 to $v1 from $fp-284
	  add $v0, $v0, $v1	
	  sw $v0, -288($fp)	# spill _tmp126 from $v0 to $fp-288
	# i = _tmp126
	  lw $v0, -288($fp)	# fill _tmp126 to $v0 from $fp-288
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L13
	  b _L13		# unconditional branch
  _L14:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _DenseMatrix.Set:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp127 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp127 from $v0 to $fp-8
	# _tmp128 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp128 from $v0 to $fp-12
	# _tmp129 = x < _tmp128
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -12($fp)	# fill _tmp128 to $v1 from $fp-12
	  slt $v0, $v0, $v1	
	  sw $v0, -16($fp)	# spill _tmp129 from $v0 to $fp-16
	# _tmp130 = *(_tmp127 + -4)
	  lw $v0, -8($fp)	# fill _tmp127 to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp130 from $v0 to $fp-20
	# _tmp131 = x < _tmp130
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -20($fp)	# fill _tmp130 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp131 from $v0 to $fp-24
	# _tmp132 = _tmp131 == _tmp128
	  lw $v0, -24($fp)	# fill _tmp131 to $v0 from $fp-24
	  lw $v1, -12($fp)	# fill _tmp128 to $v1 from $fp-12
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp132 from $v0 to $fp-28
	# _tmp133 = _tmp129 || _tmp132
	  lw $v0, -16($fp)	# fill _tmp129 to $v0 from $fp-16
	  lw $v1, -28($fp)	# fill _tmp132 to $v1 from $fp-28
	  or $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp133 from $v0 to $fp-32
	# IfZ _tmp133 Goto _L19
	  lw $v0, -32($fp)	# fill _tmp133 to $v0 from $fp-32
	  beqz $v0, _L19	# branch if _tmp133 is zero 
	# _tmp134 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string8	# load label
	  sw $v0, -36($fp)	# spill _tmp134 from $v0 to $fp-36
	# PushParam _tmp134
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp134 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L19:
	# _tmp135 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -40($fp)	# spill _tmp135 from $v0 to $fp-40
	# _tmp136 = _tmp135 * x
	  lw $v0, -40($fp)	# fill _tmp135 to $v0 from $fp-40
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp136 from $v0 to $fp-44
	# _tmp137 = _tmp127 + _tmp136
	  lw $v0, -8($fp)	# fill _tmp127 to $v0 from $fp-8
	  lw $v1, -44($fp)	# fill _tmp136 to $v1 from $fp-44
	  add $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp137 from $v0 to $fp-48
	# _tmp138 = *(_tmp137)
	  lw $v0, -48($fp)	# fill _tmp137 to $v0 from $fp-48
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -52($fp)	# spill _tmp138 from $v0 to $fp-52
	# _tmp139 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -56($fp)	# spill _tmp139 from $v0 to $fp-56
	# _tmp140 = y < _tmp139
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  lw $v1, -56($fp)	# fill _tmp139 to $v1 from $fp-56
	  slt $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp140 from $v0 to $fp-60
	# _tmp141 = *(_tmp138 + -4)
	  lw $v0, -52($fp)	# fill _tmp138 to $v0 from $fp-52
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp141 from $v0 to $fp-64
	# _tmp142 = y < _tmp141
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  lw $v1, -64($fp)	# fill _tmp141 to $v1 from $fp-64
	  slt $v0, $v0, $v1	
	  sw $v0, -68($fp)	# spill _tmp142 from $v0 to $fp-68
	# _tmp143 = _tmp142 == _tmp139
	  lw $v0, -68($fp)	# fill _tmp142 to $v0 from $fp-68
	  lw $v1, -56($fp)	# fill _tmp139 to $v1 from $fp-56
	  seq $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp143 from $v0 to $fp-72
	# _tmp144 = _tmp140 || _tmp143
	  lw $v0, -60($fp)	# fill _tmp140 to $v0 from $fp-60
	  lw $v1, -72($fp)	# fill _tmp143 to $v1 from $fp-72
	  or $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp144 from $v0 to $fp-76
	# IfZ _tmp144 Goto _L20
	  lw $v0, -76($fp)	# fill _tmp144 to $v0 from $fp-76
	  beqz $v0, _L20	# branch if _tmp144 is zero 
	# _tmp145 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string9	# load label
	  sw $v0, -80($fp)	# spill _tmp145 from $v0 to $fp-80
	# PushParam _tmp145
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -80($fp)	# fill _tmp145 to $v0 from $fp-80
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp146 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -84($fp)	# spill _tmp146 from $v0 to $fp-84
	# _tmp147 = _tmp146 * y
	  lw $v0, -84($fp)	# fill _tmp146 to $v0 from $fp-84
	  lw $v1, 12($fp)	# fill y to $v1 from $fp+12
	  mul $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp147 from $v0 to $fp-88
	# _tmp148 = _tmp138 + _tmp147
	  lw $v0, -52($fp)	# fill _tmp138 to $v0 from $fp-52
	  lw $v1, -88($fp)	# fill _tmp147 to $v1 from $fp-88
	  add $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp148 from $v0 to $fp-92
	# *(_tmp148) = value
	  lw $v0, 16($fp)	# fill value to $v0 from $fp+16
	  lw $v1, -92($fp)	# fill _tmp148 to $v1 from $fp-92
	  sw $v0, 0($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _DenseMatrix.Get:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp149 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp149 from $v0 to $fp-8
	# _tmp150 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp150 from $v0 to $fp-12
	# _tmp151 = x < _tmp150
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -12($fp)	# fill _tmp150 to $v1 from $fp-12
	  slt $v0, $v0, $v1	
	  sw $v0, -16($fp)	# spill _tmp151 from $v0 to $fp-16
	# _tmp152 = *(_tmp149 + -4)
	  lw $v0, -8($fp)	# fill _tmp149 to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp152 from $v0 to $fp-20
	# _tmp153 = x < _tmp152
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -20($fp)	# fill _tmp152 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp153 from $v0 to $fp-24
	# _tmp154 = _tmp153 == _tmp150
	  lw $v0, -24($fp)	# fill _tmp153 to $v0 from $fp-24
	  lw $v1, -12($fp)	# fill _tmp150 to $v1 from $fp-12
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp154 from $v0 to $fp-28
	# _tmp155 = _tmp151 || _tmp154
	  lw $v0, -16($fp)	# fill _tmp151 to $v0 from $fp-16
	  lw $v1, -28($fp)	# fill _tmp154 to $v1 from $fp-28
	  or $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp155 from $v0 to $fp-32
	# IfZ _tmp155 Goto _L21
	  lw $v0, -32($fp)	# fill _tmp155 to $v0 from $fp-32
	  beqz $v0, _L21	# branch if _tmp155 is zero 
	# _tmp156 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string10	# load label
	  sw $v0, -36($fp)	# spill _tmp156 from $v0 to $fp-36
	# PushParam _tmp156
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp156 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp157 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -40($fp)	# spill _tmp157 from $v0 to $fp-40
	# _tmp158 = _tmp157 * x
	  lw $v0, -40($fp)	# fill _tmp157 to $v0 from $fp-40
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp158 from $v0 to $fp-44
	# _tmp159 = _tmp149 + _tmp158
	  lw $v0, -8($fp)	# fill _tmp149 to $v0 from $fp-8
	  lw $v1, -44($fp)	# fill _tmp158 to $v1 from $fp-44
	  add $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp159 from $v0 to $fp-48
	# _tmp160 = *(_tmp159)
	  lw $v0, -48($fp)	# fill _tmp159 to $v0 from $fp-48
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -52($fp)	# spill _tmp160 from $v0 to $fp-52
	# _tmp161 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -56($fp)	# spill _tmp161 from $v0 to $fp-56
	# _tmp162 = y < _tmp161
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  lw $v1, -56($fp)	# fill _tmp161 to $v1 from $fp-56
	  slt $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp162 from $v0 to $fp-60
	# _tmp163 = *(_tmp160 + -4)
	  lw $v0, -52($fp)	# fill _tmp160 to $v0 from $fp-52
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp163 from $v0 to $fp-64
	# _tmp164 = y < _tmp163
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  lw $v1, -64($fp)	# fill _tmp163 to $v1 from $fp-64
	  slt $v0, $v0, $v1	
	  sw $v0, -68($fp)	# spill _tmp164 from $v0 to $fp-68
	# _tmp165 = _tmp164 == _tmp161
	  lw $v0, -68($fp)	# fill _tmp164 to $v0 from $fp-68
	  lw $v1, -56($fp)	# fill _tmp161 to $v1 from $fp-56
	  seq $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp165 from $v0 to $fp-72
	# _tmp166 = _tmp162 || _tmp165
	  lw $v0, -60($fp)	# fill _tmp162 to $v0 from $fp-60
	  lw $v1, -72($fp)	# fill _tmp165 to $v1 from $fp-72
	  or $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp166 from $v0 to $fp-76
	# IfZ _tmp166 Goto _L22
	  lw $v0, -76($fp)	# fill _tmp166 to $v0 from $fp-76
	  beqz $v0, _L22	# branch if _tmp166 is zero 
	# _tmp167 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string11	# load label
	  sw $v0, -80($fp)	# spill _tmp167 from $v0 to $fp-80
	# PushParam _tmp167
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -80($fp)	# fill _tmp167 to $v0 from $fp-80
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L22:
	# _tmp168 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -84($fp)	# spill _tmp168 from $v0 to $fp-84
	# _tmp169 = _tmp168 * y
	  lw $v0, -84($fp)	# fill _tmp168 to $v0 from $fp-84
	  lw $v1, 12($fp)	# fill y to $v1 from $fp+12
	  mul $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp169 from $v0 to $fp-88
	# _tmp170 = _tmp160 + _tmp169
	  lw $v0, -52($fp)	# fill _tmp160 to $v0 from $fp-52
	  lw $v1, -88($fp)	# fill _tmp169 to $v1 from $fp-88
	  add $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp170 from $v0 to $fp-92
	# _tmp171 = *(_tmp170)
	  lw $v0, -92($fp)	# fill _tmp170 to $v0 from $fp-92
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -96($fp)	# spill _tmp171 from $v0 to $fp-96
	# Return _tmp171
	  lw $v0, -96($fp)	# fill _tmp171 to $v0 from $fp-96
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
	# VTable for class DenseMatrix
	  .data
	  .align 2
	  DenseMatrix:		# label for class DenseMatrix vtable
	  .word _DenseMatrix.Init
	  .word _DenseMatrix.Set
	  .word _DenseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
  _SparseItem.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = d
	  lw $v0, 8($fp)	# fill d to $v0 from $fp+8
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# *(this + 8) = y
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 8($v1) 	# store with offset
	# *(this + 12) = next
	  lw $v0, 16($fp)	# fill next to $v0 from $fp+16
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 12($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseItem.GetNext:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp172 = *(this + 12)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp172 from $v0 to $fp-8
	# Return _tmp172
	  lw $v0, -8($fp)	# fill _tmp172 to $v0 from $fp-8
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
  _SparseItem.GetY:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp173 = *(this + 8)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp173 from $v0 to $fp-8
	# Return _tmp173
	  lw $v0, -8($fp)	# fill _tmp173 to $v0 from $fp-8
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
  _SparseItem.GetData:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp174 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp174 from $v0 to $fp-8
	# Return _tmp174
	  lw $v0, -8($fp)	# fill _tmp174 to $v0 from $fp-8
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
  _SparseItem.SetData:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = val
	  lw $v0, 8($fp)	# fill val to $v0 from $fp+8
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseItem
	  .data
	  .align 2
	  SparseItem:		# label for class SparseItem vtable
	  .word _SparseItem.Init
	  .word _SparseItem.GetNext
	  .word _SparseItem.GetY
	  .word _SparseItem.GetData
	  .word _SparseItem.SetData
	  .text
  _SparseMatrix.Init:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp175 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -12($fp)	# spill _tmp175 from $v0 to $fp-12
	# _tmp176 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp176 from $v0 to $fp-16
	# _tmp177 = _tmp175 < _tmp176
	  lw $v0, -12($fp)	# fill _tmp175 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp176 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp177 from $v0 to $fp-20
	# IfZ _tmp177 Goto _L23
	  lw $v0, -20($fp)	# fill _tmp177 to $v0 from $fp-20
	  beqz $v0, _L23	# branch if _tmp177 is zero 
	# _tmp178 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string12	# load label
	  sw $v0, -24($fp)	# spill _tmp178 from $v0 to $fp-24
	# PushParam _tmp178
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -24($fp)	# fill _tmp178 to $v0 from $fp-24
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L23:
	# _tmp179 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -28($fp)	# spill _tmp179 from $v0 to $fp-28
	# _tmp180 = _tmp179 + _tmp175
	  lw $v0, -28($fp)	# fill _tmp179 to $v0 from $fp-28
	  lw $v1, -12($fp)	# fill _tmp175 to $v1 from $fp-12
	  add $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp180 from $v0 to $fp-32
	# _tmp181 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -36($fp)	# spill _tmp181 from $v0 to $fp-36
	# _tmp182 = _tmp180 * _tmp181
	  lw $v0, -32($fp)	# fill _tmp180 to $v0 from $fp-32
	  lw $v1, -36($fp)	# fill _tmp181 to $v1 from $fp-36
	  mul $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp182 from $v0 to $fp-40
	# PushParam _tmp182
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -40($fp)	# fill _tmp182 to $v0 from $fp-40
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp183 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -44($fp)	# spill _tmp183 from $v0 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp183) = _tmp175
	  lw $v0, -12($fp)	# fill _tmp175 to $v0 from $fp-12
	  lw $v1, -44($fp)	# fill _tmp183 to $v1 from $fp-44
	  sw $v0, 0($v1) 	# store with offset
	# _tmp184 = _tmp183 + _tmp181
	  lw $v0, -44($fp)	# fill _tmp183 to $v0 from $fp-44
	  lw $v1, -36($fp)	# fill _tmp181 to $v1 from $fp-36
	  add $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp184 from $v0 to $fp-48
	# *(this + 4) = _tmp184
	  lw $v0, -48($fp)	# fill _tmp184 to $v0 from $fp-48
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# _tmp185 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -52($fp)	# spill _tmp185 from $v0 to $fp-52
	# i = _tmp185
	  lw $v0, -52($fp)	# fill _tmp185 to $v0 from $fp-52
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L24:
	# _tmp186 = 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -56($fp)	# spill _tmp186 from $v0 to $fp-56
	# _tmp187 = i < _tmp186
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -56($fp)	# fill _tmp186 to $v1 from $fp-56
	  slt $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp187 from $v0 to $fp-60
	# IfZ _tmp187 Goto _L25
	  lw $v0, -60($fp)	# fill _tmp187 to $v0 from $fp-60
	  beqz $v0, _L25	# branch if _tmp187 is zero 
	# _tmp188 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp188 from $v0 to $fp-64
	# _tmp189 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -68($fp)	# spill _tmp189 from $v0 to $fp-68
	# _tmp190 = i < _tmp189
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -68($fp)	# fill _tmp189 to $v1 from $fp-68
	  slt $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp190 from $v0 to $fp-72
	# _tmp191 = *(_tmp188 + -4)
	  lw $v0, -64($fp)	# fill _tmp188 to $v0 from $fp-64
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -76($fp)	# spill _tmp191 from $v0 to $fp-76
	# _tmp192 = i < _tmp191
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -76($fp)	# fill _tmp191 to $v1 from $fp-76
	  slt $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp192 from $v0 to $fp-80
	# _tmp193 = _tmp192 == _tmp189
	  lw $v0, -80($fp)	# fill _tmp192 to $v0 from $fp-80
	  lw $v1, -68($fp)	# fill _tmp189 to $v1 from $fp-68
	  seq $v0, $v0, $v1	
	  sw $v0, -84($fp)	# spill _tmp193 from $v0 to $fp-84
	# _tmp194 = _tmp190 || _tmp193
	  lw $v0, -72($fp)	# fill _tmp190 to $v0 from $fp-72
	  lw $v1, -84($fp)	# fill _tmp193 to $v1 from $fp-84
	  or $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp194 from $v0 to $fp-88
	# IfZ _tmp194 Goto _L26
	  lw $v0, -88($fp)	# fill _tmp194 to $v0 from $fp-88
	  beqz $v0, _L26	# branch if _tmp194 is zero 
	# _tmp195 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string13	# load label
	  sw $v0, -92($fp)	# spill _tmp195 from $v0 to $fp-92
	# PushParam _tmp195
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -92($fp)	# fill _tmp195 to $v0 from $fp-92
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp196 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -96($fp)	# spill _tmp196 from $v0 to $fp-96
	# _tmp197 = _tmp196 * i
	  lw $v0, -96($fp)	# fill _tmp196 to $v0 from $fp-96
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -100($fp)	# spill _tmp197 from $v0 to $fp-100
	# _tmp198 = _tmp188 + _tmp197
	  lw $v0, -64($fp)	# fill _tmp188 to $v0 from $fp-64
	  lw $v1, -100($fp)	# fill _tmp197 to $v1 from $fp-100
	  add $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp198 from $v0 to $fp-104
	# _tmp199 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -108($fp)	# spill _tmp199 from $v0 to $fp-108
	# *(_tmp198) = _tmp199
	  lw $v0, -108($fp)	# fill _tmp199 to $v0 from $fp-108
	  lw $v1, -104($fp)	# fill _tmp198 to $v1 from $fp-104
	  sw $v0, 0($v1) 	# store with offset
	# _tmp200 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -112($fp)	# spill _tmp200 from $v0 to $fp-112
	# _tmp201 = i + _tmp200
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -112($fp)	# fill _tmp200 to $v1 from $fp-112
	  add $v0, $v0, $v1	
	  sw $v0, -116($fp)	# spill _tmp201 from $v0 to $fp-116
	# i = _tmp201
	  lw $v0, -116($fp)	# fill _tmp201 to $v0 from $fp-116
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L24
	  b _L24		# unconditional branch
  _L25:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseMatrix.Find:
	# BeginFunc 100
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 100	# decrement sp to make space for locals/temps
	# _tmp202 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp202 from $v0 to $fp-12
	# _tmp203 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp203 from $v0 to $fp-16
	# _tmp204 = x < _tmp203
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -16($fp)	# fill _tmp203 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp204 from $v0 to $fp-20
	# _tmp205 = *(_tmp202 + -4)
	  lw $v0, -12($fp)	# fill _tmp202 to $v0 from $fp-12
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -24($fp)	# spill _tmp205 from $v0 to $fp-24
	# _tmp206 = x < _tmp205
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -24($fp)	# fill _tmp205 to $v1 from $fp-24
	  slt $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp206 from $v0 to $fp-28
	# _tmp207 = _tmp206 == _tmp203
	  lw $v0, -28($fp)	# fill _tmp206 to $v0 from $fp-28
	  lw $v1, -16($fp)	# fill _tmp203 to $v1 from $fp-16
	  seq $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp207 from $v0 to $fp-32
	# _tmp208 = _tmp204 || _tmp207
	  lw $v0, -20($fp)	# fill _tmp204 to $v0 from $fp-20
	  lw $v1, -32($fp)	# fill _tmp207 to $v1 from $fp-32
	  or $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp208 from $v0 to $fp-36
	# IfZ _tmp208 Goto _L27
	  lw $v0, -36($fp)	# fill _tmp208 to $v0 from $fp-36
	  beqz $v0, _L27	# branch if _tmp208 is zero 
	# _tmp209 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string14	# load label
	  sw $v0, -40($fp)	# spill _tmp209 from $v0 to $fp-40
	# PushParam _tmp209
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -40($fp)	# fill _tmp209 to $v0 from $fp-40
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L27:
	# _tmp210 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -44($fp)	# spill _tmp210 from $v0 to $fp-44
	# _tmp211 = _tmp210 * x
	  lw $v0, -44($fp)	# fill _tmp210 to $v0 from $fp-44
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp211 from $v0 to $fp-48
	# _tmp212 = _tmp202 + _tmp211
	  lw $v0, -12($fp)	# fill _tmp202 to $v0 from $fp-12
	  lw $v1, -48($fp)	# fill _tmp211 to $v1 from $fp-48
	  add $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp212 from $v0 to $fp-52
	# _tmp213 = *(_tmp212)
	  lw $v0, -52($fp)	# fill _tmp212 to $v0 from $fp-52
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -56($fp)	# spill _tmp213 from $v0 to $fp-56
	# elem = _tmp213
	  lw $v0, -56($fp)	# fill _tmp213 to $v0 from $fp-56
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
  _L28:
	# _tmp214 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -60($fp)	# spill _tmp214 from $v0 to $fp-60
	# _tmp215 = elem == _tmp214
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v1, -60($fp)	# fill _tmp214 to $v1 from $fp-60
	  seq $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp215 from $v0 to $fp-64
	# _tmp216 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -68($fp)	# spill _tmp216 from $v0 to $fp-68
	# _tmp217 = _tmp215 == _tmp216
	  lw $v0, -64($fp)	# fill _tmp215 to $v0 from $fp-64
	  lw $v1, -68($fp)	# fill _tmp216 to $v1 from $fp-68
	  seq $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp217 from $v0 to $fp-72
	# IfZ _tmp217 Goto _L29
	  lw $v0, -72($fp)	# fill _tmp217 to $v0 from $fp-72
	  beqz $v0, _L29	# branch if _tmp217 is zero 
	# _tmp218 = *(elem)
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -76($fp)	# spill _tmp218 from $v0 to $fp-76
	# _tmp219 = *(_tmp218 + 8)
	  lw $v0, -76($fp)	# fill _tmp218 to $v0 from $fp-76
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp219 from $v0 to $fp-80
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp220 = ACall _tmp219
	  lw $v0, -80($fp)	# fill _tmp219 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -84($fp)	# spill _tmp220 from $v0 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp221 = _tmp220 == y
	  lw $v0, -84($fp)	# fill _tmp220 to $v0 from $fp-84
	  lw $v1, 12($fp)	# fill y to $v1 from $fp+12
	  seq $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp221 from $v0 to $fp-88
	# IfZ _tmp221 Goto _L30
	  lw $v0, -88($fp)	# fill _tmp221 to $v0 from $fp-88
	  beqz $v0, _L30	# branch if _tmp221 is zero 
	# Return elem
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L30:
	# _tmp222 = *(elem)
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -92($fp)	# spill _tmp222 from $v0 to $fp-92
	# _tmp223 = *(_tmp222 + 4)
	  lw $v0, -92($fp)	# fill _tmp222 to $v0 from $fp-92
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -96($fp)	# spill _tmp223 from $v0 to $fp-96
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp224 = ACall _tmp223
	  lw $v0, -96($fp)	# fill _tmp223 to $v0 from $fp-96
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -100($fp)	# spill _tmp224 from $v0 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# elem = _tmp224
	  lw $v0, -100($fp)	# fill _tmp224 to $v0 from $fp-100
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# Goto _L28
	  b _L28		# unconditional branch
  _L29:
	# _tmp225 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -104($fp)	# spill _tmp225 from $v0 to $fp-104
	# Return _tmp225
	  lw $v0, -104($fp)	# fill _tmp225 to $v0 from $fp-104
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
  _SparseMatrix.Set:
	# BeginFunc 152
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp226 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp226 from $v0 to $fp-12
	# _tmp227 = *(_tmp226 + 20)
	  lw $v0, -12($fp)	# fill _tmp226 to $v0 from $fp-12
	  lw $v0, 20($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp227 from $v0 to $fp-16
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp228 = ACall _tmp227
	  lw $v0, -16($fp)	# fill _tmp227 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp228 from $v0 to $fp-20
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp228
	  lw $v0, -20($fp)	# fill _tmp228 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# _tmp229 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -24($fp)	# spill _tmp229 from $v0 to $fp-24
	# _tmp230 = elem == _tmp229
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v1, -24($fp)	# fill _tmp229 to $v1 from $fp-24
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp230 from $v0 to $fp-28
	# _tmp231 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -32($fp)	# spill _tmp231 from $v0 to $fp-32
	# _tmp232 = _tmp230 == _tmp231
	  lw $v0, -28($fp)	# fill _tmp230 to $v0 from $fp-28
	  lw $v1, -32($fp)	# fill _tmp231 to $v1 from $fp-32
	  seq $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp232 from $v0 to $fp-36
	# IfZ _tmp232 Goto _L31
	  lw $v0, -36($fp)	# fill _tmp232 to $v0 from $fp-36
	  beqz $v0, _L31	# branch if _tmp232 is zero 
	# _tmp233 = *(elem)
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp233 from $v0 to $fp-40
	# _tmp234 = *(_tmp233 + 16)
	  lw $v0, -40($fp)	# fill _tmp233 to $v0 from $fp-40
	  lw $v0, 16($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp234 from $v0 to $fp-44
	# PushParam value
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 16($fp)	# fill value to $v0 from $fp+16
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp234
	  lw $v0, -44($fp)	# fill _tmp234 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L32
	  b _L32		# unconditional branch
  _L31:
	# _tmp235 = 16
	  li $v0, 16		# load constant value 16 into $v0
	  sw $v0, -48($fp)	# spill _tmp235 from $v0 to $fp-48
	# PushParam _tmp235
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -48($fp)	# fill _tmp235 to $v0 from $fp-48
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp236 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -52($fp)	# spill _tmp236 from $v0 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp237 = SparseItem
	  la $v0, SparseItem	# load label
	  sw $v0, -56($fp)	# spill _tmp237 from $v0 to $fp-56
	# *(_tmp236) = _tmp237
	  lw $v0, -56($fp)	# fill _tmp237 to $v0 from $fp-56
	  lw $v1, -52($fp)	# fill _tmp236 to $v1 from $fp-52
	  sw $v0, 0($v1) 	# store with offset
	# elem = _tmp236
	  lw $v0, -52($fp)	# fill _tmp236 to $v0 from $fp-52
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# _tmp238 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -60($fp)	# spill _tmp238 from $v0 to $fp-60
	# _tmp239 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -64($fp)	# spill _tmp239 from $v0 to $fp-64
	# _tmp240 = x < _tmp239
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -64($fp)	# fill _tmp239 to $v1 from $fp-64
	  slt $v0, $v0, $v1	
	  sw $v0, -68($fp)	# spill _tmp240 from $v0 to $fp-68
	# _tmp241 = *(_tmp238 + -4)
	  lw $v0, -60($fp)	# fill _tmp238 to $v0 from $fp-60
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -72($fp)	# spill _tmp241 from $v0 to $fp-72
	# _tmp242 = x < _tmp241
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -72($fp)	# fill _tmp241 to $v1 from $fp-72
	  slt $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp242 from $v0 to $fp-76
	# _tmp243 = _tmp242 == _tmp239
	  lw $v0, -76($fp)	# fill _tmp242 to $v0 from $fp-76
	  lw $v1, -64($fp)	# fill _tmp239 to $v1 from $fp-64
	  seq $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp243 from $v0 to $fp-80
	# _tmp244 = _tmp240 || _tmp243
	  lw $v0, -68($fp)	# fill _tmp240 to $v0 from $fp-68
	  lw $v1, -80($fp)	# fill _tmp243 to $v1 from $fp-80
	  or $v0, $v0, $v1	
	  sw $v0, -84($fp)	# spill _tmp244 from $v0 to $fp-84
	# IfZ _tmp244 Goto _L33
	  lw $v0, -84($fp)	# fill _tmp244 to $v0 from $fp-84
	  beqz $v0, _L33	# branch if _tmp244 is zero 
	# _tmp245 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string15	# load label
	  sw $v0, -88($fp)	# spill _tmp245 from $v0 to $fp-88
	# PushParam _tmp245
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -88($fp)	# fill _tmp245 to $v0 from $fp-88
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L33:
	# _tmp246 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -92($fp)	# spill _tmp246 from $v0 to $fp-92
	# _tmp247 = _tmp246 * x
	  lw $v0, -92($fp)	# fill _tmp246 to $v0 from $fp-92
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $v0, $v0, $v1	
	  sw $v0, -96($fp)	# spill _tmp247 from $v0 to $fp-96
	# _tmp248 = _tmp238 + _tmp247
	  lw $v0, -60($fp)	# fill _tmp238 to $v0 from $fp-60
	  lw $v1, -96($fp)	# fill _tmp247 to $v1 from $fp-96
	  add $v0, $v0, $v1	
	  sw $v0, -100($fp)	# spill _tmp248 from $v0 to $fp-100
	# _tmp249 = *(_tmp248)
	  lw $v0, -100($fp)	# fill _tmp248 to $v0 from $fp-100
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -104($fp)	# spill _tmp249 from $v0 to $fp-104
	# _tmp250 = *(elem)
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -108($fp)	# spill _tmp250 from $v0 to $fp-108
	# _tmp251 = *(_tmp250)
	  lw $v0, -108($fp)	# fill _tmp250 to $v0 from $fp-108
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -112($fp)	# spill _tmp251 from $v0 to $fp-112
	# PushParam _tmp249
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -104($fp)	# fill _tmp249 to $v0 from $fp-104
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam value
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 16($fp)	# fill value to $v0 from $fp+16
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp251
	  lw $v0, -112($fp)	# fill _tmp251 to $v0 from $fp-112
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp252 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -116($fp)	# spill _tmp252 from $v0 to $fp-116
	# _tmp253 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -120($fp)	# spill _tmp253 from $v0 to $fp-120
	# _tmp254 = x < _tmp253
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -120($fp)	# fill _tmp253 to $v1 from $fp-120
	  slt $v0, $v0, $v1	
	  sw $v0, -124($fp)	# spill _tmp254 from $v0 to $fp-124
	# _tmp255 = *(_tmp252 + -4)
	  lw $v0, -116($fp)	# fill _tmp252 to $v0 from $fp-116
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -128($fp)	# spill _tmp255 from $v0 to $fp-128
	# _tmp256 = x < _tmp255
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -128($fp)	# fill _tmp255 to $v1 from $fp-128
	  slt $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp256 from $v0 to $fp-132
	# _tmp257 = _tmp256 == _tmp253
	  lw $v0, -132($fp)	# fill _tmp256 to $v0 from $fp-132
	  lw $v1, -120($fp)	# fill _tmp253 to $v1 from $fp-120
	  seq $v0, $v0, $v1	
	  sw $v0, -136($fp)	# spill _tmp257 from $v0 to $fp-136
	# _tmp258 = _tmp254 || _tmp257
	  lw $v0, -124($fp)	# fill _tmp254 to $v0 from $fp-124
	  lw $v1, -136($fp)	# fill _tmp257 to $v1 from $fp-136
	  or $v0, $v0, $v1	
	  sw $v0, -140($fp)	# spill _tmp258 from $v0 to $fp-140
	# IfZ _tmp258 Goto _L34
	  lw $v0, -140($fp)	# fill _tmp258 to $v0 from $fp-140
	  beqz $v0, _L34	# branch if _tmp258 is zero 
	# _tmp259 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string16: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string16	# load label
	  sw $v0, -144($fp)	# spill _tmp259 from $v0 to $fp-144
	# PushParam _tmp259
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -144($fp)	# fill _tmp259 to $v0 from $fp-144
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L34:
	# _tmp260 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -148($fp)	# spill _tmp260 from $v0 to $fp-148
	# _tmp261 = _tmp260 * x
	  lw $v0, -148($fp)	# fill _tmp260 to $v0 from $fp-148
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $v0, $v0, $v1	
	  sw $v0, -152($fp)	# spill _tmp261 from $v0 to $fp-152
	# _tmp262 = _tmp252 + _tmp261
	  lw $v0, -116($fp)	# fill _tmp252 to $v0 from $fp-116
	  lw $v1, -152($fp)	# fill _tmp261 to $v1 from $fp-152
	  add $v0, $v0, $v1	
	  sw $v0, -156($fp)	# spill _tmp262 from $v0 to $fp-156
	# *(_tmp262) = elem
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v1, -156($fp)	# fill _tmp262 to $v1 from $fp-156
	  sw $v0, 0($v1) 	# store with offset
  _L32:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseMatrix.Get:
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp263 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp263 from $v0 to $fp-12
	# _tmp264 = *(_tmp263 + 20)
	  lw $v0, -12($fp)	# fill _tmp263 to $v0 from $fp-12
	  lw $v0, 20($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp264 from $v0 to $fp-16
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 12($fp)	# fill y to $v0 from $fp+12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp265 = ACall _tmp264
	  lw $v0, -16($fp)	# fill _tmp264 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp265 from $v0 to $fp-20
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp265
	  lw $v0, -20($fp)	# fill _tmp265 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# _tmp266 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -24($fp)	# spill _tmp266 from $v0 to $fp-24
	# _tmp267 = elem == _tmp266
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v1, -24($fp)	# fill _tmp266 to $v1 from $fp-24
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp267 from $v0 to $fp-28
	# _tmp268 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -32($fp)	# spill _tmp268 from $v0 to $fp-32
	# _tmp269 = _tmp267 == _tmp268
	  lw $v0, -28($fp)	# fill _tmp267 to $v0 from $fp-28
	  lw $v1, -32($fp)	# fill _tmp268 to $v1 from $fp-32
	  seq $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp269 from $v0 to $fp-36
	# IfZ _tmp269 Goto _L35
	  lw $v0, -36($fp)	# fill _tmp269 to $v0 from $fp-36
	  beqz $v0, _L35	# branch if _tmp269 is zero 
	# _tmp270 = *(elem)
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp270 from $v0 to $fp-40
	# _tmp271 = *(_tmp270 + 12)
	  lw $v0, -40($fp)	# fill _tmp270 to $v0 from $fp-40
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp271 from $v0 to $fp-44
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp272 = ACall _tmp271
	  lw $v0, -44($fp)	# fill _tmp271 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -48($fp)	# spill _tmp272 from $v0 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return _tmp272
	  lw $v0, -48($fp)	# fill _tmp272 to $v0 from $fp-48
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L36
	  b _L36		# unconditional branch
  _L35:
	# _tmp273 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -52($fp)	# spill _tmp273 from $v0 to $fp-52
	# Return _tmp273
	  lw $v0, -52($fp)	# fill _tmp273 to $v0 from $fp-52
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L36:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseMatrix
	  .data
	  .align 2
	  SparseMatrix:		# label for class SparseMatrix vtable
	  .word _SparseMatrix.Init
	  .word _SparseMatrix.Set
	  .word _SparseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .word _SparseMatrix.Find
	  .text
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp274 = "Dense Rep \n"
	  .data			# create string constant marked with label
	  _string17: .asciiz "Dense Rep \n"
	  .text
	  la $v0, _string17	# load label
	  sw $v0, -12($fp)	# spill _tmp274 from $v0 to $fp-12
	# PushParam _tmp274
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp274 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp275 = 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -16($fp)	# spill _tmp275 from $v0 to $fp-16
	# PushParam _tmp275
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp275 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp276 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp276 from $v0 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp277 = DenseMatrix
	  la $v0, DenseMatrix	# load label
	  sw $v0, -24($fp)	# spill _tmp277 from $v0 to $fp-24
	# *(_tmp276) = _tmp277
	  lw $v0, -24($fp)	# fill _tmp277 to $v0 from $fp-24
	  lw $v1, -20($fp)	# fill _tmp276 to $v1 from $fp-20
	  sw $v0, 0($v1) 	# store with offset
	# m = _tmp276
	  lw $v0, -20($fp)	# fill _tmp276 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill m from $v0 to $fp-8
	# _tmp278 = *(m)
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -28($fp)	# spill _tmp278 from $v0 to $fp-28
	# _tmp279 = *(_tmp278)
	  lw $v0, -28($fp)	# fill _tmp278 to $v0 from $fp-28
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -32($fp)	# spill _tmp279 from $v0 to $fp-32
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp279
	  lw $v0, -32($fp)	# fill _tmp279 to $v0 from $fp-32
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp280 = *(m)
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp280 from $v0 to $fp-36
	# _tmp281 = *(_tmp280 + 16)
	  lw $v0, -36($fp)	# fill _tmp280 to $v0 from $fp-36
	  lw $v0, 16($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp281 from $v0 to $fp-40
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp281
	  lw $v0, -40($fp)	# fill _tmp281 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp282 = *(m)
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp282 from $v0 to $fp-44
	# _tmp283 = *(_tmp282 + 12)
	  lw $v0, -44($fp)	# fill _tmp282 to $v0 from $fp-44
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -48($fp)	# spill _tmp283 from $v0 to $fp-48
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp283
	  lw $v0, -48($fp)	# fill _tmp283 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp284 = "Sparse Rep \n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "Sparse Rep \n"
	  .text
	  la $v0, _string18	# load label
	  sw $v0, -52($fp)	# spill _tmp284 from $v0 to $fp-52
	# PushParam _tmp284
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp284 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp285 = 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -56($fp)	# spill _tmp285 from $v0 to $fp-56
	# PushParam _tmp285
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -56($fp)	# fill _tmp285 to $v0 from $fp-56
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp286 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -60($fp)	# spill _tmp286 from $v0 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp287 = SparseMatrix
	  la $v0, SparseMatrix	# load label
	  sw $v0, -64($fp)	# spill _tmp287 from $v0 to $fp-64
	# *(_tmp286) = _tmp287
	  lw $v0, -64($fp)	# fill _tmp287 to $v0 from $fp-64
	  lw $v1, -60($fp)	# fill _tmp286 to $v1 from $fp-60
	  sw $v0, 0($v1) 	# store with offset
	# m = _tmp286
	  lw $v0, -60($fp)	# fill _tmp286 to $v0 from $fp-60
	  sw $v0, -8($fp)	# spill m from $v0 to $fp-8
	# _tmp288 = *(m)
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp288 from $v0 to $fp-68
	# _tmp289 = *(_tmp288)
	  lw $v0, -68($fp)	# fill _tmp288 to $v0 from $fp-68
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -72($fp)	# spill _tmp289 from $v0 to $fp-72
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp289
	  lw $v0, -72($fp)	# fill _tmp289 to $v0 from $fp-72
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp290 = *(m)
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -76($fp)	# spill _tmp290 from $v0 to $fp-76
	# _tmp291 = *(_tmp290 + 16)
	  lw $v0, -76($fp)	# fill _tmp290 to $v0 from $fp-76
	  lw $v0, 16($v0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp291 from $v0 to $fp-80
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp291
	  lw $v0, -80($fp)	# fill _tmp291 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp292 = *(m)
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp292 from $v0 to $fp-84
	# _tmp293 = *(_tmp292 + 12)
	  lw $v0, -84($fp)	# fill _tmp292 to $v0 from $fp-84
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -88($fp)	# spill _tmp293 from $v0 to $fp-88
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill m to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp293
	  lw $v0, -88($fp)	# fill _tmp293 to $v0 from $fp-88
	  jalr $v0            	# jump to function
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
