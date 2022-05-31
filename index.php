<?php
require_once "functions.php";
$is_auth = rand(0, 1);
$user_name = 'Чел';

$connection = new mysqli('localhost','root','','yeti_db');
$query = "Select * from Category order by Category_ID";
$category_result = $connection->query($query);
$categories = $category_result->fetch_all(MYSQLI_ASSOC);
$query = "select a.Name as Name,
       Start_Cost,
       a.Image,
       (COALESCE(sum(b.Sum),0)+a.Start_cost) Cost,
       count(b.Sum) Bets,
       c.Name as Category,
       Winner_ID
from announcement as a
       left join bet b
                 on a.Announcement_ID = b.Announcement_ID
       inner join category c on a.Category_ID = c.Category_ID
group by a.Name, Start_cost, Image,Creating_Date,Winner_ID
having ISNULL(Winner_ID)
order by Creating_Date desc;";


$data_main = ['categories'=>$categories, 'announcements'=>$announcements];
$main = include_path("index.php", $data_main);
$data_layout = array_merge(['is_auth'=>$is_auth,'user_name'=>$user_name,'main'=>$main,'page_name'=>"Главная"],$data_main);
print include_path("layout.php",$data_layout);


