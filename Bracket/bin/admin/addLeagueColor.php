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
	<link rel="stylesheet" href="css/colorpicker.css" type="text/css" />
    <link rel="stylesheet" media="screen" type="text/css" href="css/layout.css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/colorpicker.js"></script>
    <script type="text/javascript" src="js/eye.js"></script>
    <script type="text/javascript" src="js/utils.js"></script>
    <script type="text/javascript" src="js/layout.js?ver=1.0.2"></script>
	<script type="text/javascript" src="scripts/ajaxupload.js"></script>

	<script type="text/javascript">
	var colorChoice
	function updateColor($hex)
	{
		colorChoice = $hex;
		var strVar="<br/>";
		strVar += "<form action=\"addLeagueLogo.php\" method=\"post\">";
		strVar += "<input type=\"hidden\" name=\"color\" value=\"" + colorChoice + "\"\/>";
		strVar += "<input type=\"submit\" value=\"Next\" \/>";
		strVar += "<\/form>";

		document.getElementById("colorForm").innerHTML = strVar;
	}
	
	function getColor()
	{
		return colorChoice;
	}
	</script>
	
	
</head>
<body>
<div class="content">

	<div class="formBody" id="theForm">
			<h1>Add League</h1>
			<h2>Step 1: Choose League Color</h2>
			<br/>
			<p id="colorpickerHolder">
			</p>
				 <script type="text/javascript">
						$('#colorpickerHolder').ColorPicker({
						flat: 'true',
						onSubmit: function (hsb, hex, rgb) {
							updateColor(hex);
						},
						
						});
						
						$('#colorpickerHolder').ColorPickerSetColor('00FF00');
	 			</script>
	 			<div id="colorForm">
	 				<br/>
	 				<form action="addLeagueLogo.php" method="post">
	 					<input type="hidden" name="color" value="00FF00"/>
	 					<input type="submit" value="Next" />
	 				</form>
	 			</div>
	</div>	
</div>
</body>
</html>