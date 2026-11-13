# Ho va ten: Nguyen Cong Hung - MSSV: 25520635 - Muc dich: Doc va in ra phan tu arr[2] cua mang ra man hinh.

# Ma nguon 0 – kiem tra nhanh
.data
arr: .word 7, 5, 12
msg: .asciiz "Phan tu arr[2] = "
 
.text
.globl main
main:
  la  $s0, arr
  lw  $t0, 8($s0)
  li  $v0, 4
  la  $a0, msg
  syscall
  li  $v0, 1
  add $a0, $t0, $zero
  syscall
  li  $v0, 10
  syscall
