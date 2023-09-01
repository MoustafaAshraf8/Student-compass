create table pharmacy
(
   pid integer,
   constraint fk_pid_pharmacy foreign key (pid) references place(id),
   constraint pk_pid_pharmacy primary key (pid)
);

insert into pharmacy
(pid)
values
(5),
(6),
(7),
(8);