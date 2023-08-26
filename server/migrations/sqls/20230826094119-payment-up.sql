create table payment
(
   pid integer,
   waller float,
   card varchar(20),
   constraint fk_pid_payment foreign key (pid) references person(id) on delete cascade,
   constraint pk_pid_payment primary key (pid)
)