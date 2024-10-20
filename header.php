<head>
    <link rel="stylesheet" type="text/css" href="./css/header.css">
</head>
<?php 
    @session_start();
 ?>

<div class="main-header">
    <div class="container">
        <div class="navigation">
            <div class="info">
                <nav class="menu">
                    <ul class ="menu-one" >
                        <li><a href="./index.php">首页</a></li>
                        <?php 
                            if (!empty($_SESSION["uid"])) {
                                echo "<li><a href='./user_center.php'>个人中心</a></li>";
                                echo "<li><a href='./user_exit_sql.php'>退出</a></li>";
                            }
                            else {
                                echo "<li><a href='./login.php'>登陆</a></li>";
                                echo "<li><a href='./sign.php'>注册</a></li>";
                            }
                         ?>
                        <li><a href="#">关于</a></li>
                    </ul>
                </nav>
            </div>
            <a href="./index.php">
                <h2>欢迎光临 | 我的博客</h2><br>
                <span>&nbsp;&nbsp;&nbsp;晚泊孤舟古祠下，满川风雨看潮生</span>
            </a>
        </div>
    </div>
</div>

</header>
</div>