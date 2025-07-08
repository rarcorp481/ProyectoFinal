from funciones import agregar_orden, editar_orden, eliminar_orden, listar_orden, ordenes, generar_factura, mostrar_facturas

#Función principal con el menú de opciones que verá el cliente al momento de gestionar su orden
def main():
    while True:
        print("\nGestión de Órdenes")
        print("1. Agregar Orden")
        print("2. Editar Orden")
        print("3. Eliminar Orden")
        print("4. Listar Órdenes")
        print("5. Salir")
        print("6. Generar Factura")
        print("7. Mostrar Registro de Facturas")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            agregar_orden()
        elif opcion == "2":
            editar_orden()
        elif opcion == "3":
            eliminar_orden()
        elif opcion == "4":
            listar_orden()
        elif opcion == "5":
            if ordenes:
                tiempo_total = sum(item['tiempo'] for item in ordenes)
                print(f"\nGracias por su pedido. Su comida estará lista en aproximadamente {tiempo_total} minutos.")
            else:
                print("\nNo hay órdenes registradas. ¡Hasta pronto!")
            break
        elif opcion == "6":
            generar_factura()
        elif opcion == "7":
            mostrar_facturas()
        else:
            print("\nOpción inválida. Intente de nuevo.")

if __name__ == "__main__":
    main()


    