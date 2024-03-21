extern printf

section .data
	first	db	"A"
	second 	db	"B"
	third	db	"C"
	fourth	db	"D"
	fiveth	db	"E"
	sixth	db	"F"
	seventh	db	"G"
	eighth	db	"H"
	nineth	db	"I"
	tenth	db	"J"
    fmt     db  "String: %s", 10, 0
section .bss
    flist   resb    11  ; dlugosc string + koncowe 0
section .text
	global main
main:
	push rbp
	mov rbp, rsp

    mov rdi, flist          ; adres lancucha
    mov rsi, first          
    mov rdx, second
    mov rcx, third
    mov r8,  fourth
    mov r9,  fiveth
    push     tenth
    push     nineth
    push     eighth
    push     seventh
    push     sixth
    call lfunc
    
    mov rdi, fmt
    mov rsi, flist
    mov rax, 0
    call printf

    leave
    ret
;------------------------
lfunc:
    push rbp
    mov rbp, rsp
    xor rax, rax
    mov al, byte[rsi]   ; przenosimy zawartosc pierwszeg argumentu do al
    mov [rdi], al       ; zapisujemy al w pamieci
    mov al, byte[rdx]   ; przenosimy zawartosc drugiego arugmentu do al
    mov [rdi+1], al     ; zapisujemy al w pamieci
    mov al, byte[rcx]
    mov [rdi+2], al
    mov al, byte[r8]
    mov [rdi+3], al
    mov al, byte[r9]
    mov [rdi+4], al
; pobieramy arguemntu ze stusu
    push rbx                ; zapisywany przez wywolanego

    xor rbx, rbx
    mov rax, qword[rbp+16]  ; pierwsza wartosc: poczatkowy stos + rip + rbp
    mov bl, byte[rax]
    mov [rdi+5], bl         ; zapisujemy znak w pamieci 
    mov rax, qword[rbp+24]  ; kolejna wartosc
    mov bl, byte[rax]
    mov [rdi+6], bl
    mov rax, qword[rbp+32]
    mov bl, byte[rax]
    mov [rdi+7], bl
    mov rax, qword[rbp+40]
    mov bl, byte[rax]
    mov [rdi+8], bl
    mov rax, qword[rbp+48]
    mov bl, byte[rax]
    mov [rdi+9], bl
    mov bl, 0
    mov [rdi+10], bl

    pop rbx                ; zapisywany przez wywolanego

    mov rsp, rbp
    pop rbp
    ret

