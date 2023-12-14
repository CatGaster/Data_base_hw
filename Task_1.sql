
CREATE TABLE жанры (
	CONSTRAINT жанр_pk PRIMARY KEY (жанр_id),
	жанр_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	жанр varchar(30) NOT NULL UNIQUE
);

insert into жанры (жанр)
values ('Metal'),
	   ('K-pop'),
	   ('Rock'),
	   ('Pop');



CREATE TABLE исполнители (
	CONSTRAINT исполнитель_песни_pk PRIMARY KEY (исполнитель_песни_id),
	исполнитель_песни_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	имя_исполнителя varchar(60) NOT NULL UNIQUE
);

insert into исполнители (имя_исполнителя)
values ('Metallica'),
	   ('Король и Шут'),
	   ('Stray Kids'),
	   ('Lady Gaga');



CREATE TABLE исполняемые_жанры (
	CONSTRAINT исполняемые_жанры_pk PRIMARY KEY (исполняемые_жанры_id),
	исполняемые_жанры_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	жанр int4 NOT NULL,
	исполнитель int4 NOT NULL,
	FOREIGN KEY (жанр) REFERENCES жанры (жанр_id),
	FOREIGN KEY (исполнитель) REFERENCES исполнители (исполнитель_песни_id)
);

insert into исполняемые_жанры (жанр, исполнитель)
values (1,1),
	   (2,2),
	   (3,3),
	   (4,4);



CREATE TABLE альбомы (
	CONSTRAINT альбом_pk PRIMARY KEY ("альбом_id"),
	альбом_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	название_альбома varchar(60) NOT NULL UNIQUE,
	год_выпуска date NOT NULL,
	CHECK (год_выпуска BETWEEN '1960-01-01' AND '2025-01-01')
);


insert into альбомы (название_альбома, год_выпуска)
values ('Metallica','1991-08-12'),
	   ('Король и Шут', '1997-12-18'),
	   ('Noeasy', '2021-08-23'),
	   ('The Fame Monster', '2009-01-23' );



CREATE TABLE альбомы_исполнителей (
	CONSTRAINT альбомы_исполнителей_pk PRIMARY KEY ("альбомы_исполнителей_id"),
	альбомы_исполнителей_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	исполнитель int4 NOT NULL,
	альбом int4 NOT NULL,
	FOREIGN KEY (альбом) REFERENCES альбомы(альбом_id),
	FOREIGN KEY (исполнитель) REFERENCES исполнители (исполнитель_песни_id)
);

insert into альбомы_исполнителей (исполнитель, альбом)
values (1,1),
	   (2,2),
	   (3,3),
	   (4,4);



CREATE TABLE треки (
	CONSTRAINT трек_pk PRIMARY KEY (трек_id),
	трек_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	год_выпуска_трека date NOT NULL,
	название_трека varchar(60) NOT NULL UNIQUE,
	альбом int4 NOT NULL,
	продолжительность_трека time NOT NULL,
	CHECK (год_выпуска_трека BETWEEN '1960-01-01' AND '2025-01-01'),
	FOREIGN KEY (альбом) REFERENCES альбомы(альбом_id)
);

insert into треки (год_выпуска_трека, название_трека, альбом, продолжительность_трека)
values ('1991-07-29', 'Enter Sandman', 1 ,'0:5:31'),
	   ('1997-08-08', 'Лесник', 2,'0:2:29'),
	   ('2021-08-23', 'Thunderous', 3,'0:3:03'),
	   ('2009-01-23', 'The Fame', 4 ,'0:3:42'),
	   ('1991-07-29', 'My friend of Misery', 1 ,'0:6:50'),
	   ('1997-12-18', 'Два друга и разбойниик', 2 ,'0:2:15'),
	   ('2021-08-23', 'DOMINO', 3 ,'0:3:19');



CREATE TABLE сборники (
	CONSTRAINT сборник_pk PRIMARY KEY (сборник_id),
	сборник_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	название_сборника varchar(60) NOT null UNIQUE,
	дата_выхода date NOT NULL,
  	CHECK ( дата_выхода BETWEEN '1960-01-01' AND '2025-01-01')
);

insert into сборники (название_сборника, дата_выхода)
values ('Лучшие песни Metallica', '2020-05-06'),
	   ('Лучшие песни Король и Шут', '2015-03-05'),
	   ('Лучшие песни Stray Kids', '2023-05-03'),
	   ('Лучшие песни Lady Gaga', '2010-07-12');



CREATE TABLE сборник_треков (
	CONSTRAINT сборник_треков_pk PRIMARY KEY (сборник_треков_id),
	сборник_треков_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	трек int4 NOT NULL,
	сборник int4 NOT NULL,
	FOREIGN KEY (трек) REFERENCES треки(трек_id),
	FOREIGN KEY (сборник) REFERENCES сборники(сборник_id)
);

insert into сборник_треков (трек, сборник)
values (1,1),
	   (2,2),
	   (3,3),
	   (4,4),
	   (5,1),
	   (6,2),
	   (7,3);