create table payment
(
   pid integer,
   waller float default 0.0,
   card varchar(20) default NULL,
   constraint fk_pid_payment foreign key (pid) references person(id) on delete cascade,
   constraint pk_pid_payment primary key (pid)
)