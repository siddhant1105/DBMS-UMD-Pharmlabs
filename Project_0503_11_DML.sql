USE BUDT703_Project_0503_11


-- What are the names of the employees who are full time employees, with their hours worked and annual salary?
-- Full Time employees have hours worked greater than or equal to 25 hours
DROP VIEW IF EXISTS FullTimeEmployees
GO
CREATE VIEW FullTimeEmployees
AS
SELECT e.employeeID AS 'Employee ID',CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name', e.employeeHours AS 'Employee Hours', e.employeeAnnualSalary AS 'Employee Annual Salary'
FROM [Pharmlabs.Employee] e
WHERE e.employeeHours >= 25

SELECT f.*
FROM FullTimeEmployees f


-- What are the names of the employees who are part time employees, with their hours worked and annual salary?
-- Part Time employees have hours worked less than 25 hours
DROP VIEW IF EXISTS PartTimeEmployees
GO
CREATE VIEW PartTimeEmployees
AS
SELECT e.employeeID AS 'Employee ID',CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name', e.employeeHours AS 'Employee Hours', e.employeeAnnualSalary AS 'Employee Annual Salary'
FROM [Pharmlabs.Employee] e
WHERE e.employeeHours < 25

SELECT pt.*
FROM PartTimeEmployees pt


-- What is the final amount of each product for each order?
SELECT c.orderID AS 'Order ID', p.productPrice AS 'Product Price', c.containedQuantity 'Product Quantity in order' ,(c.containedQuantity * p.productPrice) as 'Total Product Price in Order'
FROM [Pharmlabs.Contain] c, [Pharmlabs.Product] p
WHERE c.productID = p.productID 



-- What is the final amount of each order?
DROP VIEW IF EXISTS FinalOrderPrice
GO
CREATE VIEW FinalOrderPrice
AS
SELECT c.orderID AS 'Order ID', SUM(c.containedQuantity * p.productPrice) AS ' Total Price of Order'
FROM [Pharmlabs.Contain] c, [Pharmlabs.Product] p
WHERE c.productID = p.productID
GROUP BY c.orderID

SELECT fop.*
FROM FinalOrderPrice fop



-- What is the average price of products
SELECT AVG(p.productPrice) AS 'Average Price of Products'
FROM [Pharmlabs.Product] p


--Details of prodcuts that have price higher than avg price
SELECT p.productID AS 'Product ID',p.productName AS 'Product Name' , p.productPrice AS 'Product Price', p.productPrice - a.avgPrice AS "How much higher than Average"
FROM [Pharmlabs.Product] p, (
	SELECT AVG(p.productPrice) AS avgPrice
	FROM [Pharmlabs.Product] p
	) AS a
WHERE p.productPrice > a.avgPrice


-- Give the receipt of each order (Receipt contains order details with the client ID and client name, along with the ID and name of the employee who made the sale)
SELECT DISTINCT o.orderID AS 'Order ID', o.orderDate AS 'Order Date' , o.orderPaymentType AS 'Mode of Payment', cl.clientID AS 'Client ID',
	CONCAT (cl.clientFirstName,' ',cl.clientLastName) AS 'Client Full Name' , e.employeeID AS 'Employee ID',
	CONCAT (e.employeeFirstName,' ',e.employeeLastName) AS 'Employee Full Name' , 
	SUM(c.containedQuantity * p.productPrice) AS ' Total Price of Order'
FROM [Pharmlabs.Contain] c, [Pharmlabs.Product] p, [Pharmlabs.Order] o, [Pharmlabs.Client] cl, [Pharmlabs.Employee] e
WHERE c.productID = p.productID AND c.orderID = o.orderID AND 
	o.clientID = cl.clientID AND o.employeeID = e.employeeID
GROUP BY o.orderID, o.orderDate, o.orderPaymentType, cl.clientID, CONCAT (cl.clientFirstName,' ',cl.clientLastName), e.employeeID,  CONCAT (e.employeeFirstName,' ',e.employeeLastName)



-- Give the name and hours of employees who made sales with order details
SELECT e.employeeID AS 'Employee ID', CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name', e.employeeHours AS 'Employee Hours', 
	o.orderID AS 'Order ID', o.clientID AS 'Client ID', o.orderDate AS 'Order Date', o.orderPaymentType AS 'Order Payment Type'
