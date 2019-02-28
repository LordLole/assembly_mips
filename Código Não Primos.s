# Programador: Felipe Couto
# Data: 03/11/2018

.data
	msg1: .asciiz "Digite o numero inicial: "
	msg2: .asciiz "\nDigite o numero final: "
	msg3: .asciiz "\nOs numeros não primos entre "
	msg4: .asciiz "e "
	msg5: .asciiz "são: "
	msg6: .asciiz "O segundo numero tem que ser maior que o primeiro"
.text
main:

#----------inicio do recebimento dos numeros----------

	li $v0, 4      			#cod de msg de texto 
	la $a0, msg1   			#atribuindo a msg q sera exibida
	syscall
	
	li $v0, 5				#cod de numero int
	add $t1, $a0, 0			#atribuindo valor do teclado em $t1
	syscall
	
	
	li $v0, 4				#cod de msg de texto
	la $a0, msg2			#atribuindo a msg q sera exibida
	syscall
	
	li $v0, 5				#cod de numero int
	add $t2, $a0, 0			#atribuindo valor do teclado em $t2
	syscall

#----------fim do recebimento de numeros----------	
	
	bge $t1, $t2, erro		#numero 2 tem que ser maior se n erro
	
	add $t6, $t1, 0			#atribuindo $t1 a $t6
	
	enquanto1:				#label do primeiro laço
	
	bgt $t6, $t2, fim	 	#quebrando o laço maior
	add $t6, $t6, 1			#contador inicial 
	add $t3, $zero, 0		#tranformando $t3 em zero pra iniciar cont
	
	enquanto2:				#label do segundo laço
	
	bgt $t3, $t6, laco1		#quebrando o laço menor
	add $t3, $t3, 1			#segundo contador

	rem $t4, $t1, $t3		#$t4 recebe resto da divisão
	
	beq $t4, 0, cont		#decisao se o resto for zero
	j enquanto2				
	
	cont:					#label do contador
	add $t5, $t5, 1			#contador dos primos
	j enquanto2
		
	laco1:
	bne $t5, 2, print		#se cont for diferente a 2 entao e primo pula pra mostrar
	j enquanto1
	
#----------Inicio do exibimento final-----------
	
	print:
	
	li $v0, 4      			#cod de exibir msg de texto		
	la $a0, msg3			#atribuindo a msg q sera exibida
	syscall
	
	li $v0, 1				#cod de exibir numero
	add $a0, $t1, 0			#atribuindo pra mostrar o primeiro num
	syscall
	
	li $v0, 4				#cod de msg exibir de texto
	la $a0, ms4				#atribuindo a msg q sera exibida
	syscall

	li $v0, 1				#cod de exibir numero
	add $a0, $t2, 0			#atribuindo pra mostrar o segundo num
	syscall
	
	li $v0, 4				#cod de exibir msg de texto
	la $a0, msg5			#atribuindo a msg q sera exibida
	syscall
	
	#li $v0, 1				#cod de exibir numero
	#add $a0, $t6, 0		#atribuindo pra mostrar os n primos
	#syscall
	
	bgt $t3, $t6, enquanto1	#se e maior dps de printar finaliza				
	
#-----------Fim do exibimento final-----------	
	
	j fim
	erro:					#label para a mensagem de errro
	
	li $v0, 4			
	la $a0, msg6
	syscall
	
	fim:
