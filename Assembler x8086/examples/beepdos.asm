	.model tiny
	.8086

	.data
	
	.code
	org 100h
	.startup
	
	mov ah, 02h		; Character output
	mov dl, 07h		; Bell code
	int 21h

	.exit
end