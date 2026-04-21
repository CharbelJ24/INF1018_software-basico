/*
int filtro(int x, int lim);

int nums[5] = {3,-5,7,8,-2};

int main() {
  int i;
  int *p = nums;
  for (i = 0; i < 5; i++) {
    printf("%d\n", filtro(*p,LIM));
    p++;
  }
  return 0;
}
*/
.data
nums: .int 3, -5, 7, 8, -2
s1:   .string "%d\n"

 .text
 .globl main
 main:
 /* prologo */
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp
    movq  %rbx, -8(%rbp)
    movq  %r12, -16(%rbp)

 /* coloque seu codigo aqui */
    movl $0, %ebx       # int i = 0;
    movq $nums, %r12    # p = nums;

loop:
    # if(i >= 5)
    cmpl $5, %ebx
    jge fim

    # chama função filtro(*p, LIM)
    # primeiro argumento
    movl (%r12), %edi   #edi = *p

    # segundo argumento
    movl $1, %esi  # esi = LIM

    call filtro
    # resultado está em eax

    # chama função printf("%d\n", resultado)
    movq $s1, %rdi      # primeiro argumento
    movl %eax, %esi     # segundo argumento

    movl $0, %eax
    call printf

    addq $4, %r12       # p++ (avança o ponteiro)

    addl $1, %ebx       # i++

    jmp loop

fim:
    movl $0, %eax       # return 0

 /* finalizacao */
    movq -8(%rbp), %rbx
    movq -16(%rbp), %r12
    leave
    ret
