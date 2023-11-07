// Funciones o SubAlgoritmo  del proyecto
// SubAlgoritmo menus del proyecto
Funcion opcion=presentarMenu(titulo,menu,lim)
	Definir opcion Como Caracter
	Definir pos Como Entero
	Borrar Pantalla
	Escribir titulo
	Para pos=0 Hasta lim-1 Con Paso 1 Hacer
		Escribir menu[pos]
	Fin Para
	Escribir "       Elija opción[1..",lim,"]" Sin Saltar
	leer opcion
	
FinFuncion
//	1) Determinar cuánto se debe pagar por cierta cantidad de colas, considerando que si son más
//		de 23 colas, el costo por unidad es de $0,50 caso contrario el precio será 20% mas.
//	Al costo resultante calcular el 12% del iva. Se pide presentar: cantidad comprada, el costo ´por
//		unidad, el total sin iva el iva y el total a pagar.

Funcion subtotal=subtotal_cola(cant)
	Definir costo, subtotal Como Real
	costo=0.5;subtotal=0
	Si cant<=23 Entonces
		costo=0.5+(0.5*0.20)
	FinSi
	subtotal=costo*cant
FinFuncion

Funcion factura_cola
	//Entrada:
	Definir cant como entero 
	Definir costo,total, subtotal Como Real
	cant=0;total=0;subtotal=0
	Escribir "                  ","***FACTURA SOBRE LA COMPRA DE COLA***"
	Escribir "Ingresa la cantidad de cola a comprar:"
	leer cant
	Escribir "La cantidad comprada es: ", cant
	Escribir "El costo por unidad es: ", subtotal_cola(cant)/cant
	subtotal=subtotal_cola(cant)
	Escribir "Subtotal: $", subtotal
	total=subtotal+(subtotal*0.12)
	Escribir "El total a pagar es: $", total
FinFuncion
//2) La asociación de vinicultores tiene como política fijar un precio inicial al kilo
//de uva, la cual se clasifica en tipos A y B, y además en tamaños 1 y 2.
//Cuando se realiza la venta del producto, ésta es de un solo tipo y tamaño, se
//requiere determinar cuánto recibirá un productor por la uva que entrega en un
//embarque, considerando lo siguiente:Si es de tipo A, se le cargan 20 al precio
//	inicial cuando es de tamaño 1; y 30 si es de tamaño 2. Si es de tipo B, se rebajan
//	30 cuando es de tamaño 1, y 50 cuando es de tamaño 2.
//	Realice un algoritmo para determinar la ganancia obtenida
Funcion ganancia=proceso_asociacion_vinicultores(costo,kilo,tipo,tamano)
	Definir ganancia Como Real
	ganancia=0
	si tipo="a" entonces 
		si tamano=1 Entonces
			ganancia=(costo+20)*kilo
		sino 
			si tamano=2 Entonces
				ganancia=(costo+30)*kilo
			FinSi
		Finsi 
	sino
		si tipo="b" entonces 
			Si tamano=1 Entonces
				ganancia=(costo-30)*kilo
			SiNo
				si tamano=2 Entonces
					ganancia=(costo-50)*kilo
				FinSi
			FinSi
		finsi
	finsi
FinFuncion
Funcion asociacion_vinicultores
	//Entrada:
	Definir kilo, costo Como Real
	Definir tipo Como Caracter
	Definir tamano Como Entero
	kilo=0;costo=105;tipo=""
	tamano=0
	Escribir "        ","ASOCIACIÓN DE VINICULTORES-GANANCIA POR EL KILO DE UVA"
	Escribir "Precio por kilo: $",costo
	Escribir "Ingrese el kilo de uva: "
	leer kilo
	Escribir "¿Es tipo A o tipo B?"
	leer tipo
	Escribir "¿Es tamaño 1 o 2?"
	leer tamano
	tipo=Minusculas(tipo)
	Escribir "La ganancia obtenida es: ", proceso_asociacion_vinicultores(costo,kilo,tipo,tamano)
FinFuncion
//3) Dado dos números obtener el residuo sin el operador mod, %
Funcion modulo=proceso_modulo(dividendo, divisor)
	//Entrada:
	definir modulo, division Como Real
	definir div Como Entero
	modulo=0
	division=dividendo/divisor
	div=trunc(dividendo/divisor)
	modulo=(division-div)*divisor
	
FinFuncion
Funcion modulo_principal
	//Entrada:
	Definir dividendo,divisor Como Real
	dividendo=0;divisor=0
	Escribir "                    ","***RESIUO DE UNA DIVISIÓN***"
	Escribir "Ingrese el dividendo:"
	leer dividendo
	Escribir "Ingrese el divisor:"
	leer divisor 
	Escribir "El módulo es: ",proceso_modulo(dividendo, divisor)
FinFuncion
//4) El consultorio del Dr. Paez tiene como política cobrar la consulta con
//base en el número de cita, de la siguiente forma:
//	Las tres primeras citas a $200.00 c/u.
//	Las siguientes dos citas a $150.00 c/u.
//	Las tres siguientes citas a $100.00 c/u.
//	Las restantes a $50.00 c/u, mientras dure el tratamiento.
//	Se requiere un algoritmo para determinar:
//	Cuánto pagará el paciente por la cita.
//	El monto de lo que ha pagado el paciente por el tratamiento.
//	Para la solución de este problema se requiere saber qué número de cita se efectuará, con el
//	cual se podrá determinar el costo que tendrá la consulta y cuánto se ha gastado en el
//	tratamiento.
Funcion proceso_consultorio(numcita)
	//Entrada:
	definir precio, total Como Real
	precio=0;total=0
	si numcita>=1 y numcita<=3 Entonces
		precio=200
		total=precio*numcita
	SiNo
		si numcita<=5
			precio=150
			total=(numcita-3)*precio+600
		sino 
			si numcita<=8
				precio=100
				total=(numcita-5)*precio+900
			sino 
				precio=50
				total=(numcita-8)*precio+1200
			FinSi
		FinSi
	FinSi
	Escribir "El precio de cada cita: $", precio
	Escribir "El precio total del tratamiento es: $",total
FinFuncion
Funcion consultorio
	//Entrada:
	Definir numcita Como Entero
	numcita=0; 
	Escribir "                      ","***CONSULTORIO DEL DR. PAEZ***"
	Escribir "Ingrese el número de cita:"
	leer numcita
	proceso_consultorio(numcita)
FinFuncion
//5)Escribir un algoritmo que lea cuatro números y determine si el numero 1
//es la mitad del número 2; Y si el numero 3 es divisor del numero4.
Funcion proceso_mitad_numero(n1,n2,n3,n4)
	Si (n2/2)=n1 Entonces
		Escribir "El número ",n1," es la midad de ", n2
	Sino
		Escribir "El número ",n1," no es la midad de ", n2
	FinSi
	si n4 mod n3=0 Entonces
		Escribir "El número ",n3," es divisor de ", n4
	Sino 
		Escribir "El número ",n3," no es divisor ", n4
	FinSi
FinFuncion
Funcion mitad_de_numero
	//Entrada:
	Definir num1,num2,num3,num4 Como Entero
	num1=0;num2=0;num3=0;num4=0
	Escribir "                      ","***MITAD Y DIVISOR DE UN NÚMERO***"
	Escribir "Ingrese el primer número: "
	leer num1
	Escribir "Ingrese el segundo número: "
	leer num2
	Escribir "Ingrese el tercer número: "
	leer num3
	Escribir "Ingrese el cuarto número: "
	leer num4
	proceso_mitad_numero(num1,num2,num3,num4)
