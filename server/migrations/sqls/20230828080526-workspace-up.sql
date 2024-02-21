create table workspace
(
   pid integer,
   constraint fk_pid_pharmacy foreign key (pid) references place(id) on delete cascade
);

insert into workspace
(pid)
values
(13),
(14),
(15),
(16);