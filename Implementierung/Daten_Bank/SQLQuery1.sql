USE master;
GO

-- Create and use Database
IF DB_ID(N'Restaurant_Bestellungen') IS NULL
    CREATE DATABASE Restaurant_Bestellungen;
GO

USE Restaurant_Bestellungen;
go

-- Create Table Speise 

IF OBJECT_ID('Speise') IS NOT NULL
    DROP TABLE Speise;
GO
CREATE TABLE Speise (
	Produkt_ID INT PRIMARY KEY,
	Produkt_Name VARCHAR (255) NOT NULL,
	Preis DECIMAL (10, 2) NOT NULL,
	Beschreibung VARCHAR (255)
);

-- Create Table Kunde 
IF OBJECT_ID('Kunde') IS NOT NULL
    DROP TABLE Kunde;
GO
CREATE TABLE Kunde (
	Kunde_id INT  PRIMARY KEY,
	Tisch_NR INT
);

-- Create Table Restaurant 
IF OBJECT_ID('Restaurant') IS NOT NULL
    DROP TABLE Restaurant;
GO
CREATE TABLE Restaurant (
	Restaurant_id INT  PRIMARY KEY,
	Restaurant_name VARCHAR (255) NOT NULL,
	Telefon VARCHAR (25),
	Email VARCHAR (255),
	Strasse VARCHAR (255),
	Stadt VARCHAR (255),
	PLZ VARCHAR (6)
);

-- Create Table Mitarbeiter 
IF OBJECT_ID('Mitarbeiter') IS NOT NULL
    DROP TABLE Mitarbeiter;
GO
CREATE TABLE Mitarbeiter (
	Mitarbeiter_id INT  PRIMARY KEY,
	Vorname VARCHAR (50) NOT NULL,
	Nachname VARCHAR (50) NOT NULL,
	Email VARCHAR (255) NOT NULL ,
	Telefon VARCHAR (25),
	Gehalt DECIMAL (10, 2) NOT NULL,
	Strasse VARCHAR (255),
	Stadt VARCHAR (255),
	PLZ VARCHAR (6),
	Restaurant_id INT NOT NULL,
	Restaurant_leiter INT,
	 CONSTRAINT fk_Restaurant FOREIGN KEY (Restaurant_id)
			REFERENCES Restaurant(Restaurant_id)
	--FOREIGN KEY (Restaurant_id) REFERENCES Restaurant (Restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
	--FOREIGN KEY (Restaurant_leiter) REFERENCES Mitarbeiter (Restaurant_leiter) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Create Table Rechnung 
IF OBJECT_ID('Rechnung') IS NOT NULL
    DROP TABLE Rechnung;
GO
CREATE TABLE Rechnung(
	Rechnung_id INT PRIMARY KEY,
	Kunde_id INT,
	Rechnung_status tinyint NOT NULL,
	-- Rechnung status: 1 = Nicht bezahlt; 2 =Bezahlt; 3 = In bearbeitung; 4 = Fertig
	Rechnung_datum DATE NOT NULL,
	Restaurant_id INT NOT NULL,
	Mitarbeiter_id INT NOT NULL,
	CONSTRAINT fk_Kunde FOREIGN KEY (Kunde_id)
			REFERENCES Kunde(Kunde_id),
	CONSTRAINT fk_Restaurant FOREIGN KEY (Restaurant_id)
			REFERENCES Restaurant(Restaurant_id),
	CONSTRAINT fk_Mitarbeiter FOREIGN KEY (Mitarbeiter_id)
			REFERENCES Mitarbeiter(Mitarbeiter_id)

	--FOREIGN KEY (Kunde_id) REFERENCES Kunde (Kunde_id) ON DELETE CASCADE ON UPDATE CASCADE,
	--FOREIGN KEY (Restaurant_id) REFERENCES Restaurant (Restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
	--FOREIGN KEY (Mitarbeiter_id) REFERENCES Mitarbeiter (Mitarbeiter_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Create Table Rechnung_element 
IF OBJECT_ID('Rechnung_element') IS NOT NULL
    DROP TABLE Rechnung_element;
GO
CREATE TABLE Rechnung_element (
	Rechnung_id INT,
	Element_id INT,
	Produkt_ID INT NOT NULL,
	Anzahl INT NOT NULL,
	Preis DECIMAL (10, 2) NOT NULL,
	PRIMARY KEY (Rechnung_id, Element_id),
	CONSTRAINT fk_Rechnung FOREIGN KEY (Rechnung_id)
			REFERENCES Rechnung(Rechnung_id),
	CONSTRAINT fk_Speise FOREIGN KEY (Produkt_ID)
			REFERENCES Speise(Produkt_ID)
	--FOREIGN KEY (Rechnung_id) REFERENCES Rechnung (Rechnung_id) ON DELETE CASCADE ON UPDATE CASCADE,
	--FOREIGN KEY (Produkt_ID) REFERENCES Speise (Produkt_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

--INSERT INTO  TABLE Speise 

INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1001,'Belgische Waffeln',15.30,'Puderzucker und Nutella oder  Puderzucker und Vanilleeis oder  Nutella und Vanilleeis')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1002,'Apfelküchle',12.90,'Vanillesauce und Sahne oder  Vanilleeis und Vanillesauce')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1003,'Fritas',5.20,'warme, gefüllte Teigtaschen mit Vollmilchschokolade')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1004,'Tiramisu',7.50,'Eine italienische Versuchung')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1005,'Cinnamon French Toast',11.10,'Eine himmlische Köstlichkeit mit Vanillesauce')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1006,'Breakfast Bowl',7.39,'Joghurt mit Früchten der Saison und Granola')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1007,'Rührei',5.30,'Champignons und Bread Sticks (vegetarisch) oder Bacon und Bread Sticks')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1008,'Avocado Toast',7.50,'Eine italienische Versuchung')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1009,'Brooklyn Sandwich',3.90,'mit Schinken, Gouda und Tomaten')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1010,'Veggie Sandwich',6.50,'mit Hartkäse, Grillgemüse, Tomaten und Rucola')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1011,'Pasta del mare',12.50,'Orecchiette in Tomatensauce mit Oliven und Meeresfrüchten')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1012,'Veggie Pasta ',10.55,'Orecchiette in Tomatensauce mit Antipastigemüse, Oliven und Grana Padano')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1013,'Putenschnitzel',16.50,'paniertes Putenschnitzel mit Spätzle oder Pommes und einer feinen Rahmsauce')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1014,'Salat Mista',5.58,'gemischter Salat mit Gurken, Tomaten und Mais')
INSERT INTO Speise(Produkt_ID,Produkt_Name,Preis,Beschreibung) VALUES(1015,'Funghi Salat ',6.10,'gemischter Salat mit gebratenen Champignons & Mais')

