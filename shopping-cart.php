<?php
$active = "Carrito de Compras";
include("db.php");
include("functions.php");
include('header.php');
?>

<!-- Sección de Migas de Pan (Breadcrumb) -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="index.php"><i class="fa fa-home"></i> Inicio</a>
                    <a href="shop.php">Tienda</a>
                    <span>Carrito de Compras</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fin Migas de Pan -->

<!-- Sección del Carrito de Compras -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table" style="min-height: 150px;">
                    <table>
                        <tbody>
                            <?php cart_items(); ?>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="cart-buttons">
                            <a href="shop.php" class="primary-btn continue-shop">Seguir comprando</a>
                            <a href="shopping-cart.php?upd=" class="primary-btn up-cart">Actualizar carrito</a>
                        </div>
                    </div>

                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout">
                            <ul>
                                <li class="subtotal">Subtotal <span><?php total_price() ?></span></li>
                                <li class="cart-total">Total <span><?php total_price() ?></span></li>
                            </ul>
                            <a href="check-out.php" class="proceed-btn">PROCEDER AL PAGO</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Fin Carrito de Compras -->

<?php
include('footer.php');
?>

</body>
</html>

<?php

// Eliminar producto del carrito
if (isset($_GET['del'])) {

    $p_id = $_GET['del'];
    $query = "DELETE FROM cart WHERE products_id='$p_id'";
    $run_query = mysqli_query($con, $query);

    echo "<script>window.open('shopping-cart.php','_self')</script>";
}

// Actualizar carrito (nota: parece duplicado, se podría mejorar)
if (isset($_GET['upd'])) {

    $p_id = $_GET['del'];
    $query = "DELETE FROM cart WHERE products_id='$p_id'";
    $run_query = mysqli_query($con, $query);

    echo "<script>window.open('shopping-cart.php','_self')</script>";
}
?>
