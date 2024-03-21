extern printf
section .data
	msg1 	db "Hello, World", 0	
	msg2 	db "Alive and feeling good", 0
	radius  dq 357
	pi      dq 3.14
    fmtstr  db "%s", 10, 0
    fmtint  db "%d", 10, 0
    fmtflt  db "%lf", 10, 0
section .bss
section .text
	global main
main:
	push rbp		    ; prolog funkcji
	mov rbp, rsp		; prolog funkcji
;print msg1
    mov rax, 0
    mov rdi, fmtstr,
    mov rsi, msg1
    call printf
;print msg2
    mov rax, 0
    mov rdi, fmtstr,
    mov rsi, msg2
    call printf
;print radius
    mov rax, 0
    mov rdi, fmtint,
    mov rsi, [radius]   ; wez wartosc, a nie adres
    call printf
;print pi
    mov rax, 1          ; 1, uzywamy rejestru xmm
    movq xmm0, [pi]     ; wez wartosc, a nie adres
    mov rdi, fmtflt 
    call printf

	mov rsp, rbp    	; epilog funkcji
	pop rbp		        ; epilog funkcji

    ret
