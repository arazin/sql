-- 学部テーブル
create table faculties( 
	id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	faculty_name VARCHAR(50) NOT NULL,
	index(id)
)ENGINE=InnoDB;

-- 学科テーブル 外部キー:学部id
create table departments(
	id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	faculty_id INT UNSIGNED ,
	department_name VARCHAR(50) NOT NULL,
	index(id),
	foreign key(faculty_id)	references faculties(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- 研究室テーブル 外部キー:学科id
create table groups(
	id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	department_id INT UNSIGNED ,
	group_name VARCHAR(50) NOT NULL,
	index(id),
	foreign key(department_id)	references departments(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- 業種テーブル
create table industries(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	industry_name VARCHAR(50) NOT NULL,
	index(id)
)ENGINE=InnoDB;

-- 課程テーブル
create table curriculums(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	curriculum_name VARCHAR(100) NOT NULL,
	index(id)
)ENGINE=InnoDB;

-- 志望コーステーブル
create table courses(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(100),
	index(id)
)ENGINE=InnoDB;

-- 基本情報 ログイン情報入り
create table users(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  role VARCHAR(20) NOT NULL,						-- アクセス制限:admin,general,student,graduate
  name VARCHAR(100) NOT NULL,
  nationarity VARCHAR(50) NOT NULL,
  prefecture VARCHAR(50) NOT NULL,
  remain VARCHAR(100) NOT NULL,
  postcord VARCHAR(20) NOT NULL,
  phonenumber VARCHAR(25) NOT NULL,
  job VARCHAR(50) NOT NULL,
  industry_id INT UNSIGNED NOT NULL,
  birthday DATE NOT NULL,
  sex TINYINT NOT NULL,					-- 性別:0->女,1->男??
	index(id),
	foreign key(industry_id)	references industries(id)
	on update cascade on delete cascade
) engine=InnoDB;

-- 在学生 
create table students(
  user_id INT UNSIGNED PRIMARY KEY,
  grade INT NOT NULL,
	faculty_id INT UNSIGNED NOT NULL,
	department_id INT UNSIGNED NOT NULL,
	group_id INT UNSIGNED ,
	student_id VARCHAR(30) NOT NULL,
	guarantor_name VARCHAR(100),
	guarantor_address TEXT NOT NULL,
	guarantor_contact VARCHAR(20) NOT NULL,
	entrance_date DATE NOT NULL,
  foreign key(user_id)	references users(id)
	on update cascade on delete cascade,
	foreign key(faculty_id) references faculties(id)
	on update cascade on delete cascade,
	foreign key(department_id) references departments(id)
	on update cascade on delete cascade,
	foreign key(group_id) references groups(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- 修了生
create table graduates(
	user_id INT UNSIGNED PRIMARY KEY,
	changed BOOLEAN NOT NULL,
	garaduation_date DATE NOT NULL,
	index(user_id),
	foreign key(user_id) references users(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- 進路 どの修了生か判別するために修了生のuser_idを外部キーとして持つ
create table careers(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	graduate_id INT UNSIGNED NOT NULL,
	belong VARCHAR(100) NOT NULL,
	posit VARCHAR(50) NOT NULL,
	industry_id INT UNSIGNED NOT NULL,
	special_report TEXT,
	modified DATE,
	foreign key(graduate_id) references graduates(user_id)
	on update cascade on delete cascade,
	foreign key(industry_id) references industries(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- イベント種類テーブル
create table types(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type_name VARCHAR(30) NOT NULL,
	index(id)
)ENGINE=InnoDB;

-- 説明会 
CREATE TABLE events (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	event_date DATE NOT NULL,
	place TEXT NOT NULL,
	type_id INT UNSIGNED NOT NULL,
	index(id),
	foreign key(type_id)	references types(id)
  on update cascade on delete cascade
)ENGINE=InnoDB;

-- 参加者
CREATE TABLE participants (
	user_id INT UNSIGNED PRIMARY KEY,
	curriculum_id INT UNSIGNED NOT NULL,
	course_id INT UNSIGNED NOT NULL,
	teacher_name varchar(50) NOT NULL,
	entranced BOOLEAN NOT NULL,
	entrance_date DATE,
	index(user_id),
	foreign key(user_id)	references users(id)
  on update cascade on delete cascade,
	foreign key(curriculum_id)	references curriculums(id)
  on update cascade on delete cascade,
	foreign key(course_id)	references courses(id)
  on update cascade on delete cascade
)ENGINE=InnoDB;

-- 関連 参加->どのイベントに誰が参加しているか
create table events_participants(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	participant_id INT UNSIGNED NOT NULL,
	event_id INT UNSIGNED NOT NULL,
	foreign key(participant_id)	references participants(user_id)
  on update cascade on delete cascade,
	foreign key(event_id)	references events(id)
  on update cascade on delete cascade
)ENGINE=InnoDB;

-- 修了証明書の発行申請一覧
create table certificates(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	graduate_id INT UNSIGNED NOT NULL,
	issued BOOLEAN NOT NULL,
	certificate_type VARCHAR(20) NOT NULL, -- 学士、博士前期、博士後期
	graduate_year DATE NOT NULL,
	issue_num INT UNSIGNED NOT NULL,
	purpose TEXT,
	address TEXT,
	foreign key(graduate_id)	references graduates(user_id)
  on update cascade on delete cascade
)ENGINE=InnoDB;
	



