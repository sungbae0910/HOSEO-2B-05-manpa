select * from manpaboard

delete from manpaboard;
select num from manpaboard order by num desc
select * from file
select * from manpaboard where num < 1 order by num desc limit 9


create table manpaboard(
	num int,
	writedate datetime,
	title varchar(50),
	categori varchar(50),
	price int,
	mainimg varchar(2000),
	content varchar(2048),
	pi varchar(2048),
	available int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table comment(
	writer varchar(20),
	contents varchar(30),
	starpoint int,
	division int,
	number int
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table recomment(
	rewriter varchar(20),
	recontents varchar(30),
	redivision int
)
select * from comments where division1
select * from comment
select * from recomment
select mainimg from manpaboard 
drop table manpaboard
drop table comment
drop table recomment
delete from manpaboard;


CREATE TABLE board (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(20) DEFAULT NULL,
  title varchar(100) DEFAULT NULL,
  content varchar(500) DEFAULT NULL,
  bDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  readcount int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `mp_login` (
  `id` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `eMail` varchar(100) NOT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `addr` varchar(150) DEFAULT NULL,
  `rDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into mp_login(id, pass,name,eMail) values ('admin','admin','admin','admin')
