.data
s1: .string "ls -ls"

.text
.globl main
main:
/* prologo */
  pushq %rbp
  movq  %rsp, %rbp

/* coloque seu codigo aqui */
  movq $s1, %rdi  # primeiro argumento da função

  call system

  #return 0
  movl $0, %eax

/* finalizacao */
  leave
  ret