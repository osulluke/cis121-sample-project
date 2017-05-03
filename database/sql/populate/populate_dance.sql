USE katie_dance;

LOAD DATA LOCAL INFILE 'database/sql/populate/sample_data/student.csv'
    INTO TABLE student
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'database/sql/populate/sample_data/employee.csv'
	INTO TABLE employee
    FIELDS TERMINATED BY '|'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
