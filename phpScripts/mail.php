<?php
include "db_Connection.php";
ini_set("SMTP","ssl://smtp.gmail.com");
ini_set("smtp_port","465");
ini_set('sendmail_from', "email address here");

if(isset($_POST['send_mail']))
{
	$selectQuery = "SELECT  driverRecords.driverNo, driverRecords.surname, driverRecords.otherNames, driverRecords.DOB,
	driverRecords.employmentDate, drivingLicenses.licenseID, drivingLicenses.vehicleClass, drivingLicenses.issueDate,
	drivingLicenses.expiryDate FROM driverRecords INNER JOIN drivingLicenses ON driverRecords.driverNo = drivingLicenses.driverNo
 	WHERE drivingLicenses.expiryDate < CURRENT_DATE;";

 	$printResults = $connection -> query($selectQuery);
 	if ($printResults->num_rows > 0) {
		echo "<center><table border = '1'>";
		echo "<tr><th>DRIVER ID</th><th>SURNAME</th><th>OTHER NAMES</th><th>DL NUMBER</th><th>DL EXPIRED ON</th>";
    	// output data of each row
    	while($row = $printResults->fetch_assoc()) {
        	echo "<tr>";
        	echo "<td>".$row["driverNo"]. "<td>" . $row["surname"]."<td>".$row["otherNames"]."<td>".$row["licenseID"]."<td>".$row["expiryDate"];
        	echo "</tr>";
        	$driver_name = "Some name";
        	$driver_email = "recepient email";
    	}
    	echo "</table></center>";
		} 
		else
		{
    		echo "0 results";
		}
	
		$send_expiry_mail = mail($driver_email, "Transport Database DL Expiry Notice", "Hello". $driver_name."... Your driving license expired on 23rd Feb 2020. Kindly renew as soon as possible!!!");
	if($send_expiry_mail)
{
	echo("Sent successfully");
}
else
{
	echo("Something went wrong");
}

}

?><!--End of PHP code-->

<!Doctype html>
<html>
<head>
	<title>Expired DL</title>
	<style>
		.submit_mail
		{
			width: 300px;
			height:30px;
			font-size:25px;
		}
		h2
		{
			color:#03dffc;
			font-size: 30px;
		}
	</style>
	</head>
	<body>
		<center>
	<h2>Remind drivers with expired driving licenses</h2>
<form action = "<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method = "POST">
	<input type = "submit" name = "send_mail" class = "submit_mail">
	</form>
</center>
</body>
</html>