--#1
SELECT p.name, sbc3.name FROM product p
LEFT JOIN product_to_category ptc ON ptc.product_id = p.id
LEFT JOIN sub_cat_3 sbc3 ON sbc3.id = ptc.product_id
--WHERE p.name IN (...);

--#2
SELECT mc.name main_category_name, sbc1.name cat1_name, sbc2.name cat2_name, sbc3.name cat3_name, p.name product_name FROM main_category mc
LEFT JOIN sub_cat_1 sbc1 ON sbc1.main_category_id = mc.id
LEFT JOIN sub_cat_2 sbc2 ON sbc2.sub_cat1_id = sbc1.id
LEFT JOIN sub_cat_3 sbc3 ON sbc3.sub_cat2_id = sbc2.id
LEFT JOIN product_to_category ptc ON ptc.sub_cat3_id = sbc3.id
LEFT JOIN product p ON p.id = ptc.product_id
--WHERE p.name IN (...);

--#3
SELECT sbc3.name category_name, p.name product_name FROM main_category mc
LEFT JOIN sub_cat_1 sbc1 ON sbc1.main_category_id = mc.id
LEFT JOIN sub_cat_2 sbc2 ON sbc2.sub_cat1_id = sbc1.id
LEFT JOIN sub_cat_3 sbc3 ON sbc3.sub_cat2_id = sbc2.id
LEFT JOIN product_to_category ptc ON ptc.sub_cat3_id = sbc3.id
LEFT JOIN product p ON p.id = ptc.product_id
--WHERE p.name IN (...);

--#4
SELECT DISTINCT p.name as product_name, sbc3.name category_name FROM main_category mc
LEFT JOIN sub_cat_1 sbc1 ON sbc1.main_category_id = mc.id
LEFT JOIN sub_cat_2 sbc2 ON sbc2.sub_cat1_id = sbc1.id
LEFT JOIN sub_cat_3 sbc3 ON sbc3.sub_cat2_id = sbc2.id
LEFT JOIN product_to_category ptc ON ptc.sub_cat3_id = sbc3.id
LEFT JOIN product p ON p.id = ptc.product_id

--#5
SELECT mc.name main_category_name, sbc1.name cat1_name, sbc2.name cat2_name, sbc3.name cat3_name FROM main_category mc
LEFT JOIN sub_cat_1 sbc1 ON sbc1.main_category_id = mc.id
LEFT JOIN sub_cat_2 sbc2 ON sbc2.sub_cat1_id = sbc1.id
LEFT JOIN sub_cat_3 sbc3 ON sbc3.sub_cat2_id = sbc2.id
