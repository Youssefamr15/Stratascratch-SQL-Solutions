select ABS(MAX(
    CASE WHEN department = 'engineering' THEN salary ELSE 0
    END) - 
    MAX(
    CASE WHEN department = 'marketing' THEN salary ELSE 0
    END)
    )
from db_employee e
JOIN db_dept d ON e.department_id = d.id
