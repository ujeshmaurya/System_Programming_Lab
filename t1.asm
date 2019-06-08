SECTION .data
stm: db "a=%d",10,0
m: dd 0
d: dd 0
stm1: db "Capricorn",10,0
stm2: db "Aquarius",10,0
stm3: db "Pisces",10,0
stm4: db "Aries",10,0
stm5: db "Taurus",10,0
stm6: db "Gemini",10,0
stm7: db "Cancer",10,0
stm8: db "Leo",10,0
stm9: db "Virgo",10,0
stm10: db "Libra",10,0
stm11: db "Scorpio",10,0
stm12: db "Sagittarius",10,0
error: db "INVALID DATE!!",10,0

SECTION .text
extern printf
extern atoi
global main
main:
	push ebp
	mov ebp,esp
	;**********start**************
	mov eax,[ebp+8]
	mov ebx,[ebp+12]
	
	add ebx,4
	push DWORD [ebx]
	call atoi
	mov esi,eax
	mov [m],esi

	
	add ebx,4
	push DWORD [ebx]
	call atoi
	mov esi,eax
	mov [d],esi
	cmp dword[d],31
		jg lab25
	
	mov eax,[m]
	cmp eax,1
	jne lab2
		mov eax,[d]
		cmp eax, 19
		jg lab2
			push stm1
			call printf
			jmp exit
	lab2:
	mov eax,[m]
	cmp eax,1
	jne lab3
		mov eax,[d]
		cmp eax, 19
		jle lab3
			push stm2
			call printf
			jmp exit
			
	lab3:
	mov eax,[m]
	cmp eax,2
	jne lab4
		mov eax,[d]
		cmp eax, 17
		jg lab4
			push stm2
			call printf
			jmp exit
	
	lab4:
	mov eax,[m]
	cmp eax,2
	jne lab5
		mov eax,[d]
		cmp eax, 17
		jle lab5
			push stm3
			call printf
			jmp exit
	lab5:
	mov eax,[m]
	cmp eax,3
	jne lab6
		mov eax,[d]
		cmp eax, 19
		jg lab6
			push stm3
			call printf
			jmp exit
	
	lab6:
	mov eax,[m]
	cmp eax,3
	jne lab7
		mov eax,[d]
		cmp eax, 19
		jle lab7
			push stm4
			call printf
			jmp exit
			
	lab7:
	mov eax,[m]
	cmp eax,4
	jne lab8
		mov eax,[d]
		cmp eax, 20
		jg lab8
			push stm4
			call printf
			jmp exit
			
	lab8:
	mov eax,[m]
	cmp eax,4
	jne lab9
		mov eax,[d]
		cmp eax, 20
		jle lab9
			push stm5
			call printf
			jmp exit
	lab9:
	mov eax,[m]
	cmp eax,5
	jne lab10
		mov eax,[d]
		cmp eax, 20
		jg lab10
			push stm5
			call printf
			jmp exit
	lab10:
	mov eax,[m]
	cmp eax,5
	jne lab11
		mov eax,[d]
		cmp eax, 20
		jle lab11
			push stm6
			call printf
			jmp exit
	lab11:
	mov eax,[m]
	cmp eax,6
	jne lab12
		mov eax,[d]
		cmp eax, 20
		jg lab12
			push stm6
			call printf
			jmp exit
	lab12:
	mov eax,[m]
	cmp eax,6
	jne lab13
		mov eax,[d]
		cmp eax, 20
		jle lab13
			push stm7
			call printf
			jmp exit
	
	lab13:
	mov eax,[m]
	cmp eax,7
	jne lab14
		mov eax,[d]
		cmp eax, 22
		jg lab14
			push stm7
			call printf
			jmp exit
	
	lab14:
	mov eax,[m]
	cmp eax,7
	jne lab15
		mov eax,[d]
		cmp eax, 22
		jle lab15
			push stm8
			call printf
			jmp exit
	
	lab15:
	mov eax,[m]
	cmp eax,8
	jne lab16
		mov eax,[d]
		cmp eax, 22
		jg lab16
			push stm8
			call printf
			jmp exit
	
	lab16:
	mov eax,[m]
	cmp eax,8
	jne lab17
		mov eax,[d]
		cmp eax, 22
		jle lab17
			push stm9
			call printf
			jmp exit
	
	lab17:
	mov eax,[m]
	cmp eax,9
	jne lab18
		mov eax,[d]
		cmp eax, 22
		jg lab18
			push stm9
			call printf
			jmp exit
	
	lab18:
	mov eax,[m]
	cmp eax,9
	jne lab19
		mov eax,[d]
		cmp eax, 22
		jle lab19
			push stm10
			call printf
			jmp exit
	
	lab19:
	mov eax,[m]
	cmp eax,10
	jne lab20
		mov eax,[d]
		cmp eax, 22
		jg lab20
			push stm10
			call printf
			jmp exit
	
	lab20:
	mov eax,[m]
	cmp eax,10
	jne lab21
		mov eax,[d]
		cmp eax, 22
		jle lab21
			push stm11
			call printf
			jmp exit
	
	lab21:
	mov eax,[m]
	cmp eax,11
	jne lab22
		mov eax,[d]
		cmp eax, 21
		jg lab22
			push stm11
			call printf
			jmp exit
	
	lab22:
	mov eax,[m]
	cmp eax,11
	jne lab23
		mov eax,[d]
		cmp eax, 21
		jle lab23
			push stm12
			call printf
			jmp exit
	
	lab23:
	mov eax,[m]
	cmp eax,12
	jne lab24
		mov eax,[d]
		cmp eax, 21
		jg lab24
			push stm12
			call printf
			jmp exit
	
	lab24:
	mov eax,[m]
	cmp eax,12
	jne lab25
		mov eax,[d]
		cmp eax, 21
		jle lab25
			push stm1
			call printf
			jmp exit
	lab25:
		push error
		call printf
	exit:
	;**********finish*************
	mov esp,ebp
	pop ebp
	mov eax,0
	ret
