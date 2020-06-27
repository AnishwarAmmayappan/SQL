# Use bank_inventory, cricket_1 and cricket_2 tables to solve the queries.

# # Question 1:
# Q1.Write MySQL query to find priced product

select product,price from bank_inventory_pricing where price is not null;

# Question 2:

# Q2.Write MySQL query to find third lowest run scorer.

select player_id,player_name,runs from cricket_1
union
select player_id,player_name,runs from cricket_2
order by runs asc limit 2,1 ;

# Question 3:
# Q4. Write MySQL query to find player_ID and Player_name which contains “D”.

select player_id,player_name from cricket_1 where player_name like '%d%'
union
select player_id,player_name from cricket_2 where player_name like '%d%';

# Question 5:

# Q5.Write MySQL query to extract Player_Name whose name starts with 'R'.

select player_id,player_name from cricket_1 where player_name like 'r%'
union
select player_id,player_name from cricket_2 where player_name like 'r%';

# Question 6:

# Q6.Write MySQL query to extract Player_Name whose name whose popularity is grater than 10 or charisma is greater than 50

select player_id,player_name from cricket_1 where popularity>10
union
select player_id,player_name from cricket_2
where charisma>50;

