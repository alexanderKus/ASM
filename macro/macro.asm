extern printf

%define double_it(r)    sal rax, 1

%macro  prntf    2
    section .data
        %%arg1      db  %1, 0           ; pierwszy argument
        %%fmtint    db  "%s %ld", 10, 0 ; drugi argument
    section .text 
        mov rdi, %%fmtint
        mov rsi, %%arg1
        mov rdx, [%2]
        xor rax, rax
        call printf
%endmacro

section .data
    number      dq      15
section .bss
section .text
	global main
main:
	push rbp
	mov rbp, rsp

    prntf   "number: ", number
    mov     rax, [number]
    double_it(rax)
    mov     [number], rax
    prntf   "Two time 15 is", number

    leave
    ret
