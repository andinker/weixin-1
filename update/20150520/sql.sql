ALTER TABLE  `zfwx_product_cart` 
ADD  `payment_order_id` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER  `payment` ,
ADD  `payment_order_status` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER  `payment_order_id`;