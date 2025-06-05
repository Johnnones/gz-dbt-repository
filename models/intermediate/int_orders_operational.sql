WITH order_margin AS(
    SELECT *
    FROM {{ref("int_orders_margin")}}
)
, ship AS(
    SELECT *
    FROM {{ref("stg_raw__ship")}}
)
SELECT order_margin.*
, ship.shipping_fee
, ship.log_cost
, ship.ship_cost
, ROUND(order_margin.margin + ship.shipping_fee - ship.log_cost - ship.ship_cost,2) AS operational_margin
FROM order_margin
JOIN ship USING(orders_id)
