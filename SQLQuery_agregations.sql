CREATE DATABASE Magasin;

USE Magasin;

CREATE TABLE Categories(
	categorie_id INT PRIMARY KEY IDENTITY(1,1),
	name_categorie VARCHAR(50) NOT NULL,
);

SELECT *
FROM Categories

CREATE TABLE Produits(
	produit_id INT PRIMARY KEY IDENTITY(1,1),
	name_produit VARCHAR(50) NOT NULL,
	prix INT UNIQUE,
	categorie_produit INT,
	FOREIGN KEY (categorie_produit) REFERENCES Categories(categorie_id)
);

SELECT *
FROM Produits


CREATE TABLE Achats(
	achat_id INT PRIMARY KEY IDENTITY(1,1),
	id_produit INT,
	FOREIGN KEY (id_produit) REFERENCES Produits(produit_id),
	nbr_achat INT,
	date_achat VARCHAR(50)NOT NULL
);




INSERT INTO Categories(name_categorie)
Values ('fruits&legumes'),
		('patisseries'),
		('bricolage');

INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('marteau', 50, 3);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('pain', 2, 2);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('banane',1,1);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('pince plate', 20, 3);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('croissant', 3, 2);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('tomate',4,1);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('karcher', 150, 3);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('eclair', 6, 2);
INSERT INTO Produits(name_produit, prix, categorie_produit) VALUES ('raisin',8,1);


INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (1, '18/10/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (2,'10/11/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (3, '19/10/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (4,'20/10/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (5,'12/11/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (6, '18/2/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (7,'30/3/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (8,'10/4/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (9, '18/5/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (1,'30/6/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (2,'10/7/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (3,'30/8/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (4,'10/9/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (5, '18/1/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (6,'30/2/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (7,'10/3/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (8, '5/12/2019',1);
INSERT INTO Achats(id_produit,date_achat,nbr_achat) Values (9, '5/12/2019',1);


SELECT *
INTO Recapitulatif
FROM Produits
INNER JOIN Categories
ON Produits.categorie_produit=Categories.categorie_id
INNER JOIN Achats
ON Produits.produit_id=Achats.id_produit

SELECT * FROM recapitulatif

SELECT SUM(nbr_achat) AS nombre_achat_bricolage FROM Recapitulatif WHERE name_categorie='bricolage'
SELECT SUM(nbr_achat) AS nombre_achat_fruits_legumes FROM Recapitulatif WHERE name_categorie='fruits&legumes'
SELECT SUM(nbr_achat) AS nombre_achat_patisseries FROM Recapitulatif WHERE name_categorie='patisseries'

SELECT SUM(prix) AS prix_produit_bricolage FROM Recapitulatif WHERE name_categorie='bricolage'
SELECT SUM(prix) AS prix_produit_bricolage FROM Recapitulatif WHERE name_categorie='fruits&legumes'
SELECT SUM(prix) AS prix_produit_bricolage FROM Recapitulatif WHERE name_categorie='patisseries'

SELECT SUM(nbr_achat) AS nombre_achat_2019_2020 FROM Recapitulatif WHERE date_achat LIKE ('%2019%') OR date_achat LIKE ('%2020%'); 



