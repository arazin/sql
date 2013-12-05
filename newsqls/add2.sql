create table gevnents(
	id int unsigned auto_increment primary key,
	title varchar(100) NOT NULL,
	gevent_date date,
	place text,
	detail text,
	created date,
	modified date
);