FinFuncion
//6) El banco XYZ ha decidido aumentar el límite de crédito de las tarjetas de crédito
//de sus clientes, para esto considera que:
//Si su cliente tiene tarjeta tipo 1, el aumento será del 25%.
//Si tiene tipo 2 el aumento será del 35%
//Si tiene tipo 3, el aumento será del 40%
//Para cualquier otro tipo será del 50%
//Se pide realizar un algoritmo que ayude al banco a determinar el nuevo límite de crédito que tendrá una persona en su tarjeta considerando que después
//del aumento de porcentaje se tendrá que subir $20 adicionales a todas las tarjetas
Funcion nuevo_limite=proceso_nuevo_limite(tipo,limite)
	Definir aumento, nuevo_limite Como Real
	aumento=0;nuevo_limite=0
	//Proceso:
	segun tipo Hacer
		1: 
			aumento=0.25
		2:
			aumento=0.35
		3:
			aumento=0.40
		De Otro Modo:
			aumento=0.50
	FinSegun
	nuevo_limite=limite+(limite*aumento)
	nuevo_limite=nuevo_limite+20
FinFuncion
Funcion banco_xyz
	//Entrada:
	Definir limite Como Real
	Definir tipo Como Entero
	tipo=0;limite=0
	Escribir "           ","***BANCO XYZ-AUMENTO EN EL LÍMITE DE TARJETA***"
	Escribir "Ingrese su límite de dinero actual: "
	leer limite
	Escribir "Ingrese el tipo de tarjeta que posee(1,2,3..): "
	leer tipo
	Escribir "El nuevo límite de la tarjeta es: ", proceso_nuevo_limite(tipo,limite)
FinFuncion

//7)Escribir un algoritmo que lea cuatro números y determine si el numero 1 es divisor del
//		numero3 Y si el numero 2 es el doble del numero4.

Funcion proceso_divisible_doble(n1,n2,n3,n4)
	//Proceso:
	si n3 mod n1=0 Entonces
		Escribir "El número ",n1," es divisor a ", n3
	Sino 
		Escribir "El número ",n1," no es divisor a ", n3
	FinSi
	Si (n2/2)=n4 Entonces
		Escribir "El número ",n2," es el doble de ", n4
	Sino
		Escribir "El número ",n2," no es el doble de ", n4
	FinSi
	
FinFuncion
Funcion divisible_doble
	//Entrada:
	Definir num1,num2,num3,num4 Como Entero
	num1=0;num2=0;num3=0;num4=0
	Escribir "                    ","***DIVISOR Y DOBLE DE UN NÚMERO***"
	Escribir "Ingrese el primer número: "
	leer num1
	Escribir "Ingrese el segundo número: "
	leer num2
	Escribir "Ingrese el tercer número: "
	leer num3
	Escribir "Ingrese el cuarto número: "
	leer num4
	proceso_divisible_doble(num1,num2,num3,num4)
FinFuncion
//8) El banco POO ha decidido aumentar el límite de crédito de las tarjetas de crédito
//de sus clientes, para esto considera que:
//Si su cliente tiene tarjeta tipo 1, el aumento será del $100 .
//Si tiene tipo 2 el aumento será del $200
//Si tiene tipo 3, el aumento será del $300
//Para cualquier otro tipo será del 500
//Realizar un algoritmo que ayude al banco a determinar el nuevo límite
//de crédito que tendrá una persona en su tarjeta considerando que
//después del aumento se tendrá que subir 10% adicionales a todas las tarjetas
Funcion nuevo_limite=proceso_nuevo_limite_2(tipo,limite)
	Definir nuevo_limite, aumento Como Real
	nuevo_limite=0;aumento=0
	//Proceso:
	Segun tipo Hacer
		1: 
			aumento=100
		2:
			aumento=200
		3:
			aumento=300
		De otro modo: 
			aumento=500
	FinSegun
	nuevo_limite=limite+aumento
	nuevo_limite=nuevo_limite+(nuevo_limite*0.10)
FinFuncion
Funcion nuevo_limite_2
	Definir limite Como Real
	Definir tipo Como Entero
	limite=0;tipo=0
	Escribir "           ","***BANCO POO-AUMENTO EN EL LÍMITE DE TARJETA***"
	Escribir "Ingrese la cantidad límite de su tarjeta: "
	leer limite
	Escribir "Ingrese el tipo de tarjeta que posee (1,2,3...): "
	leer tipo
	Escribir "El nuevo límite de su tarjeta es: ", proceso_nuevo_limite_2(tipo,limite)
FinFuncion
//9) Pedir al usuario un número y mostrar si es negativo menor que -20, sino mostrar si es
//positivo par o impar múltiplo de 7.
Función proceso_negativo_positivo(n)
//Proceso:
Si n<0  Entonces
	si n<-20 entonces 
		escribir n, " es un número negativo menor que -20"
	sino 
		Escribir n," es un número negativo, pero no es menor que -20"
	fin si
finsi

si n>0 y n mod 2=0 entonces 
	escribir n," es un número positivo par"
finsi 
si  n>0 y (n mod 2<>0) y (n mod 7=0) Entonces
	escribir n," es un número impar multiplo de 7"
FinSi
FinFuncion
Funcion numero_negativo_positivo
	//Entrada:
	Definir num Como Entero
	num=0
	Escribir "              ","***NÚMERO NEGATIVO O MULTIPLO DE 7***"
	Escribir "Ingrese un numero: "
	leer num
	proceso_negativo_positivo(num)
FinFuncion
//10) La asociación de vinicultores tiene como política fijar un precio inicial al quintal de
//pitajaya, la cual se clasifica en tipos "Amarilla" y "Colorada", y además en tamaños 1 y 2.
//Cuando se realiza la venta del producto, ésta es de un solo tipo y tamaño, se requiere
//determinar cuánto recibirá un productor por la pitajaya que entrega en un embarque,
//considerando lo siguiente:
//	- Si es de tipo Amarilla, se le cargan $10 al precio inicial cuando es de tamaño 1; y 15% mas $5
//	si es de tamaño 2
//	- Si es de tipo Colorada, se rebajan $20 cuando es de tamaño 1, y 20% cuando es de tamaño
//	2. Sea tipo Amarilla y Colorada se debe se aplicar un descuento del 5% y el 12% del IVA.
//	Realice un algoritmo para determinar el precio de embarque

Funcion precio_final=proceso_asociacion_vinicultores_2(costo,quintal,tipo,tamaño)
	definir precio, descuento, precio_final Como Real
	precio=0;descuento=0;precio_final=0
	//Proceso:
	si tipo="amarilla" Entonces
		si tamaño=1 Entonces
			precio=(costo+10)*quintal
		SiNo
			si tamaño=2 Entonces
				precio=((costo+costo*0.15)+5)*quintal
			FinSi
		FinSi
	SiNo
		si tipo="colorada" Entonces
			si tamaño=1 Entonces
				precio=(costo-20)*quintal
			SiNo
				si tamaño=2 Entonces
					precio=(costo-costo*0.20)*quintal
				FinSi
			FinSi
		FinSi
	finsi
	descuento=precio-precio*0.05 
	precio_final=descuento+descuento*0.12
FinFuncion
Funcion asociacion_vinicultores_2
	//Entrada:
	Definir quintal, costo Como Real
	Definir tipo Como Caracter
	Definir tamaño como entero 
	quintal=0;costo=100;tipo="";tamaño=0
	Escribir "        ","ASOCIACIÓN DE VINICULTORES-GANANCIA POR EL KILO DE PITAJAYA"
	Escribir "Ingrese los quintales de pitajaya: "
	leer quintal
	Escribir "¿Es tipo Amarilla o Colorada?"
	leer tipo
	Escribir "¿Es tamaño 1 o 2?"
	leer tamaño
	tipo=Minusculas(tipo)
	Escribir "El precio del embarque es: ",proceso_asociacion_vinicultores_2(costo,quintal,tipo,tamaño)
