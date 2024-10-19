with t1 as (
select 
    p.title,
    p.budget as budget ,
    ceil(sum(e.salary) * DATEDIFF(end_date, start_date)/365) as prorated_employee_expense
from linkedin_projects p  
join linkedin_emp_projects ep ON p.id = ep.project_id 
join linkedin_employees e ON e.id = ep.emp_id
group by p.id
)

select *
from t1 
where prorated_employee_expense > budget
