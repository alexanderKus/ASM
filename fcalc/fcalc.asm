extern printf
section .data
    number1     dq  9.0
    number2     dq  73.0
	fmt         db "Numbers: %f and %f", 10, 0
	fmtfloat    db "%s %f", 10, 0
    fmtsum      db "Sum: %f and %f is %f", 10, 0
    fmtdif      db "Dif: %f and %f is %f", 10, 0
    fmtmul      db "Mul: %f and %f is %f", 10, 0
    fmtdiv      db "Div: %f and %f is %f", 10, 0
    fmtsqr      db "Sqrt: %f is %f", 10, 0
section .bss
section .text
	global main
main:
    push rbp
    mov rbp, rsp

; wypisac
    movsd   xmm0, [number1]
    movsd   xmm1, [number2]
    mov rdi, fmt
    mov rax, 2
    call printf

; sum
    movsd xmm2, [number1]
    addsd xmm2, [number2]
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, fmtsum
    mov rax, 3
    call printf

; diff
    movsd xmm2, [number1]
    subsd xmm2, [number2]
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, fmtdif
    mov rax, 3
    call printf

; mul
    movsd xmm2, [number1]
    mulsd xmm2, [number2]
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, fmtmul
    mov rax, 3
    call printf

; div
    movsd xmm2, [number1]
    divsd xmm2, [number2]
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, fmtdiv
    mov rax, 3
    call printf

; sqrt
    sqrtsd xmm1, [number1]
    movsd xmm0, [number1]
    mov rdi, fmtsqr
    mov rax, 2
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
