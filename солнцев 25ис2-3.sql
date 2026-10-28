CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    assembly_time TIMESTAMP,
    additional_info TEXT,
    delivery_address VARCHAR(255) NOT NULL
);

CREATE TABLE Order_Contents (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    packaging VARCHAR(100),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders (order_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

INSERT INTO Orders (customer_id, order_date, assembly_time, additional_info, delivery_address)
VALUES 
(101, '2026-10-25', '2026-10-26 12:00:00', 'Позвонить за час до доставки', 'г. Москва, ул. Ленина, д. 10'),
(102, '2026-10-25', '2026-10-27 15:00:00', 'Хрупкий груз', 'г. Москва, пр-т Мира, д. 45'),
(103, '2026-10-26', '2026-10-26 18:00:00', NULL, 'г. Санкт-Петербург, Невский пр-т, д. 1'),
(104, '2026-10-26', '2026-10-28 10:00:00', 'Оставить у консьержа', 'г. Казань, ул. Баумана, д. 15'),
(105, '2026-10-26', '2026-10-27 09:00:00', 'Срочный заказ', 'г. Москва, ул. Арбат, д. 20'),
(106, '2026-10-27', '2026-10-29 14:00:00', 'Не звонить в дверь', 'г. Екатеринбург, ул. Ленина, д. 5'),
(107, '2026-10-27', '2026-10-27 20:00:00', NULL, 'г. Новосибирск, Красный пр-т, д. 100'),
(108, '2026-10-27', '2026-10-30 11:00:00', 'Нужна квитанция', 'г. Москва, ул. Тверская, д. 7'),
(109, '2026-10-28', '2026-10-28 16:00:00', 'Домофон не работает', 'г. Сочи, ул. Курортный пр-т, д. 50'),
(110, '2026-10-28', '2026-10-31 10:00:00', 'Доставка до двери', 'г. Владивосток, ул. Светланская, д. 22');

INSERT INTO Order_Contents (order_id, product_id, quantity, packaging)
VALUES 
(1, 501, 2, 'Коробка'),
(1, 502, 5, 'Пакет'),
(2, 503, 1, 'Картонная коробка'),
(3, 501, 10, 'Паллета'),
(4, 504, 3, 'Термоупаковка'),
(5, 505, 1, 'Деревянный ящик'),
(6, 502, 2, 'Пакет'),
(7, 506, 4, 'Коробка'),
(8, 501, 1, 'Коробка'),
(9, 507, 12, 'Паллета'),
(10, 503, 2, 'Мешок');

SELECT 
    o.order_id, 
    o.customer_id, 
    o.order_date, 
    c.product_id, 
    c.quantity, 
    c.packaging
FROM Orders o
JOIN Order_Contents c ON o.order_id = c.order_id
ORDER BY o.order_id;