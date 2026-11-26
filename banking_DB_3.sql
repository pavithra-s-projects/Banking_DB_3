create database BankingDB;
use BankingDB;
create table Customers(
CustomerID int primary key,
Firstname varchar(50),
Lastname varchar(50),
email varchar(100),
phone varchar(15),
AccountCreationDate date);
select database();
use BankingDB;
show tables;
create table Accounts(
AccountID INT,
Accounttype Varchar(20),
Balance Decimal(10,2)
);


-- transaction table 
CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

-- Branches table 
CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
-- Account Branches table 
CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

-- Loan tables 
CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
desc loans;
desc customers;
alter table customers Add DateOfBirth Date;
select database ();
use BankingDB;
create table dummy(sno int primary key, name varchar(20));
desc dummy;
alter table dummy add column age int;
select * from dummy;
alter table dummy drop column age;
desc dummy;
alter table dummy add age int first;
select * from dummy;
alter table dummy add column age1 int after sno;
select * from dummy;
select * from customers;
desc customers;
alter table customers modify phone varchar(20);
desc customers;
alter table customers modify email varchar(50);
desc customers;
select * from dummy;
drop table dummy;
insert into dummy values(1,'Pavi'), (2,'Ash');
delete from dummy;

-- 1st Task - accounts -> connect with customers (changing the accounts table so giving first then connecting customers [so in ref])
-- add a foreign key on customerid that references customers(customerid)

ALTER TABLE Accounts ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

desc customers;
desc accounts;

-- task 2 Accounts --> connect with branches 
-- Add a foreign key on BranchID that references Branches(BranchID)

alter table accounts add BranchID INT;

Alter table Branches 
add constraint PK_Branches
primary key (BranchID);

alter table Accounts 
add constraint FK_Accounts_Branches
foreign key (BranchID)
references Branches(BranchID);

desc accounts;

-- task 3 transactions connect with accounts 
-- Add a foreign key on AccountID that references Accounts(AccountID)

ALTER TABLE Accounts ADD PRIMARY KEY (AccountID);
  ALTER TABLE Transactions ADD COLUMN AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID) 
REFERENCES Accounts(AccountID);

select * from transactions;
desc transactions;

select * from customers;
desc customers;
select * from loans;
desc loans;

-- task 4 , loans --> customers 
-- Add a foreign key on CustomerID that references Customers(CustomerID)

alter table loans add column CustomerID Int;

alter table loans 
add constraint FK_loans_customerid
foreign key (customerid)
references customers(customerid);

drop table dummy;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;


SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Transactions
WHERE TransactionID = 302;


SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;