FinFuncion
//11) Pedir al usuario un número y mostrar si es par menor que 10, sino mostrar si es negativo e
//impar o negativo divisible para 5.
Funcion proceso_numer_par_negativo(num)
	//Proceso:
	si num>=0 Entonces
		Si num mod 2=0 y  num<10 entonces 
			Escribir num," es un número par menor que 10"
		sino 
			Escribir num, " no es menor que 10 o no es par"
		FinSi
	FinSi
	si num<0 y num mod 2<>0 Entonces
		escribir num, " es un número negativo impar"
	FinSi
	si num<0 y num mod 5=0 Entonces
		escribir num," es un número negativo divisible para 5"
	FinSi
FinFuncion
Funcion numero_par_negativo
	//Entrada:
	Definir num Como Entero
	num=0
	Escribir "                ","***NÚMERO PAR, NEGATIVO IMPAR Y DIVISBLE PARA 5***"
	Escribir "Ingrese un número: "
	leer num
	proceso_numer_par_negativo(num)
FinFuncion
//12) Fábricas "El cometa" produce artículos con claves (1, 2, 3, 4, 5 y 6). Se requiere un
//algoritmo para calcular los precios de venta, para esto hay que considerar lo siguiente:
//Costo de producción = materia prima + mano de obra + gastos de fabricación.
//Precio de venta = costo de producción + 45 % de costo de producción.
//El costo de la mano de obra se obtiene de la siguiente forma: para los productos con clave 3 o
//4 se carga 75 % del costo de la materia prima; para los que tienen clave 1 o 5 se carga 80 %, y
//para los que tienen clave 2 o 6, 85 %.
//Para calcular el gasto de fabricación se considera que, si el artículo que se va a producir tiene
//claves 2 o 5, este gasto representa 30 % sobre el costo de la materia prima; si las claves son 3 o
//6, representa 35 %; si las claves son 1 o 4, representa 28 %. La materia prima tiene el mismo
//costo para cualquier clave.
Funcion mano_obra=proceso_mano_obra(materiaprima)
	//Entrada:
	Definir clave Como Entero
	Definir mano_obra Como Real
	mano_obra=0; clave=0
	Escribir "Ingrese la clave del producto de la mano de obra(1,2,3,4,5,6): "
	leer clave
	si clave=3 o clave=4 Entonces
		mano_obra=materiaprima*0.75
	sino 
		si clave=1 o clave=5 Entonces
			mano_obra=materiaprima*0.80
		sino 
			si clave=2 o clave=6 Entonces
				mano_obra=materiaprima*0.85
			FinSi
		FinSi
	FinSi
FinFuncion

Funcion gasto_fabricacion=proceso_gasto_fabricacion(materiaprima)
	//Proceso:
	Definir clave Como Entero
	Definir gasto_fabricacion Como Real
	gasto_fabricacion=0;clave=0
	Escribir "Ingrese la clave del producto del gasto de fabricación(1,2,3,4,5,6): "
	leer clave
	si clave=2 o clave=5 Entonces
		gasto_fabricacion=materiaprima*0.30
	sino 
		si clave=3 o clave=6 Entonces
			gasto_fabricacion=materiaprima*0.35
		sino 
			si clave=1 o clave=4 Entonces
				gasto_fabricacion=materiaprima*0.28
			FinSi
		FinSi
	FinSi
FinFuncion

Funcion fabrica_cometa
	//Entrada:
	Definir materiaprima, mano_obra, gasto_fabricacion, costo_produccion, precio_venta Como Real
	materiaprima=0; mano_obra=0; gasto_fabricacion=0; costo_produccion=0; precio_venta=0
	Escribir "                    ","***CALCULAR PRECIO DE VENTA***"
	Escribir "Ingrese el costo de la materia prima: "
	Leer materiaprima
	mano_obra=proceso_mano_obra(materiaprima)
	gasto_fabricacion=proceso_gasto_fabricacion(materiaprima)
	costo_produccion=materiaprima+mano_obra+gasto_fabricacion
	precio_venta=costo_produccion+(costo_produccion*0.45)
	Escribir "Materia prima: $", materiaprima
	Escribir "Mano de obra: $", mano_obra
	Escribir "Gasto de fabricación: $", gasto_fabricacion
	Escribir "Costo de producción: $", costo_produccion
	Escribir "El precio de venta es: ", precio_venta
FinFuncion
//13) Dado un número entero N, calcular e informar al usuario cuántos dígitos tiene dicho
//número.
//Funcion i=proceso_conteo_digitos(n)
//	definir i Como Entero
//	i=0
//	Mientras n>=0 Hacer
//		
//		n=trunc(n/10)
//		i=i+1
//FinMientras
//FinFuncion
//Funcion conteo_digitos
//	Definir num Como Entero
//	num=0
//	Escribir "                     ", "***CANTIDAD DE DIGITOS***"
//	Escribir "Ingrese un número entero: "
//	Leer num
//	Escribir "Este numero:",num," tiene ",proceso_conteo_digitos(num)," digitos"
//FinFuncion
Funcion long=proceso_conteo_digitos(n)
	//Proceso:
	definir long Como Entero
	
	long=Longitud(n)
	
FinFuncion
Funcion conteo_digitos
	Definir num Como caracter
	num=""
	Escribir "                     ", "***CANTIDAD DE DIGITOS***"
	Escribir "Ingrese un número entero: "
	Leer num
	Escribir "Este numero:",num," tiene ",proceso_conteo_digitos(num)," digitos"
FinFuncion
//14) Dado un número, determine si es capicúa.
//Nota: un número capicúa es aquel que se lee igual hacia adelante que hacia atrás.
Funcion proceso_numero_capicua(n)
	//Proceso:
	Definir long, i Como Entero
	Definir num, n_alreves Como Caracter
	num="";n_alreves="" 
	num=ConvertirATexto(n)
	long=Longitud(num)
	Para i=long-1 Hasta 0 Con Paso -1 Hacer
		n_alreves= n_alreves+ Subcadena(num,i,i) 
		
	FinPara
	
	Escribir "Numero: ",num
	Escribir "Número al reves: ", n_alreves
	Si num=n_alreves Entonces
		Escribir "Es un número capicúa"
	Sino 
		Escribir "No es un número capicúa"
	FinSi
FinFuncion
Funcion numero_capicua
	Definir num Como Entero
	Escribir "                      ", "***NÚMERO CAPICÚA***"
	Escribir "Ingrese un numero: "
	Leer num
	proceso_numero_capicua(num)
FinFuncion
//15) Escribir un algoritmo que presente los divisores de un numero
Funcion proceso_divisores_numero(n)
	//Proceso:
	definir i Como Entero
	Escribir "Los divisores son: " Sin Saltar
	Para i=1 Hasta n Con Paso 1 hacer
		si n mod i=0 Entonces
			Escribir i," " Sin Saltar
		FinSi
		
	FinPara
FinFuncion
Funcion divisores_numero
	//Entrada:
	Definir num Como Entero
	num=0
	Escribir "                      ", "***DIVISORES DE UN NÚMERO***"
	Escribir "Ingrese un número: "
	leer num
	proceso_divisores_numero(num)
FinFuncion
//16) Escribir un algoritmo que presente la suma de los divisores de un numero
Funcion suma=proceso_suma_divisores(num)
	//Entrada:
	Definir i, suma Como Entero
	suma=0
	Para i=1 hasta num-1 con paso 1 hacer 
		si num%i=0 Entonces
			suma=suma+i
		FinSi
	FinPara
FinFuncion
Funcion suma_divisores_numero
	//Entrada:
	Definir num Como Entero
	num=0
	Escribir "                      ", "***SUMA DE DIVISORES***"
	Escribir "Ingrese un número: "
	leer num
	Escribir "La suma de los divisores de ",num, " es: ",proceso_suma_divisores(num)
