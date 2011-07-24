<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta name="gmapkey" content="" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />

	<title>USOC Admin Tool</title>

	<link rel="stylesheet" href="css/usoc.css" type="text/css" media="all" />
    <link rel="stylesheet" media="screen" type="text/css" href="css/layout.css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	
</head>
<body>
<div class="content">
		<?php
		//Sample Database Connection Syntax for PHP and MySQL.
		
		//Connect To Database
		
		$hostname="usoc.db.5531416.hostedresource.com";
		$username="usoc";
		$password="Rhinos1999";
		$dbname="usoc";
		$usertable="leagues";
		$yourfield = "name";
		
		mysql_connect($hostname,$username, $password) or die ("<html><script language='JavaScript'>alert('Unable to connect to database! Please try again later.'),history.go(-1)</script></html>");
		mysql_select_db($dbname);
		
		# Check If Record Exists
		
		
		$url = $_POST["imgURL"];
		$color = $_POST["leagueColor"];		
		$name = $_POST["leagueName"];
		$nickName = $_POST["nickName"];
		$abbr = $_POST["abbreviation"];		
		$v_TheQuery = "INSERT INTO leagues(name, nickName, abbreviation, logo, color) VALUES ('$name', '$nickName', '$abbr', '$url', '$color')" ;
		$v_TheResult = mysql_query($v_TheQuery);
		if (! $v_TheResult){echo "<strong>No Result Set!!! boo Either the Internet is broken or you did something wrong!</strong>"; die();}
		
		$query = "SELECT * FROM $usertable";
		
		$result = mysql_query($query);
		?> 
	<div class="formBody" id="theForm">
	 <?php
		 if($result)
		 {
		 while($row = mysql_fetch_array($result))
		 {
		 $name = $row["$yourfield"];
		 echo "Name: ".$name."<br>";
		 }
		 }
	 ?>
	</div>
</div>
</body>
</html>