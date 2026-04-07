/*
int main(void){
    int i = 1;
    int q;
    while(i != 10){
        q = i * i;
        printf("%d\n", q);
        i++;
    }

    return 0;
}
*/
# formato da string "%d\n"
Sf: .string "%d\n"

.text
.globl main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)  /* guarda rbx */
    movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/
    # int i = 0;
    movl $0, %ebx

    #int q = 0;
    movl $0, %r12d

L1:
    #if (i == 10)
    cmpl $10, %ebx
    je L2

    # q = i
    movl %ebx, %r12d

    # q *= q
    imull %r12d, %r12d

    movl %r12d, %eax
    # printf("%d\n", q);
/*************************************************************/
/* imprime valor em %eax */
    movq $Sf, %rdi
    movl %eax, %esi
    movl $0, %eax
    call printf
/*************************************************************/

    # i++
    addl $1, %ebx

    jmp L1

L2:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */

  movq  $0, %rax
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret

/******/