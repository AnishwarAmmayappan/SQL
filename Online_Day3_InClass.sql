use Property_Price_Train_new;

# Q1. Write MySQL query to print details of Property_Price_Train_new whose Brick_Veneer_Type ends with e and contains 4 alphabets.

select * from property_price_train_new where brick_veneer_type like '___e';

# Q2. Fetch the 3 highest value of column Brick_Veneer_Area from Property_Price_Train_new table

select brick_veneer_area from property_price_train_new order by brick_veneer_area desc limit 2,1;

# Q3.Extract total Sale_Price for each year_sold column of Property_Price_Train_new table.

select sum(sale_price) as total_sales_price,year_sold from property_price_train_new group by(year_sold);

# Q4.Count all duplicate values of column Brick_Veneer_Type from tbale Property_Price_Train_new

select count(*)-1 as duplicate_count,brick_veneer_type from property_price_train_new group by brick_veneer_type;

# Q5. Find all the players from both matches.

select * from cricket_1;
select * from cricket_2;

select a.player_id,a.player_name from cricket_1 a inner join cricket_2 b on a.player_id=b.player_id; 

# Q6.Write MySQL query to extract maximum runs of players get only top two players

select a.player_id,a.player_name,a.runs from cricket_1 a 
inner join cricket_2 b on a.player_id=b.player_id 
order by a.runs desc
limit 2;

select * from cricket_1 a left outer join cricket_2 b on a.player_id=b.player_id;
# Q7.Create the table with following table regions (region_id, region_name) with following details
/*region_id        - int unsigned
region_name - varchar(25)*/

create table region (
region_id int unsigned,
region_name varchar(25));

describe region;

#8 Create the table with following schema countries (country_id, country_name_region_id) with following details
/*country_id -   char(2)
country_name - varchar(40)
region_id  - int unsigned (region_id is referencing regions table)*/

create table country(
country_id char(2),
country_name varchar(40),
region_id int unsigned REFERENCES region(region_id)
);

describe country;