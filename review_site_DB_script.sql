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
CREATE TABLE ADMIN(
    Admin_ID VARCHAR(10),
    Admin_level VARCHAR(25),
    Admin_permission VARCHAR(35),
    PRIMARY KEY(Person_ID, Admin_ID),
    FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)
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
CREATE TABLE LOCATION(
    Person_ID VARCHAR(15) PRIMARY KEY,
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
INSERT INTO PERSON VALUES('Kayla', 'Wheeler',4064064060,'1998-04-21', 59718, ' Address ', '1', '1');
INSERT INTO PERSON VALUES('Cole', 'Sluggett',4064064061,'1998-04-27', 59718, ' Address ', '1', '2');
INSERT INTO PERSON VALUES('Dylan', 'Lynn',4064064062,'1994-01-01', 59718, ' Address ', '1', '3');
INSERT INTO PERSON VALUES('Bob', 'Smith',4064064063,'1995-07-02', 59102, ' Address ', '2', '4');
INSERT INTO PERSON VALUES('Kate', 'Wong',4064064064,'2000-02-14', 59714, ' Address ', '3', '5');
INSERT INTO PERSON VALUES('Alex', 'Michaels',4064064065,'1989-07-13', 59718, ' Address ', '3', '6');