create table restaurant
(
   pid integer,
   categoryid integer,
   description text,
   constraint fk_pid_restaurant foreign key (pid) references place(id) on delete cascade,
   constraint pk_pid_restaurant primary key (pid),
   constraint fk_categoryid_restaurant foreign key (categoryid) references restcategory(id)
);

insert into restaurant
(id, name,description, longtitude,latitude)
values
(1,'ShawermaBox','Shawerma restaurant',31.20791,29.92613),
(2,"Macdonald's",'fast food',31.27813,30.00604),
(3,"Arous Demashq","Syrian food",31.27340,30.00510),
(4,"El fallah","Fast food",31.27955,30.01194)
;
