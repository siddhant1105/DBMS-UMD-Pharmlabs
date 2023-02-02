USE BUDT703_Project_0503_11

DROP TABLE IF EXISTS [Pharmlabs.FullTimePayStatement];
DROP TABLE IF EXISTS [Pharmlabs.PartTimePayStatement];
DROP TABLE IF EXISTS [Pharmlabs.PayStatement];
DROP TABLE IF EXISTS [Pharmlabs.Contain];
DROP TABLE IF EXISTS [Pharmlabs.Order];
DROP TABLE IF EXISTS [Pharmlabs.Client];
DROP TABLE IF EXISTS [Pharmlabs.Employee];
DROP TABLE IF EXISTS [Pharmlabs.Product];



CREATE TABLE [Pharmlabs.Product] (
	productID CHAR (5) NOT NULL,
	productName VARCHAR (30) NOT NULL,
	productPrice DECIMAL (4,2) NOT NULL,
	CONSTRAINT pk_Product_productID PRIMARY KEY (productID) )

CREATE TABLE [Pharmlabs.Employee] (
	employeeID CHAR (10) NOT NULL,
	employeeFirstName VARCHAR (20) NOT NULL,
	employeeLastName VARCHAR (20) NOT NULL,
	employeeDOB DATE,
	employeeHours CHAR (3) NOT NULL,
	employeeBankDetails CHAR (12) NOT NULL,
	employeeSSN CHAR (9) NOT NULL,
	employeeAnnualSalary INTEGER NOT NULL,
	CONSTRAINT pk_Employee_employeeID PRIMARY KEY (employeeID))
	
CREATE TABLE  [Pharmlabs.Client] (
	clientID CHAR (4) NOT NULL,
	clientFirstName VARCHAR (20) NOT NULL,
	clientLastName VARCHAR (20) NOT NULL,
	clientPhoneNumber  CHAR (10) NOT NULL,
	clientEmail VARCHAR (50) NOT NULL, 
	clientAddress VARCHAR (50) NOT NULL, 
	CONSTRAINT pk_Client_clientID PRIMARY KEY (clientID))


CREATE TABLE [Pharmlabs.Order] (
	orderId CHAR (3) NOT NULL,
	orderDate DATE,
	orderPaymentType VARCHAR (10) NOT NULL, 
	clientID CHAR (4) NOT NULL,
	employeeID CHAR (10) NOT NULL,	
	CONSTRAINT pk_Order_orderID PRIMARY KEY (orderID),
	CONSTRAINT fk_Order_clientID FOREIGN KEY (clientID)
		REFERENCES [Pharmlabs.Client] (clientID)
		ON DELETE NO ACTION ON UPDATE CASCADE,	
	CONSTRAINT fk_Order_employeeID FOREIGN KEY (employeeID)
		REFERENCES [Pharmlabs.Employee] (employeeID)
		ON DELETE NO ACTION ON UPDATE CASCADE)

CREATE TABLE [Pharmlabs.Contain] (
	orderId CHAR (3) NOT NULL,
	productID CHAR (5) NOT NULL,
	containedQuantity INT NOT NULL,
	CONSTRAINT pk_Contain_orderID_productID PRIMARY KEY (orderID, productID),
	CONSTRAINT fk_Contain_orderID FOREIGN KEY (orderID)
		REFERENCES [Pharmlabs.Order] (orderID)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Contain_productID FOREIGN KEY (productID)
		REFERENCES [Pharmlabs.Product] (productID)
		ON DELETE NO ACTION ON UPDATE CASCADE)


CREATE TABLE [Pharmlabs.PayStatement] (
	payStatementID VARCHAR (5) NOT NULL,
	payStatementDate DATE,
	payStatementAmount DECIMAL (6,2) NOT NULL,
	payStatementTaxDeduction DECIMAL (3,2) NOT NULL,
	payStatementType VARCHAR (25) NOT NULL,
	employeeID CHAR (10) NOT NULL,
	CONSTRAINT pk_PayStatement_payStatementID PRIMARY KEY (payStatementID),
	CONSTRAINT fk_PayStatement_employeeID FOREIGN KEY (employeeID)
		REFERENCES [Pharmlabs.Employee] (employeeID)
		ON DELETE NO ACTION ON UPDATE CASCADE)

CREATE TABLE [Pharmlabs.FullTimePayStatement] (
	dentalDeduction DECIMAL (3,2) NOT NULL,
	medicalDeduction DECIMAL (3,2) NOT NULL,
	lifeInsuranceDeduction DECIMAL (3,2) NOT NULL,
	payStatementID VARCHAR (5) NOT NULL,
	CONSTRAINT pk_FullTimePayStatement_payStatementID PRIMARY KEY (payStatementID),
	CONSTRAINT fk_FullTimePayStatement_payStatementID FOREIGN KEY (payStatementID)
		REFERENCES [Pharmlabs.PayStatement] (payStatementID)
		ON DELETE NO ACTION ON UPDATE CASCADE)

