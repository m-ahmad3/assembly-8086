.model small
.data
.code  

mov ax, @Data
mov ds, ax

mov ax,0xcd1fh
mov ds,ax
mov bp, 0x0003h
mov ss, ax

hlt


mov word ptr [bx+0],0x1F00h      
mov word ptr [bx+2],0xA0B1h
mov word ptr [bx+4],0x1254h
mov word ptr [bx+6],0x34EFh
mov word ptr [bx+8],0x8700h    

mov ax, [bx+0]
add ax, [bx+2]
add ax, [bx+4]
add ax, [bx+6]
add ax, [bx+8]

mov ss:[bp], ax

.exit