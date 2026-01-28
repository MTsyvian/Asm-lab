IDEAL
STUDENT_NAME equ "Mikhail Tsyvian"


;---------------------------------------------
; 
; Solution for Chapter 8 Work
;  
; This is personal task - Do not share it with others !!! 
;
;----------------------------------------------- 
 
MODEL small


public  aTom1
public  ZeroToNine2
public  ZeroToNine3
public  Array4 
public  BufferFromEx5
public  BufferToEx5
public  BufferFrom6 
public  BufferTo6
public  BufferTo6Len
public  MyLine7
public  Line7Length
public  MyWords7 
public  MyWords7Length 
public  MyQ8
public  MySum8  
public  MySet9  
public  Count1
public  Count2
public  Count3
public  Num10  
public  BinaryStr10  
public  EndGates11 
public  Gate78 
public  Num12A 
public  Num12B 
public  StrNum13 
public  WordNum13 
public  Num14Word 
public  StrWord14 


public  ShowAxDecimal
public  ex1      
public  ex2      
public  ex3      
public  ex4      
public  ex5      
public  ex6      
public  ex7a     
public  ex7b     
public  ex8      
public  ex9      
public  ex10     
public  ex11     
public  ex12     
public  ex13     
public  ex14c 

stack 256
DATASEG

		;exercise 1
		aTom1 db 13 dup(?), '$'

		;exercise 2
		ZeroToNine2 db 10 dup (?)

		;exercise 3
		ZeroToNine3 db 10 dup (?)
		
		;exercise 4
		Array4 db 100 dup (?)
		
		;exercise 5
		BufferFromEx5 db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
		BufferToEx5 db 10 dup (?)

		;exercise 6
		; Заполняем массив разными числами для теста
		BufferFrom6 db 10, 20, 5, 100, -5, -1, 13, 0, 50, 41
            db 40 dup (0)
		BufferTo6 db 50 dup (?)
		BufferTo6Len db 1 dup (?)
		
		;exercise 7
		MyLine7 db  5, 8, 12, 3, 9, 1, 4, 7, 6, 2, 10, 11, 0Dh
		Line7Length db 1 dup (?)

		;exercise 7b
		MyWords7 dw   1234h, 5555h, 0ABCh, 9999h, 1111h,
  		2222h, 3333h, 4444h, 6666h, 7777h,
  		8888h, 0DDDDh
		MyWords7Length db 1 dup (?)
		
		
		;exercise 8
		MyQ8   db   101, 130,30,201, 120, -3,100,255,0
		MySum8 dw 1 dup (?)
		
		;exercise 9
		MySet9 dw    5, -3, 0, 12, -7, 0, 1, -1, 9, 4, 0, 0FFFFh
		Count1 db 0
		Count2 db 0
		Count3 db 0
		
		;exercise 10
		Num10 db 13
		BinaryStr10 db 9 dup (?)
		
		;exercise 11
		EndGates11 db 0FFh
		Gate78   db 1 dup (?)
		
		True11 db "both 7&8 are 1 ",'$'
		False11 db "at least one of the bits 7,8 is 0",'$'
		
		;exercise 12
		Num12A db 67
		Num12B db 1 dup (?)
		
		
		;exercise 13
		StrNum13   db "38534!"
		StringOfNumsLen = ($ - StrNum13)
		WordNum13  dw 1 dup (?)
		 
		
		;exercise 14
		Num14Word   dw ?
	 
		StrWord14   db ?,?,?,?
		

CODESEG


start:
		mov ax, @data
		mov ds,ax


		 

		

		;call ex1
	 
		;call ex2
	 
		; call ex3
	 
		;call ex4
	 
		;call ex5
	 
		call ex6
		 
	 
		;call ex7a
		
		;call ex7b
		
		;call ex8
		
		;call ShowAxDecimal
	
		
		;call ex9
	 
		;call ex10
	 
		;call ex11
	 
		;call ex12
	 
		;call ex13
	 
	 
		;mov [Num14Word], 0F70Ch  
 		;call ex14c     ; this will call to ex14b and ex14a
	 
		
		
		
		 ; call TTTTTttttttTTT
	 

