-- 03_Clinic_Schema_Setup.sql

-- Create Database
create database if not exists clinic_schema_setup;

-- Use Database
use clinic_schema_setup;

drop table if exists expenses;
drop table if exists clinic_sales;
drop table if exists customer;
drop table if exists clinics;

-- Create Clinics table
create table clinics (
    cid varchar(50) primary key,
    clinic_name varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50)
);

-- Create Customer table
create table customer (
    uid varchar(50) primary key,
    name varchar(50),
    mobile varchar(15)
);

-- Create Clinic Sales table
create table clinic_sales (
    oid varchar(50) primary key,
    uid varchar(50),
    cid varchar(50),
    amount decimal(10,2),
    datetime datetime,
    sales_channel varchar(50),
    foreign key (uid) references customer(uid),
    foreign key (cid) references clinics(cid)
);

-- Create Expenses table
create table expenses (
    eid varchar(50) primary key,
    cid varchar(50),
    description varchar(100),
    amount decimal(10,2),
    datetime datetime,
    foreign key (cid) references clinics(cid)
);

-- Sample Data
insert into clinics values
('CL1', 'City Care Clinic', 'Chennai', 'Tamil Nadu', 'India'),
('CL2', 'Health Plus Clinic', 'Bangalore', 'Karnataka', 'India'),
('CL3', 'Wellness Center', 'Mumbai', 'Maharashtra', 'India'),
('CL4', 'City Health Center', 'Chennai', 'Tamil Nadu', 'India'),
('CL5', 'Metro Clinic', 'Bangalore', 'Karnataka', 'India'),
('CL6', 'Prime Care', 'Chennai', 'Tamil Nadu', 'India'),
('CL7', 'LifeLine Clinic', 'Bangalore', 'Karnataka', 'India'),
('CL8', 'Urban Health', 'Mumbai', 'Maharashtra', 'India');

insert into customer values
('USR1', 'Rahul Sharma', '9876543210'),
('USR2', 'Priya Nair', '9123456780'),
('USR3', 'Arjun Mehta', '9988776655'),
('USR4', 'Sneha Iyer', '9012345678'),
('USR5', 'Karthik Reddy', '9090909090'),
('USR6', 'Anjali Verma', '9887766554'),
('USR7', 'Rohit Singh', '9776655443'),
('USR8', 'Neha Kapoor', '9665544332');

insert into clinic_sales values
-- september (important for ranking)
('ORD1', 'USR1', 'CL1', 3000, '2021-09-10 09:00:00', 'online'),
('ORD2', 'USR2', 'CL2', 2000, '2021-09-11 10:00:00', 'offline'),
('ORD3', 'USR3', 'CL4', 6000, '2021-09-12 10:00:00', 'online'),
('ORD4', 'USR4', 'CL4', 4000, '2021-09-18 11:00:00', 'offline'),
('ORD5', 'USR5', 'CL5', 7000, '2021-09-20 12:00:00', 'online'),
('ORD6', 'USR6', 'CL5', 3000, '2021-09-25 14:00:00', 'partner'),
('ORD7', 'USR7', 'CL6', 5000, '2021-09-14 10:00:00', 'online'),
('ORD8', 'USR8', 'CL7', 4500, '2021-09-16 11:00:00', 'offline'),

-- other months
('ORD9', 'USR1', 'CL1', 5000, '2021-10-10 10:00:00', 'online'),
('ORD10', 'USR2', 'CL2', 7000, '2021-10-15 11:30:00', 'offline'),
('ORD11', 'USR3', 'CL3', 8000, '2021-11-20 09:00:00', 'online'),
('ORD12', 'USR4', 'CL8', 6000, '2021-11-25 14:00:00', 'partner');

insert into expenses values
-- september
('EXP1', 'CL1', 'staff', 1000, '2021-09-11 09:00:00'),
('EXP2', 'CL2', 'maintenance', 1500, '2021-09-12 10:00:00'),
('EXP3', 'CL4', 'equipment', 2000, '2021-09-15 10:00:00'),
('EXP4', 'CL5', 'maintenance', 3500, '2021-09-22 12:00:00'),
('EXP5', 'CL6', 'utilities', 1200, '2021-09-18 11:00:00'),
('EXP6', 'CL7', 'staff', 1800, '2021-09-20 12:00:00'),

-- other months
('EXP7', 'CL1', 'equipment', 2000, '2021-10-12 10:00:00'),
('EXP8', 'CL2', 'maintenance', 3000, '2021-10-18 12:00:00'),
('EXP9', 'CL3', 'utilities', 1500, '2021-11-28 15:00:00'),
('EXP10', 'CL8', 'rent', 2500, '2021-11-30 10:00:00');
