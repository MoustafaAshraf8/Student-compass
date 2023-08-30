create table university
(
   id serial,
   name varchar(50),
   longtitude double precision,
   latitude double precision,
   constraint pk_id_university primary key (id)
);

insert into university
(name, longtitude,latitude)
values
('Arab Academy for science and technology (Aboqir)',31.40521, 30.39347),
('Faculty of Engineering(Alexandria University)',31.20649, 29.92528),
('College complex (ALexandria University)',31.20742, 29.91082),
('Medical College complex (Alexandria University)',31.20228, 29.90422)