exit:
		mov ax, 04C00h
		int 21h

		
	 

		
;------------------------------------------------
;------------------------------------------------
;-- End of Main Program ... Start of Procedures 
;------------------------------------------------
;------------------------------------------------




;================================================
; Description -  Move 'a' 'm'  to global var aTom1  
; INPUT: None
; OUTPUT: 
; Register Usage: ; only if value might be changed
;================================================
proc ex1
    push ax 
	push bx
	push cx

	;; TODO HERE SOLUTION for EX 1

    mov cx, 13
    mov si, offset aTom1
    mov al, 'a'

fill_loop:
    mov [si], al
    inc al
    inc si
    loop fill_loop
@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex1





;================================================
; Description: fill ZeroToNine2 with '0' to '9'
; INPUT:  none
; OUTPUT: none
; Register Usage:  cx, si, al
;================================================
proc ex2

    mov cx, 10
    mov si, offset ZeroToNine2 
    mov al, '0'           
FillLoop:
    mov [si], al           
    inc al
    inc si 
    loop FillLoop

    ret
endp ex2





;================================================
; Description: fill ZeroToNine3 with 0 to 9
; INPUT:  none
; OUTPUT: none
; Register Usage:  cx, si, al
;================================================
proc ex3
    mov cx, 10
    mov si, offset ZeroToNine2 
    mov al, 0          
FillLoop:
    mov [si], al           
    inc al
    inc si 
    loop FillLoop

    ret
endp ex3





;================================================
; Description: fill Array4 with 0CCh if index is even or divisible by 7
; INPUT:  none
; OUTPUT: none
; Register Usage:  cx, si, bx, ax, dx
;================================================
proc ex4
    mov cx, 101
    mov si, offset Array4
    mov bx, 7
    
    mainfunc:
        mov cx, 100
        mov si, offset Array4
        xor bx, bx    ; bx = index
        JNZ  writecch

        div7:
            mov ax, si
            xor dx, dx
            div bx
            cmp dx, 0
            je writecch
            JMP next_iter   

        writecch:
            MOV byte ptr [si], 0CCh
        
        next_iter: 
            inc si
            loop mainfunc

    ret
endp ex4





;================================================
; Description: copy from BufferFromEx5 to BufferToEx5
; INPUT:  none
; OUTPUT: none
; Register Usage:  cx, si, di, al
;================================================
proc ex5
	mov cx, 10
	mov si, offset BufferFromEx5
	mov di, offset BufferToEx5

ex5_loop:
	mov al, [si]
	mov [di], al
	inc si
	inc di
	loop ex5_loop

    ret
endp ex5





;================================================
; Description: copy from BufferFrom6 to BufferTo6 only values > 12
; INPUT:  none
; OUTPUT: none
; Register Usage:  cx, si, di, al, bl
;================================================
proc ex6
    mov cx, 10
    mov si, offset BufferFrom6
    mov di, offset BufferTo6
    xor bl, bl

CheckLoop:
    mov al, [si]

    cmp al, 12
    jna SkipCopy 

    mov [di], al 
    inc di
    inc bl

SkipCopy:
    inc si
    loop CheckLoop

    mov [BufferTo6Len], bl  
    
    ret
endp ex6





;================================================
; Description: count length of MyLine7 until 0Dh
; INPUT:  none
; OUTPUT: none
; Register Usage:  si, cx, al
;================================================
proc ex7a
    mov si, MyLine7  
    mov cx, 0 

countline:
    mov al, [si]
    cmp al, 0Dh
    je EndLine7
    inc cx
    inc si
    jmp countline

EndLine7:
    mov Line7Length, cl
    ret
endp ex7a





;================================================
; Description: count length of MyWords7 until 0DDDDh
; INPUT:  none
; OUTPUT: none
; Register Usage:  si, cx, ax
;================================================
proc ex7b
	mov si, MyWords7
    mov cx, 0

