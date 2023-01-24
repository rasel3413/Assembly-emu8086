
.stack 100h
.data 
   
  newline db 13,10,'$'
.code 
      
      
INDEC proc
    ;read a number in range -32768 to 32767
    ;input:n
    push bx     ;save registers used
    push cx 
    push dx 
;print prompt 
@begin:
    mov ah,2
    mov dl,'?'
    int 21h    ;print '?'
    
    
    xor bx,bx     ;bx holds total
    xor cx,cx     ;cx holds sign negative or psoitive
    
 ;read a character
    mov ah,1
    int 21h
    
 ;case character of 
    cmp al,'-'
    je @minus
    cmp al,'+'
    je @plus
    jmp @repeat2
  @minus:
    mov cx,1    ;negative true
  @plus:
    int 21h     ;read a character
  @repeat2:
    cmp al,'0'
    jnge @not_digit     ;not greater than or eqaul
    cmp al,'9'
    jnle @not_digit    ;not less than equal 9  
    
 ;then convert character to a digit
    and ax,000fh  ;convert to digit
    push ax       ;save on stack
 ;total= total x 10 +digit
    mov ax,10
    mul bx            ;ax=total x 10
    pop bx
    add bx,ax         ;total= total x 10 + digit
    
    
  ;read a character 
    mov ah,1
    int 21h
    cmp al,0dh
    jne @repeat2
    
    
    mov ax,bx        ;store the number in ax
    
    or cx,cx        ;negative number
    
    je @exit
    
    neg ax
    
  @exit:
    pop dx
    pop cx
    pop bx
    ret
    
  @not_digit:
    mov ah,2
    mov dl,0dh
    int 21h
    jmp @begin
INDEC endp  

outdec proc 
    
    push ax
    push bx
    push cx
    push dx
    
    or ax,ax
    jge endif
    push ax
    mov dl,'-'
    mov ah,2
    int 21h
    
    pop ax
    neg ax
    
    endif:
    xor cx,cx
    mov bx,10D
    
    repeat1:
    xor dx,dx
    div bx
    push dx
    inc cx
    
    or ax,ax
    jne repeat1
    
    mov ah,2
    
    loop1:
    pop dx
    or dl,30h
    int 21h
    
    loop loop1
    
    pop dx
    pop cx
    pop bx
    pop ax
    RET
    
    outdec endp

main proc  
    mov ax,@data
    mov  ds,ax
   call INDEC 
   push ax 
   mov ah,9
   lea dx,newline
   int 21h  
   pop ax
   call outdec
   
   
  
    mov ah,4ch
    int 21h
main endp
 end main
               
               
               