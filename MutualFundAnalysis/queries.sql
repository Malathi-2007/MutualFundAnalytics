"""Top 5 Funds by AUM"""

SELECT fund_name,
       SUM(aum) total_aum
FROM fact_aum fa
JOIN dim_fund df
ON fa.fund_id=df.fund_id
GROUP BY fund_name
ORDER BY total_aum DESC
LIMIT 5;


"""Average NAV Per Month"""

SELECT strftime('%Y-%m', full_date),
       AVG(nav)
FROM fact_nav fn
JOIN dim_date dd
ON fn.date_id=dd.date_id
GROUP BY 1;


"""SIP YoY Growth"""

SELECT year,
SUM(amount)
FROM fact_transactions ft
JOIN dim_date dd
ON ft.date_id=dd.date_id
WHERE transaction_type='SIP'
GROUP BY year;

"""Transactions By State"""

SELECT state,
COUNT(*)
FROM fact_transactions
GROUP BY state;


"""Funds Expense Ratio < 1%"""


SELECT *
FROM fact_performance
WHERE expense_ratio < 1;


"""Additional 5 Queries"""

"""Highest Return Fund"""

SELECT *
FROM fact_performance
ORDER BY return_1yr DESC
LIMIT 1;


"""Monthly Redemption Trend"""

SELECT month,
SUM(amount)
FROM fact_transactions ft
JOIN dim_date dd
ON ft.date_id=dd.date_id
WHERE transaction_type='Redemption'
GROUP BY month;

"""Category Wise AUM"""

SELECT category,
SUM(aum)
FROM fact_aum fa
JOIN dim_fund df
ON fa.fund_id=df.fund_id
GROUP BY category;


"""Average Expense Ratio"""

SELECT AVG(expense_ratio)
FROM fact_performance;


"""Top SIP Investors"""


SELECT investor_id,
SUM(amount)
FROM fact_transactions
WHERE transaction_type='SIP'
GROUP BY investor_id
ORDER BY SUM(amount) DESC
LIMIT 10;