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

create table Captain (
    captain_id int primary key auto_increment,
    name varchar(100) not null,
    phone varchar(20) not null,
    vehicle_type varchar(50),
    vehicle_plate varchar(20),
    status enum('available','busy','inactive') default 'available'
);

create table `Order` (
    order_id int primary key auto_increment,
    customer_id int not null,
    branch_id int not null,
    captain_id int null,
    ord_street varchar(100),
    ord_building varchar(50),
    ord_floor varchar(20),
    ord_gps_coord varchar(100),
    is_donation boolean default false,
    status enum('pending','preparing','delivering','completed','cancelled') default 'pending',
    scheduled_delivery_time datetime null,
    ordered_at datetime default current_timestamp,
    foreign key (customer_id) references Customer(customer_id),
    foreign key (branch_id) references Branch(branch_id),
    foreign key (captain_id) references Captain(captain_id)
);

create table Wallet_Ledger (
    transaction_id int primary key auto_increment,
    customer_id int not null,
    ref_order_id int null,
    transaction_type enum('credit','debit') not null,
    amount decimal(10,2) not null check (amount > 0),
    created_at datetime default current_timestamp,
    foreign key (customer_id) references Customer(customer_id) on delete cascade,
    foreign key (ref_order_id) references `Order`(order_id) on delete set null
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

create table Promo_Code (
    promo_id int primary key auto_increment,
    code varchar(50) not null unique,
    discount_type enum('percentage','fixed') not null,
    discount_value decimal(10,2) not null check (discount_value > 0),
    expiration_date date not null,
    usage_limit_per_user int default 1 check (usage_limit_per_user >= 0),
    usage_limit_global int default 0 check (usage_limit_global >= 0)
);

create table Promo_Usage (
    promo_usage_id int primary key auto_increment,
    promo_id int not null,
    customer_id int not null,
    order_id int not null,
    foreign key (promo_id) references Promo_Code(promo_id) on delete cascade,
    foreign key (customer_id) references Customer(customer_id) on delete cascade,
    foreign key (order_id) references `Order`(order_id) on delete cascade
);

create table Order_Items (
    order_item_id int primary key auto_increment,
    order_id int not null,
    item_id int not null,
    quantity int default 1 check (quantity > 0),
    foreign key (order_id) references `Order`(order_id) on delete cascade,
    foreign key (item_id) references Item(item_id)
);

create table Order_Item_Modifier (
    item_modifier_id int primary key auto_increment,
    order_item_id int not null,
    modifier_option_id int not null,
    foreign key (order_item_id) references Order_Items(order_item_id) on delete cascade,
    foreign key (modifier_option_id) references Modifier_Option(option_id)
);

create table Paymentpromo_usage (
    payment_id int primary key auto_increment,
    order_id int not null,
    payment_type enum('cash','card','wallet') not null,
    status enum('pending','completed','failed') default 'pending',
    amount decimal(10,2) not null check (amount > 0),
    foreign key (order_id) references `Order`(order_id) on delete cascade
);

create table Restaurant_Review (
    review_id int primary key auto_increment,
    restaurant_id int not null,
    order_id int not null,
    rating int check (rating >= 1 and rating <= 5),
    foreign key (restaurant_id) references Restaurant(restaurant_id) on delete cascade,
    foreign key (order_id) references `Order`(order_id) on delete cascade
);

create table Item_Review (
    review_id int primary key auto_increment,
    order_item_id int not null,
    rating int check (rating >= 1 and rating <= 5),
    foreign key (order_item_id) references Order_Items(order_item_id) on delete cascade
);

create table Captain_Review (
    review_id int primary key auto_increment,
    captain_id int not null,
    order_id int not null,
    rating int check (rating >= 1 and rating <= 5),
    foreign key (captain_id) references Captain(captain_id),
    foreign key (order_id) references `Order`(order_id)
);

create table Captain_Earning (
    captain_id int not null,
    order_id int not null,
    base_pay decimal(10,2) not null check (base_pay >= 0),
    foreign key (captain_id) references Captain(captain_id),
    foreign key (order_id) references `Order`(order_id)
);
