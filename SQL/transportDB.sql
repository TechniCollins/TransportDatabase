CREATE DATABASE IF NOT EXISTS transportDatabase;
USE transportDatabase;

CREATE TABLE insuranceDetails
(
policyNumber varchar(15) PRIMARY KEY,
policyType varchar(30) NOT NULL,
insuredAmt int NOT NULL,
premium int NOT NULL,
beginningDate date NOT NULL,
endDate date NOT NULL,
insuranceCompany varchar(50) NOT NULL,

CONSTRAINT Chk_policyType CHECK(policyType = "Third Party" OR policyType = "Comprehensive" OR policyType = "Third party, fire and theft")
)ENGINE=INNODB;

CREATE TABLE vehicleRecords
(
	regNo varchar(8) PRIMARY KEY,#No need to say not null because it's already primary key
	logBookNo varchar(10) NOT NULL UNIQUE,#Log book number is unique for each vehicle
	vehicleType varchar(10) NOT NULL,
	vehicleMake varchar(15) NOT NULL,
	vehicleModel varchar(15),
	engineCapacity smallint,
	carryingCapacity smallint,
	purchaseDate date,
	manufactureYear date,
	insurancePolicy varchar(15) UNIQUE,

	INDEX(insurancePolicy),
	FOREIGN KEY(insurancePolicy) REFERENCES insuranceDetails(policyNumber),
	
	CONSTRAINT Chk_vehicletype CHECK(vehicleType = "bus" OR vehicleType= "minibus" OR
	vehicleType= "lorry" OR vehicleType= "pick-up" OR vehicleType= "car" OR vehicleType= "trailer"),
	CONSTRAINT Chk_engine CHECK(engineCapacity<=20000 AND engineCapacity>400),
	CONSTRAINT Chk_carrying CHECK(carryingCapacity BETWEEN 1 AND 100)
)ENGINE=INNODB;

CREATE TABLE driverRecords
(
	driverNo varchar(10) PRIMARY KEY,
	surname varchar(15) NOT NULL,
	otherNames varchar(30) NOT NULL,
	address varchar(20),
	email varchar(320) NOT NULL,
	DOB date NOT NULL,
	employmentDate date NOT NULL
)ENGINE=INNODB;

CREATE TABLE drivingLicenses
(
	licenseID varchar(6) PRIMARY KEY,
	vehicleClass varchar(15),
	issueDate date,
	expiryDate date,
	driverNo varchar(10) UNIQUE,
	INDEX(driverNo),#driverNo has to be indexed for refrential integrity to be enforced
	FOREIGN KEY(driverNo) REFERENCES driverRecords(driverNo),#Enforce refrential integrity
	CONSTRAINT Chk_vehicleClass CHECK(vehicleClass = "A" OR vehicleClass = "B" OR vehicleClass = "C"
	OR vehicleClass = "D" OR vehicleClass = "E" OR vehicleClass = "F" OR vehicleClass = "G")
)ENGINE=INNODB;


CREATE TABLE vehicleAssignment
(
	vehicleReg varchar(8) PRIMARY KEY,
	driverNo varchar(10),
	assignmentDate date NOT NULL,
	INDEX(vehicleReg),
	FOREIGN KEY(vehicleReg) REFERENCES vehicleRecords(regNo),
	INDEX(driverNo),
	FOREIGN KEY(driverNo) REFERENCES driverRecords(driverNo)
)ENGINE=INNODB;

CREATE TABLE fuelConsumption
(
	consumptionID int AUTO_INCREMENT PRIMARY KEY,#bigint because it's a transaction table - fueling sessions may be as many as millions
	vehicleID varchar(20),
	litresConsumed smallint NOT NULL,
	consumptionDate date NOT NULL,
	INDEX(vehicleID),
	FOREIGN KEY(vehicleID) REFERENCES vehicleRecords(regNo),
	CONSTRAINT Chk_litres CHECK(litresConsumed >0 AND litresConsumed <=20)#litres consumed should strictly be above 0... 20 litres is maximum
)ENGINE=INNODB;