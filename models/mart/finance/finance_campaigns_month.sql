WITH financedays AS(
    SELECT EXTRACT(MONTH FROM date_date) AS datemonth
    , ads_margin
    , avg_basket
    , operational_margin
    , ads_cost
    , impression
    , click
    , quantity
    , revenue
    , purchase_cost
    , margin
    , shipping_fee
    , log_cost
    FROM {{ref("finance_campaigns_day")}}
)
SELECT datemonth
    , ROUND(SUM(ads_margin),2) AS ads_margin
    , ROUND(SUM(avg_basket),2) AS avg_basket
    , ROUND(SUM(operational_margin,2) AS operational_margin
    , ROUND(SUM(ads_cost),2) AS ads_cost
    , ROUND(SUM(impression),2) AS impression
    , ROUND(SUM(click),2) AS click
    , ROUND(SUM(quantity),2) AS quantity
    , ROUND(SUM(revenue),2) AS revenue
    , ROUND(SUM(purchase_cost),2) AS purchase_cost
    , ROUND(SUM(margin),2) AS margin
    , ROUND(SUM(shipping_fee),2) AS shipping_fee
    , ROUND(SUM(log_cost),2) AS log_cost
FROM financedays
ORDER BY datemonth DESC