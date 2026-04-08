-- 04_Clinic_Queries.sql

-- Q1: Revenue by sales channel
-- Logic: Group revenue by each sales channel
select sales_channel,sum(amount) as total_revenue
from clinic_sales
where year(datetime) = 2021
group by sales_channel;

-- Q2: Top 10 customers
-- Logic: Find top customers based on spending
select c.uid,c.name,sum(cs.amount) as total_spent
from clinic_sales cs
join customer c on cs.uid = c.uid
where year(cs.datetime) = 2021
group by c.uid, c.name
order by total_spent desc
limit 10;

-- Q3: Monthly revenue, expense, profit, status
-- Logic: Combine revenue and expense month wise
with monthly_revenue as (
    select month(datetime) as month_no,sum(amount) as revenue
    from clinic_sales
    where year(datetime) = 2021
    group by month(datetime)
),
monthly_expense as (
    select month(datetime) as month_no,sum(amount) as expense
    from expenses
    where year(datetime) = 2021
    group by month(datetime)
)
select coalesce(r.month_no, e.month_no) as month_no,
       coalesce(r.revenue, 0) as total_revenue,
       coalesce(e.expense, 0) as total_expense,
       coalesce(r.revenue, 0) - coalesce(e.expense, 0) as profit_loss
from monthly_revenue r
left join monthly_expense e on r.month_no = e.month_no

union

select coalesce(r.month_no, e.month_no) as month_no,
       coalesce(r.revenue, 0) as total_revenue,
       coalesce(e.expense, 0) as total_expense,
       coalesce(r.revenue, 0) - coalesce(e.expense, 0) as profit_loss
from monthly_revenue r
right join monthly_expense e on r.month_no = e.month_no
where r.month_no is null
order by month_no;

-- Q4: Most profitable clinic per city (Sep 2021)
-- Logic: Find most profitable clinic per city
with clinic_revenue as (
    select cid, sum(amount) as revenue
    from clinic_sales
    where year(datetime) = 2021
      and month(datetime) = 9
    group by cid
),
clinic_expense as (
    select cid, sum(amount) as expense
    from expenses
    where year(datetime) = 2021
      and month(datetime) = 9
    group by cid
),
clinic_profit as (
    select c.cid,c.clinic_name,c.city,c.state,
           coalesce(r.revenue, 0) as revenue,
           coalesce(e.expense, 0) as expense,
           coalesce(r.revenue, 0) - coalesce(e.expense, 0) as profit
    from clinics c
    left join clinic_revenue r on c.cid = r.cid
    left join clinic_expense e on c.cid = e.cid
),
ranked_clinics as (
    select city,cid,clinic_name,profit,
    rank() over (partition by city
    order by profit desc) as rnk
    from clinic_profit
)
select city, cid, clinic_name, profit
from ranked_clinics
where rnk = 1
order by city;

-- Q5: Second least profitable clinic per state (Sep 2021)
-- Logic: Get second least profit clinic statewise
with clinic_revenue as (
    select cid, sum(amount) as revenue
    from clinic_sales
    where year(datetime) = 2021
    and month(datetime) = 9
    group by cid
),
clinic_expense as (
    select cid, sum(amount) as expense
    from expenses
    where year(datetime) = 2021
    and month(datetime) = 9
    group by cid
),
clinic_profit as (
    select c.cid,c.clinic_name,c.city,c.state,
           coalesce(r.revenue, 0) as revenue,
           coalesce(e.expense, 0) as expense,
           coalesce(r.revenue, 0) - coalesce(e.expense, 0) as profit
    from clinics c
    left join clinic_revenue r on c.cid = r.cid
    left join clinic_expense e on c.cid = e.cid
),
ranked_clinics as (
    select state,cid,clinic_name,profit,
    row_number() over (partition by state
    order by profit asc) as rnk
    from clinic_profit
)
select state, cid, clinic_name, profit
from ranked_clinics
where rnk = 2
order by state;