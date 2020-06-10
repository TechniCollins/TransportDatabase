<?php

?>
<!Doctype html>
<html>
<head>
	<title>TransportDB</title>
	<style>
		h1, h2
		{
			color:#03dffc;
			font-family: Arial, Helvetica, sans-serif;
		}
		h1
		{
			font-size:80px;
		}
		h2
		{
			font-size:50px;
		}
		.choose_role
		{
			width:150px;
			height:150px;
			font-size:15px;
		}
	</style>
	</head>
	<body>
		<center>
			<h1>TRANSPORT DATABASE</h1>
			<h2>Log in As:</h2>
			<form action = "phpScripts/login.php" method = "POST">
			<button type = "submit" class = "choose_role" name = "role_choice" value = "driver">Driver</button>
			<button type = "submit" class = "choose_role" name = "role_choice" value = "record_keeper">Record Keeper</button>
			<button type = "submit" class = "choose_role" name = "role_choice" value = "admin">Admin</button>
			</form>
			</center>
	</body>
</html>