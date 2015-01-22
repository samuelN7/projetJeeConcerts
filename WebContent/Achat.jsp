<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styleConnexion.css" />
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
				</ul>	
			</nav>
		</header>
		
<form method="Get" action="Serv" id="acheté">

			Nom : 				<input type="text" name="nom" /><br>
			Prenom : 			<input type="text" name="prenom"/><br>
			N°Carte : 			<input type="text" name="numCarte"/><br>
			Clé de sécurité :	<input type="text" name="clé"/><br>
			Date expiration :	<input type="text" name="date"/><br>
			<input type="checkbox" name="PourMoi" id="PourMoi" checked="checked"> <label for="PourMoi"> C'est pour moi !</label> <br>
			<input type="checkbox" name="Visible" id="Visible" checked="checked"> <label for="Visible"> Je veux être visible sur l'événement</label> <br>
			<input type="submit" value="J'achète !" id="acheté" >  
			<input type="hidden" name="op" value="acheté"/>
</form>
<script src="JsAccueil.js"></script>
</body>
</html>