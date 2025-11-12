<?php
$active = "Producto";
include("db.php");
include("functions.php");
include('header.php');
?>
<div style="overflow: hidden;">
    <!-- Sección de Migas de Pan (Breadcrumb) -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="index.php"><i class="fa fa-home"></i> Inicio</a>
                        <a href="shop.php">Tienda</a>
                        <span>Detalles del Producto</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fin de Migas de Pan -->

    <!-- Sección Detalles del Producto -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
                <!-- Categorías -->
                <div class="col-lg-3">
                    <div class="filter-widget">
                        <h4 class="fw-title">Categorías</h4>
                        <ul class="filter-catagories">
                            <?php getCat(); ?>
                        </ul>
                    </div>
                </div>

                <!-- Detalles del Producto -->
                <div class="col-lg-9">
                    <div class="row">
                        <?php
                        getProd();
                        addCart();
                        ?>

                        <!-- Formulario para agregar al carrito -->
                        <form action='product.php?add_cart=<?php 
                            if (isset($_GET['product_id'])) {
                                $product_id = $_GET['product_id'];
                                echo $product_id;
                            } ?>' method='post'>

                            <div class="form-group">
                                <div class='quantity'>
                                    <div class='pro-qty'>
                                        <input type='text' value='1' name="product_qty">
                                    </div>
                                </div>
                            </div>

                            <!-- Selector de tallas -->
                            <div class="form-group">
                                <div class='pd-size-choose'>
                                    <div class='sc-item'>
                                        <input type='radio' id='sm-size' class="form-control" name='size' value="Pequeña" required novalidate>
                                        <label for='sm-size'>S</label>
                                    </div>
                                    <div class='sc-item'>
                                        <input type='radio' id='md-size' class="form-control" name='size' value="Mediana">
                                        <label for='md-size'>M</label>
                                    </div>
                                    <div class='sc-item'>
                                        <input type='radio' id='lg-size' class="form-control" name='size' value="Grande">
                                        <label for='lg-size'>L</label>
                                    </div>
                                    <div class='sc-item'>
                                        <input type='radio' id='xl-size' class="form-control" name='size' value="Extra Grande">
                                        <label for='xl-size'>XL</label>
                                    </div>
                                </div>
                                <p id="msg"></p>
                            </div>

                            <!-- Botón de agregar al carrito -->
                            <?php 
                            if ($_SESSION['customer_email'] == 'unset') {
                                echo "<a href='login.php' class='btn primary-btn pd-cart' style='margin-top: 20px;'>Agregar al carrito</a>";
                            } else {
                                echo "<button class='btn primary-btn pd-cart' id='cartbtn' style='margin-top: 20px;'>Agregar al carrito</button>";
                            }
                            ?>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>

</section>

<!-- Productos Relacionados -->
<div class="related-products spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Productos similares</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <?php relatedProducts(); ?>
        </div>
    </div>
</div>
</div>

<?php include('footer.php'); ?>

<script>
    $("#cartbtn").on('click', function() {
        if (!$("input[name='size']").is(':checked')) {
            $("#msg").html(
                "<span class='alert alert-danger'>Por favor, selecciona una talla antes de continuar.</span>"
            );
        } else {
            return;
        }
    });
</script>

</body>
</html>
