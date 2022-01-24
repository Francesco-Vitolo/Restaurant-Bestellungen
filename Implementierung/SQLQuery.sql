
USE Restaurant_Bestellungen;
go


--CREATE TABLE Speise (
--	Produkt_ID INT identity(1000,1) PRIMARY KEY,
--	Produkt_Name VARCHAR (255) NOT NULL,
--	Preis DECIMAL (10, 2) NOT NULL,
--	Beschreibung VARCHAR (255)
--);

--CREATE TABLE Kunde (
--	Kunde_id INT identity(9000,1) PRIMARY KEY,
--	Tisch_NR INT
--);


--CREATE TABLE Restaurant (
--	Restaurant_id INT identity(1,1)  PRIMARY KEY,
--	Restaurant_name VARCHAR (255) NOT NULL,
--	Telefon VARCHAR (25),
--	Email VARCHAR (255),
--	Strasse VARCHAR (255),
--	Stadt VARCHAR (255),
--	PLZ VARCHAR (6)
--);


--CREATE TABLE Mitarbeiter (
--	Mitarbeiter_id INT identity(5000,1) PRIMARY KEY,
--	Vorname VARCHAR (50) NOT NULL,
--	Nachname VARCHAR (50) NOT NULL,
--	Email VARCHAR (255) NOT NULL ,
--	Telefon VARCHAR (25),
--	Gehalt DECIMAL (10, 2) NOT NULL,
--	Strasse VARCHAR (255),
--	Stadt VARCHAR (255),
--	PLZ VARCHAR (6),
--	Restaurant_id INT NOT NULL,
--	Restaurant_leiter INT,
--	 CONSTRAINT fk_Restaurant FOREIGN KEY (Restaurant_id)
--			REFERENCES Restaurant(Restaurant_id)
--	--FOREIGN KEY (Restaurant_id) REFERENCES Restaurant (Restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
--	--FOREIGN KEY (Restaurant_leiter) REFERENCES Mitarbeiter (Restaurant_leiter) ON DELETE NO ACTION ON UPDATE NO ACTION
--);


--CREATE TABLE Rechnung(
--	Rechnung_id INT identity(30000,1) PRIMARY KEY,
--	Kunde_id INT,
--	Rechnung_status tinyint NOT NULL,
--	-- Rechnung status: 1 = Nicht bezahlt; 2 =Bezahlt; 3 = In bearbeitung; 4 = Fertig
--	Rechnung_datum DATE NOT NULL,
--	Restaurant_id INT NOT NULL,
--	Mitarbeiter_id INT NOT NULL,
--	CONSTRAINT fk_Kunde FOREIGN KEY (Kunde_id)
--			REFERENCES Kunde(Kunde_id),
--	CONSTRAINT fk_RestaurantRechnung FOREIGN KEY (Restaurant_id)
--			REFERENCES Restaurant(Restaurant_id),
--	CONSTRAINT fk_Mitarbeiter FOREIGN KEY (Mitarbeiter_id)
--			REFERENCES Mitarbeiter(Mitarbeiter_id)

--	--FOREIGN KEY (Kunde_id) REFERENCES Kunde (Kunde_id) ON DELETE CASCADE ON UPDATE CASCADE,
--	--FOREIGN KEY (Restaurant_id) REFERENCES Restaurant (Restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
--	--FOREIGN KEY (Mitarbeiter_id) REFERENCES Mitarbeiter (Mitarbeiter_id) ON DELETE NO ACTION ON UPDATE NO ACTION
--);


--CREATE TABLE Rechnung_element (
--	Rechnung_id INT,
--	Element_id INT,
--	Produkt_ID INT NOT NULL,
--	Anzahl INT NOT NULL,
--	Preis DECIMAL (10, 2) NOT NULL,
--	PRIMARY KEY (Rechnung_id, Element_id),
--	CONSTRAINT fk_Rechnung FOREIGN KEY (Rechnung_id)
--			REFERENCES Rechnung(Rechnung_id),
--	CONSTRAINT fk_Speise FOREIGN KEY (Produkt_ID)
--			REFERENCES Speise(Produkt_ID)
--	--FOREIGN KEY (Rechnung_id) REFERENCES Rechnung (Rechnung_id) ON DELETE CASCADE ON UPDATE CASCADE,
--	--FOREIGN KEY (Produkt_ID) REFERENCES Speise (Produkt_ID) ON DELETE CASCADE ON UPDATE CASCADE
--);

--INSERT INTO  TABLE Speise 

INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Belgische Waffeln',15.30,'Puderzucker und Nutella oder  Puderzucker und Vanilleeis oder  Nutella und Vanilleeis')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Apfelküchle',12.90,'Vanillesauce und Sahne oder  Vanilleeis und Vanillesauce')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Fritas',5.20,'warme, gefüllte Teigtaschen mit Vollmilchschokolade')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Tiramisu',7.50,'Eine italienische Versuchung')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Cinnamon French Toast',11.10,'Eine himmlische Köstlichkeit mit Vanillesauce')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Breakfast Bowl',7.39,'Joghurt mit Fru?chten der Saison und Granola')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Rührei',5.30,'Champignons und Bread Sticks (vegetarisch) oder Bacon und Bread Sticks')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Avocado Toast',7.50,'Eine italienische Versuchung')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Brooklyn Sandwich',3.90,'mit Schinken, Gouda und Tomaten')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Veggie Sandwich',6.50,'mit Hartka?se, Grillgemu?se, Tomaten und Rucola')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Pasta del mare',12.50,'Orecchiette in Tomatensauce mit Oliven und Meeresfrüchten')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Veggie Pasta ',10.55,'Orecchiette in Tomatensauce mit Antipastigemüse, Oliven und Grana Padano')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Putenschnitzel',16.50,'paniertes Putenschnitzel mit Spätzle oder Pommes und einer feinen Rahmsauce')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Salat Mista',5.58,'gemischter Salat mit Gurken, Tomaten und Mais')
INSERT INTO Speise(Produkt_Name,Preis,Beschreibung) VALUES('Funghi Salat ',6.10,'gemischter Salat mit gebratenen Champignons & Mais')

