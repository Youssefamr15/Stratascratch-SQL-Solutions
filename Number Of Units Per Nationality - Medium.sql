select 
    nationality,
    count(distinct u.unit_id)
from airbnb_hosts h
join airbnb_units u 
on h.host_id = u.host_id
where h.age < 30 and u.unit_type = 'Apartment'
group by u.host_id
order by count(u.unit_id) desc
