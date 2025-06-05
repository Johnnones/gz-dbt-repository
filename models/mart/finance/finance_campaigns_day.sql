WITH campaign AS(
    SELECT *
    FROM {{ref("int_campaigns_day")}}
)
SELECT operation.date_date
, ROUND(operation.operational_margin - campaign.ads_cost,2) AS ads_margin
, avg_basket
, operational_margin
, ads_cost
, impression
, click
, total_products_sold AS quantity
, revenue
, total_purchase_cost AS purchase_cost
, ROUND(revenue - total_purchase_cost,2) AS margin
, total_shipping_fee AS shipping_fee
, total_log_cost AS log_cost
FROM {{ref("finance_days")}} AS operation
JOIN campaign USING(date_date)
ORDER BY date_date DESC