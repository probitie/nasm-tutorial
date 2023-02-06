section .data
    text db "eee",10,0
    text1 db "JifneiufniwuenfiquwnejnefwjefjwEFwheflqwhenfjqweh w f wf wf ",10,0
    digit db 0,10

section .bss
    name resb 16

section .text
    global _start

_start:
    mov rax, text1
    call _print
    call _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

_printRAXDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

;input: rax
;output: print string at address in rax
_print:
    push rax
    mov rbx, 0
_printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
    jne _printLoop

    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret