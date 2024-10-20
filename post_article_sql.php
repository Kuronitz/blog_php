<?php 
    require("./login_session_check.php");
    require("./sql_conn/conn.php");

    $title = $_POST['title'];
    $type_id = strval($_POST['type_id']);
    $content = $_POST['content'];
    $author = $_SESSION['uid'];
    $pubtime=date("Y-m-d H:i:s");
	
	$sql = "select * from article";
    $result = mysqli_query($conn,$sql);
    $res_num = mysqli_num_rows($result);

    @$post_article_sql = "INSERT INTO article (id, type_id, title, content, author, pubtime, filename)
    VALUES ( NULL, '".$type_id."', '".$title."', '".$content."', '".$author."', '".$pubtime."', NULL);";

    $res = mysqli_query($conn,$post_article_sql);
    if ($res>0) {
        echo "<script language='javascript' type='text/javascript'>";
        echo "alert('文章发表成功');";
        echo "location.href='./index.php';"; 
        echo "</script>";
        exit();
    }
    else{
        echo "<script language='javascript' type='text/javascript'>";
        echo "alert('文章发表失败');";
        echo "location.href='./post_article.php';"; 
        echo "</script>";
        exit();
    }

 ?>