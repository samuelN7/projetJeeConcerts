projetJeeConcerts
=================

Projet JEE Samuel Guéry Nicolas Ronco Rémi Montel Mouad Ben Said

Procédure pour le git sur eclipse : 
-Faire clic droit sur le projet git, team et pull.
-Copier les fichiers dans son projet, les modifier...
-Les remettre dans le projet git à l'emplacement correspondant. Clic droit, team, commit, puis faire commit and push dans la fenêtre qui s'ouvre.






INSERT INTO salle (adresse,capacite,description,nom,telephone,ville)
values ('15 allée Jean Jaures',2500,'Petite salle pour petits evenement','Le Toulousain',0601020304,'Toulouse');

INSERT INTO salle (adresse,capacite,description,nom,telephone,ville)
values ('22 avenue des Champs Elysees',12000,'une des plus grandes salles de la capitale','Bercy',0602030405,'Paris');

INSERT INTO utilisateur (est, email, motdepasse, prenom, pseudo, adresse,description,nom, ville)
values ('utilisateur','remi@montel', 'blbl', 'remi', 'rmontel',  'adresse de remi','Ecole d ingenieur','montel','Toulouse');

INSERT INTO utilisateur (est, email, motdepasse, prenom, pseudo, adresse,description,nom, ville,DESCRIPTION_GROUPE,NOM_GROUPE ,TYPEARTISTE  )
values ('artiste','samuel@guery', 'blbl', 'samuel', 'sguery',  'adresse de samuel','leur réputation n est plus à faire','Queen','Los Angeles','Leur reputation n est plus à faire', 'Queen', 1);

INSERT INTO tournee (description,titre)
values ('une tournée d adieu pour Queen', 'Live Tour 2015');

INSERT INTO tournee (description,titre)
values ('première tournée pour cet artiste qui monte', 'Découverte');

INSERT INTO EVENEMENT  (titre,description,prix,date) values ('Evenement1','Ceci est la description de l evenement 1',80,'22/01/2015');

INSERT INTO EVENEMENT  (titre,description,prix,date) values ('Evenement2','Ceci est la description de l evenement 2',65,'13/08/2015');

INSERT INTO utilisateur (est, email, motdepasse, prenom, pseudo, adresse,description,nom, ville) values ('artiste','anna@pavlova', 'blbl', 'anna', 'apavlova', 'adresse de anna','Elle était considérée comme la meilleure danseuse étoile de tous les temps','Pavlova','Moscou');




