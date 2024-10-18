with car_2020 as (
    select company_name,count(product_name) as count2020
    from car_launches
    where year = 2020
    group by company_name
),car_2019 as (
    select company_name,count(product_name) as count2019
    from car_launches
    where year = 2019
    group by company_name
)
    
select c_all.company_name, (count2020 - count2019) as total_launch
from car_launches c_all
join car_2020 c20 on c_all.company_name = c20.company_name
join car_2019 c19 on c_all.company_name = c19.company_name
group by c_all.company_name
