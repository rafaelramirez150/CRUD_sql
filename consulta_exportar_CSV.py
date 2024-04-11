import mysql.connector

def ejecutar_consulta(n, d):
    # Configura la conexión a tu base de datos
    conexion = mysql.connector.connect(
        user="root",
        password="root",
        database="ventas"
    )

    try:
        # Crea un cursor para ejecutar la consulta
        cursor = conexion.cursor()

        # Llama al procedimiento almacenado top_n
        cursor.callproc('top_n', (n, d))

        # Recupera los resultados del procedimiento almacenado
        cursor.execute("SELECT * FROM resultados")
        resultados = cursor.fetchall()

        # Muestra los resultados en la terminal
        print("Resultados:")
        for resultado in resultados:
            print(resultado)

        # Hace commit para guardar los cambios en la base de datos
        conexion.commit()

    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Cierra el cursor y la conexión
        cursor.close()
        conexion.close()

# Ejemplo de uso
n = 5
d = 0
ejecutar_consulta(5, 0)
