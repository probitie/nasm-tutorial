section .data
    text db "Hello, Wuuld!",10

section .text
    global _start

_start:
    jmp _start

    mov rax, 60
    mov rdi, 0
    syscall