CountWords7:
    mov ax, [si]
    cmp ax, 0DDDDh
    je EndWords7
    inc cx
    add si, 2          ; переход к следующему word
    jmp CountWords7

EndWords7:
    mov MyWords7Length, cl

    ret
endp ex7b





;================================================
; Description: sum all elements in MyQ8 greater than 100
; INPUT:  none
; OUTPUT: 2110 in MySum8
; Register Usage:  si, ax, bx
;================================================
proc ex8
    mov si, MyQ8
    xor ax, ax

NextElem:
    mov bl, [si]
    cmp bl, 0
    je Finish

    cmp bl, 100
    jbe Skip
    add ax, bx

Skip:
    inc si
    jmp NextElem

Finish:
    mov ah, 0
    mov MySum8, ax 

    ret
endp ex8





;================================================
; Description: count positive, negative and zero elements in MySet9
; INPUT:  none
; OUTPUT: none
; Register Usage:  si, ax, cx
;================================================
proc ex9
	mov si, offset MySet9
	xor cx, cx
NextElem:
    mov ax, [si]
    cmp ax, 0FFFFh
    je EndCount

    cmp ax, 0
    je isZero
    jg isPositive
    jl isNegative

isPositive:
    inc Count1
    jmp Next

isNegative:
    inc Count2
    jmp Next

isZero:
    inc Count3

Next:
    add si, 2
    jmp NextElem
EndCount:
	ret
endp ex9


 


;================================================
; Description: print binary representation of Num10
; INPUT:  none
; OUTPUT: 00001101B on screen
; Register Usage:  al, di, cx, dl
;================================================
proc ex10
    mov al, Num10
    mov di, BinaryStr10
    mov cx, 8

NextBit:
    shl al, 1
    shr al, 1
    jc BitOne

BitZero:
    mov dl, '0'
    jmp StorePrint

BitOne:
    mov dl, '1'

StorePrint:
    mov [di], dl
    inc di

    mov ah, 02h
    int 21h

    loop NextBit

    mov dl, 'B'
    mov [di], dl

    mov ah, 02h
    int 21h

    ret
endp ex10





;================================================
; Description: check if both bits 7 and 8 of EndGates11 are 1
; INPUT:  none
; OUTPUT: true/false message that was defined in the data seg 
; Register Usage:  ax, dx
;================================================
proc ex11
	mov al, EndGates11
    and al, 0C0h
    cmp al, 0C0h
    je BothAreOne

    mov Gate78, 'F'
    mov dx, False11
    jmp Print

BothAreOne:
    mov Gate78, 'T'
    mov dx, True11

Print:
    mov ah, 09h
    int 21h

    ret
endp ex11





;================================================
; Description: check if Num12A is between 10 and 70 and if so copy it to Num12B
; INPUT:  none
; OUTPUT: none
; Register Usage:  al
;================================================
proc ex12
	mov al, [Num12A]
	cmp al, 10
	jge MoreThan10
	jl endfunc

	MoreThan10:
		cmp al, 70
		jg endfunc
	LessThan70:
		mov [Num12B], al
	endfunc:

    ret
endp ex12





;================================================
; Description: parse string of numbers in StrNum13 and convert to word in WordNum13
; INPUT:  none
; OUTPUT: none
; Register Usage:  si, ax, bx, cx, dx
;================================================
proc ex13
 
    mov si, offset StrNum13
    xor ax, ax
    xor cx, cx

NextChar:
    mov bl, [si]
    inc si

    cmp bl, '!' 
    je EndParse

    cmp bl, ' '
    je NextChar

    cmp bl, '0'
    jb NextChar
    cmp bl, '9'
    ja NextChar

    sub bl, '0'

    mov dx, 10
    mul dx
    add ax, bx
    inc cx
    cmp cx, 5
    je EndParse

    jmp NextChar

EndParse:
    mov [WordNum13], ax

    ret
endp ex13





;================================================
; Description:  convert low byte of Num14Word to hex string in StrWord14 by calling ex14b and ex14a
; INPUT:  al
; OUTPUT: dl
; Register Usage:  al, dl
;================================================
proc ex14a
	and al, 0Fh 
    cmp al, 9
    jbe IsDigit
    add al, 'A' - 10
    jmp Store
