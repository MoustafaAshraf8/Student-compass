create table person
(
   id serial,
   name varchar(20),
   email varchar(50) unique,
   password varchar(72),
   constraint pk_id_person primary key (id)
);

insert into person
(id, name, email, password)
values
(1,'name1', 'name1@gmail.com', 'test'),
(2,'name2', 'name2@gmail.com', 'test'),
(3,'name3', 'name3@gmail.com', 'test'),
(4,'name4', 'name4@gmail.com', 'test'),
(5,'name5', 'name5@gmail.com', 'test'),
(6,'name6', 'name6@gmail.com', 'test'),
(7,'name7', 'name7@gmail.com', 'test');
