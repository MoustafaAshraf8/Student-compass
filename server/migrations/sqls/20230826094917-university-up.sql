create table university
(
   id serial,
   name varchar(50),
   longtitude double precision,
   latitude double precision,
   constraint pk_id_university primary key (id)
);

insert into university
(id, name, longtitude,latitude)
values
(1,'Arab academy for science and technology (AAST)',31.309728241554712, 30.063787469627425);
(2,'Faculty of engineering Alexandria university (FOE)',31.206169053103086, 29.924772948774198);
(3,'College complex',31.20725276893664, 29.910821976253256);
(4,'Medical college complex',31.202425880792422, 29.90428811528882);