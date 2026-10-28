# Ho va Ten;   MSSV: 25520635;   Muc dich: Tong hop 3 tháng voi du lieu cua riêng sinh vien tu do nham giai quyet cac bai toan thuc te, xu ly du lieu cho nhieu moc thoi gian lien tuc vi du nhu tinh dien n?ng tieu thu.

# Ma nguon 7

.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"

.text
.globl main
main:
	# Doc reading0 vao $s0
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
	# Doc reading1 vao $s1
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, $zero
	
	# Doc reading2 vao $s2
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, $zero
	
	# Doc reading3 vao $s3
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	add $s3, $v0, $zero
	
	# Tinh usage
	sub $t0, $s1, $s0 	# usage1
	sub $t1, $s2, $s1	# usage2
	sub $t2, $s3, $s2	# usage3
	add $t3, $t0, $t1	# total 2 lenh add
	add $t3, $t3, $t2
	
	# Thang 1
	li $v0, 4
	la $a0, m1
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	# Thang 2
	li $v0, 4
	la $a0, m2
	syscall
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	# Thang 3
	li $v0, 4
	la $a0, m3
	syscall
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	# Tong
	li $v0, 4
	la $a0, tot
	syscall
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	
