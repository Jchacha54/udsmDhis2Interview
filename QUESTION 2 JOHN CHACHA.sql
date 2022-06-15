/* Employee Tracker database */ 
CREATE DATABASE employee_tracker;

/* 
 lets create the tables with that data base
 table Department,table Role and table Employee
*/

USE employee_tracker; /* we use this command to use/select database  */

/* lets create table department with two colums and id as primary key */
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
  );

/* lets create table role with four colums and id as primary key department id as foreign key */
CREATE TABLE `role` (
   `id` int NOT NULL AUTO_INCREMENT,
    `title` varchar(30) NOT NULL,
    `salary` decimal NOT NULL,
    `department_id` int,
    FOREIGN KEY(`department_id`) REFERENCES department(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(`id`)
);

/* lets create table employee with five colums and id as primary key role,manaage id as reference key */
CREATE TABLE `employee` (
   `id` int NOT NULL AUTO_INCREMENT,
    `first_name` varchar(30) NOT NULL,
    `last_name` varchar(30) NOT NULL,
    `role_id` int,
    `manager_id` int NOT NULL,
    FOREIGN KEY(`role_id`) REFERENCES role(`id`) ON UPDATE CASCADE,
    PRIMARY KEY(`id`)
);


/* inserting 20 employees and three managers inside with manager ids */

INSERT INTO `employee` (`first_name`, `last_name`, `role_id`, `manager_id`) VALUES 
                         ('John', 'Chacha', 5, 0),
                         ('Clement', 'Marcel', 1, 1),
                         ('Raurent', 'Kalegere',3, 1),
                         ('Kehengu', 'Moses', 1, 2),
                         ('Ezra', 'Mfalme', 1, 2),
                         ('Michael', 'Ruge', 1, 2),
                         ('Priscila', 'Ndetiwa', 3, 3),
                         ('Niza', 'Sikana', 1, 2),
                         ('Mohamedi', 'Ali', 3, 3),
                         ('Happy', 'Rutaba', 2, 1),
                         ('Tumaini', 'Msifunu', 3, 3),
                         ('Dickson', 'Magazi', 1, 2),
                         ('Rhoby', 'Chacha', 3, 3),
                         ('Frank', 'Mwarimbo', 1, 2),
                         ('Gerrald', 'Mosha', 4, 2),
                         ('Doreen', 'Nkamba', 2, 1),
                         ('Irene', 'Massawe', 3, 3),
                         ('Daniel', 'Mwakilembe', 2, 1),
                         ('Johari', 'Yared', 4, 2),
                         ('Daudi', 'Nyorobi', 4, 2);

/* List All Employees with there salaries */
SELECT first_name,last_name,salary from employee e,role r WHERE e.role_id = r.id;

/* List All departments with the total amount each department uses for salaries */
SELECT name,sum(salary) as Total from department d,role r,employee e WHERE d.id = r.department_id AND e.role_id = r.id GROUP BY d.name;

/* List All Employees with manager  */
SELECT e.first_name as employeefirstname,e.last_name as employeelastname,ee.first_name as managerfirstname,ee.last_name as managerlastname FROM employee ee JOIN employee e ON ee.id=e.manager_id;

/* Who is the CEO  */
SELECT `first_name`,`last_name` from employee WHERE `manager_id` =0;