CREATE TABLE [Pharmlabs.PartTimePayStatement] (
	payStatementID VARCHAR (5) NOT NULL,
	CONSTRAINT pk_PartTimePayStatement_payStatementID PRIMARY KEY (payStatementID),
	CONSTRAINT fk_PartTimePayStatement_payStatementID FOREIGN KEY (payStatementID)
		REFERENCES [Pharmlabs.PayStatement] (payStatementID)
		ON DELETE NO ACTION ON UPDATE CASCADE)


	
	
		
--PRODUCT TABLE
INSERT INTO [Pharmlabs.Product] VALUES
	('23349', 'Azithromycin', '15.50')
INSERT INTO [Pharmlabs.Product] VALUES
	('20004', 'Yonsa', '20.99')
INSERT INTO [Pharmlabs.Product] VALUES
	('26744', 'Wilate', '10.50')
INSERT INTO [Pharmlabs.Product] VALUES
	('12514', 'Paxil', '10.99')
INSERT INTO [Pharmlabs.Product] VALUES
	('40342', 'Paracetamol', '90.49')
INSERT INTO [Pharmlabs.Product] VALUES
	('51244', 'Haldol', '50.99')
 INSERT INTO [Pharmlabs.Product] VALUES
	('95046', 'Toradol', '25.50')
INSERT INTO [Pharmlabs.Product] VALUES
	('70000', 'Tylenol', '35.49')
INSERT INTO [Pharmlabs.Product] VALUES
	('00192', 'Ecotrin', '15.50')
INSERT INTO [Pharmlabs.Product] VALUES
	('73690', 'Farxiga', '18.99')
INSERT INTO [Pharmlabs.Product] VALUES
	('11111', 'Pantoprazole', '80.49')
INSERT INTO [Pharmlabs.Product] VALUES
	('44321', 'Tramadol', '30.49')
INSERT INTO [Pharmlabs.Product] VALUES
	('98908', 'Crocin', '30.50')
INSERT INTO [Pharmlabs.Product] VALUES
	('90002', 'Lyrica', '40.99')
INSERT INTO [Pharmlabs.Product] VALUES
	('10006', 'Melatonin', '24.99')


