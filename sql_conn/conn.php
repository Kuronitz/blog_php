<?php 
    define('HOST','localhost');
    define('USER','root');
    define('PASS','');
    define('DBNAME','blog');

    if ($conn=mysqli_connect(HOST,USER,PASS,DBNAME)) {
        mysqli_query($conn,"set names utf8");
    }
    else {
     echo ("数据库连接失败！");
    }
 ?>