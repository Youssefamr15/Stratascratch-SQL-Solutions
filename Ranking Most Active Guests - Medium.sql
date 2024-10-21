select 
    id_guest,
    dense_rank() over(order by sum(n_messages) desc) as ranks,
    SUM(n_messages) as messages
from airbnb_contacts
group by id_guest
