/*int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++) {
    *(outro+i) = f(*(um+i));
  }
}

for (i=0; i<n; i++)
i = 0
while(i<n){
    *(outro+i) = f(*(um+i)); ==>
==> paux = um + i
    param1 = *paux
    temp = f(param1)
    paux = outro + i
    *paux = temp

    i++;
}
*/
/*
rdi  = um
rsi  = outro
edx  = n
ecx  = i
paux = rbx
*/

.text
.globl map2
map2:
    pushq %rbp  # salva a base do ra
    movq %rsp, %rbp # cria a base do RA da chamada
    subq $32, %rsp # abre espaço para o RA da chamada
    
    # salvar registradores callee-saved USADOS!!!
    movq %rbx, -8(%rbp)

    #i=0
    movl $0, %ecx

loop:
    cmpl %edx, %ecx
    jge fim

    #paux = um + i * 4
    movl %ecx, %eax
    imull $4, %eax
    
    #paux += i
    addq %rax, %rbx
    
    #param1 = *paux
    movq %rdi, -16(%rbp)
    movq %rsi, -24(%rbp)
    movl %edx, -28(%rbp)
    movl %ecx, -32(%rbp)

    #temp = f(param1)
    movl (%rbx), %edi # 1° parametro
    call f

    #restaura registradores do callee-saved
    movq -16(%rbp), %rdi
    movq -24(%rbp), %rsi
    movl -28(%rbp), %edx
    movl -32(%rbp), %ecx

    #paux = outro + i
    #paux = outro
    movq %rsi, %rbx

    #paux += i
    addq %rcx, %rbx

    #*paux = temp
    movl %eax, (%rbx)

    #i++
    incl %ecx

    jmp loop

fim:
    movq -8(%rbp), %rbx

    leave
    ret