FinFuncion
//17)Escribir un algoritmo que presente la cantidad de los divisores de un numero
Funcion c=proceso_conteo_divisores(n)
	//Proceso:
	Definir i, c Como Entero
	c=0
	Para i=1 hasta n con paso 1 Hacer
		si n mod i=0 Entonces
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion conteo_divisores
	//Entrada:
	Definir num Como Entero
	num=0
	Escribir "                      ", "***CANTIDAD DE DIVISORES***"
	Escribir "Ingrese un número: "
	leer num
	Escribir "El número ",num, " tiene ",proceso_conteo_divisores(num)," divisores"
FinFuncion
// 18) Escribir un algoritmo que indique si un número es perfecto
//Nota: un número es perfecto cuando la suma de los divisores del número incluido el 1 y
//	excluido el propio número es igual al numero
//Ejemplo: numero=6: los divisores del 6 son: 1+2+3=6
Funcion numeros_perfectos
	//Entrada:
	Definir num, suma Como Entero
	num=0;
	Escribir "                      ", "***NÚMERO PERFECTO***"
	Escribir "Ingrese un numero: "
	leer num
	//reutiliza la funcion proceso_suma_divisores
	suma=proceso_suma_divisores(num)
	Si suma=num Entonces
		Escribir num," es un número perfecto"
	sino 
		Escribir num, " no es un número perfecto, puesto que la suma de sus divisores es:", suma
	FinSi
FinFuncion
//19) Dado un número N determinar si es un número primo.
//Nota: Un número primo es aquel que solo es divisible por 1(uno) y por el mismo.

Funcion numero_primo
	//Entrada:
	Definir num, cont Como Entero
	Escribir "                      ", "***NÚMERO PRIMO***"
	Escribir "Ingrese un número: "
	Leer num
	//reutiliza la funcion proceso_conteo_divisores
	cont=proceso_conteo_divisores(num)
	si cont=2 Entonces
		Escribir "Es un número primo"
	sino
		Escribir "No es un número primo"
	FinSi
FinFuncion
//20) Dado dos números determinar si son primos gemelos.
//Nota: Dos números son primos gemelos si los dos son primos y su resta en valor absoluto es
//igual a 2. Ejemplo: 7 y 5

Funcion primos_gemelos
	//Entrada:
	Definir num1, num2, c1, c2 Como Entero
	num1=0;num2=0
	Escribir "                      ", "***NÚMEROS PRIMOS GEMELOS***"
	Escribir "Ingrese el primer numero:"
	leer num1
	Escribir "Ingrese el segundo número: "
	leer num2
	//reutiliza la funcion proceso_conteo_divisores
	c1=proceso_conteo_divisores(num1)
	c2=proceso_conteo_divisores(num2)
	//Proceso:
	si c1=2 y c2=2 Entonces
		si abs(num1-num2)=2 Entonces
			Escribir num1," y ",num2," son primos gemelos"
		sino 
			Escribir num1," y ",num2," no son primos gemelos"
		FinSi
	SiNo
		Escribir "Uno o los dos números no son primos"
	FinSi
FinFuncion
//21) Dado dos números determinar si son primos amigos.
//Nota: Dos números son primos amigos si las sumas de los divisores del numero1 es igual a la
//	suma de los divisores del numero2. Ejemplo: 6(1+2+3=6) y 25(1+5=6)

Funcion primos_amigos
	//Entrada:
	Definir num1, num2, suma, suma1 como entero
	num1=0;num2=0
	Escribir "                      ", "***NÚMEROS PRIMOS AMIGOS***"
	Escribir "Ingrese el primer número: "
	Leer num1
	Escribir "Ingrese el segundo número: "
	Leer num2
	//reutiliza la funcion proceso_Suma_divisores
	//Proceso:
	suma=proceso_suma_divisores(num1)
	suma1=proceso_suma_divisores(num2)
	Si suma=suma1 entonces 
		Escribir num1," y ",num2," son primos amigos"
	sino 
		Escribir num1," y ",num2," no son primos amigos"
	FinSi
FinFuncion
//1) Dada n realizar un algoritmo que presente la siguiente secuencia
//n=6
//respuesta= 2 2 4 8 32 256
Funcion secuencia_2
	//Entrada:
	Definir n, a, b, c, i Como Real
	n=0; i=0; a=0; b=1; c=2
	Escribir "                           ","***SECUENCIA***"
	Escribir "Ingrese el valor de n"
	Leer n
	//Proceso:
	Escribir "Secuencia: " Sin Saltar
	Para i = 0 Hasta n-1 Hacer
		Escribir Sin Saltar c, " "
		a = b 
		b = c
		c = a * b
	FinPara
	Escribir " "
	//Salida: c	
FinFuncion
//2) Implementa un programa que calcule el promedio de los elementos pares e impares en un
//arreglo de números enteros y los copie en otro arreglo.
//Ejemplo:
//	arreglo[2,3,4,7] areglo2[3,5]

Funcion proceso_numeros_pares(arreglo,n)
	definir c1,c2, i, suma1, suma2 Como Entero
	definir prom1,prom2, arreglo2 Como Real
	c1=0;c2=0;suma1=0;suma2=0;prom1=0;prom2=0
	Para i=0 hasta n-1 con paso 1 hacer 
		si arreglo[i] mod 2=0 Entonces
			suma1=suma1+arreglo[i]
			c1=c1+1
		FinSi
	FinPara
	prom1=suma1/c1
	Para i=0 hasta n-1 con paso 1 hacer 
		si arreglo[i] mod 2<>0 Entonces
			suma2=suma2+arreglo[i]
			c2=c2+1
		FinSi
	FinPara
	prom2=suma2/c2
	Dimension arreglo2[2]
	arreglo2[0]=prom1
	arreglo2[1]=prom2
	Escribir "Promedios: [ " Sin Saltar
	Para i=0 hasta 1 con paso 1 Hacer
		escribir arreglo2[i]," " Sin Saltar
	FinPara
	escribir "]"
FinFuncion
Funcion numeros_pares_impares
	Definir arreglo, n, i Como Entero
	n=0
	Escribir "                   ", "***PROMEDIO DE NÚMEROS PARES E IMPARES***"
	Escribir "Ingrese cantidad de elementos del arreglo: "
	leer n
	dimension arreglo[n]
	para i=0 hasta n-1 con paso 1 hacer 
		Escribir "Ingrese los números: "
		leer arreglo[i]
	finpara
	proceso_numeros_pares(arreglo,n)
FinFuncion

//3) Dada n realizar un algoritmo que presente la siguiente secuencia
//n=6
//respuesta= 20 5 15 10 5 -5 0
Funcion secuencia_num
	//Entrada:
	Definir arreglo,i Como Entero
	Dimension arreglo[6]
	Escribir "                           ","***SECUENCIA***"
	arreglo[0]=20
	arreglo[1]=5
	arreglo[2]=15
	arreglo[3]=5
	arreglo[4]=-5
	arreglo[5]=0
	//Proceso:	
	Escribir "Secuencia: " Sin Saltar
	Para i=0 hasta 5 con paso 1 Hacer
		Escribir  arreglo[i], " "Sin Saltar
	FinPara
	Escribir " "
	//Salida: arreglo[i]
FinFuncion

//4) Implementa un programa que copie los números de un arreglo a 2 arreglos en uno los
//números positivos y en el otro los negativos Ejemplo:
//	arreglo=[2,-6,4,-9, 12] arregloPositivo=[2,4,12] arregloNegativo[-6,-9]
Funcion proceso_num_pos_neg(num,n)
	Definir arreglo_positivo, arreglo_negativo, i Como Entero
	
	Para i=0  hasta n-1 con paso 1 hacer 
		Escribir "Ingrese numeros en el arrglo: "
		leer num[i]
	FinPara
	Borrar Pantalla
	Dimension arreglo_positivo[n]
	Escribir "Arreglo con números negativos: "
	para i=0 hasta n-1 con paso 1 hacer 
		si num[i]>0 Entonces
			
			arreglo_positivo[i]=num[i]
			Escribir arreglo_positivo[i], " "Sin Saltar
		FinSi
	FinPara
	Escribir ""
	Escribir "Arreglo con números negativos: "
	Dimension arreglo_negativo[n]
	para i=0 hasta n-1 con paso 1 hacer 
		si num[i]<0 Entonces
			
			arreglo_negativo[i]=num[i]
			Escribir arreglo_negativo[i], " "Sin Saltar
		FinSi
	FinPara
	
