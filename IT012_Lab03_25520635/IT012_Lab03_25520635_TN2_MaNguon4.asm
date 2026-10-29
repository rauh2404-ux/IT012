# Ho va ten: Nguyen Cong Hung;   MSSV: 25520635;   Muc dich: Chuyen doii cac bieu thuc toan hoc phuc tap thanh cac cau lenh hop ngu MIPS, nam vung cach su dung thanh ghi tam thoi vi du nhu $t5 de luu ket qua trung gian, khao sat cach bo xu ly MIPS bieu dien so am trong thanh ghi qua phuong phap bu 2.

# Ma nguon 4 - chuyen cau lenh thanh lenh hop ngu
.text
.globl main
main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3
 
    # >>> cac lenh cho x1, x2, x3 va x4
    add $t5, $s0, $s1
    add $t0, $t5, $s2
    
    add $t5, $s0, $s1
    addi $t1, $s2, 5
    sub $t1, $t5, $t1
     
    add $t2, $s0, $0 
    
    sub $t3, $s1, $s0
 
    li   $v0, 10
    syscall
