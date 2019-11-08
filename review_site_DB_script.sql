drop table if exists PERSON;
drop table if exists ADMIN_LEVEL;
drop table if exists RATING;
drop table if exists REVIEWS;
drop table if exists CREDIBILITY_SCORE;
drop table if exists LOGGED_LOCATION;
drop table if exists FRIENDSHIP;


CREATE SCHEMA BASE; 
GO
CREATE TABLE PERSON(
    Fname VARCHAR(15),
    Lname VARCHAR(15),
    Phone INTEGER(9),
    Email VARCHAR(30),
    Birthday DATE,
    Zipcode INTEGER(5),
    Address VARCHAR(25),
    Admin_ID VARCHAR(10),
    Person_ID VARCHAR(10),
    PRIMARY KEY(Person_ID, Admin_ID, Phone),
    FOREIGN KEY(Admin_ID) REFERENCES ADMIN(Admin_ID)
);
CREATE TABLE ADMIN_LEVEL(
    Admin_ID VARCHAR(10),
    Admin_level VARCHAR(25),
    Admin_permission VARCHAR(35),
    PRIMARY KEY(Admin_ID, Admin_ID),
    FOREIGN KEY(Admin_ID) REFERENCES PERSON(Person_ID)
);
CREATE TABLE RATING(
    Person_ID VARCHAR(10),
    Total_rating INTEGER,
    Number_of_reviews_recieved INTEGER,
    PRIMARY KEY(Person_ID, Total_rating),
    FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)
);
CREATE TABLE REVIEWS(
    Rating INTEGER,
    Reviewed VARCHAR(10),
    Reviewer VARCHAR(10),
    Review_ID VARCHAR(15),
    Comment VARCHAR(256),
    PRIMARY KEY(Reviewed, Reviewer, Review_ID),
    FOREIGN KEY(Reviewed) REFERENCES PERSON(Person_ID),
    FOREIGN KEY(Reviewer) REFERENCES PERSON(Person_ID)
);
CREATE TABLE CREDIBILITY_SCORE(
    Person_ID VARCHAR(15),
    Number_of_reviews INTEGER,
    Score INTEGER,
    PRIMARY KEY(Person_ID, Score),
    FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)
);
CREATE TABLE LOGGED_LOCATION(
    Person_ID VARCHAR(15),
    City VARCHAR(15),
    State VARCHAR(15),
    Loc_date DATE,
    PRIMARY KEY(Person_ID, Loc_date),
    FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)
);
CREATE TABLE FRIENDSHIP(
    Person_ID VARCHAR(15),
    Friend_ID VARCHAR(15),
    Friendship_ID VARCHAR(15),
    PRIMARY KEY(Person_ID, Friend_ID, Friendship_ID),
    FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID),
    FOREIGN KEY(Friend_ID) REFERENCES PERSON(Person_ID)
);

INSERT INTO PERSON VALUES('Kayla', 'Wheeler',4064064060,'Email','1998-04-21', 59718, ' Address ', '1', '1');
INSERT INTO PERSON VALUES('Cole', 'Sluggett',4064064061,'Email','1998-04-27', 59718, ' Address ', '1', '2');
INSERT INTO PERSON VALUES('Dylan', 'Lynn',4064064062,'Email','1994-01-01', 59718, ' Address ', '1', '3');
INSERT INTO PERSON VALUES('Bob', 'Smith',4064064063,'Email','1995-07-02', 59102, ' Address ', '2', '4');
INSERT INTO PERSON VALUES('Kate', 'Wong',4064064064,'Email','2000-02-14', 59714, ' Address ', '3', '5');
INSERT INTO PERSON VALUES('Alex', 'Michaels',4064064065,'Email','1989-07-13', 59718, ' Address ', '3', '6');

INSERT INTO ADMIN_LEVEL VALUES('1', 'Creator', 'Can change tables and pages');
INSERT INTO ADMIN_LEVEL VALUES('2', 'Manager', 'Can change pages');
INSERT INTO ADMIN_LEVEL VALUES('3', 'User', "Can't change tables or pages");
INSERT INTO ADMIN_LEVEL VALUES('4', 'Guest', "Can't access anything on site");
INSERT INTO ADMIN_LEVEL VALUES('5', 'Developer', 'Can change tables');


INSERT INTO RATING VALUES('1', 5, 4);
INSERT INTO RATING VALUES('2', 5 , 2);
INSERT INTO RATING VALUES('3', 5 , 10234);
INSERT INTO RATING VALUES('4', 5 , 1);
INSERT INTO RATING VALUES('5', 0 , 0);

INSERT INTO REVIEWS VALUES(5, "1" , "2",'1',"SUCKS!");
INSERT INTO REVIEWS VALUES(5, "1" , "3",'2',"SUCKS!");
INSERT INTO REVIEWS VALUES(5, "1" , "3",'3',"SUCKS!");
INSERT INTO REVIEWS VALUES(5, "1" , "4",'4',"SUCKS!");
INSERT INTO REVIEWS VALUES(5, "1" , "5",'5',"SUCKS!");

INSERT INTO LOGGED_LOCATION VALUES('1', 'Bozeman', 'Montana', '2019-11-08');
INSERT INTO LOGGED_LOCATION VALUES('2', 'Bozeman', 'Montana', '2019-11-08');
INSERT INTO LOGGED_LOCATION VALUES('3', 'Bozeman', 'Montana', '2019-11-08');
INSERT INTO LOGGED_LOCATION VALUES('4', 'Billings', 'Montana', '2019-11-08');
INSERT INTO LOGGED_LOCATION VALUES('5', 'Bozeman', 'Montana', '2019-11-08');
INSERT INTO LOGGED_LOCATION VALUES('6', 'Bozeman', 'Montana', '2019-11-08');

INSERT INTO FRIENDSHIP VALUES('1', '2' ,'1');
INSERT INTO FRIENDSHIP VALUES('2', '3' , '2');
INSERT INTO FRIENDSHIP VALUES('3', '4' , '3');
INSERT INTO FRIENDSHIP VALUES('5', '6' , '4');
INSERT INTO FRIENDSHIP VALUES('3', '1' , '5');
INSERT INTO FRIENDSHIP VALUES('6', '4' , '6');

SELECT * FROM PERSON LIMIT 5;
SELECT * FROM REVIEWS LIMIT 5;
SELECT * FROM RATING LIMIT 5;