FinFuncion
Funcion arreglos_num_pos_neg
	Definir n, num Como Entero
	n=0
	Escribir "                      ", "***NÚMEROS POSITIVOS Y NEGATIVOS***"
	Escribir "Ingrese la cantidad de elementos: "
	leer n
	Dimension num[n]
	proceso_num_pos_neg(num,n)
FinFuncion
//5) Leer una secuencia de números hasta que se ingrese un numero negativo.
//Mostrar la suma de los pares y la cantidad de los números que son múltiplo de 3
//Ejemplo:
//secuencia: 4,14,3,0,21,2,-4
//	Respuesta
//	paresSuma=20
//	contMuliplos3=2
Funcion suma=proceso_suma_num_pos(secuencia,i)
	Definir suma Como Entero
	suma=0
	Para i=0 hasta i-1 con paso 1 hacer 
		si secuencia[i]>=0 entonces
			si secuencia[i] mod 2=0 Entonces
				suma=suma+secuencia[i]
			FinSi
			
		FinSi
	FinPara
FinFuncion
Funcion c=proceso_num_multiplo(secuencia,i)
	Definir c Como Entero
	c=0
	para i=0 hasta i-1 con paso 1 hacer 
		si secuencia[i]>0 entonces
			si secuencia[i]%3=0 Entonces
				c=c+1
			FinSi
		finsi 
	FinPara
FinFuncion
Funcion numeros_positivos
	Definir num, secuencia, i, c Como Entero
	num=0;c=0
	Dimension secuencia[100]
	Escribir "             ", "***NÚMERO PARES Y CANTIDAD DE MULTIPLOS DE 3***"
	i=0
	Mientras num>=0 Hacer
		Escribir "Ingrese un número positivo o ingrese uno negativo para finalizar: "
		leer num
		secuencia[i]=num
		i=i+1
	FinMientras
	Borrar Pantalla
	
	Escribir "La suma de los números pares del arreglo es:", proceso_suma_num_pos(secuencia,i)
	Escribir "El arreglo contiene << ",proceso_num_multiplo(secuencia,i)," >> multiplos de 3"
	
FinFuncion

//6) Leer una secuencia de números hasta que se ingrese un 0
//y almacenarlos en un arreglo
//Se pide recorrer el arreglo y mostrar la suma del cuadrado de cada numero.
//Ejemplo: secuencia: 4,3,2,5,0
//		arreglo=[4,3,2,5]
//		exponentes= 16 9 4 25
//		respuestaSuma=54
Funcion suma=proceso_cuadrado_numero(secuencia,i,e)
	Definir suma, exponente Como Entero
	suma=0;exponente=0
	Para i=0 hasta i-1 con paso 1 hacer 
		exponente=secuencia[i]^e
		suma=suma+exponente
	FinPara
FinFuncion
Funcion suma_cuadrado_numero
	Definir num, i, secuencia como entero 
	num=1
	Dimension secuencia[100]
	Escribir "                      ", "***SUMA DE CUADRADO***"
	i=0 
	Mientras num<>0 Hacer
		Escribir "Ingresa un número o ingrese 0 para finalizar: "
		leer num
		secuencia[i]=num
		i=i+1
	FinMientras
	Escribir "La suma del cuadrado de los numeros es: ", proceso_cuadrado_numero(secuencia,i,2)
FinFuncion
//7) Leer una secuencia de números hasta que se ingrese un numero par.
//Mostrar la cantidad de los números mayores a 5 y la suma de los múltiplos de 5
//Ejemplo:
//secuencia: 3,5,15,7,9, 4
//	Respuesta
//	contMay5=3
//	sumaMultiplos5=20
Funcion c=proceso_cant_mayor5(secuencia,i)
	Definir c Como Entero
	c=0;
	Para i=0 hasta i-1 con paso 1 Hacer
		si secuencia[i]>5 Entonces
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion suma=proceso_multiplos_5(secuencia,i)
	definir suma Como Entero
	suma=0
	Para i=0 hasta i-1 con paso 1 hacer 
		si secuencia[i]%5=0 Entonces
			si secuencia[i] mod 2<>0 entonces
				suma=suma+secuencia[i]
			FinSi
			
		FinSi
	FinPara
FinFuncion
Funcion cant_suma_multiplos
	Definir num, i, secuencia como entero 
	num=1
	Dimension secuencia[100]
	Escribir "           ", "***CANTIDAD MAYORES A 5 Y SUMA DE MULTIPLOS DE 5***"
	i=0
	Mientras num mod 2<>0 Hacer
		Escribir "Ingresa un número: "
		Leer num
		secuencia[i]=num
		i=i+1
	FinMientras
	Borrar Pantalla
	Escribir "Este arreglo tiene << ",proceso_cant_mayor5(secuencia,i), " >> números mayores a 5"
	Escribir "La suma de los números multiplos de 5 es: ", proceso_multiplos_5(secuencia,i)
FinFuncion
//8) Leer una secuencia de números hasta que se ingrese un numero negativo
//y almacenarlos en un arreglo
//Se pide recorrer el arreglo y mostrar la suma de cada número elevado al cubo.
//Ejemplo: secuencia: 4,3,2,5,-1
//		arreglo=[4,3,2,5]
//		exponentes= 64 27 8 125
//		respuestaSuma=224 
//Funcion suma=proceso_suma_de_cubo(secuencia,i)
//	Definir suma, exponente Como Entero
//	suma=0;exponente=0
//	Para i=0 hasta i-1 con paso 1 Hacer
//		si secuencia[i]>0 Entonces
//			exponente=secuencia[i]^3
//			suma=suma+exponente
//		FinSi
//	FinPara
	
//FinFuncion
Funcion suma_de_cubos
	Definir num, i, secuencia como entero 
	num=0
	dimension secuencia[100]
	Escribir "                      ", "***SUMA DE CUBO***"
	i=0
	Mientras num>=0 Hacer
		Escribir "Ingrese un número: "
		Leer num
		si num>0 entonces
		secuencia[i]=num
		i=i+1
		finsi
	FinMientras
	//REUTILIZA EL CODIGO DE LA FUNCION proceso_cuadrado_numero(secuencia,i,3)
	Escribir "La suma de cubo de los números es: ", proceso_cuadrado_numero(secuencia,i,3)
FinFuncion
//9) Dado una frase indicar cuantas palabras tiene
//Ejemplo:
//	frase="hola que tal".
//	contPalabras=3
Funcion contar_palabra 
	Definir frase Como Caracter
	Definir long, c, i Como Entero
	frase="";c=0
	Escribir "                      ", "***CANTIDAD DE PALABRAS***"
	Escribir "Ingrese una frase:"
	Leer frase
	long=Longitud(frase)
	para i=0 hasta long-1 con paso 1 Hacer
		si Subcadena(frase,i,i)=" " Entonces
			c=c+1
		FinSi
	FinPara
	Escribir "La frase tiene ",c+1," palabras" 
