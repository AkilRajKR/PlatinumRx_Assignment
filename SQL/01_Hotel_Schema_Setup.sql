-- 01_Hotel_Schema_Setup.sql

-- Create Database
create database if not exists hotel_schema_setup;

-- Use Database
use hotel_schema_setup;

drop table if exists booking_commercials;
drop table if exists bookings;
drop table if exists items;
drop table if exists users;

-- Create Users table
create table users (
    user_id varchar(50) primary key,
    name varchar(50),
    phone_number varchar(15),
    mail_id varchar(100),
    billing_address varchar(150)
);

-- Create Bookings table
create table bookings (
    booking_id varchar(50) primary key,
    booking_date datetime,
    room_no varchar(50),
    user_id varchar(50),
    foreign key (user_id) references users(user_id)
);

-- Create Items table
create table items (
    item_id varchar(50) primary key,
    item_name varchar(100),
    item_rate decimal(10,2)
);

-- Create Booking Commercials table
create table booking_commercials (
    id varchar(50) primary key,
    booking_id varchar(50),
    bill_id varchar(50),
    bill_date datetime,
    item_id varchar(50),
    item_quantity decimal(10,2),
    foreign key (booking_id) references bookings(booking_id),
    foreign key (item_id) references items(item_id)
);

-- Sample Data
insert into users values
('USR1', 'Rahul Sharma', '9876543210', 'rahul.sharma@gmail.com', 'Chennai'),
('USR2', 'Priya Nair', '9123456780', 'priya.nair@gmail.com', 'Bangalore'),
('USR3', 'Arjun Mehta', '9988776655', 'arjun.mehta@gmail.com', 'Mumbai');

insert into bookings values
('BK20211001', '2021-10-10 10:00:00', 'RM101', 'USR1'),
('BK20211101', '2021-11-15 12:30:00', 'RM102', 'USR1'),
('BK20211102', '2021-11-20 09:15:00', 'RM201', 'USR2'),
('BK20211002', '2021-10-25 14:00:00', 'RM301', 'USR3');

insert into items values
('ITM1', 'Tawa Paratha', 20),
('ITM2', 'Mix Veg Curry', 120),
('ITM3', 'Paneer Butter Masala', 220);

insert into booking_commercials values
('BC1', 'BK20211001', 'BILL11', '2021-10-10 12:00:00', 'ITM1', 2),
('BC2', 'BK20211001', 'BILL11', '2021-10-10 12:00:00', 'ITM2', 1),
('BC3', 'BK20211101', 'BILL12', '2021-11-15 13:00:00', 'ITM3', 3),
('BC4', 'BK20211102', 'BILL13', '2021-11-20 10:00:00', 'ITM1', 5),
('BC5', 'BK20211002', 'BILL14', '2021-10-25 15:00:00', 'ITM2', 10);