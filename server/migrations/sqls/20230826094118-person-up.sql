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

(400,'business400', 'business400@gmail.com', 'test'),
(500,'business500', 'business500@gmail.com', 'test'),
(600,'business600', 'business600@gmail.com', 'test'),
(700,'business700', 'business700@gmail.com', 'test');
