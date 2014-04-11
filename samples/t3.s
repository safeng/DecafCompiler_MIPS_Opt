	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 12
	  li $v0, 12		# load constant value 12 into $v0
	  sw $v0, -12($fp)	# spill _tmp0 from $v0 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp0 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp1 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -16($fp)	# spill _tmp1 from $v0 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = Cow
	  la $v0, Cow	# load label
	  sw $v0, -20($fp)	# spill _tmp2 from $v0 to $fp-20
	# *(_tmp1) = _tmp2
	  lw $v0, -20($fp)	# fill _tmp2 to $v0 from $fp-20
	  lw $v1, -16($fp)	# fill _tmp1 to $v1 from $fp-16
	  sw $v0, 0($v1) 	# store with offset
	# betsy = _tmp1
	  lw $v0, -16($fp)	# fill _tmp1 to $v0 from $fp-16
	  sw $v0, -8($fp)	# spill betsy from $v0 to $fp-8
	# _tmp3 = 100
	  li $v0, 100		# load constant value 100 into $v0
	  sw $v0, -24($fp)	# spill _tmp3 from $v0 to $fp-24
	# _tmp4 = 122
	  li $v0, 122		# load constant value 122 into $v0
	  sw $v0, -28($fp)	# spill _tmp4 from $v0 to $fp-28
	# _tmp5 = *(betsy)
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -32($fp)	# spill _tmp5 from $v0 to $fp-32
	# _tmp6 = *(_tmp5)
	  lw $v0, -32($fp)	# fill _tmp5 to $v0 from $fp-32
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp6 from $v0 to $fp-36
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -28($fp)	# fill _tmp4 to $v0 from $fp-28
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -24($fp)	# fill _tmp3 to $v0 from $fp-24
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp6
	  lw $v0, -36($fp)	# fill _tmp6 to $v0 from $fp-36
	  jalr $v0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp7 = *(betsy)
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -40($fp)	# spill _tmp7 from $v0 to $fp-40
	# _tmp8 = *(_tmp7 + 4)
	  lw $v0, -40($fp)	# fill _tmp7 to $v0 from $fp-40
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp8 from $v0 to $fp-44
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill betsy to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp8
	  lw $v0, -44($fp)	# fill _tmp8 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = w
	  lw $v0, 8($fp)	# fill w to $v0 from $fp+8
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 8($v1) 	# store with offset
	# *(this + 4) = h
	  lw $v0, 12($fp)	# fill h to $v0 from $fp+12
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 4($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Moo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp9 = *(this + 4)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -8($fp)	# spill _tmp9 from $v0 to $fp-8
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill _tmp9 to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = " "
	  .data			# create string constant marked with label
	  _string1: .asciiz " "
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -12($fp)	# spill _tmp10 from $v0 to $fp-12
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -12($fp)	# fill _tmp10 to $v0 from $fp-12
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = *(this + 8)
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp11 from $v0 to $fp-16
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp11 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -20($fp)	# spill _tmp12 from $v0 to $fp-20
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -20($fp)	# fill _tmp12 to $v0 from $fp-20
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
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Cow.Init
	  .word _Cow.Moo
	  .text
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
