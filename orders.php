<?php

if (isset($_SESSION['customer_email'])) {

    $correo_cliente = $_SESSION['customer_email'];

    $consulta_cliente = "SELECT * FROM customer WHERE customer_email = '$correo_cliente'";
    $resultado_cliente = mysqli_query($con, $consulta_cliente);

    $datos_cliente = mysqli_fetch_array($resultado_cliente);
    $id_cliente = $datos_cliente['customer_id'];

    $consulta_pedidos = "SELECT * FROM orders WHERE c_id = '$id_cliente' ORDER BY date DESC";
    $resultado_pedidos = mysqli_query($db, $consulta_pedidos);

    echo "
    <div class='cart-table' style='min-height: 150px;'>
        <table>
            <thead style='font-size: larger;'>
                <tr>
                    <th>ID del Pedido</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Fecha</th>
                </tr>
            </thead>
            <tbody>
    ";

    while ($pedido = mysqli_fetch_array($resultado_pedidos)) {
        $id_pedido = $pedido['order_id'];
        $cantidad = $pedido['order_qty'];
        $precio = $pedido['order_price'];
        $fecha = $pedido['date'];

        echo "
            <tr style='border-bottom: 0.5px solid #ebebeb'>
                <td class='first-row'>$id_pedido</td>
                <td class='first-row'>$precio</td>
                <td class='first-row'>$cantidad</td>
                <td class='first-row'>$fecha</td>
            </tr>
        ";
    }

    echo "
            </tbody>
        </table>
    </div>
    ";
}
?>
