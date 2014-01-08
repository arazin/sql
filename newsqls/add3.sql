drop table if exists gevents;

create table gevents(
	id int unsigned auto_increment primary key,
	title varchar(100) NOT NULL,
	gevent_date date,
	place text,
	detail text,
	created DATETIME,
	modified DATETIME
)ENGINE=InnoDB;