FinFuncion
//10) Leer una secuencia de números hasta que se ingrese un numero negativo
//y almacenarlos en arreglo. Se pide recorrer el arreglo y cambiar cada
//elemento del arreglo por su doble.
//Ejemplo: secuencia: 4,3,6,9,0
//		arreglo=[4,3,6,9] = [8,6,12,18]
Funcion proceso_arreglo_num_doble(secuencia,i)
	
	Para i=0 hasta i-1 con paso 1 Hacer
		Si secuencia[i]>0 Entonces
			secuencia[i]=secuencia[i]*2
			Escribir secuencia[i],"  "Sin Saltar
		FinSi
	FinPara
	
FinFuncion
Funcion arreglo_num_doble
	Definir num, i, secuencia Como Entero
	num=0
	Dimension secuencia[100]
	Escribir "                 ", "***DE NÚMEROS A UN ARREGLO CON SUS DOBLE***"
	i=0
	Mientras num>=0 Hacer
		Escribir "Ingrese un número o ingrese un número negativo para finalizar:"
		Leer num
		secuencia[i]=num
		i=i+1
	FinMientras
	proceso_arreglo_num_doble(secuencia,i)
FinFuncion
//11) Leer una secuencia de caracteres hasta que se ingrese un punto.
//Deberá mostrar cuantos "x" se ingresaron
//Ejemplo:
//	secuencia="axyrx".

Funcion c=proceso_secuencia_caracter(caracter1,j)
	definir i, c Como Entero
	c=0
	Para i=0 hasta j-1 con paso 1 hacer 
		si caracter1[i]="x" o caracter1[i]="X" Entonces
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion secuencia_caracteres
	Definir caracter1,arreglo Como Caracter
	definir i Como Entero
	caracter1=""
	dimension arreglo[100]
	Escribir "                    ", "***CANTIDAD DE CARACTERES X***"
	i=0
	Mientras caracter1<>"." Hacer
		Escribir "Ingrese caracteres: "
		leer caracter1
		si caracter1<>"." Entonces
			arreglo[i]=caracter1
			i=i+1
		FinSi
	FinMientras
	Escribir "En la secuencia << "Sin Saltar
	para i=0 hasta i-1 con paso 1 hacer 
		escribir arreglo[i] Sin Saltar
	FinPara
	Escribir " >> hay ",proceso_secuencia_caracter(arreglo,i)," caracteres << x >>"
FinFuncion
//	contX= 2//Funcion secuencia_caracter
//	Definir caracter1 Como Caracter
//	definir c Como Entero
//	caracter1="";c=0
//	Mientras caracter1<>"." Hacer
//		Escribir "Ingrese caracteres: "
//		leer caracter1
//		Si caracter1="x" o caracter1="X" Entonces
//			c=c+1
//		FinSi
//	FinMientras
//	Escribir "Hay ",c," caracteres << x >>"
//FinFuncion

//12) Leer una secuencia de números hasta que se ingrese un 0
//y almacenarlos en arreglo. Se pide recorrer el arreglo y pasar a otro
//arreglo solo los números pares de cada elemento del arreglo1
//Ejemplo: secuencia: 4,3,6,9,0
//		arreglo1=[4,3,6,9] arreglo2= [4,6] 
Funcion proceso_arreglos_num_pares(arreglo1,i,n)
	Definir arreglo2 Como Entero
	dimension arreglo2[n]
	Escribir "Numeros pares: "Sin Saltar
	Para i=0 hasta i-1 con paso 1 hacer 
		si arreglo1[i]<>0 entonces
			si arreglo1[i] mod 2=0 Entonces
				arreglo2[i]=arreglo1[i]
				Escribir arreglo2[i],"  "Sin Saltar
			FinSi
		finsi 
	FinPara
FinFuncion
Funcion arreglos_num_pares
	Definir arreglo1,num, i, n Como Entero
	num=1; n=100
	dimension arreglo1[n]
	Escribir "                    ", "***ARREGLOS CON ELEMENTOS PARES***"
	i=0
	Mientras num<>0 Hacer
		Escribir "Ingresa un número o ingresa 0 para finalizar: "
		leer num
		arreglo1[i]=num
		i=i+1
	FinMientras
	proceso_arreglos_num_pares(arreglo1,i,n)
FinFuncion
//13) Dado dos números presentar los valores mayores a 5 entre ellos incluidos el numero inicial
//	y final
//Ejemplo: numero1=2 numero2=10
//	salida= 6 7 8 9 10
Funcion proceso_num_mayores_5(num)
	definir i Como Entero
	Para i=num[0] hasta num[1] con paso 1 hacer 
		si i>5 entonces 
			escribir i,"  "Sin Saltar
		finsi 
	FinPara
FinFuncion
Funcion numeros_mayores_5 
	definir num, n, i como entero 
	n=2
	dimension num[n]
	Escribir "                    ", "***VALORES MAYORES A 5***"
	Para i=0 hasta n-1 con paso 1 hacer 
		Escribir "Ingrese un número: "
		leer num[i]
	FinPara
	proceso_num_mayores_5(num)
FinFuncion

//14) Elaborar un algoritmo que lea una serie de edades de los alumnos de la facultad FACI y
//los guarde en un arreglo. Se pide:
//	· calcular el promedio general de las edades de los alumnos
//	· La cantidad y el promedio de las edades mayores o iguales a 18
//	· La cantidad y el promedio de las edades menores a 18
//Ejemplo:
//	Edades=[20,17,20,23]
//	promedioGeneral=20
//	cantMayorIgual18= 3, promedioMayorIgual18=21
//	cantMenor18= 1, promedioMenor18=17
Funcion promedio=proceso_prom_general(edad,n)
	Definir promedio, suma, i Como Real
	suma=0;promedio=0
	para i=0 hasta n-1 con paso 1 Hacer
		suma=suma+edad[i]
	FinPara
	promedio=suma/n
FinFuncion
Funcion proceso_prom_mayor_18(edad,n)
	Definir suma, promedio Como Real
	Definir c, i Como Entero
	suma=0;promedio=0;c=0
	Para i=0 hasta n-1 con paso 1 hacer 
		si edad[i]>=18 Entonces
			suma=suma+edad[i]
			c=c+1
		FinSi
	FinPara
	promedio=suma/c
	Escribir "Hay ",c," alumnos y el promedio de las edades mayores o iguales a 18 es: ",promedio
	
FinFuncion
Funcion proceso_prom_menor_18(edad,n)
	Definir suma, promedio Como Real
	Definir c, i Como Entero
	suma=0;promedio=0;c=0
	Para i=0 hasta n-1 con paso 1 Hacer
		si edad[i]<18 Entonces
			suma=suma+edad[i]
			c=c+1
		FinSi
	FinPara
	promedio=suma/c
	Escribir "Hay ",c," alumnos y el promedio de las edades mayores o iguales a 18 es: ",promedio
FinFuncion
Funcion edad_faci
	Definir edad, n, i como entero 
	Escribir "                    ", "***EDAD DE LOS ALUMNOS DE FACI***"
	Escribir "Ingrese la cantidad de edad que va a ingresar: "
	leer n
	Dimension edad[n]
	para i=0 hasta n-1 con paso 1 Hacer
		Escribir "Ingresa la edad: "
		leer edad[i]
	FinPara
	Borrar Pantalla
	Escribir "El promedio general de las edades de los alumnos de FACI es: ",proceso_prom_general(edad,n)
	proceso_prom_mayor_18(edad,n)
	proceso_prom_menor_18(edad,n)
FinFuncion
//15) Dado dos números presentar los valores Impares comprendidos entre ellos(excluidos el
//valor inicial y final)
//Ejemplo: numero1=2 numero2=11
//salida: 3 5 7 9
Funcion proceso_valores_impares(num)
	Definir i Como Entero
	Escribir "Numeros impares: " Sin Saltar
	Para i=num[0]+1 hasta num[1]-1 con paso 1 Hacer
		si i mod 2<>0 Entonces
			Escribir i,"  "Sin Saltar
		FinSi
	FinPara
