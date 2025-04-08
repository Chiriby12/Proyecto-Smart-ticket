<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login de Abogado</title>
</head>
<body>
    <h2>Login de Abogado</h2>
    <form method="POST" action="">
        <label for="correo">Correo:</label><br>
        <input type="email" id="correo" name="correo" required><br><br>

        <label for="telefono">Teléfono:</label><br>
        <input type="text" id="telefono" name="telefono" required><br><br>

        <input type="submit" value="Iniciar Sesión">
    </form>

    <?php
    session_start();

    // Datos de conexión
    $servername = "localhost";
    $username = "root";
    $password = "leon123";
    $dbname = "smart";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $correo = $_POST['correo'];
        $telefono = $_POST['telefono'];

        $sql = "SELECT * FROM abogado WHERE correo = ? AND telefono = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $correo, $telefono);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $abogado = $result->fetch_assoc();
            $_SESSION['abogado_id'] = $abogado['idAbogado'];
            $_SESSION['nombre'] = $abogado['nombre_completo'];
            header("Location: index_abogado.php");
            exit();
        } else {
            echo "<p style='color:red;'>Credenciales incorrectas.</p>";
        }

        $stmt->close();
    }

    $conn->close();
    ?>
</body>
</html>
