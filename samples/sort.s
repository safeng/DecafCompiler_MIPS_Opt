	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _ReadArray:
	# BeginFunc 128
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 128	# decrement sp to make space for locals/temps
	# _tmp0 = "How many scores? "
	  .data			# create string constant marked with label
	  _string1: .asciiz "How many scores? "
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -24($fp)	# spill _tmp0 from $v0 to $fp-24
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -24($fp)	# fill _tmp0 to $v0 from $fp-24
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -28($fp)	# spill _tmp1 from $v0 to $fp-28
	# numScores = _tmp1
	  lw $v0, -28($fp)	# fill _tmp1 to $v0 from $fp-28
	  sw $v0, -20($fp)	# spill numScores from $v0 to $fp-20
	# _tmp2 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -32($fp)	# spill _tmp2 from $v0 to $fp-32
	# _tmp3 = numScores < _tmp2
	  lw $v0, -20($fp)	# fill numScores to $v0 from $fp-20
	  lw $v1, -32($fp)	# fill _tmp2 to $v1 from $fp-32
	  slt $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp3 from $v0 to $fp-36
	# IfZ _tmp3 Goto _L0
	  lw $v0, -36($fp)	# fill _tmp3 to $v0 from $fp-36
	  beqz $v0, _L0	# branch if _tmp3 is zero 
	# _tmp4 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -40($fp)	# spill _tmp4 from $v0 to $fp-40
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -40($fp)	# fill _tmp4 to $v0 from $fp-40
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp5 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -44($fp)	# spill _tmp5 from $v0 to $fp-44
	# _tmp6 = _tmp5 + numScores
	  lw $v0, -44($fp)	# fill _tmp5 to $v0 from $fp-44
	  lw $v1, -20($fp)	# fill numScores to $v1 from $fp-20
	  add $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp6 from $v0 to $fp-48
	# _tmp7 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -52($fp)	# spill _tmp7 from $v0 to $fp-52
	# _tmp8 = _tmp6 * _tmp7
	  lw $v0, -48($fp)	# fill _tmp6 to $v0 from $fp-48
	  lw $v1, -52($fp)	# fill _tmp7 to $v1 from $fp-52
	  mul $v0, $v0, $v1	
	  sw $v0, -56($fp)	# spill _tmp8 from $v0 to $fp-56
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -56($fp)	# fill _tmp8 to $v0 from $fp-56
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp9 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -60($fp)	# spill _tmp9 from $v0 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp9) = numScores
	  lw $v0, -20($fp)	# fill numScores to $v0 from $fp-20
	  lw $v1, -60($fp)	# fill _tmp9 to $v1 from $fp-60
	  sw $v0, 0($v1) 	# store with offset
	# _tmp10 = _tmp9 + _tmp7
	  lw $v0, -60($fp)	# fill _tmp9 to $v0 from $fp-60
	  lw $v1, -52($fp)	# fill _tmp7 to $v1 from $fp-52
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp10 from $v0 to $fp-64
	# arr = _tmp10
	  lw $v0, -64($fp)	# fill _tmp10 to $v0 from $fp-64
	  sw $v0, -16($fp)	# spill arr from $v0 to $fp-16
	# _tmp11 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -68($fp)	# spill _tmp11 from $v0 to $fp-68
	# i = _tmp11
	  lw $v0, -68($fp)	# fill _tmp11 to $v0 from $fp-68
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L1:
	# _tmp12 = *(arr + -4)
	  lw $v0, -16($fp)	# fill arr to $v0 from $fp-16
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -72($fp)	# spill _tmp12 from $v0 to $fp-72
	# _tmp13 = i < _tmp12
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -72($fp)	# fill _tmp12 to $v1 from $fp-72
	  slt $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp13 from $v0 to $fp-76
	# IfZ _tmp13 Goto _L2
	  lw $v0, -76($fp)	# fill _tmp13 to $v0 from $fp-76
	  beqz $v0, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Enter next number: "
	  .data			# create string constant marked with label
	  _string3: .asciiz "Enter next number: "
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -80($fp)	# spill _tmp14 from $v0 to $fp-80
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -80($fp)	# fill _tmp14 to $v0 from $fp-80
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -84($fp)	# spill _tmp15 from $v0 to $fp-84
	# num = _tmp15
	  lw $v0, -84($fp)	# fill _tmp15 to $v0 from $fp-84
	  sw $v0, -12($fp)	# spill num from $v0 to $fp-12
	# _tmp16 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -88($fp)	# spill _tmp16 from $v0 to $fp-88
	# _tmp17 = i < _tmp16
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -88($fp)	# fill _tmp16 to $v1 from $fp-88
	  slt $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp17 from $v0 to $fp-92
	# _tmp18 = *(arr + -4)
	  lw $v0, -16($fp)	# fill arr to $v0 from $fp-16
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -96($fp)	# spill _tmp18 from $v0 to $fp-96
	# _tmp19 = i < _tmp18
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -96($fp)	# fill _tmp18 to $v1 from $fp-96
	  slt $v0, $v0, $v1	
	  sw $v0, -100($fp)	# spill _tmp19 from $v0 to $fp-100
	# _tmp20 = _tmp19 == _tmp16
	  lw $v0, -100($fp)	# fill _tmp19 to $v0 from $fp-100
	  lw $v1, -88($fp)	# fill _tmp16 to $v1 from $fp-88
	  seq $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp20 from $v0 to $fp-104
	# _tmp21 = _tmp17 || _tmp20
	  lw $v0, -92($fp)	# fill _tmp17 to $v0 from $fp-92
	  lw $v1, -104($fp)	# fill _tmp20 to $v1 from $fp-104
	  or $v0, $v0, $v1	
	  sw $v0, -108($fp)	# spill _tmp21 from $v0 to $fp-108
	# IfZ _tmp21 Goto _L3
	  lw $v0, -108($fp)	# fill _tmp21 to $v0 from $fp-108
	  beqz $v0, _L3	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -112($fp)	# spill _tmp22 from $v0 to $fp-112
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -112($fp)	# fill _tmp22 to $v0 from $fp-112
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp23 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -116($fp)	# spill _tmp23 from $v0 to $fp-116
	# _tmp24 = _tmp23 * i
	  lw $v0, -116($fp)	# fill _tmp23 to $v0 from $fp-116
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -120($fp)	# spill _tmp24 from $v0 to $fp-120
	# _tmp25 = arr + _tmp24
	  lw $v0, -16($fp)	# fill arr to $v0 from $fp-16
	  lw $v1, -120($fp)	# fill _tmp24 to $v1 from $fp-120
	  add $v0, $v0, $v1	
	  sw $v0, -124($fp)	# spill _tmp25 from $v0 to $fp-124
	# *(_tmp25) = num
	  lw $v0, -12($fp)	# fill num to $v0 from $fp-12
	  lw $v1, -124($fp)	# fill _tmp25 to $v1 from $fp-124
	  sw $v0, 0($v1) 	# store with offset
	# _tmp26 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -128($fp)	# spill _tmp26 from $v0 to $fp-128
	# _tmp27 = i + _tmp26
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -128($fp)	# fill _tmp26 to $v1 from $fp-128
	  add $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp27 from $v0 to $fp-132
	# i = _tmp27
	  lw $v0, -132($fp)	# fill _tmp27 to $v0 from $fp-132
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L1
	  b _L1		# unconditional branch
  _L2:
	# Return arr
	  lw $v0, -16($fp)	# fill arr to $v0 from $fp-16
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
  _Sort:
	# BeginFunc 304
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 304	# decrement sp to make space for locals/temps
	# _tmp28 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp28 from $v0 to $fp-20
	# i = _tmp28
	  lw $v0, -20($fp)	# fill _tmp28 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L4:
	# _tmp29 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -24($fp)	# spill _tmp29 from $v0 to $fp-24
	# _tmp30 = i < _tmp29
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -24($fp)	# fill _tmp29 to $v1 from $fp-24
	  slt $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp30 from $v0 to $fp-28
	# IfZ _tmp30 Goto _L5
	  lw $v0, -28($fp)	# fill _tmp30 to $v0 from $fp-28
	  beqz $v0, _L5	# branch if _tmp30 is zero 
	# _tmp31 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -32($fp)	# spill _tmp31 from $v0 to $fp-32
	# _tmp32 = i - _tmp31
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -32($fp)	# fill _tmp31 to $v1 from $fp-32
	  sub $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp32 from $v0 to $fp-36
	# j = _tmp32
	  lw $v0, -36($fp)	# fill _tmp32 to $v0 from $fp-36
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# _tmp33 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -40($fp)	# spill _tmp33 from $v0 to $fp-40
	# _tmp34 = i < _tmp33
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -40($fp)	# fill _tmp33 to $v1 from $fp-40
	  slt $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp34 from $v0 to $fp-44
	# _tmp35 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -48($fp)	# spill _tmp35 from $v0 to $fp-48
	# _tmp36 = i < _tmp35
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -48($fp)	# fill _tmp35 to $v1 from $fp-48
	  slt $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp36 from $v0 to $fp-52
	# _tmp37 = _tmp36 == _tmp33
	  lw $v0, -52($fp)	# fill _tmp36 to $v0 from $fp-52
	  lw $v1, -40($fp)	# fill _tmp33 to $v1 from $fp-40
	  seq $v0, $v0, $v1	
	  sw $v0, -56($fp)	# spill _tmp37 from $v0 to $fp-56
	# _tmp38 = _tmp34 || _tmp37
	  lw $v0, -44($fp)	# fill _tmp34 to $v0 from $fp-44
	  lw $v1, -56($fp)	# fill _tmp37 to $v1 from $fp-56
	  or $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp38 from $v0 to $fp-60
	# IfZ _tmp38 Goto _L6
	  lw $v0, -60($fp)	# fill _tmp38 to $v0 from $fp-60
	  beqz $v0, _L6	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -64($fp)	# spill _tmp39 from $v0 to $fp-64
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -64($fp)	# fill _tmp39 to $v0 from $fp-64
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp40 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -68($fp)	# spill _tmp40 from $v0 to $fp-68
	# _tmp41 = _tmp40 * i
	  lw $v0, -68($fp)	# fill _tmp40 to $v0 from $fp-68
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp41 from $v0 to $fp-72
	# _tmp42 = arr + _tmp41
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -72($fp)	# fill _tmp41 to $v1 from $fp-72
	  add $v0, $v0, $v1	
	  sw $v0, -76($fp)	# spill _tmp42 from $v0 to $fp-76
	# _tmp43 = *(_tmp42)
	  lw $v0, -76($fp)	# fill _tmp42 to $v0 from $fp-76
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp43 from $v0 to $fp-80
	# val = _tmp43
	  lw $v0, -80($fp)	# fill _tmp43 to $v0 from $fp-80
	  sw $v0, -16($fp)	# spill val from $v0 to $fp-16
  _L7:
	# _tmp44 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -84($fp)	# spill _tmp44 from $v0 to $fp-84
	# _tmp45 = _tmp44 < j
	  lw $v0, -84($fp)	# fill _tmp44 to $v0 from $fp-84
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  slt $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp45 from $v0 to $fp-88
	# _tmp46 = _tmp44 == j
	  lw $v0, -84($fp)	# fill _tmp44 to $v0 from $fp-84
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  seq $v0, $v0, $v1	
	  sw $v0, -92($fp)	# spill _tmp46 from $v0 to $fp-92
	# _tmp47 = _tmp45 || _tmp46
	  lw $v0, -88($fp)	# fill _tmp45 to $v0 from $fp-88
	  lw $v1, -92($fp)	# fill _tmp46 to $v1 from $fp-92
	  or $v0, $v0, $v1	
	  sw $v0, -96($fp)	# spill _tmp47 from $v0 to $fp-96
	# IfZ _tmp47 Goto _L8
	  lw $v0, -96($fp)	# fill _tmp47 to $v0 from $fp-96
	  beqz $v0, _L8	# branch if _tmp47 is zero 
	# _tmp48 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -100($fp)	# spill _tmp48 from $v0 to $fp-100
	# _tmp49 = j < _tmp48
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -100($fp)	# fill _tmp48 to $v1 from $fp-100
	  slt $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp49 from $v0 to $fp-104
	# _tmp50 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -108($fp)	# spill _tmp50 from $v0 to $fp-108
	# _tmp51 = j < _tmp50
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -108($fp)	# fill _tmp50 to $v1 from $fp-108
	  slt $v0, $v0, $v1	
	  sw $v0, -112($fp)	# spill _tmp51 from $v0 to $fp-112
	# _tmp52 = _tmp51 == _tmp48
	  lw $v0, -112($fp)	# fill _tmp51 to $v0 from $fp-112
	  lw $v1, -100($fp)	# fill _tmp48 to $v1 from $fp-100
	  seq $v0, $v0, $v1	
	  sw $v0, -116($fp)	# spill _tmp52 from $v0 to $fp-116
	# _tmp53 = _tmp49 || _tmp52
	  lw $v0, -104($fp)	# fill _tmp49 to $v0 from $fp-104
	  lw $v1, -116($fp)	# fill _tmp52 to $v1 from $fp-116
	  or $v0, $v0, $v1	
	  sw $v0, -120($fp)	# spill _tmp53 from $v0 to $fp-120
	# IfZ _tmp53 Goto _L9
	  lw $v0, -120($fp)	# fill _tmp53 to $v0 from $fp-120
	  beqz $v0, _L9	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -124($fp)	# spill _tmp54 from $v0 to $fp-124
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -124($fp)	# fill _tmp54 to $v0 from $fp-124
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp55 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -128($fp)	# spill _tmp55 from $v0 to $fp-128
	# _tmp56 = _tmp55 * j
	  lw $v0, -128($fp)	# fill _tmp55 to $v0 from $fp-128
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  mul $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp56 from $v0 to $fp-132
	# _tmp57 = arr + _tmp56
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -132($fp)	# fill _tmp56 to $v1 from $fp-132
	  add $v0, $v0, $v1	
	  sw $v0, -136($fp)	# spill _tmp57 from $v0 to $fp-136
	# _tmp58 = *(_tmp57)
	  lw $v0, -136($fp)	# fill _tmp57 to $v0 from $fp-136
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -140($fp)	# spill _tmp58 from $v0 to $fp-140
	# _tmp59 = _tmp58 < val
	  lw $v0, -140($fp)	# fill _tmp58 to $v0 from $fp-140
	  lw $v1, -16($fp)	# fill val to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -144($fp)	# spill _tmp59 from $v0 to $fp-144
	# _tmp60 = _tmp58 == val
	  lw $v0, -140($fp)	# fill _tmp58 to $v0 from $fp-140
	  lw $v1, -16($fp)	# fill val to $v1 from $fp-16
	  seq $v0, $v0, $v1	
	  sw $v0, -148($fp)	# spill _tmp60 from $v0 to $fp-148
	# _tmp61 = _tmp59 || _tmp60
	  lw $v0, -144($fp)	# fill _tmp59 to $v0 from $fp-144
	  lw $v1, -148($fp)	# fill _tmp60 to $v1 from $fp-148
	  or $v0, $v0, $v1	
	  sw $v0, -152($fp)	# spill _tmp61 from $v0 to $fp-152
	# IfZ _tmp61 Goto _L10
	  lw $v0, -152($fp)	# fill _tmp61 to $v0 from $fp-152
	  beqz $v0, _L10	# branch if _tmp61 is zero 
	# Goto _L8
	  b _L8		# unconditional branch
  _L10:
	# _tmp62 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -156($fp)	# spill _tmp62 from $v0 to $fp-156
	# _tmp63 = j + _tmp62
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -156($fp)	# fill _tmp62 to $v1 from $fp-156
	  add $v0, $v0, $v1	
	  sw $v0, -160($fp)	# spill _tmp63 from $v0 to $fp-160
	# _tmp64 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -164($fp)	# spill _tmp64 from $v0 to $fp-164
	# _tmp65 = _tmp63 < _tmp64
	  lw $v0, -160($fp)	# fill _tmp63 to $v0 from $fp-160
	  lw $v1, -164($fp)	# fill _tmp64 to $v1 from $fp-164
	  slt $v0, $v0, $v1	
	  sw $v0, -168($fp)	# spill _tmp65 from $v0 to $fp-168
	# _tmp66 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -172($fp)	# spill _tmp66 from $v0 to $fp-172
	# _tmp67 = _tmp63 < _tmp66
	  lw $v0, -160($fp)	# fill _tmp63 to $v0 from $fp-160
	  lw $v1, -172($fp)	# fill _tmp66 to $v1 from $fp-172
	  slt $v0, $v0, $v1	
	  sw $v0, -176($fp)	# spill _tmp67 from $v0 to $fp-176
	# _tmp68 = _tmp67 == _tmp64
	  lw $v0, -176($fp)	# fill _tmp67 to $v0 from $fp-176
	  lw $v1, -164($fp)	# fill _tmp64 to $v1 from $fp-164
	  seq $v0, $v0, $v1	
	  sw $v0, -180($fp)	# spill _tmp68 from $v0 to $fp-180
	# _tmp69 = _tmp65 || _tmp68
	  lw $v0, -168($fp)	# fill _tmp65 to $v0 from $fp-168
	  lw $v1, -180($fp)	# fill _tmp68 to $v1 from $fp-180
	  or $v0, $v0, $v1	
	  sw $v0, -184($fp)	# spill _tmp69 from $v0 to $fp-184
	# IfZ _tmp69 Goto _L11
	  lw $v0, -184($fp)	# fill _tmp69 to $v0 from $fp-184
	  beqz $v0, _L11	# branch if _tmp69 is zero 
	# _tmp70 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string7	# load label
	  sw $v0, -188($fp)	# spill _tmp70 from $v0 to $fp-188
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -188($fp)	# fill _tmp70 to $v0 from $fp-188
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp71 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -192($fp)	# spill _tmp71 from $v0 to $fp-192
	# _tmp72 = _tmp71 * _tmp63
	  lw $v0, -192($fp)	# fill _tmp71 to $v0 from $fp-192
	  lw $v1, -160($fp)	# fill _tmp63 to $v1 from $fp-160
	  mul $v0, $v0, $v1	
	  sw $v0, -196($fp)	# spill _tmp72 from $v0 to $fp-196
	# _tmp73 = arr + _tmp72
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -196($fp)	# fill _tmp72 to $v1 from $fp-196
	  add $v0, $v0, $v1	
	  sw $v0, -200($fp)	# spill _tmp73 from $v0 to $fp-200
	# _tmp74 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -204($fp)	# spill _tmp74 from $v0 to $fp-204
	# _tmp75 = j < _tmp74
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -204($fp)	# fill _tmp74 to $v1 from $fp-204
	  slt $v0, $v0, $v1	
	  sw $v0, -208($fp)	# spill _tmp75 from $v0 to $fp-208
	# _tmp76 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -212($fp)	# spill _tmp76 from $v0 to $fp-212
	# _tmp77 = j < _tmp76
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -212($fp)	# fill _tmp76 to $v1 from $fp-212
	  slt $v0, $v0, $v1	
	  sw $v0, -216($fp)	# spill _tmp77 from $v0 to $fp-216
	# _tmp78 = _tmp77 == _tmp74
	  lw $v0, -216($fp)	# fill _tmp77 to $v0 from $fp-216
	  lw $v1, -204($fp)	# fill _tmp74 to $v1 from $fp-204
	  seq $v0, $v0, $v1	
	  sw $v0, -220($fp)	# spill _tmp78 from $v0 to $fp-220
	# _tmp79 = _tmp75 || _tmp78
	  lw $v0, -208($fp)	# fill _tmp75 to $v0 from $fp-208
	  lw $v1, -220($fp)	# fill _tmp78 to $v1 from $fp-220
	  or $v0, $v0, $v1	
	  sw $v0, -224($fp)	# spill _tmp79 from $v0 to $fp-224
	# IfZ _tmp79 Goto _L12
	  lw $v0, -224($fp)	# fill _tmp79 to $v0 from $fp-224
	  beqz $v0, _L12	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string8	# load label
	  sw $v0, -228($fp)	# spill _tmp80 from $v0 to $fp-228
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -228($fp)	# fill _tmp80 to $v0 from $fp-228
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp81 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -232($fp)	# spill _tmp81 from $v0 to $fp-232
	# _tmp82 = _tmp81 * j
	  lw $v0, -232($fp)	# fill _tmp81 to $v0 from $fp-232
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  mul $v0, $v0, $v1	
	  sw $v0, -236($fp)	# spill _tmp82 from $v0 to $fp-236
	# _tmp83 = arr + _tmp82
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -236($fp)	# fill _tmp82 to $v1 from $fp-236
	  add $v0, $v0, $v1	
	  sw $v0, -240($fp)	# spill _tmp83 from $v0 to $fp-240
	# _tmp84 = *(_tmp83)
	  lw $v0, -240($fp)	# fill _tmp83 to $v0 from $fp-240
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -244($fp)	# spill _tmp84 from $v0 to $fp-244
	# *(_tmp73) = _tmp84
	  lw $v0, -244($fp)	# fill _tmp84 to $v0 from $fp-244
	  lw $v1, -200($fp)	# fill _tmp73 to $v1 from $fp-200
	  sw $v0, 0($v1) 	# store with offset
	# _tmp85 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -248($fp)	# spill _tmp85 from $v0 to $fp-248
	# _tmp86 = j - _tmp85
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -248($fp)	# fill _tmp85 to $v1 from $fp-248
	  sub $v0, $v0, $v1	
	  sw $v0, -252($fp)	# spill _tmp86 from $v0 to $fp-252
	# j = _tmp86
	  lw $v0, -252($fp)	# fill _tmp86 to $v0 from $fp-252
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# Goto _L7
	  b _L7		# unconditional branch
  _L8:
	# _tmp87 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -256($fp)	# spill _tmp87 from $v0 to $fp-256
	# _tmp88 = j + _tmp87
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  lw $v1, -256($fp)	# fill _tmp87 to $v1 from $fp-256
	  add $v0, $v0, $v1	
	  sw $v0, -260($fp)	# spill _tmp88 from $v0 to $fp-260
	# _tmp89 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -264($fp)	# spill _tmp89 from $v0 to $fp-264
	# _tmp90 = _tmp88 < _tmp89
	  lw $v0, -260($fp)	# fill _tmp88 to $v0 from $fp-260
	  lw $v1, -264($fp)	# fill _tmp89 to $v1 from $fp-264
	  slt $v0, $v0, $v1	
	  sw $v0, -268($fp)	# spill _tmp90 from $v0 to $fp-268
	# _tmp91 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -272($fp)	# spill _tmp91 from $v0 to $fp-272
	# _tmp92 = _tmp88 < _tmp91
	  lw $v0, -260($fp)	# fill _tmp88 to $v0 from $fp-260
	  lw $v1, -272($fp)	# fill _tmp91 to $v1 from $fp-272
	  slt $v0, $v0, $v1	
	  sw $v0, -276($fp)	# spill _tmp92 from $v0 to $fp-276
	# _tmp93 = _tmp92 == _tmp89
	  lw $v0, -276($fp)	# fill _tmp92 to $v0 from $fp-276
	  lw $v1, -264($fp)	# fill _tmp89 to $v1 from $fp-264
	  seq $v0, $v0, $v1	
	  sw $v0, -280($fp)	# spill _tmp93 from $v0 to $fp-280
	# _tmp94 = _tmp90 || _tmp93
	  lw $v0, -268($fp)	# fill _tmp90 to $v0 from $fp-268
	  lw $v1, -280($fp)	# fill _tmp93 to $v1 from $fp-280
	  or $v0, $v0, $v1	
	  sw $v0, -284($fp)	# spill _tmp94 from $v0 to $fp-284
	# IfZ _tmp94 Goto _L13
	  lw $v0, -284($fp)	# fill _tmp94 to $v0 from $fp-284
	  beqz $v0, _L13	# branch if _tmp94 is zero 
	# _tmp95 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string9	# load label
	  sw $v0, -288($fp)	# spill _tmp95 from $v0 to $fp-288
	# PushParam _tmp95
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -288($fp)	# fill _tmp95 to $v0 from $fp-288
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp96 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -292($fp)	# spill _tmp96 from $v0 to $fp-292
	# _tmp97 = _tmp96 * _tmp88
	  lw $v0, -292($fp)	# fill _tmp96 to $v0 from $fp-292
	  lw $v1, -260($fp)	# fill _tmp88 to $v1 from $fp-260
	  mul $v0, $v0, $v1	
	  sw $v0, -296($fp)	# spill _tmp97 from $v0 to $fp-296
	# _tmp98 = arr + _tmp97
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -296($fp)	# fill _tmp97 to $v1 from $fp-296
	  add $v0, $v0, $v1	
	  sw $v0, -300($fp)	# spill _tmp98 from $v0 to $fp-300
	# *(_tmp98) = val
	  lw $v0, -16($fp)	# fill val to $v0 from $fp-16
	  lw $v1, -300($fp)	# fill _tmp98 to $v1 from $fp-300
	  sw $v0, 0($v1) 	# store with offset
	# _tmp99 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -304($fp)	# spill _tmp99 from $v0 to $fp-304
	# _tmp100 = i + _tmp99
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -304($fp)	# fill _tmp99 to $v1 from $fp-304
	  add $v0, $v0, $v1	
	  sw $v0, -308($fp)	# spill _tmp100 from $v0 to $fp-308
	# i = _tmp100
	  lw $v0, -308($fp)	# fill _tmp100 to $v0 from $fp-308
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L4
	  b _L4		# unconditional branch
  _L5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintArray:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp101 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp101 from $v0 to $fp-12
	# i = _tmp101
	  lw $v0, -12($fp)	# fill _tmp101 to $v0 from $fp-12
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# _tmp102 = "Sorted results: "
	  .data			# create string constant marked with label
	  _string10: .asciiz "Sorted results: "
	  .text
	  la $v0, _string10	# load label
	  sw $v0, -16($fp)	# spill _tmp102 from $v0 to $fp-16
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp102 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L14:
	# _tmp103 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp103 from $v0 to $fp-20
	# _tmp104 = i < _tmp103
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -20($fp)	# fill _tmp103 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp104 from $v0 to $fp-24
	# IfZ _tmp104 Goto _L15
	  lw $v0, -24($fp)	# fill _tmp104 to $v0 from $fp-24
	  beqz $v0, _L15	# branch if _tmp104 is zero 
	# _tmp105 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -28($fp)	# spill _tmp105 from $v0 to $fp-28
	# _tmp106 = i < _tmp105
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -28($fp)	# fill _tmp105 to $v1 from $fp-28
	  slt $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp106 from $v0 to $fp-32
	# _tmp107 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp107 from $v0 to $fp-36
	# _tmp108 = i < _tmp107
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -36($fp)	# fill _tmp107 to $v1 from $fp-36
	  slt $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp108 from $v0 to $fp-40
	# _tmp109 = _tmp108 == _tmp105
	  lw $v0, -40($fp)	# fill _tmp108 to $v0 from $fp-40
	  lw $v1, -28($fp)	# fill _tmp105 to $v1 from $fp-28
	  seq $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp109 from $v0 to $fp-44
	# _tmp110 = _tmp106 || _tmp109
	  lw $v0, -32($fp)	# fill _tmp106 to $v0 from $fp-32
	  lw $v1, -44($fp)	# fill _tmp109 to $v1 from $fp-44
	  or $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp110 from $v0 to $fp-48
	# IfZ _tmp110 Goto _L16
	  lw $v0, -48($fp)	# fill _tmp110 to $v0 from $fp-48
	  beqz $v0, _L16	# branch if _tmp110 is zero 
	# _tmp111 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string11	# load label
	  sw $v0, -52($fp)	# spill _tmp111 from $v0 to $fp-52
	# PushParam _tmp111
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp111 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp112 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -56($fp)	# spill _tmp112 from $v0 to $fp-56
	# _tmp113 = _tmp112 * i
	  lw $v0, -56($fp)	# fill _tmp112 to $v0 from $fp-56
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp113 from $v0 to $fp-60
	# _tmp114 = arr + _tmp113
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -60($fp)	# fill _tmp113 to $v1 from $fp-60
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp114 from $v0 to $fp-64
	# _tmp115 = *(_tmp114)
	  lw $v0, -64($fp)	# fill _tmp114 to $v0 from $fp-64
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp115 from $v0 to $fp-68
	# PushParam _tmp115
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -68($fp)	# fill _tmp115 to $v0 from $fp-68
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp116 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $v0, _string12	# load label
	  sw $v0, -72($fp)	# spill _tmp116 from $v0 to $fp-72
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -72($fp)	# fill _tmp116 to $v0 from $fp-72
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp117 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -76($fp)	# spill _tmp117 from $v0 to $fp-76
	# _tmp118 = i + _tmp117
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -76($fp)	# fill _tmp117 to $v1 from $fp-76
	  add $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp118 from $v0 to $fp-80
	# i = _tmp118
	  lw $v0, -80($fp)	# fill _tmp118 to $v0 from $fp-80
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L14
	  b _L14		# unconditional branch
  _L15:
	# _tmp119 = "\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "\n"
	  .text
	  la $v0, _string13	# load label
	  sw $v0, -84($fp)	# spill _tmp119 from $v0 to $fp-84
	# PushParam _tmp119
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -84($fp)	# fill _tmp119 to $v0 from $fp-84
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
  main:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp120 = "\nThis program will read in a bunch of numbers an..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "\nThis program will read in a bunch of numbers and print them\n"
	  .text
	  la $v0, _string14	# load label
	  sw $v0, -12($fp)	# spill _tmp120 from $v0 to $fp-12
	# PushParam _tmp120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp120 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp121 = "back out in sorted order.\n\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "back out in sorted order.\n\n"
	  .text
	  la $v0, _string15	# load label
	  sw $v0, -16($fp)	# spill _tmp121 from $v0 to $fp-16
	# PushParam _tmp121
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp121 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp122 = LCall _ReadArray
	  jal _ReadArray     	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp122 from $v0 to $fp-20
	# arr = _tmp122
	  lw $v0, -20($fp)	# fill _tmp122 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill arr from $v0 to $fp-8
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _Sort
	  jal _Sort          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintArray
	  jal _PrintArray    	# jump to function
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
