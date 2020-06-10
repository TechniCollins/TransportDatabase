use transportdatabase;
											#MONTHLY FUEL CONSUMPTION AND TOTAL COST
SELECT fuelConsumption.vehicleID AS vehicle_Registration, vehicleRecords.vehicleType, vehicleRecords.vehicleMake,
vehicleRecords.engineCapacity, fuelConsumption.litresConsumed, fuelConsumption.consumptionDate, 100*fuelConsumption.litresConsumed AS Total_Cost
FROM vehicleRecords INNER JOIN fuelConsumption ON fuelConsumption.vehicleID = vehicleRecords.regNo ORDER BY fuelConsumption.consumptionDate;


												#VEHICLES ASSIGNED TO DRIVERS
SELECT vehicleAssignment.vehicleReg, vehicleRecords.vehicleType, vehicleRecords.vehicleMake, vehicleRecords.vehicleModel, driverrecords.driverNo,
driverrecords.surname, driverrecords.otherNames, vehicleAssignment.assignmentDate FROM vehicleAssignment INNER JOIN vehicleRecords
ON vehicleAssignment.vehicleReg = vehicleRecords.regNo INNER JOIN driverRecords ON vehicleAssignment.driverNo = driverRecords.driverNo;


													  #ALL INSURANCES
SELECT vehicleRecords.regNo, vehicleRecords.vehicleType, vehicleRecords.vehicleMake, insuranceDetails.policyNumber, insuranceDetails.policyType,
insuranceDetails.insuranceCompany, insuranceDetails.insuredAmt, insuranceDetails.premium, insuranceDetails.endDate FROM insuranceDetails INNER JOIN 
vehicleRecords ON insuranceDetails.policyNumber = vehicleRecords.insurancePolicy;


													#OVERDUE INSURANCES
SELECT vehicleRecords.regNo, vehicleRecords.vehicleType, vehicleRecords.vehicleMake, insuranceDetails.policyNumber, insuranceDetails.policyType,
insuranceDetails.insuranceCompany, insuranceDetails.insuredAmt, insuranceDetails.premium, insuranceDetails.endDate FROM insuranceDetails INNER JOIN 
vehicleRecords ON insuranceDetails.policyNumber = vehicleRecords.insurancePolicy WHERE insuranceDetails.endDate < CURRENT_DATE;


										#ALL DRIVERS AND THEIR DRIVING LICENCES
SELECT  driverRecords.driverNo, driverRecords.surname, driverRecords.otherNames, driverRecords.DOB, driverRecords.employmentDate,
drivingLicenses.licenseID, drivingLicenses.vehicleClass, drivingLicenses.issueDate, drivingLicenses.expiryDate FROM driverRecords 
INNER JOIN drivingLicenses ON driverRecords.driverNo = drivingLicenses.driverNo;


										#DRIVERS WITH EXPIRED DRIVING LICENCES
SELECT  driverRecords.driverNo, driverRecords.surname, driverRecords.otherNames, driverRecords.DOB, driverRecords.employmentDate,
drivingLicenses.licenseID, drivingLicenses.vehicleClass, drivingLicenses.issueDate, drivingLicenses.expiryDate
FROM driverRecords INNER JOIN drivingLicenses ON driverRecords.driverNo = drivingLicenses.driverNo
 WHERE drivingLicenses.expiryDate < CURRENT_DATE;





