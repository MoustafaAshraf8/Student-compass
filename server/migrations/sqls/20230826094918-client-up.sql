create table client
(
   pid integer,
   universityId integer default null,
   rentalId integer default null,
   constraint fk_id_client foreign key (pid) REFERENCES person(id) on delete cascade,
   constraint pk_id_client primary key (pid),
   constraint fk_universityId_client foreign key (universityId) REFERENCES university(id)
);

-- insert into client
-- (pid, universityId)
-- values
-- (1,1),
-- (2,1),
-- (3,1);