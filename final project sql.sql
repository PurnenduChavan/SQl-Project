create database eCommerce2;

create table registration_form(
registration_form_id int not null primary key,
name varchar(20),
email varchar(20),
password varchar(15),
registration_year int
);
select * from registration_form;
drop table registration_form;
drop table customer_details;

insert into registration_form values
(1,'Ramaesh','ramesh@gmail.com','ramesh123',2020),
(2,'umesh','umesh@gmail.com','umesh123',1019),
(3,'neha','neha@gmail.com','neha123',2022),
(4,'sarvesh','sarvesh@gmail.com','sarvesh123',2021),
(5,'mayur','mayur@gmail.com','mayur123',2021),
(6,'nikhil','nikhil@gmail.com','nikhil123',2018),
(7,'omkar','omkar@gmail.com','omkar123',2021),
(8,'nilesh','nilesh@gmail.com','nilesh123',2015);




create table customer_details(
customer_id int not null primary key,
customer_name varchar(20),
phone_no varchar(10),
address  varchar(50),
pincode int,
city  varchar(20),
gender varchar(10),
registration_form_id int,
foreign key (registration_form_id) references registration_form(registration_form_id)
);
select * from customer_details;
drop table customer_details;
insert into customer_details values
(1,'Ramesh',9874546585,'flat 30 complex 1','411014','Pune','Male',1),
(2,'Umesh',7852145811,'flat 10 complex 3','4110145','Satara','Male',2),
(3,'Neha',9687452114,'flat 5 complex 5','411016','Banguluru','Female',3),
(4,'Sarvesh',9988547456,'flat 70 complex 7','411017','Delhi','Male',4),
(5,'Mayur',9852364712,'flat 8 complex 1','411018','Mumbai','Male',5),
(6,'Nikhil',9754236541,'flat 4 complex 2','411019','Jaipur','Male',6),
(7,'Omkar',9874532147,'flat 9 complex 3','4110110','Kanpur','Male',7),
(8,'Nilesh',9856321475,'flat 40 complex 4','4110111','pune','Male',8);

INSERT INTO customer_details VALUES (9, 'ABC', 1234567890, 'Pune', 411057, 'Pune', 'Male', 8);
SELECT registration_form.name,customer_details.customer_name,customer_details.city,customer_details.pincode,customer_details.phone_no
FROM registration_form,customer_details 
WHERE  registration_form.registration_form_id=customer_details.registration_form_id;

create table pincodes(
pincode_id int not null primary key,
Pincode_no int,
customer_id int,
foreign key (customer_id) references customer_details(customer_id)

);
select * from pincodes;
drop table pincodes;
insert into pincodes values
(1,411014,1),
(2,4110145,2),
(3,411018,3),
(4,411017,4),
(5,411018,6),
(6,411019,7),
(7,4110110,8),
(8,4110111,1),
(9,4110121,2),
(10,4110150,3),
(11,411020,4);

INSERT INTO pincodes VALUES(12,4,5);

select customer_details.pincode,pincodes.Pincode_no,customer_details.customer_name
from customer_details,pincodes
where pincodes.customer_id=customer_details.customer_id;

create table catogary(
catogary_id int not null primary key,
catogary_name varchar(20)
);

insert into catogary values
(1,'Grocery'),
(2,'Mobiles'),
(3,'Fashion'),
(4,'Electronics'),
(5,'Home'),
(6,'Appliances'),
(7,'Furniture'),
(8,'Sports');


create table product_details(
product_id int not null primary key,
product_name varchar(20),
price int,
catogary_id int,
foreign key (catogary_id) references catogary(catogary_id)
);

insert into product_details values
(1,'Atta & Maida',194,1),
(2,'Biscuits',25,1),
(3,'steel utensils',224,5),
(4,'moto g52',13499,2),
(5,'asus tuf dash f15',84990,4),
(6,'Canon EOS 30000D',27499,4),
(7,'Real ME buds',1299,4),
(8,'Samsung (43) 4k smart',35990,4),
(9,'LG 190L',17590,6),
(10,'Franco Leone',990,3),
(11,'Casio',11995,3),
(12,'PUMA Tshirt',599,3),
(13,'moto g22',10999,5),
(14,'Real Me 7',8999,4),
(15,'Dell Laptop',60999,4),
(16,'Wooden Quenn Box Bed',14490,7),
(17,'Badminton Gear',4999,8),
(18,'Real Me Band 2',2999,3),
(19,'keyboard',1049,4),
(20,'truke BG3',1299,4);