IsDigit:
    add al, '0'
Store:
    mov dl, al
    ret

    ret
endp ex14a





;================================================
; Description:  convert high and low nibbles of Num14Word to hex string in StrWord14 by calling ex14a twice
; INPUT:  num14word 
; OUTPUT: strword14
; Register Usage:  ax, dh, dl
;================================================
proc ex14b
	push ax

    mov ah, al

    shr al, 4
    call ex14a
    mov dh, dl

    mov al, ah
    call ex14a

    pop ax
    ret

    ret
endp ex14b





;================================================
; Description:  convert Num14Word to hex string in StrWord14 by calling ex14b twice
; INPUT:  strword14, num14word
; OUTPUT: none
; Register Usage:  si, ax, dh, dl
;================================================
proc ex14c
	mov si, offset StrWord14

    mov ax, Num14Word

    mov al, ah 
    call ex14b
    mov [si], dh
    mov [si+1], dl

    mov al, al
    call ex14b
    mov [si+2], dh
    mov [si+3], dl

    ret

    ret
endp ex14c







;================================================
; Description: print bytes to the screen ax times
; INPUT: bx = pointer to the bytes , ax = how many bytes
; OUTPUT: screen
; Register Usage:  ax ,bx 
;================================================
proc printBytesAXTimes
	push cx
	push dx
	
	mov cx,ax
@@ag:
	mov dl, [bx]
	mov ah,2
	int 21h
	inc bx
	loop @@ag
	
	pop dx
	pop cx
	ret
endp printBytesAXTimes





; guess what this proc does ?
; without good names and lack of description, 
; no comments .... it is very difficult
;================================================
; Description -  print hex value of ax on screen
; INPUT: ax
; OUTPUT: hex value of ax
; Register Usage: bx, cx, dx
;================================================
proc TTTTTttttttTTT
	
	mov bx,ax
	mov cx,4
CHChchchchc:
	
	mov dx,0f000h
	and dx,bx
	rol dx, 4          
	cmp dl, 9
	ja PPPFFFFpppfffff
	add dl, 48
	jmp ZzzzZzzZZZZ

PPPFFFFpppfffff:	 
	add dl, '7'

ZzzzZzzZZZZ:
	mov ah, 2
	int 33
	shl bx,4
	loop CHChchchchc
	
	ret
endp TTTTTttttttTTT





;================================================
; Description - Write on screen the value of ax (decimal)
;               the practice :  
;				Divide AX by 10 and put the Mod on stack 
;               Repeat Until AX smaller than 10 then print AX (MSB) 
;           	then pop from the stack all what we kept there and show it. 
; INPUT: AX
; OUTPUT: Screen 
; Register Usage:   
;================================================
proc ShowAxDecimal
	push ax
	push bx
	push cx
	push dx

	; check if negative
	test ax,08000h
	jz PositiveAx
		
	;  put '-' on the screen
	push ax
	mov dl,'-'
	mov ah,2
	int 21h
	pop ax

	neg ax ; make it positive
PositiveAx:
	mov cx,0   ; will count how many time we did push 
	mov bx,10  ; the divider

put_mode_to_stack:
	xor dx,dx
	div bx
	add dl,30h
	; dl is the current LSB digit 
	; we cant push only dl so we push all dx
	push dx    
	inc cx
	cmp ax,9   ; check if it is the last time to div
	jg put_mode_to_stack

	cmp ax,0
	jz pop_next  ; jump if ax was totally 0
	add al,30h  
	mov dl, al    
	mov ah, 2h
	int 21h        ; show first digit MSB
	   
pop_next: 
	pop ax    ; remove all rest LIFO (reverse) (MSB to LSB)
	mov dl, al
	mov ah, 2h
	int 21h        ; show all rest digits
	loop pop_next

	mov dl, ','
	mov ah, 2h
	int 21h

	pop dx
	pop cx
	pop bx
	pop ax

	ret
endp ShowAxDecimal

END start
 