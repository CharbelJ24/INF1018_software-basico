/*
double foo2 (float a, float b) {
  return sin(a) + cos(b);
}
*/

.text
.globl foo1
foo1:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp

    cvtss2sd    %xmm1, %xmm1

    movsd       %xmm1, -8(%rbp)

    cvtss2sd    %xmm0, %xmm0
    call        sin

    movsd       -8(%rbp), %xmm1

    addsd       %xmm1, %xmm0

    cvtsd2ss    %xmm0, %xmm0

    leave
    ret
