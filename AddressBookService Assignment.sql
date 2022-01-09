show databases;

-- UC 1 --
create database AddressBookService;
use AddressBookService;

-- UC 2 --
create table addressbook (
contactId int auto_increment primary key, 
firstName varchar(20) not null,
lastName varchar(20) not null,
address varchar(20) not null,
city varchar(20),
state varchar(20),
zip long,
phoneNo long,
email varchar(20)
);
desc addressbook;

-- UC 3 --
insert into addressbook 
values(null,'Narendra','Pawar','Daul','Dondaicha','Maharashtra',425408,9876543210,'narendra@gmail.com');

insert into addressbook 
values(null,'Makrand','Shingare','Velapur','Sangola','Maharashtra',425401,9876543211,'makrand@gmail.com');

insert into addressbook 
values(null,'Shubham','Sali','Shahada','Nandurbar','Gujrat',425405,9876543214,'shubham@gmail.com');

insert into addressbook 
values(null,'Dhananjay','Bhadane','Boris','Dhule','Maharashtra',425412,9876543215,'dhananjay@gmail.com');



-- UC 4 --
update addressbook set city = 'dondaicha' where firstName = 'Shubham';
update addressbook set contactType = 'Family' where firstName = 'Narendra';
update addressbook set contactType = 'Colleague' where firstName = 'Makrand';
update addressbook set contactType = 'Friend' where firstName = 'Shubham';
update addressbook set contactType = 'Friend' where firstName = 'Dhananjay';


-- UC 5 --
delete from addressbook where firstName = 'Shubham';

-- UC 6 --
select * from addressbook where city = 'dhule';
select * from addressbook where state = 'maharashtra';

-- UC 7 --
select count(*) from addressbook where city = 'dondaicha';
select count(*) from addressbook where state = 'maharashtra';

-- UC 8 --
select * from addressbook where state = 'maharashtra' order by firstName asc;

-- UC 9 --
create table contacttype (type varchar(20) primary key);
insert into contacttype values ('Family');
insert into contacttype values ('Friend');
insert into contacttype values ('Colleague');

alter table addressbook add contactType varchar(20);
alter table addressbook add foreign key (contactType) references contacttype (type);
update addressbook set type = 'Colleague' where firstName = 'Makrand';

-- UC 10 --
select count(*) from addressbook where contactType = 'Friend';

-- UC 11 --
insert into addressbook 
values(null,'Dhananjay','Bhadane','Boris','Dhule','Maharashtra',425412,9876543215,'dhananjay@gmail.com','Colleague');

commit;


select * from addressbook;