--Employee
INSERT INTO [Pharmlabs.Employee] VALUES
	('1210275566', 'John', 'Wick', '10/19/1992', 45, '111122223333', '345678921', '150000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('9018247536', 'Andrew', 'Chen', '02/13/1989', 20, '726152435261', '615278198', '35000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('8526435326', 'Dante', 'Russo', '12/18/1995', 70, '635146781524', '431568765', '235000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('2341523167', 'Sam', 'Stokes', '11/08/1990', 45, '986254312376', '765123241', '160000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('7263541326', 'Ryan', 'Reynolds', '01/26/1982', 50, '362719352618', '628192546', '180000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('9162534178', 'Tom', 'Volkov', '06/11/1985', 40, '471524361726', '263415876', '130000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('1524163524', 'Kai', 'Parker', '12/22/1990', 60, '524172635172', '627182635', '175000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('7829376152', 'Jonas', 'Holland', '05/30/1979', 45, '271652415278', '563819273', '150000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('5243619874', 'Noah', 'Hemsworth', '04/04/1987', 45, '627182736172', '916243526', '145000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3217645321', 'Taylor', 'Cox', '09/07/1990', 40, '657241527368', '453816243', '96000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('8364213452', 'Phoebe', 'Markle', '10/16/1993', 45, '981425638716', '715341625', '85000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('6923542193', 'Megan', 'Fox', '03/20/1974', 50, '916342618263', '817243516', '170000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('4391746539', 'Kylie', 'Holmes', '08/10/1984', 20, '647241536472', '721826382', '30000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3581945242', 'Aria', 'Cooper', '01/28/1984', 20, '362815243627', '371524866', '32000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('1243544261', 'Lea', 'Marco', '07/24/1992', 18, '814253617124', '452816243', '28000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('4565748541', 'Noah', 'Conner', '10/25/1991', 20, '458632147589', '456985236', '32000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3452014783', 'George', 'Murphy', '02/14/1984', 45, '965822365785', '774589632', '85000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('9584752363', 'Sophia', 'Walsh', '12/19/1979', 60, '148896553255', '159336582', '165000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3554896554', 'Kyle', 'Martin', '11/28/1990', 45, '996544778523', '996582214', '90000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('1478559657', 'Oscar', 'Smith', '01/16/1989', 50, '885233124569', '556328859', '180000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3754889655', 'Jacob', 'Johnson', '06/19/1986', 40, '774588963214', '647859324', '80000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('5478965213', 'Ava', 'Davies', '12/23/1993', 20, '996582344785', '651499328', '32000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('4596574585', 'Zayn', 'Evans', '05/07/1987', 45, '225896547852', '785596884', '90000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3257745865', 'Harry', 'Garcia', '04/09/1988', 45, '365521489632', '328845965', '95000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('9658665822', 'Michael', 'Wilson', '09/07/1989', 40, '778965412589', '748896582', '80000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('4856998745', 'Charles', 'Miller', '10/20/1992', 20, '448596336589', '325596849', '32000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('4599745863', 'Linda', 'White', '03/24/1976', 50, '778954854489', '445791360', '150000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('3359677845', 'Samantha', 'Anderson', '08/01/1979', 45, '665478554785', '469932710', '85000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('7796584224', 'Margaret', 'Wang', '01/25/1991', 20, '226958321478', '856423971', '32000')
INSERT INTO [Pharmlabs.Employee] VALUES
	('1477859655', 'Emily', 'Taylor', '07/14/1995', 18, '332541889652', '844965213', '28000')


--CLIENT
INSERT INTO [Pharmlabs.Client] VALUES
	 ('5101', 'Chris','Roe', '9724071615', 'roechris12@gmail.com', '795 E Dreyfus Ave,Hyattsville, MD,20782')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('9456', 'Mike','Ross', '8234544980', 'mikeross@yahoo.com', '621 Belcrest Rd, Phoenix, AZ, 25860')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('3021', 'Louis','Litt', '7283946155', 'louis123@outlook.com', '450 E Orange St, San Diego, CA, 45002')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('4024', 'Rachel','Zane', '9979254374', 'rachel23@gmail.com', '1186 Roseville Pkwy, Seattle, WA, 94105')
INSERT INTO [Pharmlabs.Client] VALUES
 	('0987', 'Tom','Hank', '9833423633', 'Hank45@yahoo.com','575 Market St, Spanish Fort, AL, 36527')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('2244', 'Virat','Kohli', '2516214736', 'Viratkohli18@gmail.com', '183 Lonely Oak Drive, Los Angeles, CA,90029')
INSERT INTO [Pharmlabs.Client] VALUES
	('1092', 'Rachel','Green', '3236693061', 'Rachelgreen1@gmail.com', '1307 Southside Lane, Denver, CO, 80202')
INSERT INTO [Pharmlabs.Client] VALUES
 	('7923', 'Bill', 'Gates', '3027488103', 'Billgates12@outlook.com', '183 N Harvard St, Chicago, IL, 60637')
INSERT INTO [Pharmlabs.Client] VALUES
	('8432', 'Cameron', 'Green', '7737021234', 'Greencameron@gmail.com', '5802 S Ellis Ave, College Park, MD, 20783')
INSERT INTO [Pharmlabs.Client] VALUES
	('6063', 'David','Warner', '5150184406', 'Davewarner90@yahoo.com', '19 Lawrence Street, Baltimore, MD, 08753')
INSERT INTO [Pharmlabs.Client] VALUES
	('1754', 'Julia','Stiles', '2128551754', 'Julia@gmail.com', '714 Anmoore Road, Queens, NY, 11693')
INSERT INTO [Pharmlabs.Client] VALUES
	('5212', 'Blake', 'Lively', '2000191478', 'Blakelively@gmail.com', '1272 Glenview Drive, Dallas, TX, 78476')
INSERT INTO [Pharmlabs.Client] VALUES
	('8886', 'Eva','Roberts', '3615836748', 'Evaroberts35@gmail.com', '3807 Fairway Drive, Oakland, CA, 94612')
INSERT INTO [Pharmlabs.Client] VALUES
	('9314', 'Nancy','Wheeler', '2606097862', 'nancywheeler34@gmail.com', '2003 Windy Ridge Road, Charlotte, NC, 28263')
INSERT INTO [Pharmlabs.Client] VALUES
	('0001', 'Jim','Hooper', '4434509303', 'hooperjim11@gmail.com', '3969 Wildrose Lane, Detroit, MI, 48227')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('3454', 'Dylan','Brien', '3524896584', 'dbrien1997@gmail.com', '15 Maple St, Hyattsville, MD,20782')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('1451', 'Harvey','Specter', '9563258741', 'harveyspecter@yahoo.com', '104 Elm St, Phoenix, AZ, 25860')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('8520', 'John','Doe', '6325145215', 'johnd05@outlook.com', '201 Main St, San Diego, CA, 45002')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('7410', 'Jason','Blunt', '7458216985', 'jsonblunt83@gmail.com', '120 Apache Rd, Seattle, WA, 94105')
INSERT INTO [Pharmlabs.Client] VALUES
 	('3210', 'Chris','Pratt', '6981123478', 'cpratttt7@yahoo.com','5632 Pike St, Spanish Fort, AL, 36527')
INSERT INTO [Pharmlabs.Client] VALUES
	 ('5401', 'Tom','Smith', '7458999652', 'smithtom8@gmail.com', '261 Cypress St, Los Angeles, CA,90029')
INSERT INTO [Pharmlabs.Client] VALUES
	('9657', 'Sarah','Green', '5469885475', 'sargreen95@gmail.com', '187 Aspen Lane, Denver, CO, 80202')
INSERT INTO [Pharmlabs.Client] VALUES
 	('0864', 'Jamie', 'Dornan', '3479654258', 'jkdornan@outlook.com', '62 W Meadow St, Chicago, IL, 60637')
INSERT INTO [Pharmlabs.Client] VALUES
	('8495', 'Colin', 'Hoover', '9965874112', 'colinhoov7@gmail.com', '531 Ridge Ave, College Park, MD, 20783')
INSERT INTO [Pharmlabs.Client] VALUES
	('3715', 'Luca','Jameson', '3365847221', 'ljameson1090@yahoo.com', '26 Dogwood St, Baltimore, MD, 08753')
INSERT INTO [Pharmlabs.Client] VALUES
	('6482', 'Dan','Brown', '9586645825', 'db4586@gmail.com', '74 Lakeview Road, Queens, NY, 11693')
INSERT INTO [Pharmlabs.Client] VALUES
	('4651', 'Lucy', 'Hale', '4859656684', 'halelucy4@gmail.com', '108 First Rd, Dallas, TX, 78476')
INSERT INTO [Pharmlabs.Client] VALUES
	('7113', 'Steve','Jones', '8566393985', 'jonessteve8@gmail.com', '344 Lincoln Rd, Oakland, CA, 94612')
INSERT INTO [Pharmlabs.Client] VALUES
	('9637', 'Wade','Williams', '7755884695', 'wwilliams34@gmail.com', '203 Hickory St, Charlotte, NC, 28263')
INSERT INTO [Pharmlabs.Client] VALUES
	('7235', 'Poppy','Herbert', '7742215896', 'hpoppyy99@gmail.com', '45 Walmut Lane, Detroit, MI, 48227')


--ORDER
INSERT INTO [Pharmlabs.Order]VALUES
	('151', '11/01/2022', 'Online', '6063', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('153', '10/15/2021', 'Online', '5101', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('709', '05/09/2022', 'Cash',  '0001', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('584', '01/12/2021', 'Cash', '9314', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('232', '02/09/2021', 'Online', '7923', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('591', '12/24/2021', 'Online', '9456', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('407', '04/30/2022', 'Online', '2244', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('963', '08/19/2022', 'Online', '0987', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('687', '06/05/2022', 'Online', '1092', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('827', '03/25/2021', 'Cash', '8886', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('228', '01/20/2022', 'Online',  '3021', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('575', '07/23/2021', 'Cash',  '5212', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('538', '09/18/2021', 'Online',  '8886', '4856998745')
INSERT INTO [Pharmlabs.Order] VALUES
	('822', '10/12/2021', 'Cash',  '9314', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('186', '03/05/2022', 'Online',  '7235', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('608', '01/14/2021', 'Online',  '9637', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('609', '08/25/2022', 'Online',  '7113', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('610', '09/14/2022', 'Online',  '4651', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('611', '06/13/2022', 'Online',  '6482', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('612', '05/13/2022', 'Cash',  '3715', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('613', '04/12/2021', 'Online',  '8495', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('614', '03/08/2021','Cash',  '0864', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('615', '02/15/2022', 'Online',  '9657', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('616', '08/13/2022', 'Cash',  '5401', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('617', '09/30/2022', 'Online',  '3210', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('718', '12/24/2021', 'Online',  '7410', '4856998745')
INSERT INTO [Pharmlabs.Order] VALUES
	('719', '11/08/2022', 'Online',  '8520', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('720', '10/09/2022', 'Cash',  '1451', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('002', '09/10/2022', 'Cash',  '3454', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('003', '08/09/2022', 'Cash',  '0001', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('004', '07/30/2021', 'Online',  '9314', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('998', '08/29/2021', 'Online',  '8886', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('997', '08/28/2022', 'Cash',  '5212', '4856998745')
INSERT INTO [Pharmlabs.Order] VALUES
	('996', '08/27/2022', 'Cash',  '1754', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('995', '09/25/2022', 'Cash',  '6063', '4856998745')
INSERT INTO [Pharmlabs.Order] VALUES
	('994', '10/21/2022', 'Online',  '8432', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('993', '11/23/2022', 'Online',  '7923', '4856998745')
INSERT INTO [Pharmlabs.Order] VALUES
	('992', '12/22/2022', 'Cash',  '1092', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('991', '11/20/2022', 'Online',  '2244', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('990', '03/27/2022', 'Cash',  '0987', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('989', '04/14/2022', 'Online',  '4024', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('100', '05/21/2022', 'Online',  '3021', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('101', '06/23/2022', 'Online',  '9456', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('102', '08/04/2021', 'Online',  '0987', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('103', '01/30/2022', 'Online',  '1451', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('104', '07/09/2021', 'Online',  '9314', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('105', '06/07/2021', 'Online',  '8520', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('106', '09/23/2022', 'Online',  '0987', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('107', '10/06/2022', 'Online',  '5101', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('108', '04/15/2022', 'Online',  '8886', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('109', '03/18/2022', 'Online',  '2244', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('400', '11/01/2022', 'Online',  '3021', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('401', '12/31/2022', 'Cash',  '0864', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('402', '04/07/2022', 'Online',  '8495', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('403', '02/08/2022', 'Online',  '3454', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('404', '07/16/2021', 'Cash',  '1451', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('405', '08/12/2021', 'Cash',  '8520', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('406', '10/16/2022', 'Online',  '7410', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('428', '09/03/2021', 'Online',  '3210', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('408', '05/29/2021', 'Online',  '9657', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('409', '07/28/2022', 'Online',  '8495', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('410', '06/17/2022', 'Online',  '1092', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('411', '02/04/2021', 'Online',  '0001', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('412', '01/24/2022', 'Online',  '9657', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('413', '12/26/2021', 'Online',  '0864', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('414', '11/16/2022', 'Online',  '8886', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('415', '10/14/2021', 'Online',  '2244', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('416', '07/02/2021', 'Online',  '1092', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('417', '06/22/2022', 'Online',  '5101', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('418', '05/08/2021', 'Online',  '9456', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('419', '04/28/2021', 'Online',  '3021', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('420', '02/27/2022', 'Online',  '4024', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('421', '01/13/2022', 'Online',  '0987', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('422', '04/11/2021', 'Cash',  '2244', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('423', '06/24/2022', 'Online',  '1092', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('424', '03/25/2021', 'Online',  '7923', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('425', '08/29/2021', 'Cash',  '8432', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('426', '09/30/2022', 'Online',  '6063', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('427', '04/31/2021', 'Cash',  '1754', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('429', '02/20/2022', 'Online',  '5212', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('430', '04/25/2022', 'Online',  '8886', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('431', '01/06/2022', 'Online',  '9314', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('432', '10/08/2021', 'Online',  '0001', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('433', '03/31/2021', 'Online',  '3454', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('434', '12/20/2022', 'Online',  '1451', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('435', '06/29/2022', 'Online',  '8520', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('436', '11/11/2022', 'Online',  '7410', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('437', '05/02/2022', 'Online',  '3210', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('438', '01/24/2021', 'Online',  '5401', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('439', '07/06/2021', 'Online',  '9657', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('440', '07/24/2022', 'Online',  '0864', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('441', '02/20/2022', 'Cash',  '8495', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('442', '03/02/2022', 'Online',  '3715', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('443', '10/18/2022', 'Online',  '6482', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('444', '04/05/2022', 'Cash',  '4651', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('445', '02/21/2022', 'Online',  '7113', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('446', '01/09/2022', 'Online',  '9637', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('447', '06/11/2022', 'Online',  '7235', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('448', '09/04/2022', 'Online',  '0987', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('449', '03/02/2022', 'Online',  '2244', '4565748541')
INSERT INTO [Pharmlabs.Order] VALUES
	('450', '08/20/2022', 'Online',  '7923', '4391746539')
INSERT INTO [Pharmlabs.Order] VALUES
	('451', '09/14/2022', 'Online',  '6063', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('452', '10/24/2022', 'Online',  '1754', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('453', '11/24/2022', 'Online',  '5212', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('454', '11/23/2022', 'Online',  '8886', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('455', '07/11/2022', 'Online',  '5101', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('456', '08/01/2022', 'Online',  '9456', '5478965213')
INSERT INTO [Pharmlabs.Order] VALUES
	('457', '09/19/2022', 'Online',  '3021', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('458', '06/22/2022', 'Online',  '4024', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('459', '09/28/2022', 'Online',  '0987', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('460', '02/20/2022', 'Online',  '9314', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('461', '03/11/2022', 'Online',  '3454', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('462', '02/20/2022', 'Online',  '8520', '7796584224')
INSERT INTO [Pharmlabs.Order] VALUES
	('463', '01/14/2022', 'Cash',  '1754', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('464', '09/15/2022', 'Online',  '0001', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('465', '08/12/2022', 'Online',  '3454', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('466', '07/29/2022', 'Cash',  '1451', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('467', '07/28/2022', 'Online',  '8520', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('468', '07/28/2022', 'Online',  '0987', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('469', '05/22/2022', 'Online',  '9456', '1243544261')
INSERT INTO [Pharmlabs.Order] VALUES
	('470', '04/24/2022', 'Online',  '2244', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('471', '10/10/2022', 'Online',  '7923', '9018247536')
INSERT INTO [Pharmlabs.Order] VALUES
	('472', '11/14/2022', 'Online',  '1092', '3581945242')
INSERT INTO [Pharmlabs.Order] VALUES
	('473', '08/22/2021', 'Cash',  '6063', '1477859655')
INSERT INTO [Pharmlabs.Order] VALUES
	('474', '07/19/2022', 'Online',  '3021', '3581945242')





--CONTAIN
INSERT INTO [Pharmlabs.Contain] VALUES
	('538', '23349', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('575', '20004', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('151', '20004', '25')
INSERT INTO [Pharmlabs.Contain] VALUES
	('151', '23349', '23')
INSERT INTO [Pharmlabs.Contain] VALUES
	('153', '23349', '21')
INSERT INTO [Pharmlabs.Contain] VALUES
	('709', '10006', '19')
INSERT INTO [Pharmlabs.Contain] VALUES
	('584', '90002', '17')
INSERT INTO [Pharmlabs.Contain] VALUES
	('232', '12514', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('591', '26744', '13')
INSERT INTO [Pharmlabs.Contain] VALUES
	('407', '00192', '11')
INSERT INTO [Pharmlabs.Contain] VALUES
	('963', '73690', '9')
INSERT INTO [Pharmlabs.Contain] VALUES
	('687', '23349', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('827', '44321', '1')
INSERT INTO [Pharmlabs.Contain] VALUES
	('228', '12514', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('228', '10006', '3')
INSERT INTO [Pharmlabs.Contain] VALUES
	('474', '11111', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('473', '44321', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('472', '10006', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('471', '90002', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('470', '98908', '1')
INSERT INTO [Pharmlabs.Contain] VALUES
	('469', '44321', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('468', '11111', '3')
INSERT INTO [Pharmlabs.Contain] VALUES
	('467', '73690', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('466', '00192', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('465', '70000', '6')
INSERT INTO [Pharmlabs.Contain] VALUES
	('464', '95046', '7')
INSERT INTO [Pharmlabs.Contain] VALUES
	('463', '51244', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('462', '40342', '9')
INSERT INTO [Pharmlabs.Contain] VALUES
	('461', '12514', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('460', '26744', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('459', '20004', '23')
INSERT INTO [Pharmlabs.Contain] VALUES
	('458', '23349', '24')
INSERT INTO [Pharmlabs.Contain] VALUES
	('457', '10006', '25')
INSERT INTO [Pharmlabs.Contain] VALUES
	('456', '90002', '31')
INSERT INTO [Pharmlabs.Contain] VALUES
	('455', '98908', '30')
INSERT INTO [Pharmlabs.Contain] VALUES
	('454', '44321', '21')
INSERT INTO [Pharmlabs.Contain] VALUES
	('453', '11111', '20')
INSERT INTO [Pharmlabs.Contain] VALUES
	('453', '73690', '19')
INSERT INTO [Pharmlabs.Contain] VALUES
	('452', '00192', '18')
INSERT INTO [Pharmlabs.Contain] VALUES
	('451', '70000', '17')
INSERT INTO [Pharmlabs.Contain] VALUES
	('450', '95046', '16')
INSERT INTO [Pharmlabs.Contain] VALUES
	('449', '51244', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('448', '40342', '1')
INSERT INTO [Pharmlabs.Contain] VALUES
	('447', '12514', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('446', '26744', '3')
INSERT INTO [Pharmlabs.Contain] VALUES
	('445', '20004', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('444', '23349', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('443', '20004', '6')
INSERT INTO [Pharmlabs.Contain] VALUES
	('442', '26744', '7')
INSERT INTO [Pharmlabs.Contain] VALUES
	('441', '12514', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('440', '40342', '9')
INSERT INTO [Pharmlabs.Contain] VALUES
	('439', '51244', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('438', '95046', '12')
INSERT INTO [Pharmlabs.Contain] VALUES
	('437', '70000', '14')
INSERT INTO [Pharmlabs.Contain] VALUES
	('436', '00192', '16')
INSERT INTO [Pharmlabs.Contain] VALUES
	('435', '73690', '18')
INSERT INTO [Pharmlabs.Contain] VALUES
	('434', '11111', '29')
INSERT INTO [Pharmlabs.Contain] VALUES
	('433', '44321', '30')
INSERT INTO [Pharmlabs.Contain] VALUES
	('432', '98908', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('431', '90002', '23')
INSERT INTO [Pharmlabs.Contain] VALUES
	('430', '10006', '24')
INSERT INTO [Pharmlabs.Contain] VALUES
	('429', '70000', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('427', '20004', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('426', '23349', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('425', '26744', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('424', '10006', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('423', '90002', '25')
INSERT INTO [Pharmlabs.Contain] VALUES
	('422', '98908', '19')
INSERT INTO [Pharmlabs.Contain] VALUES
	('421', '44321', '20')
INSERT INTO [Pharmlabs.Contain] VALUES
	('420', '00192', '21')
INSERT INTO [Pharmlabs.Contain] VALUES
	('419', '73690', '11')
INSERT INTO [Pharmlabs.Contain] VALUES
	('418', '11111', '1')
INSERT INTO [Pharmlabs.Contain] VALUES
	('417', '73690', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('416', '40342', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('415', '12514', '6')
INSERT INTO [Pharmlabs.Contain] VALUES
	('414', '26744', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('413', '23349', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('412', '20004', '25')
INSERT INTO [Pharmlabs.Contain] VALUES
	('413', '26744', '40')
INSERT INTO [Pharmlabs.Contain] VALUES
	('414', '12514', '31')
INSERT INTO [Pharmlabs.Contain] VALUES
	('412', '40342', '30')
INSERT INTO [Pharmlabs.Contain] VALUES
	('411', '51244', '18')
INSERT INTO [Pharmlabs.Contain] VALUES
	('410', '95046', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('409', '70000', '20')
INSERT INTO [Pharmlabs.Contain] VALUES
	('408', '00192', '3')
INSERT INTO [Pharmlabs.Contain] VALUES
	('428', '73690', '1')
INSERT INTO [Pharmlabs.Contain] VALUES
	('406', '11111', '9')
INSERT INTO [Pharmlabs.Contain] VALUES
	('405', '44321', '7')
INSERT INTO [Pharmlabs.Contain] VALUES
	('404', '98908', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('403', '90002', '3')
INSERT INTO [Pharmlabs.Contain] VALUES
	('402', '10006', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('401', '23349', '6')
INSERT INTO [Pharmlabs.Contain] VALUES
	('400', '20004', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('109', '26744', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('108', '12514', '13')
INSERT INTO [Pharmlabs.Contain] VALUES
	('107', '40342', '11')
INSERT INTO [Pharmlabs.Contain] VALUES
	('106', '51244', '27')
INSERT INTO [Pharmlabs.Contain] VALUES
	('105', '95046', '29')
INSERT INTO [Pharmlabs.Contain] VALUES
	('104', '70000', '30')
INSERT INTO [Pharmlabs.Contain] VALUES
	('103', '73690', '28')
INSERT INTO [Pharmlabs.Contain] VALUES
	('102', '00192', '26')
INSERT INTO [Pharmlabs.Contain] VALUES
	('101', '23349', '24')
INSERT INTO [Pharmlabs.Contain] VALUES
	('100', '44321', '22')
INSERT INTO [Pharmlabs.Contain] VALUES
	('989', '10006', '20')
INSERT INTO [Pharmlabs.Contain] VALUES
	('990', '90002', '18')
INSERT INTO [Pharmlabs.Contain] VALUES
	('991', '98908', '16')
INSERT INTO [Pharmlabs.Contain] VALUES
	('992', '51244', '14')
INSERT INTO [Pharmlabs.Contain] VALUES
	('993', '40342', '12')
INSERT INTO [Pharmlabs.Contain] VALUES
	('994', '95046', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('995', '70000', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('996', '12514', '6')
INSERT INTO [Pharmlabs.Contain] VALUES
	('997', '20004', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('998', '90002', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('004', '40342', '1')
INSERT INTO [Pharmlabs.Contain] VALUES
	('003', '00192', '22')
INSERT INTO [Pharmlabs.Contain] VALUES
	('002', '73690', '21')
INSERT INTO [Pharmlabs.Contain] VALUES
	('720', '23349', '13')
INSERT INTO [Pharmlabs.Contain] VALUES
	('719', '44321', '40')
INSERT INTO [Pharmlabs.Contain] VALUES
	('718', '23349', '35')
INSERT INTO [Pharmlabs.Contain] VALUES
	('617', '95046', '13')
INSERT INTO [Pharmlabs.Contain] VALUES
	('616', '70000', '9')
INSERT INTO [Pharmlabs.Contain] VALUES
	('615', '20004', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('614', '90002', '11')
INSERT INTO [Pharmlabs.Contain] VALUES
	('613', '11111', '12')
INSERT INTO [Pharmlabs.Contain] VALUES
	('612', '51244', '13')
INSERT INTO [Pharmlabs.Contain] VALUES
	('611', '90002', '14')
INSERT INTO [Pharmlabs.Contain] VALUES
	('610', '44321', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('609', '00192', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('608', '20004', '3')
INSERT INTO [Pharmlabs.Contain] VALUES
	('186', '73690', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('822', '10006', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('994', '73690', '28')
INSERT INTO [Pharmlabs.Contain] VALUES
	('995', '51244', '32')
INSERT INTO [Pharmlabs.Contain] VALUES
	('996', '26744', '20')
INSERT INTO [Pharmlabs.Contain] VALUES
	('997', '11111', '2')
INSERT INTO [Pharmlabs.Contain] VALUES
	('998', '23349', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('004', '44321', '35')
INSERT INTO [Pharmlabs.Contain] VALUES
	('003', '10006', '15')
INSERT INTO [Pharmlabs.Contain] VALUES
	('002', '95046', '12')
INSERT INTO [Pharmlabs.Contain] VALUES
	('720', '11111', '25')
INSERT INTO [Pharmlabs.Contain] VALUES
	('719', '40342', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('718', '98908', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('617', '26744', '8')
INSERT INTO [Pharmlabs.Contain] VALUES
	('616', '90002', '4')
INSERT INTO [Pharmlabs.Contain] VALUES
	('615', '40342', '10')
INSERT INTO [Pharmlabs.Contain] VALUES
	('614', '12514', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('613', '20004', '5')
INSERT INTO [Pharmlabs.Contain] VALUES
	('612', '10006', '2')



--PAY STATEMENT
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('AB124', '10/19/2022', '6250.00', '0.30', 'Full Time', '1210275566') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('IK394', '10/19/2022', '1458.33', '0.15', 'Part Time', '9018247536') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('FZ278', '10/19/2022', '9791.66', '0.40', 'Full Time', '8526435326') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('PA345', '10/19/2022', '6666.66', '0.35', 'Full Time', '2341523167') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('VK078', '10/19/2022', '7500.00', '0.35', 'Full Time', '7263541326') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('NP808', '10/19/2022', '5416.66', '0.30', 'Full Time', '9162534178') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('SP999', '10/19/2022', '7291.66', '0.35', 'Full Time', '1524163524') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('YK495', '10/19/2022', '6250.00', '0.30', 'Full Time', '7829376152') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('KP609', '10/19/2022', '6041.66', '0.30', 'Full Time', '5243619874') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('NI108', '10/19/2022', '4000.00', '0.25', 'Full Time', '3217645321') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('IT358', '10/19/2022', '3541.66', '0.25', 'Full Time', '8364213452') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('GK854', '10/19/2022', '7083.33', '0.35', 'Full Time', '6923542193') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('UT090', '10/19/2022', '1250.00', '0.15', 'Part Time', '4391746539') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('DK456', '10/19/2022', '1333.33', '0.15', 'Part Time', '3581945242') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('MK078', '10/19/2022', '1166.67', '0.15', 'Part Time', '1243544261') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('MO870', '10/19/2022', '1333.33', '0.15', 'Part Time', '4565748541') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('JB007', '10/19/2022', '3541.66', '0.25', 'Full Time', '3452014783') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('SW222', '10/19/2022', '6875.00', '0.35', 'Full Time', '9584752363')
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('KM111', '10/19/2022', '3750.00', '0.25', 'Full Time', '3554896554') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('OS545', '10/19/2022', '7500.00', '0.35', 'Full Time', '1478559657') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('JJ986', '10/19/2022', '3333.33', '0.25', 'Full Time', '3754889655') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('DS091', '10/19/2022', '1333.33', '0.15', 'Part Time', '5478965213') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('EZ309', '10/19/2022', '3750.00', '0.25', 'Full Time', '4596574585') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('GH108', '10/19/2022', '3958.33', '0.25', 'Full Time', '3257745865') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('IO101', '10/19/2022', '3333.33', '0.25', 'Full Time', '9658665822') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('CM480', '10/19/2022', '1333.33', '0.15', 'Part Time', '4856998745') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('WL922', '10/19/2022', '6250.00', '0.30', 'Full Time', '4599745863') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('AO687', '10/19/2022', '3541.66', '0.25', 'Full Time', '3359677845') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('WG024', '10/19/2022', '1333.33', '0.15', 'Part Time', '7796584224') 
INSERT INTO [Pharmlabs.PayStatement] VALUES 
	('ET090', '10/19/2022', '1166.66', '0.15', 'Part Time', '1477859655')  






















--FullTimePayStatement
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'AB124')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'FZ278')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'VK078')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'PA345')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'NP808')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'SP999')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'YK495')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'KP609')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'NI108')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'IT358')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'GK854')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'JB007')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'SW222')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'KM111')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'OS545')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'JJ986')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'EZ309')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'GH108')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'IO101')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'WL922')
INSERT INTO [Pharmlabs.FullTimePayStatement] VALUES 
	('0.02', '0.03', '0.05', 'AO687')

--PartTimePayStatement
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('IK394')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('UT090')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('DK456')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('MK078')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('MO870')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('DS091')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('CM480')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('WG024')
INSERT INTO [Pharmlabs.PartTimePayStatement] VALUES 
	('ET090')
