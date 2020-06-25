/* Prerequisites */
-- Use the Bank_Holidays and bank_inventory tables to answer the below questions

# Question 1:
# 1) Increase the length of geo_location size of 30 characters.

select * from bank_inventory;
describe bank_inventory;
alter table bank_inventory modify geo_location varchar(30);

# Question 2:
# 2) Update  estimated_sale_price of bank_inventory by with an increase of 15%  when the quantity of product is more than 4.

update bank_inventory set estimated_sale_price=estimated_sale_price + (estimated_sale_price*(15/100)) where quantity>4; 

# Question 3:
# 3) Insert below record by increasing 10% of estimated_sale_price to the given estimated_sale_price 
		-- Product : DailCard
		-- Quantity: 2 
		-- price : 380.00 
		-- Puchase_cost : 8500.87
		-- estimated_sale_price: 9000.00
 
 insert into bank_inventory(product,quantity,price,purchase_cost,estimated_sale_price) 
 values('DailCard',2,380.00,8500.87,9000.00+(9000.00*10/100));
 
# Question 4:
# 4) Delete the records from bank_inventory when the difference of estimated_sale_price and 
-- Purchase_cost is less than 5% of estimated_sale_price 

delete from bank_inventory where estimated_sale_price-purchase_cost<estimated_sale_price*(5/100);

# Question 5:
# 5) Update the end time of bank holiday to 2020-03-20 11:59:59 for the holiday on 2020-03-20
 
 update bank_holidays set end_time='2020-03-20 11:59:59' where holiday='2020-03-20';
 
describe bank_holidays;
