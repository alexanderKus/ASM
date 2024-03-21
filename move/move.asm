section .data
    bNum    db  123
    wNum    dw  12345 
    dNum    dd  1234567890
    qNum1   dq  1234567890123456789
    qNum2   dq  123456
    qNum3   dq  3.14
section .bss
section .text
	global main
main:
    mov rbp, rsp; for correct debugging
	push rbp		    ; prolog funkcji
	mov rbp, rsp		; prolog funkcji

    mov rax, -1         ; wypelniamy rax jedynkami
    mov al, byte [bNum] ; NIE zeruje gorych bitow rax
    xor rax, rax        ; zeruje rax
    mov al, byte[bNum]  ; teraz rax zawiera poprawna wartosc
    
    mov rax, -1         ; wypelniamy rax jedynkami
    mov ax, word [wNum] ; NIE zeruje gorych bitow rax
    xor rax, rax        ; zeruje rax
    mov ax, word[wNum]  ; teraz rax zawiera poprawna wartosc
    
    mov rax, -1             ; wypelniamy rax jedynkami
    mov eax, dword [dNum]   ;zeruje gorne bity rax
    
    mov rax, -1             ; wypelniamy rax jedynkami
    mov rax, qword [qNum1]  ; zeruje gorych bitow rax
    mov qword [qNum2], rax   ; jednym z operatorow jest zawsze rejestr
    mov rax, 123456         ; operandem zrodlowym moze byc wartosc bezposrednia

    movq xmm0, [qNum3]      ; specialna intsrucja dla liczb zmiennnoprzecinkowych
    
	mov rsp, rbp    	; epilog funkcji
	pop rbp		        ; epilog funkcji

    ret
