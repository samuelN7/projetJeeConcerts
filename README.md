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

INSERT INTO utilisateur (est, email, motdepasse, prenom, pseudo, adresse,description,nom, ville,TYPEARTISTE,NOM_GROUPE, DESCRIPTION_GROUPE) values ('artiste','anna@pavlova', 'blbl', 'anna', 'apavlova', 'adresse de anna','Elle était considérée comme la meilleure danseuse étoile de tous les temps','pavlova','Moscou',2,'Anna Pavlova','Condisérée comme la meilleure danseuse étoile de tous les temps');

INSERT INTO utilisateur (est, email, motdepasse, prenom, pseudo, adresse,description,nom, ville,TYPEARTISTE,NOM_GROUPE, DESCRIPTION_GROUPE) values ('artiste','franck@dubosc', 'blbl', 'franck', 'dubosc', 'adresse de franck','Les films Camping','dubosc','Paris',3,'Franck Dubosc','A été révélé au grand public notamment grâce au film camping');

INSERT INTO utilisateur (est, email, motdepasse, prenom, pseudo, adresse,description,nom, ville,TYPEARTISTE,NOM_GROUPE, DESCRIPTION_GROUPE) values ('artiste','gad@elmaleh', 'blbl', 'gad', 'elmaleh', 'adresse de gad','One man show','elmaleh','Monaco',3,'Gad Elmaleh','Très apprécié du public français');

INSERT INTO tournee (description,titre)
values ('une tournée d adieu pour Queen', 'Live Tour 2015');

INSERT INTO tournee (description,titre)
values ('première tournée pour cet artiste qui monte', 'Découverte');

INSERT INTO EVENEMENT  (titre,description,prix,date) values ('Evenement1','Ceci est la description de l evenement 1',80,'22/01/2015');

INSERT INTO EVENEMENT  (titre,description,prix,date) values ('Evenement2','Ceci est la description de l evenement 2',65,'13/08/2015');