select * from product_details;
drop table product_details;

select product_details.product_name,catogary.catogary_name,product_details.price
from catogary,product_details
where product_details.catogary_id=catogary.catogary_id;

-- From product details table we are going into the oerder details table where we see all the information about the perticular product.

create table whislist(
whishlist_id int not null primary key,
product_id int,
foreign key (product_id) references product_details(product_id)
);

insert into whislist values
(1,2),
(2,20),
(3,5),
(4,2),
(5,8),
(6,1),
(7,15),
(8,7);
select product_details.product_name as whislist_names,product_details.price
from whislist,product_details
where whislist.product_id=product_details.product_id;

create table order_details(
order_details_id int not null primary key,
diliver_by varchar(20),
product_id int,
foreign key (product_id) references product_details(product_id)
);

insert into order_details values
(1,'12 jun',1),
(2,'25 july',2),
(3,'11 jun',3),
(4,'9 august',4),
(5,'12 jun',5),
(6,'12 jun',6),
(7,'30 jun',7),
(8,'15 july',8),
(9,'31 jun',9),
(10,'18 august',10),
(11,'1 jun',11),
(12,'6 jun',12),
(13,'22 jun',13),
(14,'10 july',14),
(15,'14 jun',15),
(16,'11 jun',16),
(17,'12 jun',17),
(18,'5 august',18),
(19,'8 jun',19),
(20,'10 jun',20);
select * from order_details;

select order_details.diliver_by,product_details.product_name,product_details.price
from order_details,product_details
where order_details.product_id=product_details.product_id;

create table cart(
cart_id int not null primary key,
order_details_id int,
product_id int,
foreign key (order_details_id) references order_details(order_details_id),
foreign key (product_id) references product_details(product_id)
);


insert into cart values
(1,1,5),
(2,2,5),
(3,6,7),
(4,8,9);

select product_details.product_name,order_details.diliver_by,product_details.price
from cart,product_details,order_details
where cart.order_details_id=order_details.order_details_id and cart.product_id=product_details.product_id;

create table orders(
orders_id int not null primary key,
quantity int,
order_details_id int,
cart_id int,
customer_id int,
product_id int,
foreign key (order_details_id) references order_details(order_details_id),
foreign key (cart_id) references cart(cart_id),
foreign key (customer_id) references customer_details(customer_id),
foreign key (product_id) references product_details(product_id)
);

select * from orders;
drop table orders;
insert into orders values
(1,2,1,1,1,4),
(2,1,12,3,2,20),
(3,3,13,4,8,17),
(4,4,18,1,5,10),
(5,2,20,2,6,4),
(6,1,14,null,3,12),
(7,2,20,2,1,4),
(8,2,20,1,2,15);


select customer_details.customer_name,customer_details.city,customer_details.address,customer_details.pincode,
product_details.product_name,product_details.price,order_details.diliver_by,cart.cart_id
from orders,customer_details,order_details,cart,product_details
where orders.customer_id=customer_details.customer_id 
and orders.product_id=product_details.product_id 
and orders.order_details_id=order_details.order_details_id
and orders.cart_id=cart.cart_id;

create table payment(
payment_id int not null primary key,
methods varchar(20),
orders_id int,
product_id int,
foreign key (orders_id) references orders(orders_id),
foreign key (product_id) references product_details(product_id)
);

select* from payment;
drop table payment;
insert into payment values
(1,'UPI',1,1),
(2,'Wallets',5,2),
(3,'Credit/Debit',4,5),
(4,'Net Banking',2,6),
(5,'Cash On Delivery',3,8);

select product_details.product_name,orders.quantity, payment.methods,product_details.price
from payment,orders,product_details
where payment.orders_id=orders.orders_id and payment.product_id=product_details.product_id;


create table refund(
refund_id int not null primary key,
payment_id int,
product_id int,
customer_id int,
foreign key (payment_id) references payment(payment_id),
foreign key (product_id) references product_details(product_id),
foreign key (customer_id) references customer_details(customer_id)

);

select * from refund;
drop table refund;
drop table refund;
insert into refund values
(1,1,20,1),
(2,2,15,5),
(3,3,11,6),
(4,4,8,7),
(5,5,9,6),
(6,2,6,4),
(7,4,1,4);


