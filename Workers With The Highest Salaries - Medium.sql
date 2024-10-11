select t.worker_title as best_paid_title
from worker w 
join title t ON w.worker_id = t.worker_ref_id
Where w.salary = (SELECT Max(salary) FROM  worker) 
