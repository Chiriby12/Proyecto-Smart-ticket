<?php
session_start();

// Verificar si el formulario fue enviado mediante POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Configuración de la conexión a la base de datos
    $servername = "localhost";
    $username = "root";
    $password = "leon123";
    $dbname = "proyecto_pruebaa";

    // Crear la conexión
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    // Obtener y sanitizar los datos del formulario
    $correo = isset($_POST['Correo']) ? $conn->real_escape_string($_POST['Correo']) : null;
    $clave = isset($_POST['Clave']) ? $conn->real_escape_string($_POST['Clave']) : null;

    // Verificar que los datos no estén vacíos
    if ($correo && $clave) {
        // Consultar el usuario en la base de datos
        $sql = "SELECT idPersona, id_Rol FROM persona WHERE Correo = '$correo' AND Clave = '$clave'";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            $row = $result->fetch_assoc();

            // Verificar si el usuario es estudiante (id_Rol = 4 en este ejemplo)
            if ($row['id_Rol'] == 4) { 
                // Guardar el ID del usuario en la sesión
                $_SESSION['idPersona'] = $row['idPersona'];
                $_SESSION['id_Rol'] = $row['id_Rol'];
                
                // Redirigir a la página de estudiantes
                header("Location: ../../html/index-Estudiantes.html");
                exit();
            } else {
                // Si el rol no es de estudiante
                $_SESSION['error'] = "Acceso denegado: No tienes permisos para entrar como estudiante.";
            }
            // Verificar si el usuario es estudiante (id_Rol = 4 en este ejemplo)
            if ($row['id_Rol'] == 5) { 
                // Guardar el ID del usuario en la sesión
                $_SESSION['idPersona'] = $row['idPersona'];
                $_SESSION['id_Rol'] = $row['id_Rol'];
                
                // Redirigir a la página de docentes
                header("Location: ../../html/index-Docente.html");
                exit();
            } else {
                // Si el rol no es de estudiante
                $_SESSION['error'] = "Acceso denegado: No tienes permisos para entrar como estudiante.";
            }
            // Verificar si el usuario es estudiante (id_Rol = 4 en este ejemplo)
            if ($row['id_Rol'] == 6) { 
                // Guardar el ID del usuario en la sesión
                $_SESSION['idPersona'] = $row['idPersona'];
                $_SESSION['id_Rol'] = $row['id_Rol'];
                
                // Redirigir a la página de administradores
                header("Location: ../../html/index(3).html");
                exit();
            } else {
                // Si el rol no es de estudiante
                $_SESSION['error'] = "Acceso denegado: No tienes permisos para entrar como estudiante.";
            }
        } else {
            // Si el usuario no se encontró o la clave es incorrecta
            $_SESSION['error'] = "Correo o clave incorrectos.";
        }
    } else {
        $_SESSION['error'] = "Todos los campos son obligatorios.";
    }

    // Redirigir de vuelta al formulario de login si hay error
    header("Location: ../../html/authentication-login.html");
    exit();
} else {
    // Si alguien intenta acceder directamente a este script sin enviar el formulario
    header("Location: ../../html/authentication-login.html");
    exit();
}
?>
