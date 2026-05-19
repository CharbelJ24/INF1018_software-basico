.text
.global bemboba

bemboba:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  subq $16, %rsp

  movl %edi, %ebx

  # a = &local[0]  =>  %rdx = rbp - 16
  leaq    -16(%rbp), %rdx

  # i = 0  => %esi = 0
  movl    $0, %esi

loop:
  cmpl $4, %esi
  jge fim

  movl %ebx, (%rdx)
  addq $4, %rdx
  addl $1, %esi
  jmp loop

fim:
  leaq -16(%rbp), %rdi
  movl $4, %esi
  call addl

  addq $16, %rsp
  popq %rbx
  leave
  ret
