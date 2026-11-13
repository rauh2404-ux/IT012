# Ho va ten: Nguyen Cong Hung - MSSV: 25520635 - Muc dich: Tinh va in ra man hinh dien nang tieu thu cua tung thang, thang co dien nang lon nhat va tong dien nang.

# Ma nguon 7 (Phan du lieu)
.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48

# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
Loop:
  # >>> thoat neu i == n
  beq $s2, $s3, Done
  
  # >>> tinh dia chi reading[i]
  sll $t1, $s2, 2	# $t1 = 4*i
  add $t2, $t1, $s0	# $t2 = dia chi reading[i]
  
  # >>> $t3 = reading[i], $t4 = reading[i+1]
  lw $t3, 0($t2)	# $t3 = reading[i]
  lw $t4, 4($t2)	# $t4 = reading[i+1]
  
  # >>> $t5 = $t4 - $t3 (dien nang thang i+1)
  sub $t5, $t4, $t3
  
  # >>> tinh dia chi usage[i], luu $t5 vao usage[i]
  add $t6, $t1, $s1	# $t6 = 4*i + dia chi nen usage
  sw $t5, 0($t6)	# usage[i] = $t5
  
  # >>> cong don dien nang cac thang vao $s4, dien nang lon nhat $s5, thang tuong ung $s6
  add $s4, $s4, $t5
  # >>> so sanh dien nang thang hien tai voi $s5 bang slt
  slt $t7, $s5, $t5
  beq $t7, $0, month
  add $s5, $t5, $0
  addi $s6, $s2, 1
  
  month:
  # >>> in “Thang “, i+1, “: ", $t5, xuong dong
  li $v0, 4
  la $a0, m1
  syscall
  
  li $v0, 1
  addi $a0, $s2, 1
  syscall
  
  li $v0, 4
  la $a0, m2
  syscall
  
  li $v0, 1
  add $a0, $t5, $zero
  syscall
  
  li $v0, 4
  la $a0, nl
  syscall
  # >>> i = i + 1, quay lai Loop
  addi $s2, $s2, 1 
  j Loop
  
Done:
  # >>> in tong
  li $v0, 4
  la $a0, mt 	# in "Tong: " 
  syscall
  
  li $v0, 1
  add $a0, $s4, $0	# in tong dien nang cac thang
  syscall
  
  li $v0, 4
  la $a0, nl	# xuong dong
  syscall
  # >>> in thang cao nhat
  li $v0, 4
  la $a0, mm	# in "Thang cao nhat: "
  syscall
  
  li $v0, 1
  add $a0, $s6, $0	# in thang tuong ung $s6
  syscall
  
  li $v0, 4
  la $a0, lp	# in " ("
  syscall
  
  li $v0, 1
  add $a0, $s5, $0	# in dien nang lon nhat $s5
  syscall
  
  li $v0, 4
  la $a0, rp	# in ")"
  syscall
  
  li $v0, 4
  la $a0, nl
  syscall
  
  li   $v0, 10
  syscall
