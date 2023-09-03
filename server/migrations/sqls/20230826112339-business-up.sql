create table business
(
   pid integer,
   constraint pk_pid_business primary key (pid)
);

insert into business
(pid)
values
(400),
(500),
(600),
(700);