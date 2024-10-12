select location, AVG(popularity) as avg_popularity
from facebook_employees e
join facebook_hack_survey h ON e.id = h.employee_id
group by location
