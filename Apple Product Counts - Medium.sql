select 
    u.language,
    count(distinct
    CASE 
        WHEN e.device IN ('macbook pro','iphone 5s','ipad air') THEN e.user_id
    ELSE NULL END  ) as n_apple_user,
    count(distinct e.user_id) as n_total_users
from playbook_events e
join playbook_users u 
on e.user_id = u.user_id
group by u.language
order by n_total_users desc
