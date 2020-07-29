CREATE SCHEMA IF NOT EXISTS BSORE;
USE BSORE ;

CREATE TABLE IF NOT EXISTS CustomerDim (
         Customer_code    VARCHAR(45)   NOT NULL,
         FirstName  VARCHAR(45)       NOT NULL,
         LastName         VARCHAR(30)   NOT NULL,
         Gender     ENUM ('M','F')  NOT NULL,
         BirthDate    DATE  NOT NULL,
         MaritalStatus VARCHAR(10),
         PostCode VARCHAR(15) NOT NULL,
         City     VARCHAR(30) NOT NULL,
         Income  FLOAT NOT NULL,
         PRIMARY KEY (Customer_code));
         
  CREATE TABLE IF NOT EXISTS DateDim (
         Date_Key INT NOT NULL AUTO_INCREMENT,
         CalenderYear INT NOT NULL,
         CalenderQuater INT NOT NULL,
         MonthOfYear INT NOT NULL,
         PRIMARY KEY (Date_Key));
         
  CREATE TABLE IF NOT EXISTS SellingChannelDim (
		 SellingChannel VARCHAR(45) NOT NULL,
         SellingChannel_code VARCHAR(45) NOT NULL,
         CommisionRate TINYINT NOT NULL,
         PRIMARY KEY (SellingChannel));
         
  CREATE TABLE IF NOT EXISTS PaymentDim (
         PaymentID INT NOT NULL,
         Payment_Card VARCHAR(45) NOT NULL,
         PRIMARY KEY (PaymentID));
         
 CREATE TABLE IF NOT EXISTS ORDERFACTS (
        Date_Key INT NOT NULL,
        Customer_code VARCHAR(45) NOT NULL,
        SellingChannel VARCHAR(45) NOT NULL,
        PaymentID INT NOT NULL,
        InvoiceNumber VARCHAR(30) NOT NULL,
        TotalCost FLOAT NOT NULL,
        TotalRetail_Price FLOAT NOT NULL,
        PRIMARY KEY (Date_key, Customer_code, SellingChannel, PaymentID));
 
 ALTER TABLE ORDERFACTS
 ADD CONSTRAINT FK_DateDim1
 FOREIGN KEY (Date_Key)
 REFERENCES DateDim (Date_Key);
 
 ALTER TABLE ORDERFACTS
 ADD CONSTRAINT FK_SellingChannelDim1
 FOREIGN KEY (SellingChannel)
 REFERENCES SellingChannelDim (SellingChannel);
 
 ALTER TABLE ORDERFACTS
 ADD CONSTRAINT FK_PaymentDim1
 FOREIGN KEY (PaymentID)
 REFERENCES PaymentDim (PaymentID);
 
 ALTER TABLE ORDERFACTS
 ADD CONSTRAINT FK_CustomerDim1
 FOREIGN KEY (Customer_code)
 REFERENCES CustomerDim (Customer_code);
 
 

 
 
 
         
          
		 