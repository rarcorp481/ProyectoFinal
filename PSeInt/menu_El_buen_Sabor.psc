Algoritmo menu_pollos_el_buen_sabor
			// definicion de los arreglos  
			Dimension descripcion[15]
			Dimension precio[15]
			Dimension tiempo[15]
			Dimension categoria[15]
			
			Dimension orden_descripcion[100]
			Dimension orden_precio[100]
			Dimension orden_tiempo[100]
			Dimension orden_categoria[100]
			
			// variables auxiliares que permiten en desplazarse por las listas 
			Definir orden_contador, i, eleccion, indice, nueva_eleccion Como Entero
			Definir opcion Como Cadena
			
			// Elementos del menu de pollos 
			descripcion[1]<-"pollo asado"
			precio[1]<-200
			tiempo[1]<-20
			categoria[1]<-"PTF"
			
			descripcion[2]<-"pollo frito"
			precio[2]<-150
			tiempo[2]<-15
			categoria[2]<-"PTF"
			
			descripcion[3]<-"pollo rostisado"
			precio[3]<-180
			tiempo[3]<-30
			categoria[3]<-"PTF"
			
			descripcion[4]<-"pollo a la plancha"
			precio[4]<-120
			tiempo[4]<-15
			categoria[4]<-"PTF"
			
			descripcion[5]<-"alitas de pollo"
			precio[5]<-220
			tiempo[5]<-25
			categoria[5]<-"PTF"
			
			descripcion[6]<-"limonada"
			precio[6]<-30
			tiempo[6]<-0
			categoria[6]<-"BBD"
			
			descripcion[7]<-"te frio"
			precio[7]<-25
			tiempo[7]<-0
			categoria[7]<-"BBD"
			
			descripcion[8]<-"cerveza"
			precio[8]<-60
			tiempo[8]<-0
			categoria[8]<-"BBD"
			
			descripcion[9]<-"jamaica"
			precio[9]<-40
			tiempo[9]<-0
			categoria[9]<-"BBD"
			
			descripcion[10]<-"horchata"
			precio[10]<-50
			tiempo[10]<-0
			categoria[10]<-"BBD"
			
			descripcion[11]<-"pay de manzana"
			precio[11]<-115
			tiempo[11]<-10
			categoria[11]<-"PST"
			
			descripcion[12]<-"pay de limon"
			precio[12]<-100
			tiempo[12]<-10
			categoria[12]<-"PST"
			
			descripcion[13]<-"pastel de chocolate"
			precio[13]<-90
			tiempo[13]<-10
			categoria[13]<-"PST"
			
			descripcion[14]<-"flan casero"
			precio[14]<-120
			tiempo[14]<-10
			categoria[14]<-"PST"
			
			descripcion[15]<-"helado de coco"
			precio[15]<-80
			tiempo[15]<-10
			categoria[15]<-"PST"
			
			orden_contador<-0
			
			// Bucle principal de comandos para determinar la accion del usuario
			Repetir
				Escribir ""
				Escribir "Gestión de Órdenes"
				Escribir "1. Agregar Orden"
				Escribir "2. Editar Orden"
				Escribir "3. Eliminar Orden"
				Escribir "4. Listar Órdenes"
				Escribir "5. Salir"
				Escribir "6. Imprimir factura"
				Escribir "Seleccione una opción:"
				Leer opcion
				
				//Cada caso de este Segun representa una Funcion que estará dentro de un módulo dedicado
				//para cada una de ellas que será importado al programa principal. Los nombres están definidos
				//por el comentario arriba de cada caso
				Segun opcion
					
					
					// agregar_orden() 
					Caso "1":
						
						Para i<-1 Hasta 15
							Escribir i, ". ", descripcion[i], " - ", precio[i], " Córdobas"
						FinPara
						
						Escribir "Ingrese número de producto:"
						Leer eleccion
						
						Si eleccion>=1 Y eleccion<=15 Entonces
							orden_contador<-orden_contador+1
							orden_descripcion[orden_contador] <- descripcion[eleccion]
							orden_precio[orden_contador] <- precio[eleccion]
							orden_tiempo[orden_contador] <- tiempo[eleccion]
							orden_categoria[orden_contador] <- categoria[eleccion]
							Escribir descripcion[eleccion], " agregado."
							
						Sino
							Escribir "Selección inválida."
							
						FinSi
						
						
					// editar_orden()	
					Caso "2":
						
						Si orden_contador=0 Entonces
							Escribir "No hay órdenes para editar."
							
						Sino
							Para i<-1 Hasta orden_contador
								Escribir i, ". ", orden_descripcion[i], " - ", orden_precio[i]
							FinPara
							
							Escribir "Orden a modificar:"
							Leer indice
							
							Si indice>=1 Y indice<=orden_contador Entonces
								Para i<-1 Hasta 15
									Escribir i, ". ", descripcion[i], " - ", precio[i]
								FinPara
								
								Escribir "Nuevo producto:"
								Leer nueva_eleccion
								
								Si nueva_eleccion>=1 Y nueva_eleccion<=15 Entonces
									orden_descripcion[indice]<-descripcion[nueva_eleccion]
									orden_precio[indice]<-precio[nueva_eleccion]
									orden_tiempo[indice]<-tiempo[nueva_eleccion]
									orden_categoria[indice]<-categoria[nueva_eleccion]
									Escribir "Orden actualizada."
									
								FinSi
								
							FinSi
							
						FinSi
						
						
					// eliminar_orden()	
					Caso "3":
						
						Si orden_contador=0 Entonces
							Escribir "No hay órdenes para eliminar."
							
						Sino
							Para i<-1 Hasta orden_contador
								Escribir i, ". ", orden_descripcion[i], " - ", orden_precio[i]
							FinPara
							
							Escribir "Orden a eliminar:"
							Leer indice
							
							Si indice>=1 Y indice<=orden_contador Entonces
								Escribir orden_descripcion[indice], " eliminado."
								
								Para i<-indice Hasta orden_contador-1
									orden_descripcion[i]<-orden_descripcion[i+1]
									orden_precio[i]<-orden_precio[i+1]
									orden_tiempo[i]<-orden_tiempo[i+1]
									orden_categoria[i]<-orden_categoria[i+1]
								FinPara
								
								orden_contador<-orden_contador-1
							FinSi
							
						FinSi
						
						
					// listar_orden()	
					Caso "4":
						
						Si orden_contador=0 Entonces
							Escribir "No hay órdenes registradas."
							
						Sino
							Para i<-1 Hasta orden_contador
								Escribir i, ". ", orden_descripcion[i], " - ", orden_precio[i]
							FinPara
							
						FinSi
						
						
					//salir del programa	
					Caso "5":
						
						Escribir "Gracias. ¡Hasta luego!"
						
					De Otro Modo:
						Escribir "Opción inválida."
						
						
					//imprimir_factura()
					Caso "6":
						
						Escribir "FACTURA DE LA ORDEN:"
						Escribir "------------------------"
						
						suma <- 0
						tiempo_total <- 0
						
						Si orden_contador = 0 Entonces
							Escribir "No hay productos en la orden."
							
						Sino
							Para i <- 1 Hasta orden_contador Con Paso 1
								Escribir "Producto ", i, ": ", orden_descripcion[i]
								Escribir "Precio: C$ ", orden_precio[i]
								Escribir "Tiempo estimado: ", orden_tiempo[i], " minutos"
								Escribir "Categoría: ", orden_categoria[i]
								Escribir ""
								suma <- suma + orden_precio[i]
								tiempo_total <- tiempo_total + orden_tiempo[i]
							FinPara
							
							Escribir "------------------------"
							Escribir "TOTAL A PAGAR: C$ ", suma
							Escribir "TIEMPO TOTAL ESTIMADO: ", tiempo_total, " minutos"
							Escribir "Gracias por su compra. ¡Vuelva pronto!"
							
						FinSi
						
				FinSegun
				
			Hasta Que opcion="5" o opcion = "6"
			
FinAlgoritmo





