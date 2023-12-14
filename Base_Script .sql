CREATE TABLE жанры (
	CONSTRAINT жанр_pk PRIMARY KEY (жанр_id),
	жанр_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	жанр varchar(30) NOT NULL UNIQUE
);

CREATE TABLE исполнители (
	CONSTRAINT исполнитель_песни_pk PRIMARY KEY (исполнитель_песни_id),
	исполнитель_песни_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	имя_исполнителя varchar(60) NOT NULL UNIQUE
);

CREATE TABLE исполняемые_жанры (
	CONSTRAINT исполняемые_жанры_pk PRIMARY KEY (исполняемые_жанры_id),
	исполняемые_жанры_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	жанр int4 NOT NULL,
	исполнитель int4 NOT NULL,
	FOREIGN KEY (жанр) REFERENCES жанры (жанр_id),
	FOREIGN KEY (исполнитель) REFERENCES исполнители (исполнитель_песни_id)
);

CREATE TABLE альбомы (
	CONSTRAINT альбом_pk PRIMARY KEY ("альбом_id"),
	альбом_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	название_альбома varchar(60) NOT NULL UNIQUE,
	год_выпуска date NOT NULL,
	CHECK (год_выпуска BETWEEN '1960-01-01' AND '2025-01-01')
);

CREATE TABLE альбомы_исполнителей (
	CONSTRAINT альбомы_исполнителей_pk PRIMARY KEY ("альбомы_исполнителей_id"),
	альбомы_исполнителей_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	исполнитель int4 NOT NULL,
	альбом int4 NOT NULL,
	FOREIGN KEY (альбом) REFERENCES альбомы(альбом_id),
	FOREIGN KEY (исполнитель) REFERENCES исполнители (исполнитель_песни_id)
);

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

CREATE TABLE сборники (
	CONSTRAINT сборник_pk PRIMARY KEY (сборник_id),
	сборник_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	название_сборника varchar(60) NOT null UNIQUE,
	дата_выхода date NOT NULL,
  	CHECK ( дата_выхода BETWEEN '1960-01-01' AND '2025-01-01')
);

CREATE TABLE сборник_треков (
	CONSTRAINT сборник_треков_pk PRIMARY KEY (сборник_треков_id),
	сборник_треков_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	трек int4 NOT NULL,
	сборник int4 NOT NULL,
	FOREIGN KEY (трек) REFERENCES треки(трек_id),
	FOREIGN KEY (сборник) REFERENCES сборники(сборник_id)
);