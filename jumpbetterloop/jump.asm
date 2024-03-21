extern  printf

section .data
    number dq  1000000000
    fmt    db "Suma od 0 do %ld, to %ld", 10, 0
section .bss
section .text
	global main
main:
	push rbp		    ; prolog funkcji
	mov rbp, rsp		; prolog funkcji

    mov rcx, [number]   ; inicjalizacja rcx liczba
    mov rax, 0          ; suma

bloop:
    add rax, rcx
    loop bloop          ; zapletalmy, jednoczesnie dec o 1, az rcx = 0

    mov rdi, fmt
    mov rsi, [number]
    mov rdx, rax
    mov rax, 0
    call printf

	mov rsp, rbp    	; epilog funkcji
	pop rbp		        ; epilog funkcji
    ret
