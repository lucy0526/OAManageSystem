ALTER TABLE `aobmo`.`message` 
DROP COLUMN `mess_type`,
DROP COLUMN `mess_source`;

ALTER TABLE `aobmo`.`notice` 
ADD COLUMN `notice_source` varchar(50) NOT NULL AFTER `content`,
ADD COLUMN `notice_type` varchar(50) NOT NULL AFTER `notice_source`;

DROP TABLE emp_message;
CREATE TABLE emp_message (
  `mess_id` int(11) NOT NULL,
  `emp_id` int(11)
);
ALTER TABLE emp_message ADD CONSTRAINT emp_message_PK PRIMARY KEY(mess_id,emp_id);
ALTER TABLE emp_message ADD CONSTRAINT emp_message_fk1 FOREIGN KEY(emp_id) REFERENCES emp(emp_id);
ALTER TABLE emp_message ADD CONSTRAINT emp_message_fk2 FOREIGN KEY(mess_id) REFERENCES message(mess_id); 