	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Animal.InitAnimal:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = h
	  lw $v0, 8($fp)	# fill h to $v0 from $fp+8
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# *(this + 8) = mom
	  lw $v0, 12($fp)	# fill mom to $v0 from $fp+12
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 8($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Animal.GetHeight:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp0 from $v0 to $fp-8
	# Return _tmp0
	  lw $v0, -8($fp)	# fill _tmp0 to $v0 from $fp-8
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
  _Animal.GetMom:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 8)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp1 from $v0 to $fp-8
	# Return _tmp1
	  lw $v0, -8($fp)	# fill _tmp1 to $v0 from $fp-8
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
	# VTable for class Animal
	  .data
	  .align 2
	  Animal:		# label for class Animal vtable
	  .word _Animal.InitAnimal
	  .word _Animal.GetHeight
	  .word _Animal.GetMom
	  .text
  _Cow.InitCow:
	# BeginFunc 8
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# *(this + 12) = spot
	  lw $v0, 16($fp)	# fill spot to $v0 from $fp+16
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 12($v1) 	# store with offset
	# _tmp2 = *(this)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp2 from $v0 to $fp-8
	# _tmp3 = *(_tmp2)
	  lw $v0, -8($fp)	# fill _tmp2 to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp3 from $v0 to $fp-12
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 12($fp)	# fill m to $v0 from $fp+12
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam h
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 8($fp)	# fill h to $v0 from $fp+8
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp3
	  lw $v0, -12($fp)	# fill _tmp3 to $v0 from $fp-12
	  jalr $v0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.IsSpottedCow:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp4 = *(this + 12)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp4 from $v0 to $fp-8
	# Return _tmp4
	  lw $v0, -8($fp)	# fill _tmp4 to $v0 from $fp-8
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
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Animal.InitAnimal
	  .word _Animal.GetHeight
	  .word _Animal.GetMom
	  .word _Cow.InitCow
	  .word _Cow.IsSpottedCow
	  .text
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp5 = 16
	  li $v0, 16		# load constant value 16 into $v0
	  sw $v0, -16($fp)	# spill _tmp5 from $v0 to $fp-16
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp5 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp6 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp6 from $v0 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp7 = Cow
	  la $v0, Cow	# load label
	  sw $v0, -24($fp)	# spill _tmp7 from $v0 to $fp-24
	# *(_tmp6) = _tmp7
	  lw $v0, -24($fp)	# fill _tmp7 to $v0 from $fp-24
	  lw $v1, -20($fp)	# fill _tmp6 to $v1 from $fp-20
	  sw $v0, 0($v1) 	# store with offset
	# betsy = _tmp6
	  lw $v0, -20($fp)	# fill _tmp6 to $v0 from $fp-20
	  sw $v0, -8($fp)	# spill betsy from $v0 to $fp-8
	# _tmp8 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -28($fp)	# spill _tmp8 from $v0 to $fp-28
	# _tmp9 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -32($fp)	# spill _tmp9 from $v0 to $fp-32
	# _tmp10 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -36($fp)	# spill _tmp10 from $v0 to $fp-36
	# _tmp11 = *(betsy)
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp11 from $v0 to $fp-40
	# _tmp12 = *(_tmp11 + 12)
	  lw $v0, -40($fp)	# fill _tmp11 to $v0 from $fp-40
	  lw $v0, 12($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp12 from $v0 to $fp-44
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp10 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -32($fp)	# fill _tmp9 to $v0 from $fp-32
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -28($fp)	# fill _tmp8 to $v0 from $fp-28
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp12
	  lw $v0, -44($fp)	# fill _tmp12 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# b = betsy
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  sw $v0, -12($fp)	# spill b from $v0 to $fp-12
	# _tmp13 = *(b)
	  lw $v0, -12($fp)	# fill b to $v0 from $fp-12
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -48($fp)	# spill _tmp13 from $v0 to $fp-48
	# _tmp14 = *(_tmp13 + 8)
	  lw $v0, -48($fp)	# fill _tmp13 to $v0 from $fp-48
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -52($fp)	# spill _tmp14 from $v0 to $fp-52
	# PushParam b
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill b to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp15 = ACall _tmp14
	  lw $v0, -52($fp)	# fill _tmp14 to $v0 from $fp-52
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -56($fp)	# spill _tmp15 from $v0 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = "spots: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "spots: "
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -60($fp)	# spill _tmp16 from $v0 to $fp-60
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -60($fp)	# fill _tmp16 to $v0 from $fp-60
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = *(betsy)
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp17 from $v0 to $fp-64
	# _tmp18 = *(_tmp17 + 16)
	  lw $v0, -64($fp)	# fill _tmp17 to $v0 from $fp-64
	  lw $v0, 16($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp18 from $v0 to $fp-68
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp19 = ACall _tmp18
	  lw $v0, -68($fp)	# fill _tmp18 to $v0 from $fp-68
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -72($fp)	# spill _tmp19 from $v0 to $fp-72
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -72($fp)	# fill _tmp19 to $v0 from $fp-72
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintBool
	  jal _PrintBool     	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp20 = "    height: "
	  .data			# create string constant marked with label
	  _string2: .asciiz "    height: "
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -76($fp)	# spill _tmp20 from $v0 to $fp-76
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -76($fp)	# fill _tmp20 to $v0 from $fp-76
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = *(b)
	  lw $v0, -12($fp)	# fill b to $v0 from $fp-12
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp21 from $v0 to $fp-80
	# _tmp22 = *(_tmp21 + 4)
	  lw $v0, -80($fp)	# fill _tmp21 to $v0 from $fp-80
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp22 from $v0 to $fp-84
	# PushParam b
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill b to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp23 = ACall _tmp22
	  lw $v0, -84($fp)	# fill _tmp22 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -88($fp)	# spill _tmp23 from $v0 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -88($fp)	# fill _tmp23 to $v0 from $fp-88
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