FinFuncion
Funcion valores_impares
	Definir num, n como entero 
	n=2
	dimension num[n]
	Escribir "                    ", "***VALORES IMPARES***"
	Escribir "Ingresa el primer número: "
	Leer num[0]
	Escribir "Ingresa el segundo número: "
	Leer num[1]
	proceso_valores_impares(num)
FinFuncion
//16) Elaborar un algoritmo que lea una serie de sueldos de los empleados de la unemi y los
//guarde en un arreglo. Se pide:
//	· Presentar el sueldo más alto de los empleados
//	· La cantidad y el promedio de los sueldos de los empleados
//Ejemplo:
//	sueldos=[500,700,800,600]
//	SueldoMasAlto= 800
//	cantidadSueldos=4 promedioGeneral=650
Funcion maximo=proceso_sueldo_alto(sueldo,n)
	Definir maximo, i Como Real
	maximo=sueldo[0]
	Para i=0 hasta n-1 con paso 1 hacer 
		si sueldo[i]>maximo Entonces
			maximo=sueldo[i]
		FinSi
	FinPara
FinFuncion
Funcion cant_promedio_sueldo(sueldo,n)
	Definir c, i Como Entero
	Definir promedio, suma Como real
	c=0;promedio=0;suma=0
	Para i=0 hasta n-1 con paso 1 hacer 
		suma=suma+sueldo[i]
		c=c+1
	FinPara
	promedio=suma/n
	Escribir "Hay << ",n, " >> sueldos y el promedio de los sueldos es: ", promedio
FinFuncion
Funcion sueldo_empleados
	Definir sueldo Como Real
	definir n, i Como Entero
	n=0
	Escribir "                   ", "***SUELDO DE LOS EMPLEADOS DE UNEMI***"
	Escribir "¿Cuántos sueldos va a ingresar?"
	leer n
	dimension sueldo[n]
	para i=0 hasta n-1 con paso 1 hacer 
		Escribir "Ingrese el sueldo: $" Sin Saltar
		Leer sueldo[i]
	FinPara
	Escribir "El sueldo más alto es: ", proceso_sueldo_alto(sueldo,n)
	cant_promedio_sueldo(sueldo,n)
FinFuncion
//17) Dadas dos frase indicar la de mayor longitud"
Funcion proceso_longitud_mayor(f1,f2)
	Definir long1, long2 Como Entero
	long1=Longitud(f1)
	long2=Longitud(f2)
	Si long1>long2 entonces 
		Escribir "La frase 1 tiene mayor longitud que la frase 2 "
		Escribir "<< ",f1, " >> tiene << ",long1," >> caracteres"
	sino 
		Escribir "La frase 2 tiene mayor longitud que la frase 1"
		Escribir "<< ",f2, " >> tiene << ",long2," >> caracteres"
	FinSi
FinFuncion
Funcion mayor_longitud
	Definir frase1, frase2 Como Caracter
	frase1="";frase2=""
	Escribir "                    ", "***PALABRA DE MAYOR LONGITUD***"
	Escribir "Ingrese la primera frase: "
	Leer frase1
	Escribir "Ingrese la segunda frase: "
	leer frase2
	proceso_longitud_mayor(frase1,frase2)
FinFuncion
//	18) Indicar cuantas ,.;: hay en una cadena"
Funcion c=proceso_cant_signos(frase)
	Definir i, long,c Como entero 
	Definir car Como Caracter
	c=0
	long=Longitud(frase)
	
	Para i=0 hasta long-1 con paso 1 Hacer
		car=Subcadena(frase,i,i)
		Si car="," o car="." o car=";" o car=":"
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion cant_signos_puntuacion
	Definir frase Como Caracter
	frase=""
	Escribir "                    ", "***CANTIDAD DE SIGNOS DE PUNTUACIÓN***"
	Escribir "Ingresa la cadena: "
	leer frase
	Escribir "La cadena que ingreso tiene ",proceso_cant_signos(frase)," signos de puntuación (,.;:)"
FinFuncion
//19) Dado una cadena indicar cuantas vocales, consonantes y dígitos hay"
Funcion c=proceso_contar_vocal(frase)
	Definir c, long, i Como Entero
	Definir car Como Caracter
	c=0
	frase=Minusculas(frase)
	long=Longitud(frase)
	Para i=0 hasta long-1 con paso 1 Hacer
		car=Subcadena(frase,i,i)
		Si car="a" o car="e" o car="i" o car="o" o car="u" o car="á" o car="é" o car="í" o car="ó" o car="ú"
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion c=proceso_contar_consonantes(frase)
	Definir c, long, i Como Entero
	Definir car Como Caracter
	c=0
	frase=Minusculas(frase)
	long=Longitud(frase)
	Para i=0 hasta long-1 con paso 1 Hacer
		car=Subcadena(frase,i,i)
		si (car>="b" y car<="d") o (car>="f" y car<="h") o (car>="j" y car<="n") o (car>="p" y car<="t") o (car>="v" y car<="z")
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion c=proces_contar_digitos(frase)
	Definir c, long, i Como Entero
	Definir car Como Caracter
	c=0
	frase=Minusculas(frase)
	long=Longitud(frase)
	Para i=0 hasta long-1 con paso 1 Hacer
		car=Subcadena(frase,i,i)
		Si car>="1" y car<="9"
			c=c+1
		FinSi
	FinPara
FinFuncion
Funcion contar_v_c_d
	Definir frase Como Caracter
	frase=""
	Escribir "               ", "***CANTIDAD DE VOCALES, CONSONANTES Y DIGITOS***"
	Escribir "Ingrese la frase: "
	leer frase 
	Escribir "La cadena tiene ", proceso_contar_vocal(frase), " vocales"
	Escribir "La cadena tiene ", proceso_contar_consonantes(frase), " consonates"
	Escribir "La cadena tiene ", proces_contar_digitos(frase), " digitos"
FinFuncion
//20)Indicar cuantas palabras hay en una frase asumiendo 1 o varios espacios entre palabras"
Funcion cant=proceso_contarpalabras(frase)
	Definir cant, i Como Entero
	Definir ultimoEspacio Como Entero
	ultimoEspacio=1;cant= 0
	Para i= 0 Hasta Longitud(frase)-1 Con Paso 1 Hacer
		Si Subcadena(frase, i, i) = " " Entonces
			Si ultimoEspacio = 0 Entonces
				cant= cant + 1
				ultimoEspacio= 1
			FinSi
			
		Sino
			ultimoEspacio= 0
		FinSi
	FinPara
FinFuncion
Funcion contar_word
	Definir frase Como Cadena
	Escribir "                   ","***CONTADOR DE PALABRAS***"
		Escribir "Ingrese una frase:"
		Leer frase
		frase=frase+" "
		Escribir "La frase tiene ", proceso_contarpalabras(frase), " palabras."
		
FinFuncion
//21) Presentar la suma de los dígitos de una cedula"
Funcion suma=proceso_cedula(num_cedula)
	Definir suma, digito, i, digitos como Entero
	suma= 0
	Dimension digitos[10] 
    // Separa los dígitos y los almacena en el arreglo
    i=1
    Mientras num_cedula > 0 Hacer
        digito= num_cedula MOD 10
        digitos[i]= digito
        i= i + 1
		num_cedula=trunc(num_cedula / 10)
    FinMientras
    // Calcula la suma de los dígitos almacenados en el arreglo

    Para i <- 1 Hasta i - 1 Hacer
        suma = suma + digitos[i]
    FinPara
FinFuncion
Funcion suma_cedula
	Definir cedula Como Entero
	Escribir "                   ","***SUMA DE LOS DÍGITOS***"
    Escribir"Ingrese el número de cédula:"
    Leer cedula
    Escribir "La suma de los dígitos de la cédula es:",proceso_cedula(cedula)
