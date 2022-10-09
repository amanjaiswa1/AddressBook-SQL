-- UC1 -- Create AddressBook_service Database
create database AddressBook_service;
use AddressBook_service;

-- UC2 -- Create AddressBook Table
create table AddressBook(
	FirstName varchar(100),
	LastName varchar(100),
	Address varchar(100),
	City varchar(100),
	State varchar (100),
	Zip int,
	PhoneNumber bigint,
	Email varchar(100));

-- UC3 -- Insert Contacts to AddressBook
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values
	('Aniruddha','Mishra','DGG','DGG','CG',491445,9644556671,'ani@gmail.com'),
	('Aman','Jaiswal','Baloda','Baloda','CG',493332,9644556672,'aman@gmail.com'),
	('Tekesh','Kumar','Raipur','Raipur','CG',492001,9644556673,'tekesh@gmail.com'),
	('Nikhil','Yadav','Bhilai','Bhilai','CG',490020,9644556674,'nikhil@gmail.com'),
	('Sujeet','Patel','Rewa','Rewa','MP',580020,7844556674,'sujeet@gmail.com');
select * from AddressBook;

-- UC4 -- Edit existing contact using name
update AddressBook set LastName = 'Dhruw' where FirstName = 'Tekesh';
select * from AddressBook;

-- UC5 -- Delete existing contact using name
delete from AddressBook where FirstName='Aniruddha';
select * from AddressBook;

-- UC6 -- Retrieve person belonging to a City or State--
select * from AddressBook where City = 'Bhilai' or State = 'MP'; 

-- UC7 -- Size of AddressBook by City and State
select COUNT(*) as StateCount, State from AddressBook group by State;
select COUNT(*) as CityCount, City from AddressBook group by City;

-- UC8 -- Sort entries by Person's name alphbatically
select * from AddressBook order by FirstName;

-- UC9 -- Identify each AddressBook with name and type
alter table Addressbook add ContactType varchar(100) not null default 'Friend';
update AddressBook set ContactType = 'Family' where FirstName = 'Tekesh';
select * from AddressBook;

-- UC10 -- Get contact count by type
select COUNT(*) as Type, ContactType from AddressBook group by ContactType;

-- UC11 -- Add person to both Friend and Family
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,ContactType) values
	('Samarth','Vaish','DGG','DGG','CG',491445,9644556677,'sam@gmail.com','Friend'),
	('Samarth','Vaish','DGG','DGG','CG',491445,9644556677,'sam@gmail.com','Family');
select * from AddressBook;