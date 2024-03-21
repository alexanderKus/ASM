extern printf
section .data
	msg 	db "Hello, World!", 0
	fmtstr  db "This is string: %s", 10, 0	; format printf
section .bss
section .text
	global main
main:
	push rbp
	mov rbp, rsp
	mov rdi, fmtstr	; pierwszy argument printf
	mov rsi, msg	; drugi argument printf
	mov rax, 0	; nie uzywamy zadnych rejestrow xmm
	call printf
	mov rsp, rbp
	pop rbp
	mov rax, 60	; 60 = wyjscie
	mov rdi, 0	; 0 = wysciowy kod syganaluzujacy sukces
	syscall
