select artist, COUNT(*) as n_occurences
from spotify_worldwide_daily_song_ranking
group by artist
order by 2 desc
