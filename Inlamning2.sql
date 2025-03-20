/*
Mattias Karlsson YH24
Inlämningsuppgift 2
*/
/*
Skapar en databas som heter bokhandel
*/
CREATE DATABASE Bokhandel_2;
/*
Väljer att använda databasen Bokhandel
*/
USE Bokhandel_2;
/*
Skapar tabellen kunder
KundID är PRIMARY KEY
*/
CREATE TABLE Kunder (
	  KundID INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT betyder att värdet ökar med ett heltal för varje ny rad
    Namn VARCHAR(100) NOT NULL,    -- VARCHAR används för text och kan innehålla både siffror och bokstäver
    Epost VARCHAR(255) UNIQUE NOT NULL, -- UNIQUE betyder här att alla Epost måste vara unika i tabellen
    Telefon VARCHAR(20) NOT NULL,  -- NOT NULL betyder att kolumnen måste ha ett värde
    Adress VARCHAR(255) NOT NULL   -- VARCHAR(255) betyder att den kan lagra upp till 255 tecken
    );
    /*
    Skapar tabellen böcker
    BokID är PRIMARY KEY
    */
CREATE TABLE Böcker (
	  BokID INT AUTO_INCREMENT PRIMARY KEY, 
    Titel VARCHAR(255) NOT NULL,   -- Titel kan innehålla upp till 255 tecken och ett värde måste anges
    ISBN VARCHAR(20) UNIQUE NOT NULL,  -- UNIQUE betyder här att alla ISBN nummer måste vara unika i tabellen
    Författare VARCHAR(100) NOT NULL,  -- Författare kan innehålla upp till 100 tecken och ett värde måste anges
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0), -- Pris måste vara större än 0
    Lagerstatus INT NOT NULL CHECK(Lagerstatus >= 0) -- Värdet kan bara vara 0 eller högre
	  );
/*
Skapar tabellen beställningar
Ordernummer är PRIMARY KEY
KundID är FOREIGN KEY
*/
CREATE TABLE Beställningar (
	 Ordernummer INT AUTO_INCREMENT PRIMARY KEY,                   
   KundID INT NOT NULL,                                            
   Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
   Totalsumma DECIMAL(10,2) NOT NULL CHECK (Totalsumma > 0), -- Totalsumman måste vara större än 0
	 FOREIGN KEY (KundID) REFERENCES Kunder(KundID)  -- Definierar KundID som Foreign key i tabellen beställningar, och 
	 );                                              -- refererar att KundID måste finnas i tabellen Kunder
/*
Skapar tabellen orderrader
OrderradID är PRIMARY KEY
Ordernummer är FOREIGN KEY
BokID är FOREIGN KEY
*/
CREATE TABLE Orderrader (
	  OrderradID INT AUTO_INCREMENT PRIMARY KEY,            		     
    Ordernummer INT NOT NULL,					          		     
	  BokID INT NOT NULL,                                   		     
    Antal INT NOT NULL CHECK (Antal > 0),  -- Värdet på "Antal" ska vara större än 0
    Delsumma DECIMAL(10,2) NOT NULL CHECK (Delsumma > 0),  -- Värdet på "Delsumma" ska vara större än 0
    FOREIGN KEY (Ordernummer) REFERENCES Beställningar(Ordernummer), -- Definierar Ordernummer som FK och refererar att den finns i Beställningar
    FOREIGN KEY (BokID) REFERENCES Böcker(BokID)                 -- Definierar BokID som FK och refererar att den måste finnas i tabellen Böcker
    );
