extern printf

section .data
    strng       db  "ABCDE", 0
    strngLen    equ     $ - strng - 1   ; dlugosc lancucha bez 10 i 0  
    fmt1        db  "Original: %s", 10, 0
    fmt2        db  "Reversed: %s", 10, 0
section .bss
section .text
	global main

main:
	push rbp		    ; prolog funkcji
	mov rbp, rsp		; prolog funkcji

; wyswietl orignaly string
    mov rdi, fmt1
    mov rsi, strng
    mov rax, 0
    call printf   

; znak po znasku odkladamy na stos
    xor rax, rax
    mov rbx, strng
    mov rcx, strngLen
    mov r12, 0          ; R12 jako wskaznik

    pushLoop:
        mov al, byte[rbx+r12]   ; przenosiny znak do rax
        push rax                ; odkladamu rax na stos
        inc r12
        loop pushLoop

        mov rbx, strng
        mov rcx, strngLen
        mov r12, 0
   
    popLoop:
        pop rax
        mov byte [rbx+r12], al
        inc r12
        loop popLoop
        mov byte[rbx+r12], 0    ; konczymy lancuch znakiem 0

; wyswietl odwrocony string
    mov rdi, fmt2
    mov rsi, strng
    mov rax, 0
    call printf   
    
	mov rsp, rbp    	; epilog funkcji
	pop rbp		        ; epilog funkcji

    ret
