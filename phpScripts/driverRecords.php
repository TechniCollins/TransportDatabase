<?php
$connect_db = "transportdatabase";
$connect_host = "localhost";
$connect_user = "root";
$connect_pwd = "";

$conn = new mysqli($connect_host, $connect_user, $connect_pwd,$connect_db);
if($conn)
{
	echo "Success";
}
else
{
	echo "Failed to establish connection!";
}

$selectQuery = "SELECT  driverRecords.driverNo, driverRecords.surname, driverRecords.otherNames, driverRecords.DOB, driverRecords.employmentDate,
drivingLicenses.licenseID, drivingLicenses.vehicleClass, drivingLicenses.issueDate, drivingLicenses.expiryDate
FROM driverRecords INNER JOIN drivingLicenses ON driverRecords.driverNo = drivingLicenses.driverNo
 WHERE drivingLicenses.expiryDate < CURRENT_DATE;";
$printResults = $conn -> query($selectQuery);
if ($printResults->num_rows > 0) {
	echo "<table border = '1'>";
	echo "<tr><th>DRIVER ID</th><th>SURNAME</th><th>OTHER NAMES</th><th>DL NUMBER</th><th>DL EXPIRED ON</th>";
    // output data of each row
    while($row = $printResults->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row["driverNo"]. "<td>" . $row["surname"]."<td>".$row["otherNames"]."<td>".$row["licenseID"]."<td>".$row["expiryDate"];
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}
?>
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
		table, tr, td, th
		{
			  border: 1px solid black;
  			  border-collapse: collapse;
		}
		td
		{
			width:150px;
		}
	</style>
	</head>
</html>