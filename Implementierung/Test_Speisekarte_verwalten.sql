USE master;
GO

IF DB_ID('Restaurant_Test') IS NULL
  CREATE DATABASE Restaurant_Test;
GO

USE Restaurant_Test;
GO 

IF OBJECT_ID('Speise') IS NOT NULL
  DROP TABLE Speise;
GO



CREATE TABLE Speise (
  ID_Speise int NOT NULL IDENTITY PRIMARY KEY, 
  Name nvarchar(50),
  Preis decimal(5,2),
  Beschreibung nvarchar(200),
);

Insert into Speise (Name, Preis, Beschreibung) values 
('Pizza Margherita', 8.90, 'Pizza mit Tomatensoﬂe und K‰se'),
('Pizzaa Margherita', 8.90, 'Pizza mit Tomatensoﬂe und K‰se'),
('Pizzaaa Margherita', 8.90, 'Pizza mit Tomatensoﬂe und K‰se'),
('Pizzaaaa Margherita', 8.90, 'Pizza mit Tomatensoﬂe und K‰se'),
('Pizzaaaaa Margherita', 8.90, 'Pizza mit Tomatensoﬂe und K‰se');