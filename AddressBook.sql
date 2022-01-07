/*------------Address Book Service-------------*/

/*-----------UC1-------------*/
create database address_book_service;
use address_book_service;

/*-----------UC2-------------*/
create table contacts(
	id int not null auto_increment,
    fname varchar(50) not null,
    lname varchar(50) not null,
    address varchar(100) not null,
    city varchar(50) not null,
    state varchar(50) not null,
    zip int not null,
    phoneno long not null,
    email varchar(50) not null,
    primary key(id)
);

select * from contacts;

insert into contacts(fname,lname,address,city,state,zip,phoneno,email) 
values('Koda', 'Ashok','Visakhapatnam','Vizag','AP',531163,7396382672,'test@gmail.com');
insert into contacts(fname,lname,address,city,state,zip,phoneno,email) 
values('Myla', 'Gireish','Visakhapatnam','Vizag','AP',521162,8154785412,'test1@gmail.com');
insert into contacts(fname,lname,address,city,state,zip,phoneno,email,type)
values('Vasu', 'Navin','Chennai','Pormandal','TN',622012,9154897702,'test3@gmail.com','family');

/*-----------UC3-------------*/
insert into contacts(fname,lname,address,city,state,zip,phoneno,email)
values('Charan', 'Kumar','Goa','Goa','GA',11223344,7896541230,'test4@gmail.com');
select * from contacts;

/*-----------UC4-------------*/
update contacts set fname = 'Polamerseti', lname = 'Sanju' where id = 4;
select * from contacts;

/*-----------UC5-------------*/
delete from contacts where id = 3;

/*-----------UC6-------------*/
select fname, lname from contacts where state = 'AP';

/*-----------UC7-------------*/
select count(city) from contacts;
select count(state) from contacts;

/*-----------UC8-------------*/
select fname, lname from contacts where state = 'AP' order by fname ASC;
select fname, lname from contacts where state = 'AP' order by fname DESC;

/*-----------UC9-------------*/
select * from contacts;
alter table contacts add persontype int;

create table person_type(
	id int not null auto_increment,
    persontype varchar(50) not null,
    primary key(id)
);
alter table contacts drop column persontype;
select * from person_type;

alter table contacts add foreign key(persontype) references person_type(id);

update contacts set persontype = 3 where id = 4;

select contacts.lname, person_type.persontype from contacts 
inner join person_type on contacts.persontype = person_type.id;

/*-----------UC10-------------*/
select count(persontype) from contacts where persontype = 1;

/*-----------UC11-------------*/
select * from contacts;
insert into contacts(fname,lname,address,city,state,zip,phoneno,email,persontype)
values('Dev', 'Kunami','Chennai','Pormandal','TN',622012,9154897702,'test3@gmail.com', (1)(2));