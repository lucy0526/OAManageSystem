alter table attendance add enddate date not null;
alter table attendance change date startdate date not null;

ALTER TABLE `aobmo`.`emp` 
CHANGE COLUMN `phone` `phone` VARCHAR(20) NULL DEFAULT NULL ;

ALTER TABLE emp DROP FOREIGN KEY FK_属于; 

alter table aobmo.emp add column photo varchar(50) not null;

-- 缺勤表
create table misstime
(
   misstime_id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   emp_id               int not null,
   time                 int not null,
   date                 date not null
);


ALTER TABLE `aobmo`.`message` 
ADD COLUMN `read` tinyint(1) AFTER `date`;

ALTER TABLE `aobmo`.`message` 
CHANGE COLUMN `read` `isread` tinyint(1) DEFAULT NULL AFTER `date`;

use aobmo;

alter table wage drop foreign key FK_拥有;
alter table wage add constraint FK_拥有 foreign key(emp_id) 
references emp (emp_id) on delete cascade on update cascade;

alter table attendance drop foreign key FK_emp_att;
alter table attendance add constraint FK_emp_att foreign key(emp_id) 
references emp (emp_id) on delete cascade on update cascade;

alter table emp_message drop foreign key FK_属于2;
alter table emp_message add constraint FK_属于2 foreign key(emp_id) 
references emp (emp_id) on delete cascade on update cascade;

alter table overtime drop foreign key FK_emp_overtime;
alter table overtime add constraint FK_emp_overtime foreign key(emp_id) 
references emp (emp_id) on delete cascade on update cascade;