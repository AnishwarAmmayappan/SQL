# Use tables cricket_1 and cricket_2 to answer the queries. 

# Question 1:

select * from cricket_1;
select * from cricket_2;

# Q1.Extract Player_Id and Player_name of those columns where charisma is null.

select a.player_id,a.player_name from cricket_1 a left outer join cricket_2  b on a.player_id=b.player_id  where charisma is null;

# Question 2:

# Q2.Write MySQL query to extract Player_Id , Player_Name , charisma where charisma is greater than 25.

select player_id,player_name from cricket_2 where charisma>25;

# Question 3:

# Q3.Write MySQL query to extract Player_Id , Player_Name who scored fifty (Runs >=50).

select player_id,player_name,runs from cricket_1 where runs=50 union 
select player_id,player_name,runs from cricket_2 where runs=50;


# Question 4:

# Q4.Write MySQL query to extract Player_Id , Player_Name who have popularity in the range of 10 to 12.

select player_id,player_name from cricket_1 where popularity between 10 and 12;


# Question 5:

# Q5.Write MySQL query to extract Player_id, Player_Name where the Runs and Charisma both are greater than 50.

select player_id,player_name from cricket_2 where runs>50 and charisma>50;