FROM [Pharmlabs.Employee] e, [Pharmlabs.Order] o
WHERE e.employeeID = o.employeeID



-- How many sales did each employee make from highest number of sales to lowest number of sales?
SELECT o.employeeID AS 'Emoloyee ID', COUNT( o.employeeID) AS 'Number of Sales made'
FROM [Pharmlabs.Order] o
GROUP BY o.employeeID
ORDER BY COUNT(o.employeeID) DESC



-- What details of the employee who made the maximum amount of sales
SELECT e.employeeID  AS 'Employee ID', CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name', e.employeeDOB AS 'Employee Date of Birth', e.employeeHours AS 'Employee Hours',
	e.employeeBankDetails AS 'Employee Bank Details', e.employeeSSN AS 'Employee SSN', e.employeeAnnualSalary AS 'Employee Annual Salary'
FROM [Pharmlabs.Employee] e, 
	(
	SELECT MAX(o.employeeID) AS 'Employee With Maximum Sales' 
	FROM [Pharmlabs.Order] o
	) AS m
WHERE e.employeeID = m.[Employee With Maximum Sales]




-- Promote the part time employee with the highest sales to become a full time employee (Only part time employees make sales)
-- Increase the Hours worked by employee with highest sales to 45 and give him/her a salary raise to $85000
UPDATE [Pharmlabs.Employee] 
SET employeeHours = 45, employeeAnnualSalary = 85000
WHERE employeeID =
	(
	SELECT e.employeeID
	FROM [Pharmlabs.Employee] e, 
		(
		SELECT MAX(o.employeeID) AS 'Employee With Maximum Sales' 
		FROM [Pharmlabs.Order] o
		) AS m
	WHERE e.employeeID = m.[Employee With Maximum Sales]
	)


SELECT e.employeeID  AS 'Employee ID', CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name', e.employeeDOB AS 'Employee Date of Birth', e.employeeHours AS 'Employee Hours',
	e.employeeBankDetails AS 'Employee Bank Details', e.employeeSSN AS 'Employee SSN', e.employeeAnnualSalary AS 'Employee Annual Salary'
FROM [Pharmlabs.Employee] e




-- What are the deatils of the client that makes maximum purchases
SELECT c.clientID AS 'Client ID', CONCAT (c.clientFirstName,' ', c.clientLastName) AS 'Client Full Name', c.clientPhoneNumber AS 'Client Phone Number', c.clientEmail AS 'Client email ID', c.clientAddress AS 'Client Address'
FROM [Pharmlabs.Client] c
WHERE c.clientID = 
	(
	SELECT MAX(o.clientID)
	FROM [Pharmlabs.Order] o 
	)





--What is the net pay received by full time employees after tax deduction, dental deduction, life insurance and medical deduction
SELECT DISTINCT e.employeeID AS 'Employee ID', CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name',  
	(ps.payStatementAmount - (ps.payStatementTaxDeduction * ps.payStatementAmount) - (ps.payStatementAmount * (f.dentalDeduction + f.medicalDeduction + f.lifeInsuranceDeduction)))*24 AS 'Net Salary'
FROM [Pharmlabs.PayStatement] ps, [Pharmlabs.FullTimePayStatement] f, [Pharmlabs.Employee] e
WHERE ps.payStatementID = f.payStatementID AND ps.employeeID = e.employeeID
ORDER BY e.employeeID




--What is the net pay received by part time employees after tax deduction
SELECT DISTINCT e.employeeID AS 'Employee ID', CONCAT (e.employeeFirstName,' ', e.employeeLastName) AS 'Employee Full Name',  
	(ps.payStatementAmount - (ps.payStatementTaxDeduction * ps.payStatementAmount))*24 AS 'Net Salary'
FROM [Pharmlabs.PayStatement] ps, [Pharmlabs.PartTimePayStatement] pt, [Pharmlabs.Employee] e
WHERE ps.payStatementID = pt.payStatementID AND ps.employeeID = e.employeeID
ORDER BY e.employeeID
