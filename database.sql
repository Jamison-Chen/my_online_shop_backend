DELETE FROM shop_product;
DELETE FROM shop_brand;
DELETE FROM shop_category;

ALTER SEQUENCE shop_brand_id_seq RESTART WITH 1;
ALTER SEQUENCE shop_category_id_seq RESTART WITH 1;
ALTER SEQUENCE shop_product_id_seq RESTART WITH 1;

INSERT INTO shop_brand (name) VALUES ('brand_one');
INSERT INTO shop_brand (name) VALUES ('brand_two');
INSERT INTO shop_brand (name) VALUES ('brand_three');
INSERT INTO shop_brand (name) VALUES ('brand_four');

INSERT INTO shop_category (name) VALUES ('category_one');
INSERT INTO shop_category (name) VALUES ('category_two');

INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (1, 1, 'product_one', 100.0, 'description_one', 10);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (1, 1, 'product_two', 199.0, 'description_two', 7);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, inventory)
VALUES (2, 1, 'product_three', 88.8, 20);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (3, 1, 'product_four', 1000.0, 'description_four', 1);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, inventory)
VALUES (2, 2, 'product_five', 666.0, 7);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, inventory)
VALUES (2, 2, 'product_six', 999.0, 0);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (3, 2, 'product_seven', 3999.0, 'description_seven', 1);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (3, 2, 'product_eight', 2890.0, 'description_eight', 3);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (4, 2, 'product_nine', 100.0, 'description_nine', 100);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, inventory)
VALUES (4, 2, 'product_ten', 100.0, 87);
INSERT INTO shop_product (brand_id, category_id, name, unit_price, description, inventory)
VALUES (4, 2, 'product_eleven', 100.0, 'description_eleven', 123);