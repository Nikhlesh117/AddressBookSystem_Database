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

--UC10: Ability to get number of contact persons by Type
select Count(*) as NumberOfContacts , Contact_Type from  AddressBookDetails Group by Contact_Type

--UC12: Creating Tables Based on ER Diagrams  
create table Address_Book
(
Address_BookID int identity(1,1) primary key,
Address_BookName varchar(200)
)
insert into Address_Book values ('Ashs Book'),('Priyankas Book')
select * from Address_Book

--Create Contact_Person Table
create table Contact_Person(
AddressBook_ID int,
Contact_ID int identity(1,1) primary key,
FirstName varchar(100),
SecondName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200),
foreign key (AddressBook_ID) references Address_Book(Address_BookID))

--insert value in Contact_Person table
insert into Contact_Person values
(1,'Nick','Rao','8 Nk nagar','Vizag','Andhra Pradesh',123654,9887654321,'nk@gmail.com'),
(2,'Suresh', 'Kumar','12 SK naga','Mysore','Karnataka',100004,9876554122,'Suresh@gmail.com'),
(2,'Geetha','sharma','3 GS nagar','Noida','Uttar Pradesh',543201, 9876558821,'Geetha@gmail.com'),
(1,'Sam','yadav','84 SY nagar','Chennai','Tamil Nadu',129123, 9876554867,'sam@gmail.com')

select * from Contact_Person

 --- Create table for ContactType
create table ContactType
(ContactType_ID int identity(1,1) primary key,
ContactType_Name varchar(200)
)
--insert values in  ContactType table
insert into ContactType values
('Family'),('Friends'),('Profession')
select * from ContactType

  --- Create table for TypeManager 
create Table TypeManager(
ContactType_Identity int,
Contact_Identity int,
foreign key (ContactType_Identity) references ContactType(ContactType_ID),
foreign key (Contact_Identity) references Contact_Person(Contact_ID)
)
-- insert values in  TypeManager table
insert into TypeManager values
(1,3),
(2,3),
(3,1),
(1,2),
(2,4)
select * from TypeManager

--UC11: Create Contact for both Family and Friends Type 
select Address_BookName,Concat(FirstName,' ',SecondName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Address_Book 
Full JOIN Contact_Person on Address_Book.Address_BookID=AddressBook_ID 
Full JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
Full JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID


--UC13: Ensure all retrieve queries done especially in UC 6, UC 7, UC 8 and UC 10

--UC-06
select Address_BookName,Concat(FirstName,' ',SecondName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID and (City='Mysore' or State='Karnataka')
INNER JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
INNER JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID

--UC-07
select Count(*),state,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID 
Group by state,City

--UC-08
select Address_BookName,(FirstName+' '+SecondName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID and (City='Mysore')
INNER JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
INNER JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID
order by(FirstName)

--UC-10
select Count(*) as NumberOfContacts,ContactType.ContactType_Name
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID
INNER JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
INNER JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID
Group by ContactType_Name