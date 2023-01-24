 ; Program for factorial  plz consider n between 1 to 9
.stack 100h
.data 
   
  newline db 13,10,'$'
.code 
      
 

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
   
   
   mov ah,1
   int 21h
   mov cl,al
   xor ch,ch
   sub cx,30h  
   xor ax,ax
   mov ax,1
 start:  
 mul cx
 dec cx
 jnz start
 
 push ax
 
 mov ah,9
 lea dx ,newline
 int 21h
 pop ax
 
 
 
   call outdec
   
   
  
    mov ah,4ch
    int 21h
main endp
 end main
               
               
               