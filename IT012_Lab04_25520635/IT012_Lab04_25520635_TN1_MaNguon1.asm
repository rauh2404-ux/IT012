# Ho va ten: Nguyen Cong Hung - MSSV: 25520635 - Muc dich: Khai bao mang reading gom 13 phan tu va mang usage chua ra 48 byte trong.

# Ma nguon 1 – mang trong bo nho
.data
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48
 
.text
.globl main
main:
  li  $v0, 10
  syscall
