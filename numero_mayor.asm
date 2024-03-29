.data                  # Seccion para declarar variables
msg1: .asciiz "Ingrese el numero 1: \n" #Declara la variable msg1 y la inicializa
msg2: .asciiz "Ingrese el numero 2: \n" #Declara la variable msg2 y la inicializa
msg3: .asciiz "Ingrese el numero 3: \n" #Declara la variable msg3 y la inicializa
msg4: .asciiz "El numero mayor es " #Declara la variable msg4 y la inicializa
.text                  # Seccion de codigo
main:
    #Imprimir mensaje a usuario para que ingrese el numero 1
    li $v0, 4         #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg1      #Carga la direccion de la cadena en $a0
    syscall           #Llamada al sistema
    #Leer numero a ingresar por consola
    li $v0, 5         #Cargar el código de la llamada al sistema para leer entero
    syscall           #Llamada al sistema
    
    move $t1, $v0     #Guardamos el numero en el registro t1
    
    #Imprimir mensaje a usuario para que ingrese el numero 2
    li $v0, 4         #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg2      #Carga la direccion de la cadena en $a0
    syscall           #Llamada al sistema
    #Leer numero a ingresar por consola
    li $v0, 5         #Cargar el código de la llamada al sistema para leer entero
    syscall           #Llamada al sistema
    
    move $t2, $v0     #Guardamos el numero en el registro t2
    
    #Imprimir mensaje a usuario para que ingrese el numero 3
    li $v0, 4         #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg3      #Carga la direccion de la cadena en $a0
    syscall           #Llamada al sistema
    #Leer numero a ingresar por consola
    li $v0, 5         # Cargar el código de la llamada al sistema para leer entero
    syscall           # llamada al sistema
    
    move $t3, $v0     #Guardamos el numero en el registro t3
    
    #Comparamos numeros 1 y 2
    bge $t1, $t2, mayor  #Si el numero 1 es mayor que el numero 2, salta al label mayor
    move $t4, $t2        #Sino (numero 2 mayor) guarda el numero 2 en t4
    j parte2 	         #Salta al label parte2
    
mayor: #Parte del codigo que se ejecuta si numero 1 es mayor que el numero 2
    move $t4, $t1        #Carga el numero 1 en t4

parte2: #Parte del codigo que sigue al primer condicional
    #Comparamos el numero mayor (de entre los numeros 1 y 2) con el numero 3
    bge $t4,$t3,final    #Si el numero en t4 es mayor que el numero 3, salta al label final
    move $t4, $t3	 #Sino (numero 3 es mayor) guarda el numero 3 en t4
    j final              #Salta al label final
final: #Parte final del codigo
    #Imprimimos el numero mayor calculado
    li $v0, 4            #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg4         #Carga la direccion de la cadena en $a0
    syscall 
    
    move $a0, $t4        #Carga el número mayor en $a0
    li $v0, 1            #Cargar el código de la llamada al sistema para imprimir un entero
    syscall              #Llamada al sistema
    
    # Terminar el programa
    li $v0, 10           #Carga el código de la llamada al sistema para salir del programa
    syscall              #Llamada al sistema para salir
