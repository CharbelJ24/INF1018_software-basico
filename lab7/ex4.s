/*
#include <stdio.h>

int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}
/*
    while(i != 4){
        s = s+nums[i];
        i++;
    }
    for (i=0;i<4;i++)
        s = s+nums[i];
*/


.data
# char nums[4] = {65, -105, 111, 34};
nums:  .int 65, -105, 111, 34
Sf:  .string "soma = %d\n"

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

    # int s = 0;
    movl $0, %r12d

L1:
    # if(i == 4)
    cmpl $4, %ebx
    jge L2

    # rcx = endereço base do array
    movq $nums, %rcx

    #eax = i
    movl %ebx, %eax
    # eax = i * 4
    imull $4, %eax

    # rcx = nums + i * 4
    addq %rax, %rcx

    #eax = nums[i]
    movl (%rcx), %eax

    # s = s + nums[i]
    addl %eax, %r12d

    # i++
    addl $1, %ebx

    jmp L1

L2:
    # coloca soma em eax
    movl %r12d, %eax 


/*************************************************************/
/* imprime valor em %eax */
    movq $Sf, %rdi
    movl %eax, %esi
    movl $0, %eax
    call printf
/*************************************************************/

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */

  movq  $0, %rax
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret

/***************************************************************/
