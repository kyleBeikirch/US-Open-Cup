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
	
	<script type="text/javascript" src="js/jquery.js" ></script>
	<script type="text/javascript" src="scripts/ajaxupload.js"></script>
	
	
	
</head>
<body>
<div class="content">

<div class="formBody">
	<h2>Add a Team</h2>
	<form action="scripts/ajaxupload.php" method="post" name="sleeker" id="sleeker" enctype="multipart/form-data">
					<input type="hidden" name="maxSize" value="9999999999" />
					<input type="hidden" name="maxW" value="200" />
					<input type="hidden" name="fullPath" value="http://kylebeikirch.com/usoc/admin/uploads/" />
					<input type="hidden" name="relPath" value="../uploads/" />
					<input type="hidden" name="colorR" value="255" />
					<input type="hidden" name="colorG" value="255" />
					<input type="hidden" name="colorB" value="255" />
					<input type="hidden" name="maxH" value="200" />
					<input type="hidden" name="filename" value="filename" />
					<div class="rowElem"><label>Logo</label><input type="file" value="Upload Logo" name="filename" onchange="ajaxUpload(this.form,'scripts/ajaxupload.php?filename=name&amp;maxSize=9999999999&amp;maxW=200&amp;fullPath=http://kylebeikirch.com/usoc/admin/uploads/&amp;relPath=../uploads/&amp;colorR=255&amp;colorG=255&amp;colorB=255&amp;maxH=200','upload_area','File Uploading Please Wait...&lt;br /&gt;&lt;img src=\'images/loader_light_blue.gif\' width=\'128\' height=\'15\' border=\'0\' /&gt;','&lt;img src=\'images/error.gif\' width=\'16\' height=\'16\' border=\'0\' /&gt; Error in Upload, check settings and path info in source code.'); return false;" /></div>
				</form>
				
				
		<div id="upload_area">
		No Logo Yet
		</div>
</div>
</div>
</body>
</html>