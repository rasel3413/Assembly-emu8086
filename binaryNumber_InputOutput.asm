INCLUDE 'EMU8086.INC'
.model small
.stack 100h
.data 
  en db 13,10,"enter a number: ",'$' 
  a db ?
  b db ? 
  ct db 0
  output db 13,10,"Output:",'$'   
  newline db 13,10,'$'
.code
main proc
    mov ax,@data
    mov ds,ax  
    
     mov bx,0
    for:  
    
    mov ah,1
    int 21h 
    cmp al,0dh
    je end
    sub al,48 
    shl bx,1
    or bl,al
    inc ct
    
    
    jmp for
    
     end:  
     printn
     
     mov cl,16
     sub cl,ct
     rcl bx,cl
     mov cx,0
     mov cl,ct
     mov ah,2
     for2:
        
        rol bx,1
        jc output_one
        mov dl,'0'
        int 21h 
        jmp last
        
        output_one:
        mov dl,'1'
        int 21h
        last:
     loop for2
    
    
    

end main
               
               
               