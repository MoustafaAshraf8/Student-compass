create table student
(
   id serial,
   email VARCHAR(50),
   password VARCHAR(50)
);

insert into student
(email,password)
VALUES
('test','password'),
('test','password'),
('test','password'),
('test','password');
