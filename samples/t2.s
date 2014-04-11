	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _tester:
	# BeginFunc 188
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 188	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $v0, 1		# load constant value 1 into $v0
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
	# b = _tmp9
	  lw $v0, -52($fp)	# fill _tmp9 to $v0 from $fp-52
	  sw $v0, 4($gp)	# spill b from $v0 to $gp+4
	# _tmp10 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -56($fp)	# spill _tmp10 from $v0 to $fp-56
	# _tmp11 = sz < _tmp10
	  lw $v0, 4($fp)	# fill sz to $v0 from $fp+4
	  lw $v1, -56($fp)	# fill _tmp10 to $v1 from $fp-56
	  slt $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp11 from $v0 to $fp-60
	# IfZ _tmp11 Goto _L1
	  lw $v0, -60($fp)	# fill _tmp11 to $v0 from $fp-60
	  beqz $v0, _L1	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
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
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp13 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -68($fp)	# spill _tmp13 from $v0 to $fp-68
	# _tmp14 = _tmp13 + sz
	  lw $v0, -68($fp)	# fill _tmp13 to $v0 from $fp-68
	  lw $v1, 4($fp)	# fill sz to $v1 from $fp+4
	  add $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp14 from $v0 to $fp-72
	# _tmp15 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -76($fp)	# spill _tmp15 from $v0 to $fp-76
	# _tmp16 = _tmp14 * _tmp15
	  lw $v0, -72($fp)	# fill _tmp14 to $v0 from $fp-72
	  lw $v1, -76($fp)	# fill _tmp15 to $v1 from $fp-76
	  mul $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp16 from $v0 to $fp-80
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -80($fp)	# fill _tmp16 to $v0 from $fp-80
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp17 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -84($fp)	# spill _tmp17 from $v0 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp17) = sz
	  lw $v0, 4($fp)	# fill sz to $v0 from $fp+4
	  lw $v1, -84($fp)	# fill _tmp17 to $v1 from $fp-84
	  sw $v0, 0($v1) 	# store with offset
	# _tmp18 = _tmp17 + _tmp15
	  lw $v0, -84($fp)	# fill _tmp17 to $v0 from $fp-84
	  lw $v1, -76($fp)	# fill _tmp15 to $v1 from $fp-76
	  add $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp18 from $v0 to $fp-88
	# result = _tmp18
	  lw $v0, -88($fp)	# fill _tmp18 to $v0 from $fp-88
	  sw $v0, -12($fp)	# spill result from $v0 to $fp-12
	# _tmp19 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -92($fp)	# spill _tmp19 from $v0 to $fp-92
	# i = _tmp19
	  lw $v0, -92($fp)	# fill _tmp19 to $v0 from $fp-92
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
  _L2:
	# _tmp20 = i < sz
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, 4($fp)	# fill sz to $v1 from $fp+4
	  slt $v0, $v0, $v1	
	  sw $v0, -96($fp)	# spill _tmp20 from $v0 to $fp-96
	# IfZ _tmp20 Goto _L3
	  lw $v0, -96($fp)	# fill _tmp20 to $v0 from $fp-96
	  beqz $v0, _L3	# branch if _tmp20 is zero 
	# _tmp21 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -100($fp)	# spill _tmp21 from $v0 to $fp-100
	# _tmp22 = i < _tmp21
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -100($fp)	# fill _tmp21 to $v1 from $fp-100
	  slt $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp22 from $v0 to $fp-104
	# _tmp23 = *(result + -4)
	  lw $v0, -12($fp)	# fill result to $v0 from $fp-12
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -108($fp)	# spill _tmp23 from $v0 to $fp-108
	# _tmp24 = i < _tmp23
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -108($fp)	# fill _tmp23 to $v1 from $fp-108
	  slt $v0, $v0, $v1	
	  sw $v0, -112($fp)	# spill _tmp24 from $v0 to $fp-112
	# _tmp25 = _tmp24 == _tmp21
	  lw $v0, -112($fp)	# fill _tmp24 to $v0 from $fp-112
	  lw $v1, -100($fp)	# fill _tmp21 to $v1 from $fp-100
	  seq $v0, $v0, $v1	
	  sw $v0, -116($fp)	# spill _tmp25 from $v0 to $fp-116
	# _tmp26 = _tmp22 || _tmp25
	  lw $v0, -104($fp)	# fill _tmp22 to $v0 from $fp-104
	  lw $v1, -116($fp)	# fill _tmp25 to $v1 from $fp-116
	  or $v0, $v0, $v1	
	  sw $v0, -120($fp)	# spill _tmp26 from $v0 to $fp-120
	# IfZ _tmp26 Goto _L4
	  lw $v0, -120($fp)	# fill _tmp26 to $v0 from $fp-120
	  beqz $v0, _L4	# branch if _tmp26 is zero 
	# _tmp27 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -124($fp)	# spill _tmp27 from $v0 to $fp-124
	# PushParam _tmp27
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -124($fp)	# fill _tmp27 to $v0 from $fp-124
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp28 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -128($fp)	# spill _tmp28 from $v0 to $fp-128
	# _tmp29 = _tmp28 * i
	  lw $v0, -128($fp)	# fill _tmp28 to $v0 from $fp-128
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp29 from $v0 to $fp-132
	# _tmp30 = result + _tmp29
	  lw $v0, -12($fp)	# fill result to $v0 from $fp-12
	  lw $v1, -132($fp)	# fill _tmp29 to $v1 from $fp-132
	  add $v0, $v0, $v1	
	  sw $v0, -136($fp)	# spill _tmp30 from $v0 to $fp-136
	# *(_tmp30) = i
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -136($fp)	# fill _tmp30 to $v1 from $fp-136
	  sw $v0, 0($v1) 	# store with offset
	# _tmp31 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -140($fp)	# spill _tmp31 from $v0 to $fp-140
	# _tmp32 = i + _tmp31
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -140($fp)	# fill _tmp31 to $v1 from $fp-140
	  add $v0, $v0, $v1	
	  sw $v0, -144($fp)	# spill _tmp32 from $v0 to $fp-144
	# i = _tmp32
	  lw $v0, -144($fp)	# fill _tmp32 to $v0 from $fp-144
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L2
	  b _L2		# unconditional branch
  _L3:
	# _tmp33 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -148($fp)	# spill _tmp33 from $v0 to $fp-148
	# _tmp34 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -152($fp)	# spill _tmp34 from $v0 to $fp-152
	# _tmp35 = _tmp33 < _tmp34
	  lw $v0, -148($fp)	# fill _tmp33 to $v0 from $fp-148
	  lw $v1, -152($fp)	# fill _tmp34 to $v1 from $fp-152
	  slt $v0, $v0, $v1	
	  sw $v0, -156($fp)	# spill _tmp35 from $v0 to $fp-156
	# _tmp36 = *(b + -4)
	  lw $v0, 4($gp)	# fill b to $v0 from $gp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -160($fp)	# spill _tmp36 from $v0 to $fp-160
	# _tmp37 = _tmp33 < _tmp36
	  lw $v0, -148($fp)	# fill _tmp33 to $v0 from $fp-148
	  lw $v1, -160($fp)	# fill _tmp36 to $v1 from $fp-160
	  slt $v0, $v0, $v1	
	  sw $v0, -164($fp)	# spill _tmp37 from $v0 to $fp-164
	# _tmp38 = _tmp37 == _tmp34
	  lw $v0, -164($fp)	# fill _tmp37 to $v0 from $fp-164
	  lw $v1, -152($fp)	# fill _tmp34 to $v1 from $fp-152
	  seq $v0, $v0, $v1	
	  sw $v0, -168($fp)	# spill _tmp38 from $v0 to $fp-168
	# _tmp39 = _tmp35 || _tmp38
	  lw $v0, -156($fp)	# fill _tmp35 to $v0 from $fp-156
	  lw $v1, -168($fp)	# fill _tmp38 to $v1 from $fp-168
	  or $v0, $v0, $v1	
	  sw $v0, -172($fp)	# spill _tmp39 from $v0 to $fp-172
	# IfZ _tmp39 Goto _L5
	  lw $v0, -172($fp)	# fill _tmp39 to $v0 from $fp-172
	  beqz $v0, _L5	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -176($fp)	# spill _tmp40 from $v0 to $fp-176
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -176($fp)	# fill _tmp40 to $v0 from $fp-176
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp41 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -180($fp)	# spill _tmp41 from $v0 to $fp-180
	# _tmp42 = _tmp41 * _tmp33
	  lw $v0, -180($fp)	# fill _tmp41 to $v0 from $fp-180
	  lw $v1, -148($fp)	# fill _tmp33 to $v1 from $fp-148
	  mul $v0, $v0, $v1	
	  sw $v0, -184($fp)	# spill _tmp42 from $v0 to $fp-184
	# _tmp43 = b + _tmp42
	  lw $v0, 4($gp)	# fill b to $v0 from $gp+4
	  lw $v1, -184($fp)	# fill _tmp42 to $v1 from $fp-184
	  add $v0, $v0, $v1	
	  sw $v0, -188($fp)	# spill _tmp43 from $v0 to $fp-188
	# _tmp44 = "Done"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Done"
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -192($fp)	# spill _tmp44 from $v0 to $fp-192
	# *(_tmp43) = _tmp44
	  lw $v0, -192($fp)	# fill _tmp44 to $v0 from $fp-192
	  lw $v1, -188($fp)	# fill _tmp43 to $v1 from $fp-188
	  sw $v0, 0($v1) 	# store with offset
	# Return result
	  lw $v0, -12($fp)	# fill result to $v0 from $fp-12
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
	# BeginFunc 168
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp45 = 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -12($fp)	# spill _tmp45 from $v0 to $fp-12
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp45 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp46 = LCall _tester
	  jal _tester        	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -16($fp)	# spill _tmp46 from $v0 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# d = _tmp46
	  lw $v0, -16($fp)	# fill _tmp46 to $v0 from $fp-16
	  sw $v0, -8($fp)	# spill d from $v0 to $fp-8
	# _tmp47 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp47 from $v0 to $fp-20
	# _tmp48 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -24($fp)	# spill _tmp48 from $v0 to $fp-24
	# _tmp49 = _tmp47 < _tmp48
	  lw $v0, -20($fp)	# fill _tmp47 to $v0 from $fp-20
	  lw $v1, -24($fp)	# fill _tmp48 to $v1 from $fp-24
	  slt $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp49 from $v0 to $fp-28
	# _tmp50 = *(d + -4)
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -32($fp)	# spill _tmp50 from $v0 to $fp-32
	# _tmp51 = _tmp47 < _tmp50
	  lw $v0, -20($fp)	# fill _tmp47 to $v0 from $fp-20
	  lw $v1, -32($fp)	# fill _tmp50 to $v1 from $fp-32
	  slt $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp51 from $v0 to $fp-36
	# _tmp52 = _tmp51 == _tmp48
	  lw $v0, -36($fp)	# fill _tmp51 to $v0 from $fp-36
	  lw $v1, -24($fp)	# fill _tmp48 to $v1 from $fp-24
	  seq $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp52 from $v0 to $fp-40
	# _tmp53 = _tmp49 || _tmp52
	  lw $v0, -28($fp)	# fill _tmp49 to $v0 from $fp-28
	  lw $v1, -40($fp)	# fill _tmp52 to $v1 from $fp-40
	  or $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp53 from $v0 to $fp-44
	# IfZ _tmp53 Goto _L6
	  lw $v0, -44($fp)	# fill _tmp53 to $v0 from $fp-44
	  beqz $v0, _L6	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -48($fp)	# spill _tmp54 from $v0 to $fp-48
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -48($fp)	# fill _tmp54 to $v0 from $fp-48
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp55 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -52($fp)	# spill _tmp55 from $v0 to $fp-52
	# _tmp56 = _tmp55 * _tmp47
	  lw $v0, -52($fp)	# fill _tmp55 to $v0 from $fp-52
	  lw $v1, -20($fp)	# fill _tmp47 to $v1 from $fp-20
	  mul $v0, $v0, $v1	
	  sw $v0, -56($fp)	# spill _tmp56 from $v0 to $fp-56
	# _tmp57 = d + _tmp56
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $v1, -56($fp)	# fill _tmp56 to $v1 from $fp-56
	  add $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp57 from $v0 to $fp-60
	# _tmp58 = *(_tmp57)
	  lw $v0, -60($fp)	# fill _tmp57 to $v0 from $fp-60
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp58 from $v0 to $fp-64
	# _tmp59 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -68($fp)	# spill _tmp59 from $v0 to $fp-68
	# _tmp60 = _tmp58 < _tmp59
	  lw $v0, -64($fp)	# fill _tmp58 to $v0 from $fp-64
	  lw $v1, -68($fp)	# fill _tmp59 to $v1 from $fp-68
	  slt $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp60 from $v0 to $fp-72
	# _tmp61 = *(d + -4)
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -76($fp)	# spill _tmp61 from $v0 to $fp-76
	# _tmp62 = _tmp58 < _tmp61
	  lw $v0, -64($fp)	# fill _tmp58 to $v0 from $fp-64
	  lw $v1, -76($fp)	# fill _tmp61 to $v1 from $fp-76
	  slt $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp62 from $v0 to $fp-80
	# _tmp63 = _tmp62 == _tmp59
	  lw $v0, -80($fp)	# fill _tmp62 to $v0 from $fp-80
	  lw $v1, -68($fp)	# fill _tmp59 to $v1 from $fp-68
	  seq $v0, $v0, $v1	
	  sw $v0, -84($fp)	# spill _tmp63 from $v0 to $fp-84
	# _tmp64 = _tmp60 || _tmp63
	  lw $v0, -72($fp)	# fill _tmp60 to $v0 from $fp-72
	  lw $v1, -84($fp)	# fill _tmp63 to $v1 from $fp-84
	  or $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp64 from $v0 to $fp-88
	# IfZ _tmp64 Goto _L7
	  lw $v0, -88($fp)	# fill _tmp64 to $v0 from $fp-88
	  beqz $v0, _L7	# branch if _tmp64 is zero 
	# _tmp65 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string7	# load label
	  sw $v0, -92($fp)	# spill _tmp65 from $v0 to $fp-92
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -92($fp)	# fill _tmp65 to $v0 from $fp-92
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp66 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -96($fp)	# spill _tmp66 from $v0 to $fp-96
	# _tmp67 = _tmp66 * _tmp58
	  lw $v0, -96($fp)	# fill _tmp66 to $v0 from $fp-96
	  lw $v1, -64($fp)	# fill _tmp58 to $v1 from $fp-64
	  mul $v0, $v0, $v1	
	  sw $v0, -100($fp)	# spill _tmp67 from $v0 to $fp-100
	# _tmp68 = d + _tmp67
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $v1, -100($fp)	# fill _tmp67 to $v1 from $fp-100
	  add $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp68 from $v0 to $fp-104
	# _tmp69 = *(_tmp68)
	  lw $v0, -104($fp)	# fill _tmp68 to $v0 from $fp-104
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -108($fp)	# spill _tmp69 from $v0 to $fp-108
	# PushParam _tmp69
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -108($fp)	# fill _tmp69 to $v0 from $fp-108
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = "\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "\n"
	  .text
	  la $v0, _string8	# load label
	  sw $v0, -112($fp)	# spill _tmp70 from $v0 to $fp-112
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -112($fp)	# fill _tmp70 to $v0 from $fp-112
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp71 = *(d + -4)
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -116($fp)	# spill _tmp71 from $v0 to $fp-116
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -116($fp)	# fill _tmp71 to $v0 from $fp-116
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp72 = "\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "\n"
	  .text
	  la $v0, _string9	# load label
	  sw $v0, -120($fp)	# spill _tmp72 from $v0 to $fp-120
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -120($fp)	# fill _tmp72 to $v0 from $fp-120
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -124($fp)	# spill _tmp73 from $v0 to $fp-124
	# _tmp74 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -128($fp)	# spill _tmp74 from $v0 to $fp-128
	# _tmp75 = _tmp73 < _tmp74
	  lw $v0, -124($fp)	# fill _tmp73 to $v0 from $fp-124
	  lw $v1, -128($fp)	# fill _tmp74 to $v1 from $fp-128
	  slt $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp75 from $v0 to $fp-132
	# _tmp76 = *(b + -4)
	  lw $v0, 4($gp)	# fill b to $v0 from $gp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -136($fp)	# spill _tmp76 from $v0 to $fp-136
	# _tmp77 = _tmp73 < _tmp76
	  lw $v0, -124($fp)	# fill _tmp73 to $v0 from $fp-124
	  lw $v1, -136($fp)	# fill _tmp76 to $v1 from $fp-136
	  slt $v0, $v0, $v1	
	  sw $v0, -140($fp)	# spill _tmp77 from $v0 to $fp-140
	# _tmp78 = _tmp77 == _tmp74
	  lw $v0, -140($fp)	# fill _tmp77 to $v0 from $fp-140
	  lw $v1, -128($fp)	# fill _tmp74 to $v1 from $fp-128
	  seq $v0, $v0, $v1	
	  sw $v0, -144($fp)	# spill _tmp78 from $v0 to $fp-144
	# _tmp79 = _tmp75 || _tmp78
	  lw $v0, -132($fp)	# fill _tmp75 to $v0 from $fp-132
	  lw $v1, -144($fp)	# fill _tmp78 to $v1 from $fp-144
	  or $v0, $v0, $v1	
	  sw $v0, -148($fp)	# spill _tmp79 from $v0 to $fp-148
	# IfZ _tmp79 Goto _L8
	  lw $v0, -148($fp)	# fill _tmp79 to $v0 from $fp-148
	  beqz $v0, _L8	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string10	# load label
	  sw $v0, -152($fp)	# spill _tmp80 from $v0 to $fp-152
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -152($fp)	# fill _tmp80 to $v0 from $fp-152
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp81 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -156($fp)	# spill _tmp81 from $v0 to $fp-156
	# _tmp82 = _tmp81 * _tmp73
	  lw $v0, -156($fp)	# fill _tmp81 to $v0 from $fp-156
	  lw $v1, -124($fp)	# fill _tmp73 to $v1 from $fp-124
	  mul $v0, $v0, $v1	
	  sw $v0, -160($fp)	# spill _tmp82 from $v0 to $fp-160
	# _tmp83 = b + _tmp82
	  lw $v0, 4($gp)	# fill b to $v0 from $gp+4
	  lw $v1, -160($fp)	# fill _tmp82 to $v1 from $fp-160
	  add $v0, $v0, $v1	
	  sw $v0, -164($fp)	# spill _tmp83 from $v0 to $fp-164
	# _tmp84 = *(_tmp83)
	  lw $v0, -164($fp)	# fill _tmp83 to $v0 from $fp-164
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -168($fp)	# spill _tmp84 from $v0 to $fp-168
	# PushParam _tmp84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -168($fp)	# fill _tmp84 to $v0 from $fp-168
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp85 = "\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "\n"
	  .text
	  la $v0, _string11	# load label
	  sw $v0, -172($fp)	# spill _tmp85 from $v0 to $fp-172
	# PushParam _tmp85
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -172($fp)	# fill _tmp85 to $v0 from $fp-172
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
