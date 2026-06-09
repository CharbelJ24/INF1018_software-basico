.text
.globl foo2
foo2:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp

    cvtss2sd    %xmm1, %xmm1
    movsd       %xmm1, -8(%rbp)

    cvtss2sd    %xmm0, %xmm0
    call        sin

    movsd       %xmm0, -16(%rbp)

    movsd       -8(%rbp), %xmm0
    call        cos

    movsd       -16(%rbp), %xmm1
    addsd       %xmm1, %xmm0

    leave
    ret