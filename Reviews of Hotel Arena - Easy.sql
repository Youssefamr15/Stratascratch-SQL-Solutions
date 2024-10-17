select hotel_name,reviewer_score,COUNT(*)
from hotel_reviews
WHERE hotel_name= 'Hotel Arena'
GROUP BY hotel_name,reviewer_score
