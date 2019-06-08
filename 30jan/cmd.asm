SECTION .data
stm: db "n1= %d",10,0
stm2: db "n2= %d",10,0
stm3: db "abs(n1-n2)= %ld",10,0
stm4: db "random number 1 = %d",10,0
stm5: db "random number 2 = %d",10,0
stm6: db "eq=%d",10,0
n1: dd 0
n2: dd 0
a: dd -1
b: dd 0
d: dd 0
e: dd 0
f: dd 0
SECTION .text
extern printf
extern atoi
extern fabs
extern rand
extern srand
global main
main:
        push ebp
        mov ebp,esp
        mov  eax,DWORD[ebp+8]
        mov ebx,DWORD[ebp+12]
        ;**************************************************************************
        add ebx,4
        push DWORD [ebx]								
		call atoi
		mov esi,eax
		mov [n1],esi
		push eax
        push stm
        call printf
        add ebx,4
        push DWORD [ebx]
        call atoi
        mov edi,eax
        mov [n2],edi
        push eax
        push stm2
        call printf
        ;***************************************************************************
        cmp esi,edi
        jg check2
        sub edi,esi
        push edi
        mov [b],esi
        jg exit_
        
        	check2:
        sub esi,edi
        push esi
        mov [b],esi
        	exit_:
        push stm3
        call printf
        ;***************************************************************************
        call rand
        mov edx,0
        mov eax,[rand]
        mov ebx,[b]
        div ebx
        push edx
        mov [d],edx
        push stm4
        call printf
        
        call rand
        mov edx,1
        mov eax,[rand]
        mov ebx,[b]
        div ebx
        push edx
        mov [f],edx
        push stm5
        call printf
        ;*****************************************************************************
        mov eax,[d]
        imul eax,[n1]
        mov [d],eax
        mov eax,[f]
        imul eax,[n2]
        add eax,[d]
        push eax
        push stm6
        call printf
        add esp,8
        mov esp,ebp
        pop ebp
        mov eax,0
        ret
        
