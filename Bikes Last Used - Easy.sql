select bike_number, MAX(end_time) as last_used
from dc_bikeshare_q1_2012
group by bike_number
ORDER BY MAX(end_time) desc
