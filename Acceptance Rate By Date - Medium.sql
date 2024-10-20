with a as
(
select *  from fb_friend_requests where action='accepted'
),b as(
select *  from fb_friend_requests  where action='sent'
)

select b.date, count(a.user_id_receiver)/count(b.user_id_sender)
from b
left join a on a.user_id_sender=b.user_id_sender 
    and a.user_id_receiver=b.user_id_receiver
group by b.date
