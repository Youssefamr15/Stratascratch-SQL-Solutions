WITH nonpaying AS (
    select 
        date,
        SUM(downloads) as non_paying
    from ms_user_dimension u
    join ms_acc_dimension  a ON u.acc_id  = a.acc_id
    JOIN ms_download_facts d ON u.user_id = d.user_id
    where paying_customer = 'no'
    GROUP BY date
    ORDER BY date
)
,paying AS (
    select 
        date,
        SUM(downloads) as paying
    from ms_user_dimension u
    join ms_acc_dimension  a ON u.acc_id  = a.acc_id
    JOIN ms_download_facts d ON u.user_id = d.user_id
    where paying_customer = 'yes'
    GROUP BY date
    ORDER BY date
)

select d.date, np.non_paying, p.paying
FROM ms_download_facts d
JOIN nonpaying np ON d.date = np.date
JOIN paying p ON d.date = p.date
where np.non_paying > p.paying
GROUP BY date
ORDER BY date
