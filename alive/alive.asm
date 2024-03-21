section .data
	msg1 	db "Hello, World", 10, 0		; lancuch ze znakiem NL i 0
	msg1Len equ $-msg1-1			; mierzymy dlugosc, odejmujac koncowe 0
	msg2 	db "Alive and feeling good", 10, 0	; lancuch ze znakiem NL i 0
	msg2Len equ $-msg2-1			; mierzymy dlugosc, odejmujac koncowe 0
	radius  dq 357
	pi      dq 4.13
section .bss
section .text
	global main
main:
	push rbp		; prolog funkcji
	mov rbp, rsp		; prolog funkcji
	mov rax, 1		; 1 = wypisz
	mov rdi, 1		; 1= stdout
	mov rsi, msg1		; lancuch do wyswietlania
	mov rdx, msg1Len	; dlugosc lancucha
	syscall
	mov rax, 1		; 1 = wypisz
	mov rdi, 1		; 1= stdout
	mov rsi, msg2		; lancuch do wyswietlania
	mov rdx, msg2Len	; dlugosc lancucha
	syscall
	mov rsp, rbp	; epilog funkcji
	pop rbp		; epilog funkcji
	mov rax, 60	; 60 = wyjscie
	mov rdi, 0	; 0 = wysciowy kod syganaluzujacy sukces
	syscall
