create database hotels

use hotels;

---1. table about hotel chains --- essential information giver of hotel chain 

create table hotel_chains(
hotel_chain_code int , 
hotel_chain_name varchar (40),
chain_rating_id int,
primary key (hotel_chain_code)
);

--- adding foreign key into the table
alter table hotel_chains add foreign key (chain_rating_id) references ratings(rating_id);
--<<<<<----------------------->>>>>>----

INSERT INTO hotel_chains VALUES (11,'Hyatt - known for hospitality',122173);
INSERT INTO hotel_chains VALUES (12,'Radisson Blu Hotels & Resorts',122174);
INSERT INTO hotel_chains VALUES (13,'Taj - Luxury Hotels & Resorts',122173);

---lets join two tabels with the help of the joins

select hotel_chains.hotel_chain_code,hotel_chains.hotel_chain_name,ratings.rating
from hotel_chains
join ratings
on hotel_chains.chain_rating_id = ratings.rating_id;
--<<<<<----------------------->>>>>>----

----------------quick changer in the table
select * from hotel_chains;
drop table hotel_chains;
--<<<<<----------------------->>>>>>----

-----2. individual hotel - essential information giver of one hotel

create table Haytt_Hotels(
hotel_id int ,
hotel_code int, 
hotel_name varchar(80),
hotel_address varchar (100),
hotel_postcode int,
hotel_city varchar(30),
hotel_url varchar (200),
Hyatt_chain_code int,
country_code int,
hotel_rating_id int,
primary key (hotel_id),
foreign key (Hyatt_chain_code) references hotel_chains(hotel_chain_code)
);

---------adding foreign key into the table
alter table Haytt_Hotels add foreign key (country_code) references ref_countries(country_code);
alter table Haytt_HOtels add foreign key (hotel_rating_id) references ratings(rating_id);
--<<<<<----------------------->>>>>>------


INSERT INTO Haytt_Hotels VALUES(1044,110044,'Hyatt Centric Janakpuri New Delhi','Janakpuri District Centre Complex',0004,'Delhi','https://www.hyatt.com/hyatt-centric/delct-hyatt-centric-janakpuri-new-delhi',11,+91,122174);
INSERT INTO Haytt_Hotels VALUES(1045,110045,'Hyatt Centric Candolim Goa','Anna Waddo Main Candolim Road',0005,'Goa','https://www.hyatt.com/hyatt-centric/goazc-hyatt-centric-candolim-goa,',11,+91,122173);
INSERT INTO Haytt_Hotels VALUES(1046,110046,'Hyatt Place Vadodara','Hotel Wing - Nilamber Triumph',0006,'Vadodara','https://www.hyatt.com/en-US/hotel/india/hyatt-place-vadodara/bdqzv',11,+91,122172);
INSERT INTO Haytt_Hotels VALUES(1047,110047,'Hyatt Hyderabad','IT Park Hyderabad Telangana',0007,'Hyderabad','https://www.hyatt.com/en-US/hotel/india/hyatt-ahmedabad/amdhy',11,+91,122174);
INSERT INTO Haytt_Hotels VALUES(996,440081,'Hyatt Centric Milan Centrale','Via Giovanni Battista Pirelli',118,'Milan','https://www.hyatt.com/en-US/hotel/italy/park-hyatt-milan/milph',11,+39,122173);
INSERT INTO Haytt_Hotels VALUES(997,440082,'Hyatt Centric Murano Venice','Riva Longa Murano Venice',119 ,'Venice','https://www.hyatt.com/hyatt-centric/vcect-hyatt-centric-murano-venice',11,+39,122173);


---------adding foreign key into the table
select Haytt_Hotels.hotel_id,Haytt_Hotels.hotel_name,ratings.rating
from Haytt_Hotels
join ratings
on Haytt_Hotels.hotel_rating_id = ratings.rating_id;

select Haytt_Hotels.hotel_id,Haytt_Hotels.hotel_name,Haytt_Hotels.hotel_city,ref_countries.country_name,ref_countries.country_currency
from Haytt_Hotels
join ref_countries
on Haytt_Hotels.country_code = ref_countries.country_code;
--<<<<<----------------------->>>>>>------

----------------quick changer in the table
select * from Haytt_hotels;
drop table Haytt_hotels;
--<<<<<----------------------->>>>>>------


---3. table it is information giver of reference country

create table ref_countries(
country_code int,
country_currency varchar (30),
country_name varchar (30),
primary key (country_code)
);

INSERT INTO ref_countries Values (+91,'Rupee','India');
INSERT INTO ref_countries Values (+39,'Euro','Italy');

----------------quick changer in the table
select * from ref_countries;
drop table ref_countries;
--<<<<<----------------------->>>>>>----

-----4. this table in informative in terms of hotel  star ratings

create table ratings(
rating_id int,
rating int,
rating_code int,
Reviews varchar (100),
primary key (rating_id)
);

INSERT INTO ratings VALUES(122172,5,122,'https://travel.usnews.com/hotels/brands/');
INSERT INTO ratings VALUES(122173,9,123,'https://travel.usnews.com/hotels/brands/' );
INSERT INTO ratings VALUES(122174,7,124,'https://travel.usnews.com/hotels/brands/' );
INSERT INTO ratings VALUES(122175,2,125,'https://travel.usnews.com/hotels/brands/' );
INSERT INTO ratings VALUES(122176,1,125,'https://travel.usnews.com/hotels/brands/' );

