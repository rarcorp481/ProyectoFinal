import datetime
from elementos_menu import menu_de_pollo

ordenes = []
facturas = []  # Registro de facturas
numero_cliente = 1  # Número de cliente único

#Función para mostrar el menú con todos los items y características albergadas en el diccionario
def mostrar_menu():
    print("\nMenú de Pollo:")
    for i, item in enumerate(menu_de_pollo, 1):
        print(f"{i}. {item['descripcion']} - {item['precio']} Córdobas")

#Función para agrerar orden del menú anteriormente mostrado
def agregar_orden():
    mostrar_menu()
    try:
        eleccion = int(input("Ingrese el número del producto que desea pedir: ")) - 1
        if 0 <= eleccion < len(menu_de_pollo):
            ordenes.append(menu_de_pollo[eleccion])
            print(f"\n{menu_de_pollo[eleccion]['descripcion']} agregado a la orden.")
        else:
            print("\nSelección inválida.")
    except ValueError:
        print("\nPor favor, ingrese un número válido.")

#Función para reemplazar un item ya añadido al arreglo "ordenes"
def editar_orden():
    listar_orden()
    try:
        index = int(input("Ingrese el número de la orden que desea modificar: ")) - 1
        if 0 <= index < len(ordenes):
            mostrar_menu()
            nueva_eleccion = int(input("Ingrese el nuevo producto: ")) - 1
            if 0 <= nueva_eleccion < len(menu_de_pollo):
                ordenes[index] = menu_de_pollo[nueva_eleccion]
                print("\nOrden actualizada correctamente.")
            else:
                print("\nSelección inválida.")
        else:
            print("\nNúmero de orden inválido.")
    except ValueError:
        print("\nIngrese un número válido.")

#Función para eliminar un item dentro del arreglo "ordenes"
def eliminar_orden():
    listar_orden()
    try:
        index = int(input("Ingrese el número de la orden que desea eliminar: ")) - 1
        if 0 <= index < len(ordenes):
            eliminado = ordenes.pop(index)
            print(f"\n{eliminado['descripcion']} ha sido eliminado de la orden.")
        else:
            print("\nNúmero de orden inválido.")
    except ValueError:
        print("\nIngrese un número válido.")

#Función para listar los items dentro del arreglo "ordenes"
def listar_orden():
    print("\nÓrdenes actuales:")
    if not ordenes:
        print("No hay órdenes registradas.")
    else:
        for i, item in enumerate(ordenes, 1):
            print(f"{i}. {item['descripcion']} - {item['precio']} Córdobas")

#Generador de facturas para los clientes que han completado su órden
def generar_factura():
    global numero_cliente

    if not ordenes:
        print("\nNo hay órdenes registradas.")
        return

    fecha_actual = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    nombre_archivo = f"factura_cliente_{numero_cliente}.txt"

    with open(nombre_archivo, "w", encoding="utf-8") as archivo:
        archivo.write("----- FACTURA -----\n")
        archivo.write(f"Fecha: {fecha_actual}\n")
        archivo.write(f"Cliente Nº: {numero_cliente}\n\n")

        total = 0
        for i, item in enumerate(ordenes, 1):
            archivo.write(f"{i}. {item['descripcion']} - {item['precio']} Córdobas\n")
            total += item['precio']
        archivo.write(f"\nTotal a pagar: {total} Córdobas\n")
        archivo.write("--------------------\n")

    facturas.append({
        'numero_cliente': numero_cliente,
        'fecha': fecha_actual,
        'total': total
    })
    numero_cliente += 1

    print(f"\nFactura generada exitosamente en el archivo: {nombre_archivo}")

#Función para registrar las facturas en un archivo .txt con la fecha en la que 
#fue generada, el monto total y el número de cliente
def mostrar_facturas():
    print("\nRegistro de Facturas:")
    if not facturas:
        print("No hay facturas registradas.")
    else:
        with open("registro_facturas.txt","a", encoding = "utf-8") as archivo:
            for factura in facturas:
                print(f"Cliente Nº: {factura['numero_cliente']} - Fecha: {factura['fecha']} - Total: {factura['total']} Córdobas")
                archivo.write(f"Cliente Nº: {factura['numero_cliente']} - Fecha: {factura['fecha']} - Total: {factura['total']} Córdobas")


