select 
    from_user,
    count(from_user) as total_emails,
    rank() over(order by count(from_user) desc,from_user asc) as rank_no
from google_gmail_emails
group by from_user
