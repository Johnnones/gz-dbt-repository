WITH campaign AS(
    SELECT *
    FROM {{ref("int_campaigns_day")}}
)
SELECT operation.date_date
, operation.operational_margin - campaign.ads_cost AS ads_margin
, avg_basket
, operational_margin
, ads_cost
, impression
, click
, total_products_sold
, revenue
, total_purchase_cost
, margin
, total_shipping_fee
, total_log_cost
FROM {{ref("finance_days")}} AS operation
JOIN campaign USING(date_date)
ORDER BY date_date DESC