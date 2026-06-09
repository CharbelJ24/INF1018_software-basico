/* 
PILHA:
-8(%rbp)  → r
-16(%rbp) → a
-20(%rbp) → n
-24(%rbp) → i
*/

.text
.globl foo3
foo3:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp

    movl    %esi, -20(%rbp)
    movq    %rdi, -16(%rbp)

    # int i = 0 (edx)
    movl    $0, %edx

    pxor    %xmm0, %xmm0
    movsd   %xmm0, -8(%rbp)

    movl    $0, -24(%rbp)

/*
  while(i<n){
    temp = sin(*a)
    r += temp
    a++;
  }
  */

loop:
    movl    -24(%rbp), %eax
    cmpl    -20(%rbp), %eax
    jge     fim

    movq    -16(%rbp), %rdi
    movsd   (%rdi), %xmm0
    call    sin

    movsd   -8(%rbp), %xmm1
    addsd   %xmm0, %xmm1
    movsd   %xmm1, -8(%rbp)

    movq    -16(%rbp), %rdi
    addq    $8, %rdi
    movq    %rdi, -16(%rbp)

    addl    $1, -24(%rbp)

    jmp loop

fim:
    movsd   -8(%rbp), %xmm0
    
    leave
    ret
