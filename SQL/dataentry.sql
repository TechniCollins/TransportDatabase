use transportDatabase;
									#ADD DRIVERS TO DRIVERS TABLE
INSERT INTO driverRecords VALUES("38289685", "Karanja", "Jeff", "Nakuru",
"jeff@students.ke", '1997-8-6', '2019-5-12');


								#ADD DRIVING LICENCES INFORMATION TO TABLE
INSERT INTO drivingLicenses VALUES("776Y55D", "A", '2018-8-7','2019-1-12', "38289685" );


									#ADD INSURANCE INFORMATION TO TABLE
INSERT INTO insuranceDetails VALUES("7893258741", "Comprehensive", 1500000, 6500, '2018-1-1', '2019-2-3', "MADISON");

										#ADD VEHICLES TO VEHICLES TABLE
INSERT INTO vehicleRecords VALUES("KCQ 675M", "52156723", "minibus", "Isuzu", "Polo", 10000, 30, '2018-7-11', '2017-6-5', "4789314526");

										#ASSIGN VEHICLES TO DRIVERS
INSERT INTO vehicleAssignment VALUES("KCQ 675M","25782897",'2019-12-6');

									#ADD FUEL CONSUMPTION INFORMATION
INSERT INTO fuelConsumption VALUES(NULL, "KCQ 675M",3,'2020-2-1');