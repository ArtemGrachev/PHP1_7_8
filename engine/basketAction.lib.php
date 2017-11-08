<?php
function makeBasketAction($good, $quantity = 0) {
    $goodPrice = (int)(getRowResult("SELECT good_price
    FROM goods
    WHERE id_good = ". (int)$good ."
    AND is_active = 1")['good_price']);
    if (!alreadyLoggedIn()) {
        return '{result: 0,
        errorMessage: "Вы не авторизированы на изменение корзины"}';
    } elseif ((int)$good === 0) {
        return '{result: 0,
        errorMessage: "Неправильный номер товара ('.$good.')"}';
    } elseif ($goodPrice < 1) {
        return '{result: 0,
        errorMessage: "Нет товара с таким идентификатором ('.$good.')"}';
    } else {
        $good = (int)$good;
        $quantity = (int)$quantity;
        $seachInBasket = (int)(getRowResult("SELECT id_basket
            FROM basket 
            WHERE id_user = ". (int)$_SESSION['user']['id_user'] ."
            AND id_good = ".$good."
            AND is_in_order = 0
            AND quantity > 0")['id_basket']);
        if ($quantity > 0) {
            if ($seachInBasket > 0) {
                executeQuery("UPDATE basket
                    SET quantity = ". $quantity .",
                    price = ". ($goodPrice * $quantity) ."
                    WHERE id_basket = '". $seachInBasket ."'");
                return '{result: 1}';
            } else {
                executeQuery("INSERT INTO basket
                    SET id_good = ". $good .",
                    id_user = ". (int)$_SESSION['user']['id_user'] .",
                    quantity = ". $quantity .",
                    price = ". ($goodPrice * $quantity));
                return '{result: 1}';
            }
        } elseif ($seachInBasket > 0) {
            executeQuery("DELETE FROM basket
                WHERE id_basket = ". $seachInBasket);
            return '{result: 1}';
        } else {
            return '{result: 0,
            errorMessage: "Запись для удаления не найдена ('.$good.')"}';
        }
    }
}