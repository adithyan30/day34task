CREATE TABLE `Student` (
  `student_id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `phone_number` int,
  `date_of_birth` date,
  `address` varchar(255)
);

CREATE TABLE `Mentor` (
  `mentor_id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `phone_number` int
);

CREATE TABLE `Course` (
  `Course_id` int PRIMARY KEY,
  `course_name` varchar(255),
  `description` varchar(255),
  `mentor_id` int,
  `start_date` date,
  `end_date` date
);

CREATE TABLE `Enrollement` (
  `enrollement_id` int PRIMARY KEY,
  `student_id` int,
  `Course_id` int,
  `Enrollement_date` date
);

CREATE TABLE `Task` (
  `task_id` int PRIMARY KEY,
  `student_id` int,
  `course_name` varchar(255),
  `title` varchar(255),
  `description` varchar(255),
  `date_of_submission` date,
  `status` varchar(255)
);

CREATE TABLE `Payment` (
  `Payment_id` int PRIMARY KEY,
  `Payment_date` date,
  `Payment_mode` varchar(255),
  `Payment_amount` decimal,
  `student_id` int,
  `Course_id` int
);

ALTER TABLE `Mentor` ADD FOREIGN KEY (`mentor_id`) REFERENCES `Course` (`mentor_id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`Course_id`) REFERENCES `Enrollement` (`Course_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`student_id`) REFERENCES `Enrollement` (`student_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`student_id`) REFERENCES `Task` (`student_id`);

ALTER TABLE `Task` ADD FOREIGN KEY (`course_name`) REFERENCES `Course` (`course_name`);

ALTER TABLE `Student` ADD FOREIGN KEY (`student_id`) REFERENCES `Payment` (`student_id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`Course_id`) REFERENCES `Payment` (`Course_id`);
