SELECT student_firstName, student_lastName, student_emailAddress, student_phoneNumber
FROM katie_dance.student
WHERE last_attendance >= NOW() - '6 months';

SELECT student_firstName, student_lastName, student_emailAddress, student_phoneNumber
FROM katie_dance.student
WHERE last_attendance >= NOW() - '2 weeks';