create table restaurant
(
   pid integer,
   categoryid integer default 1,
   description text default '',
   constraint fk_pid_restaurant foreign key (pid) references place(id) on delete cascade,
   constraint pk_pid_restaurant primary key (pid),
   constraint fk_categoryid_restaurant foreign key (categoryid) references restcategory(id)
);

-- insert into restaurant
-- (pid)
-- values
-- (8);