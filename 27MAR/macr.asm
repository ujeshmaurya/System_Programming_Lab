
SECTION .data
a: dd 0
b: dd 0
c: dd 0
d: dq 0.0
e: dd 0
f: dd 0
g: dd 0
h: dd 0
m: dd 0
stma: db "side a = %d",10,0
stmb: db "side b = %d",10,0
stmc: db "side c = %d",10,0
stms: db "semi perimeter(s) = %ld",10,0
stm: db "area = %d",10,0

; MACRO DEFINITION
%macro semiperim 3 
      mov eax, %1
        add eax, %2
        add eax, %3
        mov edx, 0
        mov ecx, 2
        div ecx
        mov [d],eax
        push eax
        push stms
        call printf
      
   %endmacro
   
   
%macro sqrta 2
        mov edx, 0
        mov ecx, 0
        loop:
                add ecx,1
                
                mov edx,ecx
                imul edx,edx
                cmp edx,%1
                jge exit

                jmp loop
        exit:
        mov %2,ecx
        cmp edx,%1
        je dota
        mov ecx,%2
        sub ecx,1
        mov %2,ecx
        dota:
        mov ecx,%2
%endmacro


%macro multiply 7
        semiperim %1,%2,%3              ;macro to compute semi perimeter s=(a+b+c)/2
        mov eax,%4
        sub eax,%1
        mov %5,eax
        
        mov eax,%4
        sub eax,%2
        mov %6,eax
        
        mov eax,%4
        sub eax,%3
        mov %7,eax
        
        mov eax,%4
        imul eax,%5
        imul eax,%6
        imul eax,%7
%endmacro       

SECTION .text
extern printf
extern atoi
global main
main:
        push ebp
        mov ebp,esp
        mov  eax,DWORD[ebp+8]
        mov ebx,DWORD[ebp+12]
        ;************************************************************************** input from COMMAND LINE ARGUMENTS
        add ebx,4
        push DWORD [ebx]								
		call atoi
		mov esi,eax
		mov [a],esi
		
        
        add ebx,4
        push DWORD [ebx]
                call atoi
                mov edi,eax
                mov [b],edi
        
        
        add ebx,4
        push DWORD [ebx]
                call atoi
                mov edi,eax
                mov [c],edi
        
        ;************************************************************************* calculate area from a,b,c
        
        mov eax,[a]
        push eax
        push stma
        call printf                     ;print value of side a
        mov eax,[b]
        push eax
        push stmb
        call printf                     ;print value of side b
        mov eax,[c]
        push eax
        push stmc
        call printf                     ;print value of side c
        
        
        
        multiply [a],[b],[c],[d],[f],[g],[h]            ;macro to compute and multiply s*(s-a)*(s-b)*(s-c)
        
        mov [m],eax
        
        sqrta [m],[e]                                   ; macro to find square root of s*(s-a)*(s-b)*(s-c)
        
        push ecx
        push stm
        call printf                                     ; print value of area
        
        
        ;*************************************************************************finish off
        
        add esp,8
        mov esp,ebp
        pop ebp
        mov eax,0
        ret
        
