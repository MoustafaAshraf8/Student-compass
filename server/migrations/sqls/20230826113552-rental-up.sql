create table rental
(
   pid integer,
   space integer,
   room integer,
   price_per_night float,
   duration integer,
   available boolean default true,
   constraint fk_pid_rental foreign key (pid) references place(id) on delete cascade,
   constraint pk_pid_rental primary key (pid)
);