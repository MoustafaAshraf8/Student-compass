create table place
(
   id serial,
   pid integer,
   name varchar(20),
   longtitude double precision,
   latitude double precision,
   constraint pk_id_place primary key (id),
   constraint fk_pid_place foreign key (pid) references business(pid)
);


insert into place
(id,pid,name,latitude,longtitude)
values
(1,4,'test-0',31.309728241554712,30.063787469627425),
(2,4,'test-1',31.206169053103086,29.924772948774198),
(3,4,'test-2',31.207252768936640,29.910821976253256),
(4,4,'test-3',31.202425880792422,29.904288115288820),
(5,4,'test-4',1.0,1.0),
(6,4,'test-5',1.0,1.0),
(7,4,'test-6',1.0,1.0),
(8,4,'balbaa',29.942273991797162,31.22805513419555);