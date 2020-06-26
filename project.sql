
drop table view_relation;
drop table act;
drop table viewer_info;
drop table actor_info;
drop table movie_info;
drop table producer_info;

create table producer_info(
  producer_id number(20),
  name varchar(35)not null,
  age number(11)not null,
  gender varchar(20)not null,
  primary key(producer_id)
);
create table movie_info(
  m_id number(10),
  name varchar(30)not null,
  movie_type varchar(35)not null,
  producer_id number(20),
  budget number(20),
  earned_money number(20),
  primary key(m_id),
  foreign key(producer_id) references producer_info(producer_id) 
);
create table actor_info(
  id_act number(20),
  name varchar(30)not null,
  age number(20)not null,
  gender varchar(20)not null,
  primary key(id_act)
);
create table viewer_info(
  id_view number(20),
  name varchar(30)not null,
  age number(20)not null,
  primary key(id_view)
);

create table act(
        id_act number(20),
	m_id number(7),
	foreign key(m_id) references movie_info(m_id),
	foreign key(id_act) references actor_info(id_act),
        primary key(id_act,m_id)
);

create table view_relation(
        id_view number(7),
	m_id number(7),
	foreign key(m_id) references movie_info(m_id),
	foreign key(id_view) references viewer_info(id_view)
);

insert into producer_info(producer_id,name,age,gender) values(1,'Steve Jollt',23,'Male');
insert into producer_info(producer_id,name,age,gender) values(2,'Mark will',31,'Male');
insert into producer_info(producer_id,name,age,gender) values(3,'Mel gibson',35,'Male');
insert into producer_info(producer_id,name,age,gender) values(4,'Sohyun Hjiyt',38,'Male');
insert into producer_info(producer_id,name,age,gender) values(5,'Monika Belucchi',39,'Female');


insert into movie_info(m_id,name,movie_type,producer_id,budget,earned_money) values(11,'The Jungle Book','Thriller','4',120000,2120100);
insert into movie_info(m_id,name,movie_type,producer_id,budget,earned_money) values(12,'The Note Book','Drama','1',120000,2120100);
insert into movie_info(m_id,name,movie_type,producer_id,budget,earned_money) values(13,'The Gladiator','Acion','3',120000,2120100);
insert into movie_info(m_id,name,movie_type,producer_id,budget,earned_money) values(14,'Minority Report','Detective','2',520000,4120100);
insert into movie_info(m_id,name,movie_type,producer_id,budget,earned_money) values(15,'The Jungle Book','Thriller','5',120000,5120100);

insert into actor_info(id_act,name,age,gender) values(111,'Russel Crew',34,'Male');
insert into actor_info(id_act,name,age,gender) values(121,'Hue Jckman',43,'Male');
insert into actor_info(id_act,name,age,gender) values(131,'Asli Jiuboyn',34,'Male');
insert into actor_info(id_act,name,age,gender) values(141,'Don lokahu',37,'Male');
insert into actor_info(id_act,name,age,gender) values(151,'Werytu Sdrt',41,'Male');

insert into viewer_info(id_view,name,age) values(211,'Aslk',21);
insert into viewer_info(id_view,name,age) values(311,'Mira',21);
insert into viewer_info(id_view,name,age) values(411,'Asad',21);
insert into viewer_info(id_view,name,age) values(511,'Gutar gu',21);
insert into viewer_info(id_view,name,age) values(611,'Behala',21);

insert into act(id_act,m_id) values(111,15);
insert into act(id_act,m_id) values(121,11);
insert into act(id_act,m_id) values(111,13);
insert into act(id_act,m_id) values(141,14);
insert into act(id_act,m_id) values(151,12);

insert into view_relation(id_view,m_id) values(211,15);
insert into view_relation(id_view,m_id) values(311,11);
insert into view_relation(id_view,m_id) values(211,13);
insert into view_relation(id_view,m_id) values(411,14);
insert into view_relation(id_view,m_id) values(511,15);

commit;