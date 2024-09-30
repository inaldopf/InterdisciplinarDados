/* Khiata: */
/*Nesse banco de dados seguimos o seguinte padrão
 * 1. Todas as tabela relacionas são nomeada da seguinte forma: coluna1_coluna2
 * 2. Todas as tabelas devem iniciar em letras minusculas e devem estar em ingles
 *  
 */

DROP table 	course cascade
CREATE TABLE course (
    ID serial PRIMARY KEY,
    title VARCHAR(60),
    workloadInMinutes INTEGER,
    videoUrl varchar(60),
    createdAt DATE,
    UNIQUE (ID, title)
);

CREATE TABLE user_preference (
    pfk_user_id integer,
    value Varchar(60),
    PRIMARY KEY (pfk_user_id, value),
    CONSTRAINT unique_col_preference UNIQUE (pfk_user_id, value)
    
);

CREATE TABLE user_course (
    pfk_user_id INTEGER,
    pfk_course_id INTEGER,
    PRIMARY KEY (pfk_user_id, pfk_course_id)
   );


CREATE TABLE favorites (
    pfk_user_id INTEGER,
    value VARCHAR(60),
    PRIMARY KEY (pfk_user_id, value),
    CONSTRAINT unique_col_favorite UNIQUE (pfk_user_id, value)
);

CREATE TABLE type_course (
    id_course INTEGER,
    id_type INTEGER,
    PRIMARY KEY (id_course, id_type)
);

CREATE TABLE users (
    ID serial PRIMARY KEY,
    name VARCHAR(60),
    CPF VARCHAR(11),
    genderId INTEGER,
    age INTEGER,
    isdressmaker BIT,
    isPremium BIT,
    phone INTEGER,
    ImageURL VARCHAR(100),
    password VARCHAR(12),
    email VARCHAR(100),
    profilePictureUrl VARCHAR(100),
    UNIQUE (ID, CPF, email, phone)
);




CREATE TABLE adress (
    ID serial PRIMARY KEY UNIQUE,
    recipient VARCHAR(60),
    street VARCHAR(60),
    number INTEGER,
    complement VARCHAR(50),
    Label VARCHAR(50)
);

CREATE TABLE gender (
    ID serial PRIMARY KEY,
    gender VARCHAR(60),
    UNIQUE (ID, gender)
);

CREATE TABLE courseType (
    ID serial PRIMARY KEY,
    Type varchar(60),
    UNIQUE (ID, Type)
);

CREATE TABLE user_adress (
    pfk_user_id INTEGER,
    pfk_adress_id INTEGER,
    PRIMARY KEY (pfk_user_id, pfk_adress_id)
);
 
 

 
ALTER TABLE user_preference ADD CONSTRAINT FK_user_preference_2
    FOREIGN KEY (pfk_user_id)
    REFERENCES users (ID);
 
ALTER TABLE user_course ADD CONSTRAINT FK_user_course_2
    FOREIGN KEY (pfk_user_id)
    REFERENCES users (ID);
 
ALTER TABLE user_course ADD CONSTRAINT FK_user_course_3
    FOREIGN KEY (pfk_course_id)
    REFERENCES course (ID);
 
ALTER TABLE favorites ADD CONSTRAINT FK_favorites_2
    FOREIGN KEY (pfk_user_id)
    REFERENCES users (ID);
 
ALTER TABLE type_course ADD CONSTRAINT FK_type_course_1
    FOREIGN KEY (id_type)
    REFERENCES courseType (ID);
 
ALTER TABLE type_course ADD CONSTRAINT FK_type_course_3
    FOREIGN KEY (id_course)
    REFERENCES course (ID);
 
ALTER TABLE users ADD CONSTRAINT FK_users_3
    FOREIGN KEY (genderId)
    REFERENCES gender (ID);


 
 
ALTER TABLE user_adress ADD CONSTRAINT FK_user_adress_2
    FOREIGN KEY (pfk_user_id)
    REFERENCES users (ID);
 
ALTER TABLE user_adress ADD CONSTRAINT FK_user_adress_3
    FOREIGN KEY (pfk_adress_id)
    REFERENCES adress (ID);




--users
select * from users

INSERT INTO public.users
("name", cpf, genderid, age, isdressmaker, ispremium, phone, imageurl, "password", email, profilepictureurl)
VALUES('Maria Silva', '12345678900', 1, 32, '0', '1', 123456789, NULL, 'senha123', 'maria@email.com', NULL);
INSERT INTO public.users
("name", cpf, genderid, age, isdressmaker, ispremium, phone, imageurl, "password", email, profilepictureurl)
VALUES('João Souza', '98765432100', 2, 45, '1', '0', 987654321, NULL, 'senha456', 'joao@email.com', NULL);



--User_preference
select * from user_preference
INSERT INTO user_preference
(pfk_user_id, value)
VALUES(1, 'Jeans');
INSERT INTO public.user_preference
(pfk_user_id, value)
VALUES(2, 'Remenda');
INSERT INTO user_preference
(pfk_user_id, value)
VALUES(2, 'Jeans');

--user_course
select * from user_course
INSERT INTO public.user_course
(pfk_user_id, pfk_course_id)
VALUES(1, 2);
INSERT INTO public.user_course
(pfk_user_id, pfk_course_id)
VALUES(1, 1);
INSERT INTO public.user_course
(pfk_user_id, pfk_course_id)
VALUES(2, 1);



--type_course

INSERT INTO public.type_course
(id_course, id_type)
VALUES(1, 1);
INSERT INTO public.type_course
(id_course, id_type)
VALUES(2, 2);

--gender
select * from gender
INSERT INTO public.gender
(id, gender)
VALUES(1, 'Feminino');
INSERT INTO public.gender
(id, gender)
VALUES(2, 'Masculino');
INSERT INTO public.gender
(id, gender)
VALUES(3, 'Outro');


--favorites
select * from favorites
INSERT INTO public.favorites
(pfk_user_id, value)
VALUES(1, 'calça');
INSERT INTO public.favorites
(pfk_user_id, value)
VALUES(1, 'camisa');
INSERT INTO public.favorites
(pfk_user_id, value)
VALUES(2, 'calça');
INSERT INTO public.favorites
(pfk_user_id, value)
VALUES(2, 'toca');


--course type
SELECT * from coursetype
INSERT INTO public.coursetype
(id, type)
VALUES(2, 'Modelagem');
INSERT INTO public.coursetype
(id, "type")
VALUES(1, 'Corte e Costura');

--course
select * from course
INSERT INTO public.course
(title, workloadinminutes, videourl, createdat)
VALUES('Curso de Corte Básico', 15, 'http://url.com/curso1', '2024-09-01');
INSERT INTO public.course
(title, workloadinminutes, videourl, createdat)
values('Curso de Modelagem Avançada', 12, 'http://url.com/curso2', '2024-09-01');


-- adress
INSERT INTO public.adress
(id, recipient, street, "number", complement, "label")
VALUES(1, 'Maria Silva', 'Rua A', 123, 'Apto 10', 'Casa');
INSERT INTO public.adress
(id, recipient, street, "number", complement, "label")
VALUES(2, 'João Souza', 'Rua B', 456, 'Apto 20', 'Trabalho');

--user adress

select * from user_adress
insert into user_adress (pfk_user_id, pfk_adress_id)
values(1,2)
insert into user_adress (pfk_user_id, pfk_adress_id)
values(2,1)

