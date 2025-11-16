create database job;

create table Employee (
    id serial PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    contact_type varchar(50),
    salary INT,   
    team_id int references Team(id)
);

create table Leave (
    id serial PRIMARY KEY,
    start_date Date,
    end_date Date, 
    employee_id int references Employee(id)
);

create table Team (
    id serial PRIMARY KEY,
    name varchar(50)
);