----------------quick changer in the table
select * from ratings;
drop table ratings;
--<<<<<----------------------->>>>>>----

------5.table --- essential information of the guests

create table guests(
guest_id int,
guest_name varchar (40),
guest_phone_number bigint ,
guest_address varchar (80),
guest_city varchar (30),
hotel_id int,
booking_id int,
stay_room_number int,
primary key (guest_id)
);

-------------foreign key used to change existing table-------
alter table guests add foreign key (hotel_id) references Haytt_Hotels(Hotel_id);
alter table guests add foreign key (booking_id) references bookings(booking_id);
alter table guests add foreign key (stay_room_number) references guest_stay(room_number);
--<<<<<----------------------->>>>>>----

INSERT INTO guests VALUES (7982 ,'Jyotirmay gupta',7982343785,'Durgapuri Delhi','Delhi',996,556,102);
INSERT INTO guests VALUES (7983 ,'Rohit Gond',798545353,'Old delhi Chandni chowk','Old Delhi',1047,556,209);
INSERT INTO guests VALUES (7984 ,'Arpit gupta',9234465654,'old  house of Rajiv chowk','Central Delhi',997,557,207);
INSERT INTO guests VALUES (7985 ,'Mohit kumar',6143456566,'long and old street of south bombay','Mumbai',1044,557,408);
INSERT INTO guests VALUES (7986 ,'Wisdom watson',44-7545476,'right hand street of venice','Venice',1045,553,410);
INSERT INTO guests VALUES (7987 ,'Shane coin',4982343785,'Durgaii Delhi','Delhi',1046,553,201 );
INSERT INTO guests VALUES (7988 ,'Robert gustin',448545353,'gunstin street ','Oxford',554,402,410);
INSERT INTO guests VALUES (7989 ,'Ashvini aggraval',92121654,'Gaur way of Rajiv chowk','Central Delhi',997,554,101);
INSERT INTO guests VALUES (7990 ,'Mohan zoha',6143454990,'kulcha street of south bombay','Mumbai',996,555,102);
INSERT INTO guests VALUES (7991 ,'Rahim Khan',7545576476,'watson circle street of venice','Venice',1047,555,209);

-------------rest are for other hotels of the another hotel chain----------
INSERT INTO guests VALUES (7992 ,'Shaii kann',75655343785,'Mohan nagar','Delhi' );
INSERT INTO guests VALUES (7993 ,'habib ali',78045353,'near jama majid Chandni chowk','Old Delhi');
INSERT INTO guests VALUES (7994 ,'Shalini gupta',9234464334,'cirle road, Rajiv chowk','Central Delhi');
INSERT INTO guests VALUES (7995 ,'Aanchal kumar',615656566,'valley road south bombay','Mumbai');
INSERT INTO guests VALUES (7996 ,'Austin green',44-754445476,'president road','Washington');

------adding foreign key into the table
select guests.guest_id,guests.guest_name,guests.guest_phone_number,Haytt_Hotels.hotel_name,Haytt_Hotels.hotel_city
from guests
join Haytt_Hotels
on guests.hotel_id = Haytt_Hotels.hotel_id ;

select guests.guest_id,guests.guest_name,guests.guest_phone_number,bookings.date_from,bookings.date_to
from guests
join bookings
on guests.booking_id = bookings.booking_id ;

select guests.guest_id,guests.guest_name,guests.guest_phone_number,guest_stay.room_number,guest_stay.room_floor,guest_stay.room_type,guest_stay.servent_name_for_guest
from guests
join guest_stay
on guest_stay.room_number= guests.stay_room_number ;

--<<<<<----------------------->>>>>>------


----------------quick changer in the table
select * from guests;
drop table guests;
--<<<<<----------------------->>>>>>----

----6. table --- essential information regarding bookings ----

create table bookings(
booking_id int, 
date_from date,
date_to date ,
primary key (booking_id)
);

INSERT INTO bookings VALUES (556,'2023-01-12','2023-01-19');
INSERT INTO bookings VALUES (557,'2023-03-15','2023-03-25');
INSERT INTO bookings VALUES (553,'2023-04-12','2023-04-19');
INSERT INTO bookings VALUES (554,'2023-09-01','2023-09-08');
INSERT INTO bookings VALUES (555,'2023-10-02','2023-10-05');


----------------quick changer in the table
select * from bookings;
drop table bookings;
--<<<<<----------------------->>>>>>----

--7--essential information of the guest staying---

create table guest_stay(
room_number int, 
room_floor varchar(30) ,
room_type varchar(20),
servent_name_for_guest varchar (30),
primary key (room_number)
);

INSERT INTO guest_stay VALUES (102,'1st floor','Honeymoon Sweet','Ramoo');
INSERT INTO guest_stay VALUES (209,'2nd floor','Honeymoon Sweet','Sewata');
INSERT INTO guest_stay VALUES (207,'2nd floor','Honeymoon Sweet','Manav');
INSERT INTO guest_stay VALUES (408,'4th floor','Family Rememberence','vinoda');
INSERT INTO guest_stay VALUES (410,'4th floor','Family Rememberence','vinoda');
INSERT INTO guest_stay VALUES (201,'2nd floor','Night Party','Pathan');
INSERT INTO guest_stay VALUES (402,'4th floor','Party','wisdom comb');
INSERT INTO guest_stay VALUES (101,'1st floor','Bachelors special','Rani kumari');

----------------quick changer in the table
select * from guest_stay;
drop table guest_stay;
--<<<<<----------------------->>>>>>----