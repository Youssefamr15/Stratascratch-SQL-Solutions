With t1 as (
    select 
        DATE_FORMAT(created_at, '%Y-%m') as ym,
        SUM(value) as c_s,
        lag(SUM(value)) OVER () as l_s
    from sf_transactions
    GROUP BY DATE_FORMAT(created_at, '%Y-%m')
)

SELECT ym, ROUND(((c_s - l_s)/l_s)*100,2)
FROM t1
