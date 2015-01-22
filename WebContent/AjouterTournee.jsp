<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nouvelle Tournee</title>
<link rel="stylesheet" href="styleAjouterTournee.css" />
</head>
<body>
		<header id="header">
		
			<div id="bandeau1"></div>
		
			<div id="bandeau2"></div>
			
			<div id="connexion"> <a href="inscription.html">Inscription</a> <a href=connexion.html>Connexion</a><a href="/projet_jee/Serv?op=deconnexion">Deconnexion</a> 
			</div>
			
			
			<nav id="nav">
				
				<ul id="listePrincipale">
					<li><a href="accueil.jsp" id=accueil>Accueil</a></li>
					<li id="Artiste"> Artistes <img id="petiteFleche" src="petiteFleche.png" alt="petite flèche" height="5" width="9">
						<ul id=genreArtiste>
							<li><a href="/projet_jee/Serv?op=listerArtistesMusique" >Musique</a></li>
							<li><a href="/projet_jee/Serv?op=listerArtistesDanse" >Danse</a></li>
							<li><a href="/projet_jee/Serv?op=listerArtistesHumour" >Humour</a></li>	
						</ul>
					</li>
					<li><a href="/projet_jee/Serv?op=listerSalles">Salles</a></li>
					<li><a href="/projet_jee/Serv?op=listerEvenements">Evenements</a></li>
					<li><a href="/projet_jee/Serv?op=listerUtilisateurs">Membres</a></li>
					<li><a href="/projet_jee/Serv?op=listerTournees">Tournees</a></li>
					<li><a href="/projet_jee/Serv?op=pagePerso">MaPagePerso</a></li>
				</ul>	
			</nav>
		</header>

		<!-- Les champs necessaires a l'ajout d'une tournee -->
		
		<p>Tous les champs ci-dessous sont <span style="color: red; font-weight: bold;">obligatoires :</span></p><br />


		<form method="Get" action="Serv" id="formAjouterTournee">
			<img id="erreur1" src="erreur.png" alt="erreur1" height="12" width="12">
			Titre:					<input type="text" name="nomT"/><br>
			<img id="erreur2" src="erreur.png" alt="erreur2" height="12" width="12">
			1ère date: 				<input type="text" name="dateD" /><br>
			<img id="erreur3" src="erreur.png" alt="erreur3" height="12" width="12">
			Dernière date : 			<input type="text" name="dateF"/><br>
			<img id="erreur4" src="erreur.png" alt="erreur4" height="12" width="12">
			Description : 			<input type="text" name="descT"/><br>
			<input type="submit" value="Ajouter" id="ajouterTournee" >  
			<input type="hidden" name="op" value="ajouterTournee"/>
		</form>
		<p> ${sessionScope.sessionUtilisateur.pseudo} </p>
	<script src="AjouterTournee.js"></script>
	<script src="Accueil.js"></script>
</body>
</html>