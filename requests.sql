-- Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe. 
    select Employee.id, first_name, last_name from Employee  left join Team  on Employee.team_id = Team.id where Team.id is null ;

-- Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.
    select Employee.id, first_name, last_name from Employee left join Leave on Leave.employee_id = Employee.id where Leave.employee_id is null ; 

-- Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé, le nom & prénom de l’employé qui prend congé et le nom de son équipe.
    select Leave.id, start_date, end_date, Employee.first_name, Employee.last_name , Team.name from Leave join Employee on Leave.employee_id = Employee.id join Team on Employee.team_id = Team.id;

-- Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat, et le nombre d’employés associés.
    select contact_type, count(contact_type) from Employee group by contact_type;

-- Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus jusqu’à end_date inclus.
    select count(Employee.id) from Employee join Leave on Leave.employee_id = Employee.id where start_date >= current_date and start_date < current_date + interval '1 day' or end_date >= current_date and end_date < current_date + interval '1 day'  ;

-- Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui sont en congé aujourd’hui. Pour rappel, la end_date est incluse dans le congé, l’employé ne revient que le lendemain
    select Employee.id, first_name, last_name, Team.name from Employee join Leave on Leave.employee_id = Employee.id join Team on Employee.team_id = Team.id where start_date >= current_date and start_date < current_date + interval '1 day' or end_date >= current_date and end_date < current_date + interval '1 day';