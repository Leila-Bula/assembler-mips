.data                  # Seccion para declarar variables
num1: .word 0  #Declaramos la variable num1 e inicializamos en 0
num2: .word 1  #Declaramos la variable num2 e inicializamos en 1
msg1: .asciiz "Ingrese el numero de terminos n de la serie: \n" #Declara la variable msg1 y la inicializa
msg2: .asciiz "\n" #Declara la variable msg2 y la inicializa
msg3: .asciiz "Los terminos son: \n" #Declara la variable msg3 y la inicializa
.text                #Seccion de codigo
main:
    #Imprimir mensaje a usuario para que ingrese el numero n de terminos de la serie
    li $v0, 4        #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg1     #Carga la direccion de la cadena en $a0
    syscall          #Llamada al sistema
 
    li $v0, 5        #Carga el código de la llamada al sistema para leer entero
    syscall          #Llamada al sistema
    
    move $t1, $v0    #Guardamos el numero en el registro t1
    lw $t2, num1     #Cargamos el valor en num1 al registro t2
    lw $t3, num2     #Cargamos el valor en num2 al registro t3
    #Tomemos en cuenta los siguientes usos de los registros
    # t0 contador
    # t1 n
    # t2 num1
    # t3 num2
    # t4 termino
    li $t0, 2        #Carga en el registro t0 el valor de 2, es decir inicializamos el contador en 2
    
    #Imprimimos el primer termino
    li $v0, 4        #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg3     #Carga la direccion de la cadena en $a0
    syscall          #Llamada al sistema
    move $a0, $t3    #Carga el primer número de la sucecion en $a0
    li $v0, 1        #Carga el código de la llamada al sistema para imprimir un entero
    syscall          #Llamada al sistema
    li $v0, 4        #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg2     #Carga la direccion de la cadena en $a0
    syscall          #Llamada al sistema 
ciclo: #Label que marca el inicio del ciclo
    #Verificacion de la condicion del ciclo
    bgt $t0, $t1, fin_ciclo #Si el contador es mayor a n, salta al final del ciclo
    #contenido del ciclo
    
    #Calcula el siguiente termino de la sucesion
    add $t4, $t2, $t3       #Suma el num1 y el num2 (ultimos 2 terminos) y lo carga en t4
    
    #Imprime el nuevo termino calculado
    move $a0, $t4           #Carga el termino en $a0
    li $v0, 1               #Carga el código de la llamada al sistema para imprimir un entero
    syscall          	    #Llamada al sistema
    li $v0, 4               #Codigo de servicio 4 para imprimir una cadena
    la $a0, msg2            #Carga la direccion de la cadena en $a0
    syscall          	    #Llamada al sistema 
    move $t2, $t3	    #Carca num2 en num1 (para actualizar a los ultimos dos terminos)
    move $t3, $t4	    #Carge el nuevo termino en t3 (nuevo num2
    add $t0, $t0, 1         #Aumenta el contador en 1, suma el valor del contador mas 1, y lo guarda en t0
    j ciclo		    #Salta al inicio del ciclo
fin_ciclo: #Label que indica la finalizacion del ciclo
    # Terminar el programa
    li $v0, 10              # Cargar el código de la llamada al sistema para salir del programa
    syscall                 # Llamar al sistema para salir
