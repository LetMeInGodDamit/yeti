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