<?php
include "db_connection.php";
//Open log file to take note of database access and use
$log_file = fopen("../dbSecurity/databaseLogs.txt", "a");
$role_choice = $_POST['role_choice'];
$choice_log_text = date("Y/m/d")." " . date("h:i:sa")."	"."Someone requested to log in as ".$role_choice."\n";
fwrite($log_file, $choice_log_text);

if($role_choice == "driver")
{
	$placeholder = "Enter Driver ID";
	if (isset($_POST['login']) && !empty($_POST['username']) && !empty($_POST['userPassword']))
 	{
 		if ($_POST['username'] == 'driver' && $_POST['userPassword'] == '1234')
 	 	{
        	$_SESSION['valid'] = true;
        	$_SESSION['timeout'] = time();
        	$_SESSION['username'] = 'Transportdb_Driver';
        	echo 'Log in success';
        	fwrite($log_file, date("Y/m/d")." " . date("h:i:sa")."	Successfull login by ".$_SESSION['username']);
        	header('Location: driver.php');
    	}
    	else
    	{
        	echo 'Wrong username or password';
        	fwrite($log_file, date("Y/m/d")." " . date("h:i:sa")."	Attempted login failed ");
    	}
 	}
	}
	elseif($role_choice == "record_keeper" or $role_choice == "admin")
	{
	$placeholder = "Enter Registered username";
	if (isset($_POST['login']) && !empty($_POST['username']) && !empty($_POST['userPassword']))
 	{
 		if ($_POST['username'] == 'admin' && $_POST['userPassword'] == '5678')
 	 	{
        	$_SESSION['valid'] = true;
        	$_SESSION['timeout'] = time();
        	$_SESSION['username'] = 'Transportdb_Admin';
        	echo 'Log in success';
        	fwrite($log_file, date("Y/m/d")." " . date("h:i:sa")."	Successfull login by ".$_SESSION['username']);
        	header('Location: admin.com');
    	}
    	else
    	{
        	echo 'Wrong username or password';
        	fwrite($log_file, date("Y/m/d")." " . date("h:i:sa")."	Attempted login failed ");
    	}
 	}
	}
	else
	{
		echo "No valid role selected";
	}

fclose($log_file);
?>
<!Doctype html>
<html>
<head>
	<title>TransportDB</title>
	<style>
		.db_success_connect
		{
			color:#05f782;
		}
		h2
		{
			color:#03dffc;
			font-size: 50px;
		}

		.login, .login_button
		{
			margin:10px 10px 10px 10px;
			width: 300px;
			height:40px;
		}
	</style>
	</head>
	<body>
		<center>
			<h2>LOGIN AS:	<?php echo $role_choice;?></h2>
		<form action = "<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method = "POST" class = "login">
			<input type = "text" name = "username" placeholder="<?php echo $placeholder;?>" class = "login">
			<input type = "password" name = "userPassword" placeholder="Enter password" class = "login">
			<input type = "submit" name = "login" class = "login_button">
		</center>
		</form>
	</body>
</html>