/*
Infogar kunduppgifter i tabellen kunder
*/
INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES
('Anna Svensson','anna@email.com','0701234567','Bokvägen 1'),
('Erik Eriksson', 'erik@email.com','0702345678','Tidningsvägen 2'),
('Per Persson', 'per@email.com','0703456789','Litteraturvägen 3');
/*
Infogar bokuppgifter i tabellen böcker
*/
INSERT INTO Böcker (Titel, ISBN, Författare, Pris, Lagerstatus) VALUES
('Svensk politik','978-91-7789-849-8','Per T Ohlsson', 399.99, 200),
('Mastering Windows server 2022','978-1-83763-450-7','Jordan Krause', 499.99, 20),
('Comptia Network', '978-1-264-26905-1','Mike Meyers', 299.99, 3);
/*
Sorterar och visar data från Böcker tabellen
*/
SELECT * FROM Böcker ORDER BY Pris ASC;   -- Sorterar böcker efter priset, i stigande följd
/*
Infogar beställningsuppgifter i tabellen Beställningar
*/
INSERT INTO Beställningar (KundID, Datum, Totalsumma ) VALUES
(1,'2024-03-03', 699.98),  -- Kund 1 gör en beställning 3 Mars
(2,'2024-03-05', 999.98),  -- Kund 2 gör en beställning 5 Mars
(2,'2024-03-10', 1099.97), -- Kund 2 gör en beställning 10 Mars
(3,'2024-03-04', 1999.96), -- Kund 3 gör en beställning 4 Mars
(3,'2024-03-10', 1399.96), -- Kund 3 gör en beställning 10 Mars
(3,'2024-03-12', 299.99); -- Kund 3 gör en beställning 12 Mars
SELECT * FROM Beställningar;
/*
Infogar orderradsuppgifter i tabellen Orderrader
*/
INSERT INTO Orderrader (Ordernummer, BokID, Antal, Delsumma) VALUES
(1, 3, 1, 299.99),  -- Kund 1 köper 1 Comptida Network 
(1, 1, 1, 399.99),  -- Kund 1 köper 1 Svensk politik  
(2, 2, 2, 999.98),  -- Kund 2 köper 2 Mastering Windows server 2022 
(3, 3, 1, 299.99),  -- Kund 2 köper 1 Comptida Network 
(3, 1, 2, 799.98),  -- Kund 2 köper 2 Svensk politik 
(4, 2, 4, 1999.96), -- Kund 3 köper 4 Mastering Windows server 2022 
(5, 3, 2, 599.98),  -- Kund 3 köper 2  Comptia Network 
(5, 1, 2, 799.98),  -- Kund 3 köper 2  Svensk politik 
(6, 3, 1, 299.99);  -- Kund 3 köper 1  Comptia Network 
SELECT * FROM orderrader;
/*
Hämtar alla kunder och beställningar
*/
SELECT * FROM kunder;       -- Visar alla Kunder från tabellen Kunder
SELECT * FROM Beställningar;  -- Visar alla beställningar från tabellen Beställningar
/*
Filtrerar kunder efter namn och email
*/
SELECT * FROM Kunder WHERE Namn = 'Anna Svensson'; -- Visar kunder som heter Anna Svensson
SELECT * FROM Kunder WHERE Epost LIKE 'E%';        -- Visar kunder som har en Epost som börjar med bokstaven E
/*
Sorterar och visar data från Böcker tabellen
*/
SELECT * FROM Böcker ORDER BY Pris ASC;    -- Sorterar böcker efter priset, i stigande följd
SELECT * FROM Böcker ORDER BY Pris DESC;   -- Sorterar böcker efter priset, i nedstigande följd 
/*
Updaterar kunduppgifter
Använder transaktioner så att ändringar kan ångras
*/
START TRANSACTION;    -- Startar en transaktion
UPDATE Kunder         -- Uppdaterar en kunds email
SET Epost = 'per.student@email.com' 
WHERE KundID = 3;
SELECT * FROM Kunder WHERE KundID = 3;   -- Visar resultatet av ändringen  
COMMIT;    -- Här sparas ändringen permanent
ROLLBACK;  -- Här ångras ändringen, om den inte har sparats permanent
/*
Jag får lägga till en kund som inte är knuten till några beställningar
Annars går det inte att ta bort kunden om den är knuten till beställningar
*/	
INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES
('Bengt Bengtsson','bengt@email.com','0701234568','Husvägen 1');
/*
Tar bort en kund från tabellen
använder transaktioner så att ändringar kan ångras
*/							
START TRANSACTION;                           -- Startar en ny transaktion 
SET SQL_SAFE_UPDATES = 0;                                                          --
DELETE FROM Kunder WHERE Namn = 'Bengt Bengtsson';   -- Tar bort en kund från tabellen kunder
SELECT * FROM Kunder WHERE Namn = 'Bengt Bengtsson';  -- Visar resultatet av ändringen
COMMIT;         -- Här sparas ändringen permanent
ROLLBACK;       -- Här ångras ändringen, om den inte har sparats permanent
/*
Använder inner join för att visa vilka kunder som har lagt beställning
*/
SELECT Kunder.Namn, Beställningar.Ordernummer      -- Hämtar namn från kunder och ordernummer från beställningar  
FROM Kunder                                        -- Väljer tabellen Kunder
INNER JOIN Beställningar ON Kunder.KundID = Beställningar.KundID; -- Kombinerar tabellen Beställningar med Kunder 
                                                                  -- och länkar tabellerna med KundID från Beställningar med KundID från Kunder
/*
Anväder left join för att visa alla kunder även de utan beställningar
*/
SELECT Kunder.Namn, Beställningar.Ordernummer               -- Hämtar namn från Kunder och hämtar ordernummer från Beställningar
FROM Kunder                                                 -- Väljer tabellen Kunder
LEFT JOIN Beställningar ON Kunder.KundID = Beställningar.KundID; -- Kombinerar tabellen Beställningar med Kunder
																 -- och länkar tabellerna med KundID(FK) från Beställningar med KundID(PK) från Kunder
