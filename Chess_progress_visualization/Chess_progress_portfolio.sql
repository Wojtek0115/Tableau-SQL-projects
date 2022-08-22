select
    count(case when resoult = 'Win' then 1 else null end) as total_wins,
    count(case when resoult = 'Lose' then 1 else null end) as total_loses,
    count(case when resoult = 'Tie' then 1 else null end) as total_ties,
    count(game_id) as total_games
from chess_progress
--loooking for W/T/L ratio in the future

select
    resoult,
    count(resoult) as sumary
from 
    chess_progress 
group by
    resoult

select
    'Above_1100' as Rating,
    cast(avg(accuracy) as decimal (10,2)) as Average_accuracy,
    cast(avg(moves) as decimal (10,2)) as Average_moves
from 
    Chess_progress
where
    My_rating > 1100
union all
select
    'Below_1100',
    cast(avg(accuracy) as decimal (10,2)) as Average_accuracy,
    cast(avg(moves) as decimal (10,2)) as Average_moves
from 
    chess_progress
where 
    My_rating < 1100

--Looking how effectivness and count of moves change betweeen below 1100 and above 1100 rating

select
    datee, 
    my_rating
from
    Chess_progress
order by    
    datee,
    My_rating asc
    
-- looking at how my rating changes over previous days

with
    days_played as
    (select count(distinct(datee)) as days_played from chess_progress),
    games as
    (select count(Game_id) as games_played from chess_progress),
    Daily_time_played as
    (select games_played / days_played * 10.0 as Daily_time_played from days_played,games)
    select * from days_played,Daily_time_played



