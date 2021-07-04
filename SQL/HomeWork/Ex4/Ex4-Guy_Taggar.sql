#******Q1******
create database ex4;
use ex4;

#******Q2******
CREATE TABLE person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30)
);

#******Q3******
INSERT INTO person (`name`) VALUES ('Dr. John Dolittle'), ('Sir Windston Churchill');

#******Q4******
CREATE TABLE pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30)
);

#******Q5******
insert into pet (`name`) values ("Polynesia"), ("Gub-Gub"), ("Jip"), ("Rufus");

#******Q6******
alter table pet
add owner_id INT;

#******Q7******
SET SQL_SAFE_UPDATES = 0;
UPDATE pet 
SET 
    owner_id = 1337
WHERE
    `name` = 'Rufus';
SET SQL_SAFE_UPDATES = 1;

#******Q8******
alter table pet
add constraint fk_pet_person
foreign key (owner_id)
references person (person_id);

#******Q9******
SET SQL_SAFE_UPDATES = 0;
UPDATE pet 
SET 
    owner_id = 2
WHERE
    `name` = 'Rufus';
SET SQL_SAFE_UPDATES = 1; # Now re-run Q8

#******Q10******
UPDATE pet 
SET 
    owner_id = 1
WHERE
    pet_id != 4;

#******Q11******
UPDATE pet 
SET 
    owner_id = 2
WHERE
    pet_id = 4;
    
#******Q12******
DELETE FROM person 
WHERE
    person_id = 1;

#******Q13******
alter table pet
drop foreign key fk_pet_person,
drop index fk_pet_person;

#******Q14******
DELETE FROM person 
WHERE
    person_id = 1;