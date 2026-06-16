/*
struct X {
  int vi;
  double vd;
  struct X *next;
};

double pack (struct X *px) {
  double acc = 0;
  while (px != NULL) {
    acc += foo(px->vd, px->vi);
    px = px->next;
  }
  return acc;
}
*/

.text
.globl pack
pack:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    pxor    %xmm0, %xmm0
    movsd   %xmm0, -8(%rbp)

    movq    %rdi, -16(%rbp)

loop:
    cmpq    $0, -16(%rbp)
    je      end

    movq    -16(%rbp), %rdi
    movsd   8(%rdi), %xmm0
    movl    0(%rdi), %edi
    call    foo

    addsd   -8(%rbp), %xmm0
    movsd   %xmm0, -8(%rbp)

    movq    -16(%rbp), %rdi
    movq    16(%rdi), %rdi
    movq    %rdi, -16(%rbp)

    jmp loop

end:
    movsd   -8(%rbp), %xmm0

    leave
    ret
