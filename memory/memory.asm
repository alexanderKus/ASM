section .data
    bNum    db  123
    wNum    dw  12345
    wArray  times   5   dw  0   ; tablice 5 elementow typu word (2bytes) rownych 0
    dNum    dd  12345
    qNum1   dq  12345
    text1   db  "abc", 0
    qNum2   dq  3.14159
    text2   db  "cde", 0
section .bss
    bvar    resb    1
    dvar    resd    1
    wvar    resw    10
    qvar    resq    30000
section .text
	global main
main:
	push rbp
	mov rbp, rsp

    lea rax, [bNum]     ; wczytaj adres bNum do rax
    mov rax, bNum       ; wczutaj adres bNum do rax
    mov rax, [bNum]     ; wczutaj wartosc pod adresem bNum do rax

    mov [bvar], rax     ; zapisz wartosc w rax pod adresem bvar
    lea rax, [bvar]     ; wczytaj adres bvar do rax

    lea rax, [wNum]     ; wczytaj adres wNum do rax
    mov rax, [wNum]     ; wczytaj zawartosc wNum do rax

    lea rax, [text1]    ; wczytaj ades text1 do rax
    mov rax, text1      ; wczytaj adres text1 do rax
    mov rax, text1+1     ; wczutaj adres drugiego znaku text1 do rax
    lea rax, [text1+1]  ; wczutaj adres drugiego znaku test1 do rax
    mov rax, [text1]    ; wczytaj zawartosc zaczynajaca sie od text1 do rax
    mov rax, [text1+1]  ; wczutaj zawartosc zaczynajaca sie od test1+1 do rax

	mov rsp, rbp
	pop rbp
    ret
