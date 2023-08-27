create table person
(
   id serial,
   name varchar(20),
   email varchar(50),
   password varchar(50),
   constraint pk_id_person primary key (id)
);

insert into person
(id, name, email, password)
values
(1,'test', 'test', 'test');