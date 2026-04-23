/*
int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);
}
*/

.text
.globl fat
fat:
    pushq %rbp
    movq %rsp, %rbp

    subq $8, %rsp
    movl %edi, -4(%rbp)

    #if (n == 0)
    cmpl $0, %edi
    jne recursivo

    # return 1
    movl $1, %eax
    jmp fim

recursivo:
  # n - 1
  movl -4(%rbp), %edi
  subl $1, %edi

  # chama fat(n-1)
  call fat

  # n * fat(n-1)
  movl -4(%rbp), %edx
  imull %edx, %eax

fim:
  leave
  ret
