projetJeeConcerts
=================

Projet JEE Samuel Guéry Nicolas Ronco Rémi Montel Mouad Ben Said

Procédure pour le git sur eclipse : 
-Faire clic droit sur le projet git, team et pull.
-Copier les fichiers dans son projet, les modifier...
-Les remettre dans le projet git à l'emplacement correspondant. Clic droit, team, commit, puis faire commit and push dans la fenêtre qui s'ouvre.





/* Salle */
INSERT INTO salle (adresse,capacite,description,nom,telephone,ville)
values ('adresse1',500,'description1','test1',06,'Toulouse');

INSERT INTO salle (adresse,capacite,description,nom,telephone,ville)
values ('adresse2',500,'description2','test2',06,'Paris');

INSERT INTO utilisateur (dtype, email, motdepasse, prenom, pseudo, adresse,description,nom, ville)
values ('utilisateur','@', 'blbl', 'remi', 'rmontel',  'adresse1','description1','test1','Toulouse');

INSERT INTO utilisateur (dtype, email, motdepasse, prenom, pseudo, adresse,description,nom, ville,DESCRIPTION_GROUPE,NOM_GROUPE ,TYPEARTISTE  )
values ('artiste','@', 'blbl', 'samuel', 'sguery',  'adresse2','description2','test2','Paris','bon groupe', 'queen', 1);

INSERT INTO tournee (description,titre)
values ('super tournée', 'maTournee');

INSERT INTO tournee (description,titre)
values ('tournée de merde', 'taTournee');








