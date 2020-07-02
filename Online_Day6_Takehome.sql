
/* Pre-requisite */
## Use tables Bank_Inventory_pricing, Bank_branch_PL to solve following queries

# Question 1:
# 1) Print product , sum of quantity more than  6 sold during all three months.  

select product,sum(quantity) from bank_inventory_pricing group by product having  sum(quantity)>6;

# Question 2:
# 2) Real Profit = revenue - cost  Find for which products, 
# branch level real profit is more than the estimated_profit in Bank_branch_PL .

select branch,sum(revenue-cost) from bank_branch_pl 
group by branch,product
having sum(estimated_profit)<sum(revenue-cost);

# Question 3:
# 3) Real  Profit = revenue - cost  Print branch and its sum of  estimated_profit and sum of real profit ignoring the loss 

select branch,case 
when sum(revenue-cost)>0 then sum(revenue-cost) 
end as 'real profit' ,sum(estimated_profit)
from bank_branch_pl 
group by branch 
having  case 
when sum(revenue-cost)>0 then sum(revenue-cost) end is not null;

# Question 4:
# 4)  For which products of the banker of the branch , the total loss  is incurred . 
# Note : revenue - cost  is Loss if its value is -ve. 

set sql_mode=only_full_group_by;

select branch, banker, product,
case 
when sum(revenue-cost)<0 then sum(revenue-cost) end 'total loss' 
from bank_branch_pl group by branch,banker,product having (case 
when sum(revenue-cost)<0 then sum(revenue-cost) end) is not null;

# Question 5:
# 5)  Find the least calculated profit earned during all 3 periods

select  min(revenue-cost) as 'least profit'
 from bank_branch_pl where (revenue-cost)>0;  

# Question 6:
# 6)  Find branch level overall calculated profit greater than estimated profit ignoring the products encountered with loss

select branch,sum(revenue-cost) from bank_branch_pl where (revenue-cost)>0
group by branch having sum(revenue-cost)>sum(estimated_profit);

# Question 7:
# 7)  Find products calculated profit at branch reaching the estimated_profit with minimum difference of 10% 

select branch,product,sum(revenue-cost) from bank_branch_pl where (revenue-cost)>0
group by branch,product having (sum(estimated_profit)-sum(revenue-cost))/100>(10/100);

# Question 8:
# 8) Reduce 30% of the cost for all the products and print the products whose  calculated profit 
# at branch is exceeding estimated_profit .

select branch,product,sum(revenue-(cost-(cost*30/100))) from bank_branch_pl where (revenue-cost)>0
group by branch,product having sum(revenue-(cost-(cost*30/100)))>sum(revenue-cost);