--INSERT INTO TABLE Kunde 
INSERT INTO Kunde(Tisch_NR)VALUES(70001)
INSERT INTO Kunde(Tisch_NR)VALUES(70002)
INSERT INTO Kunde(Tisch_NR)VALUES(70003)
INSERT INTO Kunde(Tisch_NR)VALUES(70004)
INSERT INTO Kunde(Tisch_NR)VALUES(70005)


--INSERT INTO TABLE Restaurant 
INSERT INTO Restaurant(Restaurant_name,Telefon,Email,Strasse,Stadt,PLZ)VALUES('Mauritius_stuttgart','07116159147','stuttgart@my-mauritius.com','Marienstraße 12','Stuttgart','70178')
INSERT INTO Restaurant(Restaurant_name,Telefon,Email,Strasse,Stadt,PLZ)VALUES('Mauritius_Worms','062412673030','Worms@my-mauritius.com','Andreasstraße 13','Worms','67547')


--INSERT INTO TABLE Mitarbeiter 
INSERT INTO Mitarbeiter(Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES('Layla','Schmitt','Layla.Schmitt@my-mauritius.com','017664655999',2530.85,'Blumenstr 22','Stuttgart','70178',1,NULL);
INSERT INTO Mitarbeiter(Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES('markus','Habeb','markus.Habeb@my-mauritius.com','017632585999',1630.85,'langstr 7','Stuttgart','70178',1,5001);
INSERT INTO Mitarbeiter(Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES('Thomas','Braun','Thomas.Braun@my-mauritius.com','017664655999',2530.85,'hochstr 17','Worms','67547',2,NULL);
INSERT INTO Mitarbeiter(Vorname,Nachname, Email, Telefon, Gehalt,Strasse,Stadt,PLZ, Restaurant_id, Restaurant_leiter) VALUES('markus','Habeb','markus.Habeb@my-mauritius.com','017632585999',1630.85,'Kaiserstr 31','Worms','67547',2,6001);


----INSERT INTO TABLE Rechnung 
--INSERT INTO Rechnung(Kunde_id, Rechnung_status, Rechnung_datum, Restaurant_id,Mitarbeiter_id) VALUES(9001,4,'20201006',2,6001);
--INSERT INTO Rechnung(Kunde_id, Rechnung_status, Rechnung_datum, Restaurant_id,Mitarbeiter_id) VALUES(9003,4,'20201006',2,6001);


----INSERT INTO TABLE Rechnung_element 
--INSERT INTO Rechnung_element(Rechnung_id, Element_id, Produkt_ID, Anzahl, Preis) VALUES(30000,20001,1004,1,7.50);
--INSERT INTO Rechnung_element(Rechnung_id, Element_id, Produkt_ID, Anzahl, Preis) VALUES(30001,20002,1015,1,6.10);