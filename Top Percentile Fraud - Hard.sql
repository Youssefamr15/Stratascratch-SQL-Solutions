SELECT policy_num,	state,	claim_cost,	fraud_score
FROM (
    select *,PERCENT_RANK() OVER(PARTITION BY state ORDER BY fraud_score DESC) AS rank_no
    from fraud_score
    ) as t1 
WHERE rank_no <= 0.05
