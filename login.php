<?php
$active = "Iniciar Sesión";
include("db.php");
include("functions.php");
include("header.php");
?>

<!-- Sección de ruta de navegación -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="index.php"><i class="fa fa-home"></i> Inicio</a>
                    <span>Iniciar Sesión</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Sección de inicio de sesión -->
<div class="register-login-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="login-form">
                    <h2>Iniciar Sesión</h2>
                    <form action="login.php" method="post">
                        <div class="group-input">
                            <label for="correo">Correo electrónico *</label>
                            <input type="text" id="correo" name="correo_cliente" required>
                            <div id="error_correo"></div>
                        </div>
                        <div class="group-input">
                            <label for="clave">Contraseña *</label>
                            <input type="password" id="clave" name="clave_cliente" required>
                            <div id="error_clave"></div>
                        </div>

                        <button name="iniciar_sesion" class="site-btn login-btn">Ingresar</button>
                    </form>
                    <div class="switch-login">
                        <a href="register.php" class="or-login">¿No tienes cuenta? Crea una aquí</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include('footer.php'); ?>
</body>
</html>

<?php
if (isset($_POST['iniciar_sesion'])) {

    $correo = $_POST['correo_cliente'];
    $clave = $_POST['clave_cliente'];
    $id_cliente = $correo;

    $consulta_cliente = "SELECT * FROM customer WHERE customer_email = '$correo' AND customer_pass = '$clave'";
    $resultado_cliente = mysqli_query($con, $consulta_cliente);

    $ip_cliente = getRealIpUser();
    $coincidencias_cliente = mysqli_num_rows($resultado_cliente);

    $consulta_carrito = "SELECT * FROM cart WHERE c_id = '$id_cliente'";
    $resultado_carrito = mysqli_query($con, $consulta_carrito);
    $coincidencias_carrito = mysqli_num_rows($resultado_carrito);

    if ($coincidencias_cliente == 0) {
        echo "
        <script>
            bootbox.alert({
                message: 'Usuario o contraseña incorrectos',
                backdrop: true
            });
        </script>";
        exit();
    }

    if ($coincidencias_cliente == 1 && $coincidencias_carrito == 0) {
        $_SESSION['customer_email'] = $correo;
        echo "<script>window.open('index.php?stat=1','_self')</script>";
    } else {
        $_SESSION['customer_email'] = $correo;
        echo "<script>window.open('check-out.php','_self')</script>";
    }
}
?>
