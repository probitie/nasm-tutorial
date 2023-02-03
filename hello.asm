section .data
    text1 db "eee",10
    digit db 0,10

section .bss
    name resb 16

section .text
    global _start

_start:

    mov rax, 5
    call _printRAXDigit
    call _printText1

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

_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 4
    syscall
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret