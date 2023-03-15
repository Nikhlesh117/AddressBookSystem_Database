-- Welcome to the Address Book System-Database

--UC01: Create Address Book database
create database Address_Book
use Address_Book

--UC02: Create Table
create table AddressBookDetails(
firstName varchar(200) not null,
lastName varchar(200) not null,
address varchar(255) not null,
city varchar(255),
state varchar(255),
zip int,
phoneNumber bigint,
email varchar(200) not null
)

--UC03: Insert Values to Table
insert into  AddressBookDetails
values('Nick', 'Rao', '8 Nk nagar', 'Vizag', 'AP', 123654, 09887654321, 'nk@email.com'),
('Suresh', 'kumar', '12 SK nagar', 'Mysore', 'Karnataka', 100004, 09876554122, 'Suresh@email.com'),
('Geetha', 'sharma', '3 GS nagar', 'Noida', 'UP', 543201, 09876558821, 'Geetha@email.com'),
('Sam', 'yadav', '84 SY nagar', 'Chennai', 'Tamil Nadu', 129123, 09876554867, 'Sam@email.com')

--UC04: ability to edit existing contact 
update AddressBookDetails set phoneNumber=9432667788 where firstName='Sam'

--display table
select * from AddressBookDetails