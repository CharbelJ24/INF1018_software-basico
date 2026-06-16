/*
DICIONARIO:
-8(%rsp) = double acc
-16(%rsp) = struct X1 *px
-20(%rsp) = int n
-24(%rsp) = int i
*/

.text
.globl pack1
pack1:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp

    pxor    %xmm0, %xmm0
    movsd   %xmm0, -8(%rbp)

    movq    %rdi, -16(%rbp)

    movl    %esi, -20(%rbp)

    movl    $0, -24(%rbp)

loop:
    movl        -24(%rbp), %eax
    cmpl        -20(%rbp), %eax
    jge         end

    movq        -16(%rbp), %rdi
    movslq      -24(%rbp), %rax
    imulq       $8, %rax
    addq        %rax, %rdi

    movss       4(%rdi), %xmm0
    cvtss2sd    %xmm0, %xmm0
    movl        0(%rdi), %edi
    call        foo

    addsd       -8(%rbp), %xmm0
    movsd       %xmm0, -8(%rbp)

    addl        $1, -24(%rbp)
    jmp         loop

end:
    movsd   -8(%rbp), %xmm0

    leave 
    ret
    