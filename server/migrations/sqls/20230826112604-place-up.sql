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