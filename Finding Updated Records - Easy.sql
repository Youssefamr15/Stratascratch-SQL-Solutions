select 
    id,
    first_name,
    last_name,
    department_id,
    MAX(salary)
from ms_employee_salary
GROUP BY id
ORDER BY id
