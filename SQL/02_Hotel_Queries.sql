-- 02_Hotel_Queries.sql

-- Q1: Last booked room per user
-- Logic: ROW_NUMBER to get latest booking per user

-- Q1: For every user in the system, get the user_id and last booked room_no

select user_id, room_no from (
    select u.user_id,b.room_no,
    row_number() over (partition by u.user_id
    order by b.booking_date desc) as rnk
    from users u
    left join bookings b
        on u.user_id = b.user_id
) t
where rnk = 1 or rnk is null;

-- Q2: Total billing for bookings in November 2021
-- Logic: SUM(quantity * rate)

select b.booking_id,sum(bc.item_quantity * i.item_rate) as total_amount
from bookings b
join booking_commercials bc on b.booking_id = bc.booking_id
join items i on bc.item_id = i.item_id
where year(b.booking_date) = 2021 and month(b.booking_date) = 11
group by b.booking_id;

-- Q3: Bills > 1000 in October 2021
-- Logic: SUM(quantity * rate)

select bc.bill_id,sum(bc.item_quantity * i.item_rate) as total_bill
from booking_commercials bc
join items i on bc.item_id = i.item_id
where year(bc.bill_date) = 2021 and month(bc.bill_date) = 10
group by bc.bill_id
having sum(bc.item_quantity * i.item_rate) > 1000;

-- Q4: Most and least ordered item per month (2021)
-- Logic: Find most and least items
select * from (
    select month(bc.bill_date) as month,
	i.item_name,sum(bc.item_quantity) as total_qty,
	rank() over (partition by month(bc.bill_date) 
	order by sum(bc.item_quantity) desc) as rnk_desc,
	rank() over (partition by month(bc.bill_date) 
	order by sum(bc.item_quantity) asc) as rnk_asc
    from booking_commercials bc
    join items i on bc.item_id = i.item_id
    where year(bc.bill_date) = 2021
    group by month(bc.bill_date), i.item_name
) t
where rnk_desc = 1 or rnk_asc = 1;

-- Q5: Customers with second highest bill per month (2021)
-- Logic: Fetch second highest monthly bills

with monthly_bill as (
    select month(bc.bill_date) as month_no,
    u.user_id,u.name,bc.bill_id,sum(bc.item_quantity * i.item_rate) as total_bill
    from booking_commercials bc
    join bookings b on bc.booking_id = b.booking_id
    join users u on b.user_id = u.user_id
    join items i on bc.item_id = i.item_id
    where year(bc.bill_date) = 2021
    group by month(bc.bill_date), u.user_id, u.name, bc.bill_id
),
ranked_bills as (
    select month_no,user_id,name,bill_id,total_bill,
    rank() over (partition by month_no
    order by total_bill desc) as rnk
    from monthly_bill
)
select month_no,user_id,name,bill_id,total_bill
from ranked_bills
where rnk = 2
order by month_no;
