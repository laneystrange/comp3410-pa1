.macro print_str
li   $v0, 4       # specify Print String service
syscall           # print the string
.end_macro

.macro print_int
li $v0, 1
syscall
.end_macro

.macro read_int
li $v0, 5
syscall
.end_macro

.macro exit
li   $v0, 10          # system call for exit
syscall
.end_macro