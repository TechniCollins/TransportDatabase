<?php
//Open log file to record connection attempts
$connection_log_file = fopen("../dbSecurity/databaseLogs.txt", "a");

$hostName = "localhost";
$userName = "root";
$password = "";
$database = "transportdatabase";

$connection = mysqli_connect($hostName, $userName, $password, $database);

if($connection)
{
	echo "<p class = 'db_success_connect'>"."Database connection established"."</p>";
	$log_message = date("Y/m/d")." " . date("h:i:sa")."	"."Access to the database ".$database." was granted to ".$userName."\n";

}
else
{
	echo "Connection to database failed";
	$log_message = date("Y/m/d")." " . date("h:i:sa")."	"."Access to the database ".$database." was denied to ".$userName."\n";
}
fwrite($connection_log_file, $log_message);
fclose($connection_log_file);
?>