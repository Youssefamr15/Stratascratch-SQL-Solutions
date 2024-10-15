with t1 as (
    select 
        state,
        count(stars) as five_star_counts,
        rank() over(order by COUNT(*) desc) as state_rank 
    from yelp_business
    where stars = 5 
    group by state
    order by 2 desc,1 
)

select state,five_star_counts
from t1 
where state_rank <= 5
