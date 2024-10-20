<?php
 
    session_start();
 
    $image = imagecreatetruecolor(100, 30);
    $bgcolor = imagecolorallocate($image, 255, 255, 255);
    imagefill($image, 0, 0, $bgcolor);
 
    $captch_code='';
    $arr1 = range('a','z');
    $arr2 = range('A','Z');
    $arr3 = range(1,9);
    $arr4 = range(1,9);
    $arr5 = range(1,9);
    $arr0 = array_merge($arr1,$arr2,$arr3,$arr4,$arr5);
    $arr0 = array_diff($arr0, ["l", "1", "I", "0", "O", "o"]);
    $arr0 = array_values($arr0);
	
   for ($i=0; $i<4 ; $i++) { 
    $fontsize=6;
    $fontcolor=imagecolorallocate($image,rand(0,120),rand(0,120),rand(0,120));
    $arr=implode("", $arr0);
    $fontcontent = substr($arr,rand(0,strlen($arr)) ,1);
    $captch_code.= $fontcontent;

    $x=($i*100/4)+rand(5,10);
    $y=rand(5,10);
 
    imagestring($image,$fontsize,$x,$y,$fontcontent,$fontcolor);
   }

    $captch_code = strtolower($captch_code);
    $_SESSION['authcode'] = md5($captch_code);

    for ($i=0; $i < 200; $i++) { 
    	$pointcolor = imagecolorallocate($image,rand(50,200),rand(50,200),rand(50,200));
    	imagesetpixel($image, rand(1,99), rand(1,29), $pointcolor);
    }
   
    for ($i=0; $i < 3; $i++) { 
    	$linecolor = imagecolorallocate($image,rand(80,220),rand(80,220),rand(80,220));
    	imageline($image, rand(1,99), rand(1,29),rand(1,99), rand(1,29) ,$linecolor);
    }
 
    header('content-type:image/png');
	imagepng($image);
 
    imagedestroy($image);
?>