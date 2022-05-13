create table Category
(
  Category_ID int PRIMARY key AUTO_INCREMENT,
  Name varchar(20) UNIQUE not null
);
insert into Category (Category_ID, Name) values
                                           (null,'Доски и лыжи'),
                                           (null,'Крепления'),
                                           (null,'Ботинки'), (null,'Одежда'),
                                           (null,'Инструменты'), (null,'Разное');
create table Announcements(
                           Announcement_ID int PRIMARY KEY AUTO_INCREMENT,
                           Category_ID int not null,
                           Creator_ID int not null,
                           Winner_ID int not null,
                           Creating_Date datetime not null,
                           Name varchar(50) not null,
                           Description  varchar(100) not null,
                           Image varchar(75) not null unique,
                           Start_Cost int not null,
                           Ending_Date datetime not null,
                           Bet_Step int not null
);
create table Bets(
                  Bet_ID int PRIMARY KEY AUTO_INCREMENT,
                  User_ID int not null,
                  Accommodation_Date datetime not null,
                  Sum int not null
);
create table Users(
                   User_ID int primary key AUTO_INCREMENT,
                   Registration_Date datetime not null,
                   Email varchar(50) not null unique,
                   User_Name varchar(50) not null unique,
                   Password varchar(150) not null,
                   Avatar varchar(75) not null,
                   Contacts text not null
);
alter table Announcements
  add foreign key (Category_ID) references Category(Category_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    add foreign key (Creator_ID) references Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    add foreign key (Winner_ID) references  Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Bets
  add foreign key (User_ID) references Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;
