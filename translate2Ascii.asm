; Angelina Loayza                                                                                                                        
; CMSC 313 HW 11 - MonWed @ 2:30                                                                                                         

section .data
inputBuf        db      0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A ; stores raw bytes as inputBuf                                           
hexDigits db '0123456789ABCDEF'                                 ; table for hex digits                                                   

section .bss
outputBuf       resb 80         ;reserves 80 bytes for the output                                                                        

section .text
global _start

_start:
        mov esi, inputBuf       ; esi points to inputBuf                                                                                 
        mov edi, outputBuf      ; edi points to outputBuf                                                                                
        mov ecx, 8              ; num of bytes in inputBuf                                                                               

translate_loop:                 ; loops through each byte and increments esi, converts it to ASCII, then stores it in outputBuf          
        lodsb
        mov ah, al
        ; Convert high bits to ASCII                                                                                                     
        shr al, 4
        movzx ebx, al
        mov al, [hexDigits + ebx] ; Convert to ASCII                                                                                     
        stosb

        ; Convert low bits to ASCII                                                                                                      
        mov al, ah
        and al, 0x0F
        movzx ebx, al
        mov al, [hexDigits + ebx] ; Convert to ASCII                                                                                     
        stosb

        mov al, ' '
        stosb

        loop translate_loop

    ; Add newline                                                                                                                        
        mov al, 0x0A
        stosb

    ; Calculate output length of string in edx                                                                                           
        mov edx, edi
        sub edx, outputBuf

    ; Write to stdout                                                                                                                    
        mov eax, 4
        mov ebx, 1
        mov ecx, outputBuf
        int 0x80

    ; Exit                                                                                                                               
        mov eax, 1
        xor ebx, ebx
        int 0x80
