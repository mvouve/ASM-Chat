sys_exit    equ 1
sys_read    equ 3
sys_write   equ 4
stdin       equ 0
stdout      equ 1
stderr      equ 3


section       .data
  errmsg      db  'Error, not enough args!', 0xa
  len         equ $ - errmsg

section       .bss


section      .text
global        _start

_start:
  pop rax

  cmp rax, 3
  jne missing_args


exit:
  mov rax, sys_exit
  mov rbx, 0
  int 0x80


missing_args:
  mov rax, sys_write
  mov rbx, stdout
  mov rcx, errmsg
  mov rdx, len
  int 0x80
  jmp exit
