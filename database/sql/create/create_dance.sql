DROP DATABASE IF EXISTS katie_dance;
CREATE DATABASE katie_dance;
USE katie_dance;
/*
    This table holds information about students...names, birthdays, contact
    info, etc.
*/
CREATE TABLE student (
	student_id			      INT				NOT NULL AUTO_INCREMENT,
    student_firstName	      VARCHAR(20)		NOT NULL,
    student_middleName	      VARCHAR(20)		NOT NULL,
    student_lastName	      VARCHAR(20)		NOT NULL,
    student_birthDate	      DATETIME 			NOT NULL,
    student_startDate         DATETIME          NOT NULL,
    student_phoneNumber       VARCHAR(10)       NOT NULL,
    student_emailAddress      VARCHAR(100)      NOT NULL,
    student_mailingAddress    VARCHAR(100)      NOT NULL,
    student_interests         TEXT              NOT NULL,
    CONSTRAINT			      PK_student		PRIMARY KEY(student_id)
);
/*
    This table holds information about employees...names, employment dates,
    pay rate, contact info, etc.
*/
CREATE TABLE employee (
    employee_id			       INT				 NOT NULL AUTO_INCREMENT,
    employee_firstName	       VARCHAR(20)		 NOT NULL,
    employee_middleName	       VARCHAR(20)		 NOT NULL,
    employee_lastName	       VARCHAR(20)		 NOT NULL,
    employee_birthDate	       DATETIME 		 NOT NULL,
    employee_startDate         DATETIME          NOT NULL,
    employee_phoneNumber       VARCHAR(10)       NOT NULL,
    employee_emailAddress      VARCHAR(100)      NOT NULL,
    employee_mailingAddress    VARCHAR(100)      NOT NULL,
    employee_pay_rate          NUMERIC(10,2)     NOT NULL,
    CONSTRAINT			       PK_employee		 PRIMARY KEY(employee_id)
);
/*
    This table holds information about the type of dance class being
    given...i.e. Samba, Latin, Salsa, etc.
*/
CREATE TABLE class_type (
    class_type_id               INT             	NOT NULL AUTO_INCREMENT,
    class_type_name             VARCHAR(50)     	NOT NULL,
    CONSTRAINT                  PK_class_type   	PRIMARY KEY(class_type_id)
);
/*
    This table holds information about the different 'types' of programs
    the studio offers. These are 'generalized' program types that are
    series of group and private classes that individuals can purchase as
    a package deal in order to give a bit of stability and predictability
    to a person's learning and the studio's schedule.
*/
CREATE TABLE program_type (
    program_type_id             INT                 NOT NULL AUTO_INCREMENT,
    program_type_name           VARCHAR(50)         NOT NULL,
    number_group_classes        INT                 NOT NULL,
    number_private_classes      INT                 NOT NULL,
    program_price               NUMERIC(10,2)       NOT NULL,
    CONSTRAINT                  PK_program_type     PRIMARY KEY(program_type_id)
);
/*
	This is the list of different event types which includes group classes,
	private classes, and each's base price (which is used for single events).
*/
CREATE TABLE event_type (
	event_type_id				INT					NOT NULL AUTO_INCREMENT,
	event_type_name				VARCHAR(50)			NOT NULL,
	event_base_price			NUMERIC(10,2)		NOT NULL,
	CONSTRAINT					PK_event_type		PRIMARY KEY(event_type_id)
);
/*
	This is the 'schedule' of events that occur in the studio. It contains
	dates/times, event_types (group/private), the class's teacher/instructor,
	and more...
*/
CREATE TABLE event (
	event_id					INT					NOT NULL AUTO_INCREMENT,
	event_type					INT					NOT NULL,
	event_time					DATETIME			NOT NULL,
	CONSTRAINT					FK_event_type		FOREIGN KEY(event_type) REFERENCES event_type(event_type_id),
	CONSTRAINT					PK_event			PRIMARY KEY(event_id)
);
/*
	This is the list that contains who attended each class and will be
	used to decrement lessons for
*/
CREATE TABLE attendance (
	attendance_record			INT					NOT NULL AUTO_INCREMENT,
	event_id					INT					NOT NULL,
	student_id					INT					NOT NULL,
	CONSTRAINT					FK_event_id			FOREIGN KEY(event_id) REFERENCES event(event_id),
	CONSTRAINT					FK_student_id		FOREIGN KEY(student_id) REFERENCES student(student_id),
	CONSTRAINT					PK_attendance		PRIMARY KEY(attendance_record)
);
