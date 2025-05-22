CREATE DATABASE tech_school;

USE tech_school;
CREATE TABLE programs(
program_id INT,
Program_name VARCHAR(50),
duration_months VARCHAR(50),
description VARCHAR(50),
PRIMARY KEY (program_id)
);

USE tech_school;
CREATE TABLE student(
student_id INT,
first_name CHAR(50),
last_name CHAR(50),
email VARCHAR(50),
phone VARCHAR(50),
date_of_birth DATE,
gender VARCHAR(50),
enrollment_date VARCHAR(50),
program_id INT,
PRIMARY KEY(student_id),
FOREIGN KEY(program_id) REFERENCES programs (program_id) ON DELETE CASCADE
);

USE tech_school;
CREATE TABLE instructors(
instructors_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
phone VARCHAR(50),
specilization VARCHAR(50),
PRIMARY KEY(instructors_id)
);

USE tech_school;
CREATE TABLE courses(
course_id INT,
course_name VARCHAR(50),
program_id INT,
instructors_id INT,
credit_hours VARCHAR(50),
course_description VARCHAR(50),
PRIMARY KEY(course_id),
FOREIGN KEY(Program_id) REFERENCEs Programs (program_id) ON DELETE CASCADE,
FOREIGN KEY(instructors_id) REFERENCEs instructors (instructors_id) ON DELETE CASCADE
);

USE tech_school;
CREATE TABLE classes(
class_id INT,
course_id INT,
instructors_id INT,
start_date DATE,
end_date DATE,
classroom VARCHAR(50),
PRIMARY KEY (class_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id) ON DELETE CASCADE,
FOREIGN KEY (instructors_id) REFERENCES instructors (instructors_id) ON DELETE CASCADE
);


USE tech_school;
CREATE TABLE Enrollment(
enrollment_id INT,
student_id INT,
class_id INT,
enrollment_date DATE,
grade VARCHAR(50) NOT NULL,
PRIMARY KEY (enrollment_id),
FOREIGN KEY (Student_id) REFERENCES student (student_id) ON DELETE CASCADE,
FOREIGN KEY (class_id) REFERENCES classes (class_id) ON DELETE CASCADE
);

USE tech_school;
CREATE TABLE assessments(
assessments_id INT,
class_id INT,
assessment_type VARCHAR(50),
date DATE,
total_marks VARCHAR(50),
PRIMARY KEY (assessments_id),
FOREIGN KEY (class_id) REFERENCES classes (class_id) ON DELETE CASCADE
);

USE tech_school;
CREATE TABLE Assessment_Results(
result_id INT,
assessments_id INT,
student_id INT,
score INT,
PRIMARY KEY (result_id),
FOREIGN KEY (assessments_id) REFERENCES assessments (assessments_id) ON DELETE CASCADE,
FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE
);

USE tech_school;
DROP DATABASE tech_school;