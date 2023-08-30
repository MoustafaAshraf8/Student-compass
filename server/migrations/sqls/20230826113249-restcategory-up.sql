create table restcategory
(
   id serial,
   name varchar(20),
   constraint pk_id_restcategory primary key (id)
);

insert into restcategory
(id,name)
values
(1,'general');