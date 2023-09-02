create table workspace
(
   pid integer,
   constraint fk_pid_pharmacy foreign key (pid) references place(id)
);

-- insert into workspace
-- (pid)
-- values
-- (13),
-- (14),
-- (15),
-- (16);