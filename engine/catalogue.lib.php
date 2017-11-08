<?php
/**
 * готовим страницу каталога
 * @param $page_vars
 */
function prepareCataloguePage(&$page_vars){
    $page_vars["css"] = '<link rel="stylesheet" href="/css/catalogue.css">';
    $goods = getAssocResult("SELECT id_good, good_name, good_price
        FROM goods 
        WHERE is_active = 1
        ORDER BY id_good DESC");
    foreach ($goods as $key => $value) {
        if (alreadyLoggedIn()) {
            $quantity = getRowResult("SELECT quantity
            FROM basket 
            WHERE id_user='". $_SESSION['user']['id_user'] ."'
            AND id_good = ". $value['id_good'] ."
            AND is_in_order = 0
            AND quantity > 0");
            if (isset($quantity['quantity']) && $quantity['quantity'] != 0) {
                $goods[$key]['quantity'] = (int)$quantity['quantity'] + 1;
            } else {
                $goods[$key]['quantity'] = 1;
            }
        } else {
            $page_vars["disabled"] = ' disabled';
        }
    }
    $page_vars["goods"] = $goods;
}