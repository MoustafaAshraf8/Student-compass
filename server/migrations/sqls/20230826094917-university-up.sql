create table university
(
   id serial,
   name varchar(50),
   longtitude double precision,
   latitude double precision,
   constraint pk_id_university primary key (id)
);

insert into university
(id, name, longtitude,latitude)
values
(1,'test',5.0,5.0);