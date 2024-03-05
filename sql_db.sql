-- Employees 
create table Employees(
    emp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name varchar(255) NOT NULL,
    department varchar(255) NOT NULL,
    software_based boolean,
    admin_based boolean,
    job_role varchar(255),
    team_id INT NOT NULL,
    office_location varchar(255)
    -- FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);


-- Teams
create table Teams(
    team_id INT NOT NULL PRIMARY KEY,
    team_manager INT NOT NULL
    -- FOREIGN KEY (team_manager) REFERENCES Employees(emp_id)
);

ALTER TABLE Employees ADD FOREIGN KEY (team_id) REFERENCES Teams(team_id);
ALTER TABLE Teams ADD FOREIGN KEY (team_manager) REFERENCES Employees(emp_id);

-- Projects  
create table Projects(
    project_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    category varchar(255) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Tasks
create table Tasks(
    Code INT NOT NULL,
    name varchar(255),
    weight INT CHECK (weight Between 1 and 5),
    project_id INT NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (Code, project_id, emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Progress

create table Monthly_Progress(
    month_id INT NOT NULL,
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    task_code INT NOT NULL,
    completion_percent INT CHECK (completion_percent BETWEEN 0 AND 100),
    PRIMARY KEY (project_id, task_code),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (task_code) REFERENCES Tasks(Code)
);

