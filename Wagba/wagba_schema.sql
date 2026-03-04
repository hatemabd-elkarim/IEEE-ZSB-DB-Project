create database wagba;
use wagba;
create table Customer (
    customer_id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique
); 

create table Customer_Phone (
    phone_no varchar(20) primary key,
    customer_id int not null,
    foreign key (customer_id) references Customer(customer_id) on delete cascade
);

create table Address (
    address_id int primary key auto_increment,
    customer_id int not null,
    street varchar(100) not null,
    building varchar(50),
    floor varchar(20),
    gps_coordinates varchar(100) not null,
    foreign key (customer_id) references Customer(customer_id) on delete cascade
);


create table Wallet_Ledger (
    transaction_id int primary key auto_increment,
    customer_id int not null,
    ref_order_id int null,
    transaction_type enum('credit','debit') not null,
    amount decimal(10,2) not null check (amount > 0),
    created_at datetime default current_timestamp,
    foreign key (customer_id) references Customer(customer_id)
        on delete cascade,
    foreign key (ref_order_id) references Orders(order_id)
        on delete set null
);


create table Restaurant (
    restaurant_id int primary key auto_increment,
    name varchar(100) not null,
    cuisine_type varchar(100)
);

create table Branch (
    branch_id int primary key auto_increment,
    restaurant_id int not null,
    location varchar(200) not null,
    open_time time,
    close_time time,
    foreign key (restaurant_id) references Restaurant(restaurant_id) on delete cascade
);

create table Delivery_Zone (
    zone_id int primary key auto_increment,
    branch_id int not null,
    zone_name varchar(100) not null,
    delivery_fee decimal(10,2) not null check (delivery_fee >= 0),
    foreign key (branch_id) references Branch(branch_id) on delete cascade
);

create table Delivery_Pricing_Rule (
    delivery_pricing_id int primary key auto_increment,
    branch_id int not null,
    start_time time not null,
    end_time time not null,
    multiplier decimal(4,2) not null check (multiplier >= 1),
    description varchar(200),
    foreign key (branch_id) references Branch(branch_id) on delete cascade
);


create table Item (
    item_id int primary key auto_increment,
    branch_id int not null,
    category varchar(100) not null,
    name varchar(100) not null,
    price decimal(10,2) not null check (price > 0),
    is_available boolean default true,
    foreign key (branch_id) references Branch(branch_id) on delete cascade 
);


create table Modifier_Group (
    group_id int primary key auto_increment,
    item_id int not null,
    name varchar(100) not null,
    min_select int default 0 check (min_select >= 0),
    max_select int default 1 check (max_select >= 1),
    foreign key (item_id) references Item(item_id) on delete cascade ,
    check (max_select >= min_select)
);

create table Modifier_Option (
    option_id int primary key auto_increment,
    group_id int not null,
    name varchar(100) not null,
    price_change decimal(10,2) default 0,
    foreign key (group_id) references Modifier_Group(group_id) on delete cascade
);