select   refund.refund_id,customer_details.customer_name ,product_details.product_name,product_details.price as refund_price,payment.methods
from payment,product_details,refund,customer_details
where refund.product_id=product_details.product_id and refund.payment_id=payment.payment_id and refund.customer_id=customer_details.customer_id;




-- Questions:
-- 1.Display all User
select customer_name from customer_details;

-- 2.Display all product with catogary
select product_details.product_name,catogary.catogary_name,product_details.price
from catogary,product_details
where product_details.catogary_id=catogary.catogary_id;

-- 3.Display all order placed
select customer_details.customer_name,product_details.product_name as placed_order,product_details.price,order_details.diliver_by
from orders,customer_details,order_details,cart,product_details
where orders.customer_id=customer_details.customer_id 
and orders.product_id=product_details.product_id 
and orders.order_details_id=order_details.order_details_id
and orders.cart_id=cart.cart_id;

-- 4.Display all users whose pincode is 411016
select * from customer_details where pincode=411016;

-- 5.Display all the products whose price is above 50000

select * from product_details where price>50000;

-- 6.Display All orders placed by users who have placed order above 10000/-
select customer_details.customer_name,customer_details.city,customer_details.address,customer_details.pincode,product_details.product_name,product_details.price,order_details.diliver_by,cart.cart_id
from orders,customer_details,order_details,cart,product_details
where orders.customer_id=customer_details.customer_id 
and orders.product_id=product_details.product_id 
and orders.order_details_id=order_details.order_details_id
and orders.cart_id=cart.cart_id
 and product_details.price>10000;
 
 
--  7.Display products added into whishlist by use whose name start with "A" 
select product_details.product_name as whislist_names,product_details.price
from whislist,product_details
where whislist.product_id=product_details.product_id and product_name like 'a%';


-- 8.Display top 3 products based on their price
select product_name,price from product_details order by price desc limit 3;


-- 9.Display all users who have canceled or request for refund for products.
select   refund.refund_id,customer_details.customer_name ,product_details.product_name,product_details.price as refund_price,payment.methods
from payment,product_details,refund,customer_details
where refund.product_id=product_details.product_id and refund.payment_id=payment.payment_id and refund.customer_id=customer_details.customer_id;

-- 10.Display order between 12 jun and 31jun.
select order_details.diliver_by,product_details.product_name,product_details.price
from order_details,product_details
where order_details.product_id=product_details.product_id and diliver_by between '12 jun' and '31 jun';


-- 11.Display all users registered in year 2021.
select registration_year,name from registration_form where registration_year=2021;

-- 12.Dispaly all pincodes are only serviceble.
select customer_details.pincode,pincodes.Pincode_no,customer_details.customer_name
from customer_details,pincodes
where pincodes.customer_id=customer_details.customer_id;

-- 13.Count how many usersare male and how many are female.

select gender,count(case when 'Male' then 1 end) as 'Male',count(case when 'Female' then 1 end) as 'Female',count(*) as 'total' from customer_details group by gender;
select count(gender)  from customer_details group by gender;

-- 15.Calculate the total sum of all orders placed.

select sum(quantity) from orders ;

-- 16.Calculate average product price.

select avg(price) from product_details;


-- 17.Find number of users live in pune and have placed the order above 10000.
select customer_details.customer_name,customer_details.city,product_details.price
from orders,customer_details,order_details,cart,product_details
where orders.customer_id=customer_details.customer_id 
and orders.product_id=product_details.product_id 
and orders.order_details_id=order_details.order_details_id
and orders.cart_id=cart.cart_id
and customer_details.city='Pune'
and product_details.price>10000;

-- 19.Find minimum and maximum order value placed by which user.
select customer_details.customer_name,max(product_details.price),min(product_details.price)
from orders,customer_details,order_details,cart,product_details
where orders.customer_id=customer_details.customer_id 
and orders.product_id=product_details.product_id 
and orders.order_details_id=order_details.order_details_id
and orders.cart_id=cart.cart_id;


-- 20.identify products belong to the catagory-electronics.
select product_details.product_name,catogary.catogary_name
from catogary,product_details
where product_details.catogary_id=catogary.catogary_id and catogary.catogary_name='Electronics';


-- 21.Group the products based on each catogary and count products in each catagory.
select product_details.product_name,catogary.catogary_name,count(catogary_name)
from catogary,product_details
where product_details.catogary_id=catogary.catogary_id group by catogary.catogary_name;


-- 22.concate product name with 'PECOMM' for producs whose price is above 1000.
select concat( product_name,'','pecomm') as concat from product_details where price>1000;
