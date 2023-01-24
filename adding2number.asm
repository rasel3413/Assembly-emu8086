.model small
.stack 100h
.data 
  en db 13,10,"enter a number: ",'$' 
  a db ?
  b db ? 
  output db 13,10,"Output:",'$'
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,en
    int 21h
    
    mov ah,1
    int 21h
    mov a,al
    sub a,48
    
    mov ah,9
    lea dx,en
    int 21h
    
    mov ah,1
    int 21h
    mov b,al
    sub b,48 
    
    
    mov bh,a
    add bh,b
    add bh,48
            
    mov ah,9
    lea dx,output
    int 21h
    
    mov ah,2 
    mov dl,bh
    int 21h
     
    mov ah,4ch
    int 21h
    main endp

end main
               
               
               