--INSERT INTO TABLE Kunde 
INSERT INTO Kunde(Kunde_id,Tisch_NR)VALUES(9001,70001)
INSERT INTO Kunde(Kunde_id,Tisch_NR)VALUES(9002,70002)
INSERT INTO Kunde(Kunde_id,Tisch_NR)VALUES(9003,70003)
INSERT INTO Kunde(Kunde_id,Tisch_NR)VALUES(9003,70004)
INSERT INTO Kunde(Kunde_id,Tisch_NR)VALUES(9001,70005)


--INSERT INTO TABLE Restaurant 
INSERT INTO Restaurant(Restaurant_id,Restaurant_name,Telefon,Email,Strasse,Stadt,PLZ)VALUES(1,'Mauritius_stuttgart','07116159147','stuttgart@my-mauritius.com','Marienstraße 12','Stuttgart','70178')
INSERT INTO Restaurant(Restaurant_id,Restaurant_name,Telefon,Email,Strasse,Stadt,PLZ)VALUES(2,'Mauritius_Worms','062412673030','Worms@my-mauritius.com','Andreasstraße 13','Worms','67547')


--INSERT INTO TABLE Mitarbeiter 
INSERT INTO Mitarbeiter(Mitarbeiter_id,Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES(5001,'Layla','Schmitt','Layla.Schmitt@my-mauritius.com','017664655999',2530.85,'Blumenstr 22','Stuttgart','70178',1,NULL);
INSERT INTO Mitarbeiter(Mitarbeiter_id,Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES(5002,'markus','Habeb','markus.Habeb@my-mauritius.com','017632585999',1630.85,'langstr 7','Stuttgart','70178',1,5001);
INSERT INTO Mitarbeiter(Mitarbeiter_id,Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES(6001,'Thomas','Braun','Thomas.Braun@my-mauritius.com','017664655999',2530.85,'hochstr 17','Worms','67547',2,NULL);
INSERT INTO Mitarbeiter(Mitarbeiter_id,Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES(6002,'markus','Habeb','markus.Habeb@my-mauritius.com','017632585999',1630.85,'Kaiserstr 31','Worms','67547',2,6001);


--INSERT INTO TABLE Rechnung 
INSERT INTO Rechnung(Rechnung_id,Kunde_id, Rechnung_status, Rechnung_datum, Restaurant_id,Mitarbeiter_id) VALUES(30111,9001,4,'20201006',2,6001);
INSERT INTO Rechnung(Rechnung_id,Kunde_id, Rechnung_status, Rechnung_datum, Restaurant_id,Mitarbeiter_id) VALUES(30112,9003,4,'20201006',2,6001);


--INSERT INTO TABLE Rechnung_element 
INSERT INTO Rechnung_element(Rechnung_id, Element_id, Produkt_ID, Anzahl, Preis) VALUES(30111,20001,1004,1,7.50);
INSERT INTO Rechnung_element(Rechnung_id, Element_id, Produkt_ID, Anzahl, Preis) VALUES(30111,20002,1015,1,6.10);



