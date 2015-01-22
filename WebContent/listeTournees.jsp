<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des tournées</title>
<link rel="stylesheet" href="styleConnexion.css" />
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
	
	<h2>Les tournées à venir</h2>
	<br>
	
	<form method="Get" action="Serv">	
			<label for="titreTournee">Titre : </label> 	
			<input type="text" name="titreTournee" id="titreTournee" />
			<br>
			<br>
			<input type="submit" value="Rechercher"/>
			<input type="hidden" name="op" value="RechercherTournee"/>
	</form>
	<br>
	<br>
	
	<% Collection<Tournee> tournees = (Collection<Tournee>)request.getAttribute("listeTournees");
	 for(Tournee t : tournees) {
		 out.println("<a href=\"/projet_jee/Serv?op=lienTournee&param="+t.getTitre()+"\">"+t.getTitre()+"</a> <br>");
		 out.println("<br>");
	}%>
	</body>
	<script src="JsAccueil.js"></script>
</html>