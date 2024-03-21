extern  printf
section .data
    number1 db  42
    number2 db  42
    fmt1    db "Liczba1 >= Liczba2", 10, 0
    fmt2    db "Liczba2 >= Liczba1", 10, 0
section .bss
section .text
	global main
main:
	push rbp		    ; prolog funkcji
	mov rbp, rsp		; prolog funkcji

    mov rax, [number1] ; wczytaj liczby do rejestrow
    mov rbx, [number2]

    cmp rax, rbx
    jge greater

    mov rdi, fmt2
    mov rax, 0
    call printf
    jmp exit

greater:
    mov rdi, fmt1
    mov rax, 0
    call printf

exit:
	mov rsp, rbp    	; epilog funkcji
	pop rbp		        ; epilog funkcji
    ret
