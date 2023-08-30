create table place
(
   id serial,
   pid integer,
   name varchar(20),
   long double precision,
   lat double precision,
   constraint pk_id_place primary key (id),
   constraint fk_pid_place foreign key (pid) references business(pid)
);

insert into place
(id,pid,name,long,lat)
values
(1,4,'test',1.0,1.0),
(2,4,'test',1.0,1.0),
(3,4,'test',1.0,1.0),
(4,4,'test',1.0,1.0),
(5,4,'test',1.0,1.0),
(8,4,'balbaa',29.942273991797162,31.22805513419555);