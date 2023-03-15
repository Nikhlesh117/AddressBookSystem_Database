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

--UC05: ability to delete existing contact 
delete from AddressBookDetails where firstName='Geetha'

--UC06: ability to retrieve person using city or state from the table
select * from AddressBookDetails where city = 'Mysore' or state = 'karnataka'

--UC07: Ability to Retrieve Count of address book by city and state
select Count(city) from AddressBookDetails
select count(state) from AddressBookDetails

--UC08: Sort Contacts By Name in a City
select * from AddressBookDetails WHERE city = 'Chennai' ORDER BY firstName

--UC09: Identify each Address Book with name and Type
alter table AddressBookDetails add Book_Name VARCHAR(20),Contact_Type VARCHAR(20)

--Update values for Type=Friends--
update AddressBookDetails set Book_Name = 'FriendName',Contact_Type = 'Friends' where FirstName='Sam' 

--Update values for Type=Family--
update AddressBookDetails set Book_Name = 'FamilyName',Contact_Type = 'Family' where FirstName='Nick'

--Update values for Type=Profession--
update AddressBookDetails set Book_Name = 'Manager',Contact_Type = 'Profession' where FirstName='Suresh'

select * from AddressBookDetails
