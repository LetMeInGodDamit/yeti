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
                           Winner_ID int,
                           Creating_Date datetime not null,
                           Name varchar(50) not null,
                           Description  varchar(100) not null,
                           Image varchar(75) not null unique,
                           Start_Cost int not null,
                           Ending_Date datetime ,
                           Bet_Step int not null
);
create table Bets(
                  Bet_ID int PRIMARY KEY AUTO_INCREMENT,
                  User_ID int not null,
                  Announcement_ID int not null,
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
add foreign key (User_ID) references Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE,
add foreign key (Announcement_ID) references Announcements(Announcement_ID) ON DELETE CASCADE ON UPDATE CASCADE;

insert into Users values(
                          Null,
                          '2002-12-28',
                          'emailoffool@gmail.com',
                          'Fool',
                          'NGINIF34fa',
                          'img/user.jpg',
                          ''),
                        (
                          Null,
                          '2020-05-06',
                          'emailofsun@gmail.com',
                          'Sun',
                          'JNFIHF23j',
                          'img/user.jpg',
                          ''
                        ),(
                          Null,
                          '2015-05-06',
                          'emailoftower@gmail.com',
                          'Tower',
                          'JNFIHF23j',
                          'img/user.jpg',
                          ''
                        );
insert into Announcements values(
                                  NULL,
                                  1,
                                  1,
                                  2,
                                  '2021-01-01 11:00:00',
                                  '2014 Rossignol District Snowboard',
                                  'Just nice Snowboard',
                                  'img/lot-1.jpg',
                                  10999,
                                  '2021-01-03 09:29:07',
                                  500
                                ),
                                (
                                  NULL,
                                  1,
                                  1,
                                  null,
                                  '2022-01-01 12:00:00',
                                  'DC Ply Mens 2016/2017 Snowboard',
                                  'Just nice Snowboard',
                                  'img/lot-2.jpg',
                                  159999,
                                  null,
                                  1000
                                ),
                                (
                                  NULL,
                                  2,
                                  2,
                                  null,
                                  '2022-01-01 12:00:00',
                                  'Крепления Union Contact Pro 2015 года размер L/XL',
                                  'Крепления размера XL/L',
                                  'img/lot-3.jpg',
                                  8000,
                                  null,
                                  400
                                ),
                                (
                                  NULL,
                                  3,
                                  2,
                                  null,
                                  '2022-01-01 12:00:00',
                                  'Ботинки для сноуборда DC Mutiny Charocal',
                                  'Ботинки',
                                  'img/lot-4.jpg',
                                  10999,
                                  null,
                                  500
                                ),
                                (
                                  NULL,
                                  4,
                                  2,
                                  null,
                                  '2022-01-01 12:00:00',
                                  'Куртка для сноуборда DC Mutiny Charocal',
                                  'Куртка',
                                  'img/lot-5.jpg',
                                  7500,
                                  null,
                                  450
                                ), (
                                  NULL,
                                  6,
                                  1,
                                  null,
                                  '2022-01-01 12:00:00',
                                  'Маска Oakley Canopy',
                                  'Маска',
                                  'img/lot-6.jpg',
                                  5400,
                                  null,
                                  350
                                );
insert into Bets values(
                         null,
                         1,
                         2,
                         '2021-01-02 09:30:00',
                         500
                       ),
                       (
                         null,
                         1,

                         3,
                         '2021-01-03 09:20:32',
                         500
                       ),
                       (
                         null,
                         5,
                         3,
                         '2021-01-03 09:20:32',
                         1000
                       ),(
                         null,
                         5,
                         2,
                         '2021-01-03 09:20:32',
                         1000
                       );



#Начало запросов


select * from Category;
select a.Name,
       Start_cost,
       Image,
       (sum(b.Sum)+a.Start_cost)Последняя_ставка,
       count(b.Sum)Количество_ставок,
       c.Name,
       Winner_ID
from Announcements as a
       left join Bets b
                 on a.Announcement_ID = b.Announcement_ID
       inner join Category c on a.Category_ID = c.Category_ID
group by a.Name, Start_cost, Image,Creating_Date,Winner_ID
having ISNULL(Winner_ID)
order by Creating_Date desc;
select * from Announcements inner join Category c on Announcements.Category_ID = c.Category_ID
where Announcement_ID=1;
select * from Bets inner join Announcements a on Bets.Announcement_ID = a.Announcement_ID
where Announcement_ID = 1;
