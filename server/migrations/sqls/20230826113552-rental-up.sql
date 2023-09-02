create table rentalhome
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

-- insert into rentalhome
-- (pid,space,room,price_per_night,duration,available)
-- values
-- (1,1,1,200,3,true),
-- (2,1,1,200,3,true),
-- (3,1,1,200,3,true),
-- (4,1,1,200,3,true);


-- insert into university
-- (id, space, room,price_per_night,duration,available,longtitude,latitude)
-- values
-- (1,'masaken Al dobat',1,200,3,true,31.31291,30.6275),
-- (2,'Maamoura beach',1,200,3,true,31.287746631466902, 30.02960661088507),
-- (3,'Shatby',1,200,3,true,31.212173512459124, 29.918476260819396),
-- (4,'Sotar',1,200,3,true,31.20470990432669, 29.90971029470579);