/*
Räknar antal beställningar per kund genom att använda group by
*/ 
SELECT Kunder.Namn, COUNT(Ordernummer) AS `Antal Beställningar` -- räknar beställningar och visar att resultatet i kolumnen heter Antal Beställningar
FROM Beställningar                                              -- Väljer tabellen Beställningar
INNER JOIN Kunder ON Beställningar.KundID = Kunder.KundID       -- Kombinerar Kunder och Beställningar där KundID matchar båda tabellerna
GROUP BY Kunder.Namn;                                           -- Grupperar efter kundens namn
/*
Visar kunder som har gjort mer än 2 beställningar
*/
SELECT Kunder.Namn, COUNT(Ordernummer) AS `Antal Beställningar`
FROM Beställningar
INNER JOIN Kunder ON Beställningar.KundID = Kunder.KundID
GROUP BY Kunder.Namn
HAVING COUNT(Ordernummer) > 2;   -- Visar mer än 2
/*
Skapar ett index på e-post i Kunder
*/
CREATE INDEX idx_Epost ON Kunder(Epost); -- "idx_Epost" är namnet på indexet som skapas
/*
Visar index
*/
SHOW INDEX FROM Kunder;
/*
I tabellen Böcker ovan finns redan en constraint som
ser till att priset på böcker alltid är över 0
Nedan finns ett test, för att pröva att lägga till
en bok som har priset 0
*/
INSERT INTO Böcker (Titel, ISBN, Författare, Pris, Lagerstatus) -- test data
VALUES ('Spansk','978-87-7900-684-3','Donte Holst', 0, 10);
/*
En trigger som minskar lagersaldo efter en order
*/
DELIMITER $$ --  Detta gör det möjligt att skriva fler SQL-kommandon i 
             -- triggern utan att avsluta den med semikolon
CREATE TRIGGER uppdatera_lagerstatus  -- skapar en trigger
AFTER INSERT ON Orderrader  -- triggern aktiveras efter en rad infogas i Orderrader.
FOR EACH ROW
BEGIN    -- Inom BEGIN och END definieras de SQL-kommandon som utförs när triggern aktiveras
    UPDATE Böcker
    SET Lagerstatus = Lagerstatus - NEW.Antal
    WHERE BokID = NEW.BokID;
END $$

DELIMITER ;



DESC Orderrader;
SELECT * FROM Orderrader;
SELECT * FROM Böcker;
/*
För att testa triggern infogas data i
Beställningar och Orderrader
*/

INSERT INTO Beställningar (KundID, Datum, Totalsumma ) VALUES 
(3,'2024-03-14', 799.98); -- Kund 3 gör en beställning 14 Mars
INSERT INTO Orderrader (Ordernummer, BokID, Antal, Delsumma) 
VALUES (7, 1, 2, 799.98 );  -- kund 3 köper 2 Svensk politik

SHOW CREATE TRIGGER uppdatera_lagerstatus;

SELECT * FROM Böcker WHERE BokID = 1; -- Visar kund med BokID 1
/*
Skapar en tabell som heter Kundlogg
*/
CREATE TABLE Kundlogg (    
    LoggID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT,
    Registreringsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- lagrar tidpunkten när posten skapas
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
);

DELIMITER $$
/*
Skapar en trigger som loggar när ny kund registreras
*/
CREATE TRIGGER logga_ny_kund 
AFTER INSERT ON Kunder -- Triggern körs efter att en ny post har lagts till i tabellen Kunder
FOR EACH ROW  
BEGIN
    INSERT INTO Kundlogg (KundID) -- När en ny kund (KundID) läggs till i Kunder, skapas automatiskt en rad i Kundlogg med samma KundID
    VALUES (NEW.KundID); -- NEW.KundID refererar till det KundID som precis har lagts till i Kunder
END $$

DELIMITER ;

/*
För att testa triggern infogas kunduppgifter i tabellen Kunder
*/
INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES 
('Martina Martinsson', 'martina@email.com','0733456789', 'Markvägen 3');
/*
Visar tabellen Kundlogg
*/
SELECT * FROM Kundlogg;
/*
Visar tabellen Kunder
*/
SELECT * FROM kunder;
/*
Backup and restore

1. Skapar en backup av Bokhandel_2 i kommandotolken
mysqldump -u root -p Bokhandel_2 > bokhandel_2_backup.sql
Efter det logga in med lösenord
Enter password: ********

2. Kollar om det skapades en backup

3. Tar bort databasen Bokhandel_2

4. Kör sedan scriptet 
CREATE DATABASE Bokhandel_2;

5. Efter det kör det följande scriptet i kommandotolken
mysql -u root -p Bokhandel_2 < "C:\Users\Mattias\Desktop\backup\Bokhandel_2_backup.sql"
Efter det ska man logga in med lösenord
Enter password: ********
Kontrollera sedan att databasen kommer tillbaka
*/
