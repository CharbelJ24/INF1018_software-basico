/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    if ((*p % 2) == 0)
      printf("%d\n", *p);
  return 0;
}
*/

/*
i = 0;
p = nums;

while(i != 4){
    if((*p & 1) == 0){
        printf("%d\n", *p);
    }
    i++;
    p++;
}
*/

#int nums[] = {10, -21, -30, 45}
.data
nums: .int 10, -21, -30, 45

Sf: .string "%d\n"

.text
.global main

main:
    pushq %rbp
    movq %rsp, %rbp

    pushq %rbx
    pushq %r12

    #i = 0
    movl $0, %ebx

    #p = nums
    movq $nums, %r12

L1:
    #if (i == 4)
    cmpl $4, %ebx
    je L3

    #eax = *p
    movl (%r12), %eax
    movl %eax, %edx

    # (*p & 1) == 1
    andl $0x01, %edx
    jnz L2

    # printf("%d\n", *p)

/*************************************************************/
/* imprime valor em %eax */
    movq $Sf, %rdi
    movl %eax, %esi
    movl $0, %eax
    call printf
/*************************************************************/

L2:
    #p++
    addq $4, %r12

    # i++
    addl $1, %ebx

    jmp L1

L3:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */

  movq  $0, %rax
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret

/******/