FinFuncion
//22) Indicar si una palabra es palíndroma". Ejemplo: "ana" es palíndroma por se lee igual de
//inicio a fin que de fin a inicio
Funcion palabra_palindroma
	Definir palabra, palabra_alreves Como Caracter
	Definir long, i Como entero 
	palabra="";palabra_alreves=""
	Escribir "                    ", "***PALABRA PALÍNDROMA***"
	Escribir "Ingresa una palabra: "
	Leer palabra
	long=Longitud(palabra)
	Para i=long-1 hasta 0 con paso -1 hacer 
		palabra_alreves=palabra_alreves+Subcadena(palabra,i,i)
		
	FinPara
	Si palabra=palabra_alreves Entonces
		Escribir "Es una palabra de palíndroma"
	SiNo
		Escribir "No es una palabra palíndroma"
	FinSi
FinFuncion
//23) Presentar la posición de un carácter cualquiera dentro de una cadena"
Funcion  proceso_posicion_caracter(cadena1)
	Definir letra Como Caracter
	Definir long, i Como Entero
	letra=""
	Escribir "Ingrese el caracter para mostrar su posición: "
	leer letra
	long=Longitud(cadena1)
	para i=0 hasta long-1 Con Paso 1 hacer 
		si Subcadena(cadena1,i,i)=letra
			Escribir "El caracter << ",letra," >>"," se encuentra en la posición ",i, " de la cadena"
		FinSi
	FinPara
FinFuncion
Funcion posicion_caracter
	Definir cadena1 Como Caracter
	cadena1=""
	Escribir "                    ", "***POSICIÓN DE UN CARÁCTER***"
	Escribir "Ingrese una cadena: "
	leer cadena1
	proceso_posicion_caracter(cadena1)
FinFuncion

// Algoritmo principal del proyecto
Algoritmo Proyecto
	Definir menuPrincipal,titulo,titulo2,opc,opcn,opcc, opciones1, opciones2 Como Caracter
	Definir pos,lim Como Entero
	Dimension menuPrincipal[3],opciones1[25],opciones2[25]
	// Arreglo menu principal
	menuPrincipal[0] = "  1)Ejercicios con Numeros"
	menuPrincipal[1] = "  2)Ejercicios con Cadenas"
	menuPrincipal[2] = "  3)Salir"
	
	// arreglo submenu numeros
	opciones1[0]="1) Cantidad de colas"
	opciones1[1]="2) Asociación de vinicultores"
	opciones1[2]="3) Obtener residuo"
	opciones1[3]="4) Consultorio del Dr. Paez"
	opciones1[4]="5) Mitad Y divisor de un número"
	opciones1[5]="6) Banco XYZ-Aumento límite tarjeta"
	opciones1[6]="7) Divisor y doble de un número"
	opciones1[7]="8) Banco POO-Aumento límite tarjeta"
	opciones1[8]="9) Número negativo o positivo"
	opciones1[9]="10) Asociación de vinicultores 2"
	opciones1[10]="11) Número par o negativo impar "
	opciones1[11]="12) Fabrica El cometa"
	opciones1[12]="13) Cantidad de dígitos"
	opciones1[13]="14) Número capicúa"
	opciones1[14]="15) Divisor de un número"
	opciones1[15]="16) Suma de los divisores de un numero"
	opciones1[16]="17) Cantidad de los divisores de un numero"
	opciones1[17]="18) Número perfecto"
	opciones1[18]="19) Número primo"
	opciones1[19]="20) Números primos gemelos"
	opciones1[20]="21) Números primos amigos"
	opciones1[21]="22) Atrás"
	
	//opciones cadenas y arreglos
	opciones2[0]="1) Secuencia"
	opciones2[1]="2) Promedio de elementos pares e impares"
	opciones2[2]="3) Secuncia 2"
	opciones2[3]="4) Arreglos con numeros negativos y positivos"
	opciones2[4]="5) Secuencias de numeros positivos"
	opciones2[5]="6) Suma del cuadrado de numeros positivos"
	opciones2[6]="7) Secuencia mayores a 5 o multiplos de 5"
	opciones2[7]="8) Suma del cubo de numeros positivos"
	opciones2[8]="9) Cantidad de palabras"
	opciones2[9]="10) El doble de numeros positivos"
	opciones2[10]="11) Secuencia de caracteres"
	opciones2[11]="12) Arreglos de números pares"
	opciones2[12]="13) Números mayores a 5"
	opciones2[13]="14) Edad de los alumnos de la facultad FACI"
	opciones2[14]="15) Presentar números impares"
	opciones2[15]="16) Sueldo de los empleados de la UNEMI"
	opciones2[16]="17) Frase de mayor longitud"
	opciones2[17]="18) Signos de puntuación en una cadena"
	opciones2[18]="19) Vocales, consonantes y dígitos en una cadena"
	opciones2[19]="20) Cantidad de palabras en una frase"
	opciones2[20]="21) Suma de los dígitos de la cédula"
	opciones2[21]="22) Palabra palíndroma"
	opciones2[22]="23) Posición de un caracter"
	opciones2[23]="24) Salir"
	opc=""
    Mientras opc <> "3" Hacer
		Borrar Pantalla
		opc=presentarMenu("Menu Principal",menuPrincipal,3)
		Segun opc Hacer
		"1":
			opcn=""
			Mientras opcn <> "22" Hacer         
				opcn=presentarMenu("Menu Numeros",opciones1,22)
				Borrar Pantalla
				Segun opcn Hacer
					"1": 
						factura_cola
					"2": 
						asociacion_vinicultores
					"3": 
						modulo_principal
					"4":
						consultorio
					"5":
						mitad_de_numero
					"6":
						banco_xyz
					"7":
						divisible_doble
					"8":
						nuevo_limite_2
					"9":
						numero_negativo_positivo
					"10":
						asociacion_vinicultores_2
					"11":
						numero_par_negativo
					"12":
						fabrica_cometa
					"13":
						conteo_digitos
					"14":
						numero_capicua
					"15":
						divisores_numero
					"16":
						suma_divisores_numero
					"17":
						conteo_divisores
					"18": 
						numeros_perfectos
					"19":
						numero_primo
					"20":
						primos_gemelos
					"21":
						primos_amigos
					"22": Escribir "Regresando al menú principal"
					De Otro Modo:
						Escribir "Número no válido..."
				FinSegun
				Esperar 3 segundos
			FinMientras
		    
		"2":
			opcc=""
			Mientras opcc<> "24" Hacer         
				opcc=presentarMenu("Menu cadenas y arreglos",opciones2,24)
				Borrar Pantalla
				Segun opcc Hacer
					"1": 
						secuencia_2
					"2": 
						numeros_pares_impares
					"3": 
						secuencia_num
					"4":
						arreglos_num_pos_neg
					"5":
						numeros_positivos
					"6":
						suma_cuadrado_numero
					"7":
						cant_suma_multiplos
					"8":
						suma_de_cubos
					"9":
						contar_palabra 
					"10":
						arreglo_num_doble
					"11":
						secuencia_caracteres
					"12":
						arreglos_num_pares
					"13":
						numeros_mayores_5 
					"14":
						edad_faci
					"15":
						valores_impares
					"16":
						sueldo_empleados
					"17":
						mayor_longitud
					"18": 
						cant_signos_puntuacion
					"19":
						contar_v_c_d
					"20":
						contar_word
					"21":
						suma_cedula
					"22":
						palabra_palindroma
					"23":
						posicion_caracter
					"24": Escribir "Regresando al menú principal"	
					De Otro Modo:
						Escribir "Número no válido..."
				FinSegun
				Esperar 3 segundos
			FinMientras
		"3":
			Borrar Pantalla
			Escribir "Gracias por usar el Sistema..."
		De Otro Modo:
			Escribir "Número no válido..."
			Esperar 2 Segundos
		Fin Segun
    Fin Mientras
FinAlgoritmo
