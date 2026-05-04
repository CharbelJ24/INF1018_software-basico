/*
int maior_que(int x, int y);
int boo(int *v, int n, int ref) {
 int i, cont = 0;
 for (i = 0; i < n; i++) {
 if (maior_que(v[i], ref))
 cont += 1;
 }
 return cont;
}
*/

/*
i = 0
while(i < n){
    aux = i
    aux = i * 4
    paux = v + aux
    param1 = *paux
    temp = maior_que(param1, ref) 

    if(temp != 0)
        cont++;
    
    i++
}
*/

.globl boo
boo:
    pushq %rbp
    movl %rsp, %rbp
    subq $32, %rbp

# salvando registradores callee-saved
    movq %rbx, -8(%rbp)

    movl $0, %ecx # ecx = i = 0

    movl $0, %ebx # ebx = cont = 0

loop:
    # while (i >= n)
    cmpl %esi, %ecx
    jge fim

# aux = i
    movl %ecx, %eax
# aux = i * 4
    imull $4, %eax          # aux = i * 4
# paux = aux + v
    movq %rdi, %rcx
    addq %rax, %rcx

# guardar valores para chamar a função
    movq %rdi, -16(%rbp)
    movl %esi, -24(%rbp)
    movl %edx, -28(%rbp)
    movl %ecx, -32(%rbp)
# param1 = *paux
    movl (%rcx), %edi
# param2 = ref
    movl %edx, %esi

#temp = maior_que(param1, ref) 
    call maior_que           # temp = eax

# restaura valores
    movq -16(%rbp), %rdi
    movl -24(%rbp), %esi
    movl -28(%rbp), %edx
    movl -32(%rbp), %ecx

# if(temp != 0) cont++;
    cmpl $0, %eax
    je fora_if

# cont++
    addl $1, %ebx

fora_if:
    # i++
    movl -4(%rbp), %ecx
    incl %ecx

    jmp loop

fim:
# retorno = cont (ebx)
    movl %ebx, %eax

    movq -8(%rbp), %rbx

    leave
    ret
