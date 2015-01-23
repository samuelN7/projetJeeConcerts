<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>

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
		
			<div id="bandeau1"></div>
		
			<div id="bandeau2"></div>
			
			<div id="connexion">
			<a href="inscription.html">Inscription</a>
			<%	if ( !((Integer) request.getSession().getAttribute("estInscris") == 1)) {%> 
			<a href=connexion.html>Connexion</a>
			<%} %>
 			<%	if ( (Integer) request.getSession().getAttribute("estInscris") == 1) {%>
 			<a href="/projet_jee/Serv?op=deconnexion">Deconnexion</a> 
			<%} %>
			<a href="/projet_jee/Serv?op=pagePerso">MaPagePerso</a><br/>
			
			<br>
			<%	if ( (Integer) request.getSession().getAttribute("estInscris") == 1) {
				out.println( ((Utilisateur) request.getSession().getAttribute("uti")).getPseudo());
			} %>
			
			</div>
			
			
			<nav id="nav">
				<h3>Bienvenue sur notre site</h3>
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
		
				<p id="descriptionSite"> Ne loupez aucun événement de vos artistes préférés ! <br />
				Vous n'êtes pas encore inscrit ? Ne perdez plus de temps, c'est par <a href="inscription.html">ici.</a> <br />
				Déjà inscrit ? <a href=connexion.html>Connectez-vous !</a>
				</p>
			</nav>
		</header>
		
		<article id="derniersEvenements">Faire la requête sql <br>
		<br>
		</article>
		
		<article id="ArtistesDuMoment">Suggestion?</article>
	
			<p> ${sessionScope.sessionUtilisateur.pseudo} </p>
		
		<script src="Accueil.js"></script>
	</body>
</html>
