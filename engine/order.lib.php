<?php
function makeOrderAction(){
    $result = [];

    // при отсутствии action - пытаемся оформить заказ
    if(!isset($_GET['action'])){
        $amount = getBasketAmountByUserId($_SESSION["user"]["id_user"]);

        $order_sql = "INSERT INTO orders (id_user, amount, id_status)
                      VALUES(
                        " .$_SESSION["user"]["id_user"]. ",
                        " .$amount. ",
                        1
                      )";

        if(executeQuery($order_sql)){
            $result["success"] = true;

            // получаем ID созданного заказа
            $id_order_sql = "SELECT MAX(id_order) AS id_order FROM orders WHERE id_user = " . $_SESSION["user"]["id_user"];
            $id_order_data = getRowResult($id_order_sql);
            $id_order = $id_order_data["id_order"];

            $result["id_order"] = $id_order;

            // обновляем корзину
            $basket_update_sql = "UPDATE basket
                                  SET id_order = ".(int)$id_order.",
                                      is_in_order = 1
                                  WHERE id_user = ".$_SESSION["user"]["id_user"]."
                                  AND is_in_order = 0
            ";

            executeQuery($basket_update_sql);
        }
        else
            $result["success"] = false;
    }

    return $result;
}