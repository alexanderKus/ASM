section .data
	msg db "Hello, World", 0
section .bss
section .text
	global main
main:
	mov rax, 1	; 1 = wypisz
	mov rdi, 1	; 1= stdout
	mov rsi, msg
	mov rdx, 13	; dlugosc lancucha bez 0 
	syscall
	mov rax, 60	; 60 = wyjscie
	mov rdi, 0	; 0 = wysciowy kod syganaluzujacy sukces
	syscall
