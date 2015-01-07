<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Bienvenue sur notre site !</title>
		<link rel="stylesheet" href="styleAccueil.css" />
	</head>
	
	<body>
		<header id="header">
			<nav id="nav">
				<h3>Bienvenue sur notre site</h3>
				<ul id="listePrincipale">
					<li><a href="accueil.html" id=accueil>Accueil</a></li>
					<li id="Artiste"> Artistes <img id="petiteFleche" src="petiteFleche.png" alt="petite flèche" height="5" width="9">
						<ul id=genreArtiste>
							<li><a href="" >Musique</a></li>
							<li><a href="" >Danse</a></li>
							<li><a href="" >Autres</a></li>	
						</ul>
					</li>
					<li><a href="/projet_jee/Serv?op=listerSalles">Salles</a></li>
					<li><a href="/projet_jee/Serv?op=listerEvenements">Evenements</a></li>
					<li><a href="/projet_jee/Serv?op=listerUtilisateurs">Membres</a></li>
					<li><a href="/projet_jee/Serv?op=listerTournees">Tournees</a></li>
				</ul>	
		
				<p id="descriptionSite"> Ne loupez aucun événement de vos artistes préférés ! <br />
				Vous n'êtes pas encore inscrit ? Ne perdez plus de temps, c'est par <a href="inscription.html">ici.</a> <br />
				Déjà inscrit ? <a href=connexion.html>Connectez-vous !</a>
				</p>
			</nav>
		</header>
		
		<article id="derniersEvenements">Faire la requête sql</article>
		
		<article id="ArtistesDuMoment">Suggestion?</article>
		<% String pseudo = (String) request.getAttribute("pseudo"); 
			out.println(pseudo);%>
		
		<script src="Accueil.js"></script>
	</body>
</html>