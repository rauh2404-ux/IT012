# Ho va ten: Nguyen Cong Hung - MSSV: 25520635 - Muc dich: Tinh toan dien nang tieu thu va in ra man hinh

# Ma nguon 5 – phan bac dien nang
.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"
 
.text
.globl main
main:
  li  $v0, 4
  la  $a0, prompt
  syscall
  li  $v0, 5            # doc kWh, ket qua o $v0
  syscall
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)
  # >>> xac dinh bac (1..4) theo Bang 6, dat vao $s1
  slti $t0, $s0, 101	# Bac 1 <= 100 kWh
  bne $t0, $zero, bac1
  
  slti $t0, $s0, 151	# Bac 2 <= 150 kWh
  bne $t0, $zero, bac2
  
  slti $t0, $s0, 201	# Bac 3 <= 200 kWh
  bne $t0, $zero, bac3
  
  j bac4	# Bac 4 > 201 kWh
  
  bac1: 
  	addi $s1, $0, 1
  	j output
  bac2:
  	addi $s1, $0, 2
  	j output
  	
  bac3:
  	addi $s1, $0, 3
  	j output
  bac4:
  	addi $s1, $0, 4
  	j output
  # >>> in “Bac: “, roi $s1, roi xuong dong
  output:
  	li $v0, 4
  	la $a0, msg       # in "Bac: "
  	syscall
  	li $v0, 1
  	add $a0, $s1, $zero
  	syscall 
  	li $v0, 4
  	la $a0, nl      # in xuong dong
  	syscall
  	 
  li  $v0, 10
  syscall
