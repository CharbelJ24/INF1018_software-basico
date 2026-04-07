/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  int sum = 0;
  for (i = 0, p = nums; i != 4; i++, p++)
    sum += *p;
  printf("%d\n", sum);
  return 0;
}
*/

/*
i = 0;
p = nums;

while (i != 4){
    sum+= *p;
    i++;
    p++;
}
*/

.data
nums:  .int  10, -21, -30, 45
Sf:  .string "%d\n"

.text
.global main

main:
  pushq %rbp
  movq %rsp, %rbp

  pushq %rbx
  pushq %r12

  # sum = 0 
  movl $0, %eax

  # i = 0
  movl $0, %ebx

  #p = nums
  movq $nums, %r12

L1:
  # if (i == 4)
  cmpl $4, %ebx
  je L2

  #sum += *p
  addl (%r12), %eax

  # p++
  addq $4, %r12

  # i++
  addl $1, %ebx

  jmp L1

L2:
  # printf("%d\n, sum)

/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/******/
