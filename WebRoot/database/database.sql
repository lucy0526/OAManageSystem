/**
*Author:lucy
*Date:2018/7/30
*Desc:OA办公系统数据表
**/
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/7/1 21:22:21                            */
/*==============================================================*/


/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/7/30 16:42:53                           */
/*==============================================================*/


drop table if exists attendance;

drop table if exists emp;

drop table if exists emp_message;

drop table if exists message;

drop table if exists notice;

drop table if exists overtime;

drop table if exists wage;

/*==============================================================*/
/* Table: attendance                                            */
/*==============================================================*/
create table attendance
(
   att_id               INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   emp_id               int not null,
   date                 date not null
);

/*==============================================================*/
/* Table: emp                                                   */
/*==============================================================*/
create table emp
(
   emp_id               INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   wage_id              int,
   emp_name             varchar(20) not null,
   password             varchar(20) not null,
   priority             int not null,
   age                  int,
   gender               varchar(5),
   phone                int,
   email                varchar(40),
   position             char(10) not null
);

/*==============================================================*/
/* Table: emp_message                                           */
/*==============================================================*/
create table emp_message
(
   emp_id               INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   mess_id              int not null
);

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   mess_id              INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   title                varchar(50) not null,
   content              varchar(1024) not null,
   date                 date not null
);

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   date                 date not null,
   title                varchar(50) not null,
   content              varchar(1024) not null
);

/*==============================================================*/
/* Table: overtime                                              */
/*==============================================================*/
create table overtime
(
   overtime_id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   emp_id               int not null,
   time                 int not null,
   date                 date not null
);

/*==============================================================*/
/* Table: wage                                                  */
/*==============================================================*/
create table wage
(
   wage_id              INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   emp_id               int not null,
   base_wage            int,
   deduct_wage          int,
   add_wage             int,
   total_wage           int
);

alter table attendance add constraint FK_emp_att foreign key (emp_id)
      references emp (emp_id) on delete restrict on update restrict;

alter table emp add constraint FK_属于 foreign key (wage_id)
      references wage (wage_id) on delete restrict on update restrict;

alter table emp_message add constraint FK_属于2 foreign key (emp_id)
      references emp (emp_id) on delete restrict on update restrict;

alter table emp_message add constraint FK_拥有2 foreign key (mess_id)
      references message (mess_id) on delete restrict on update restrict;

alter table overtime add constraint FK_emp_overtime foreign key (emp_id)
      references emp (emp_id) on delete restrict on update restrict;

alter table wage add constraint FK_拥有 foreign key (emp_id)
      references emp (emp_id) on delete restrict on update restrict;

