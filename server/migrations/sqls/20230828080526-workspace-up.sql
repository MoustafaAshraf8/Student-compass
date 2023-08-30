create table workspace
(
   pid integer,
   constraint fk_pid_pharmacy foreign key (pid) references place(id)
);