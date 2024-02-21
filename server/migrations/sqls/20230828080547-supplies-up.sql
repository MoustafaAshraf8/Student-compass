create table supply
(
   pid integer,
   constraint fk_pid_pharmacy foreign key (pid) references place(id) on delete cascade,
   constraint pk_pid_supply primary key (pid)
);

insert into supply
(pid)
values
(17),
(18),
(19),
(20);