With t1 as (
    SELECT user1, user2 
    FROM facebook_friends 
    UNION 
    SELECT user2 AS user1, user1 AS user2 
    FROM facebook_friends
)

SELECT 
    user1,
    COUNT(*)/ (select COUNT(DISTINCT user1) 
    from t1) *100
FROM t1 
GROUP BY user1 
ORDER BY user1 
