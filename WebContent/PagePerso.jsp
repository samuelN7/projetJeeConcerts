<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mon Profil</title>
<link rel="stylesheet" href="stylePagePerso.css" />
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
	
	<aside>
		<ul id = "parcoursPagePerso">
			<li><a href = "">Profil</a></li>
			<li><a href = "">Paramètres</a></li>
			<li><a href = "">Messagerie privée</a></li>
		</ul>
	</aside>
	<img src="avatarDefaut.png" alt="avatar par défaut" height="256" width="256" id="avatarDefaut">
	<div id="statut">
		<h4 id="h4">Vous avez le statut : *Artiste ou simple Utilisateur*</h4>
		 <br />
		<p>A ce titre vous pouvez:</p> 
		   <div> - consulter les événements: <a href ="/projet_jee/Serv?op=listerEvenements">liste des Evenements</a></div>
		   <div> - consulter les Salles proches de chez vous susceptibles de vous intéresser: <a href ="/projet_jee/Serv?op=listerSalles">liste des Salles</a> </div>
	       <div> - créer un évènement : <a href ="AjouterEvenement.jsp">création d'événement</a></div>
	         nous vous invitons donc à tenir votre profil artistique à jour afin que tout le monde puisse connaître votre activité   
	</div>

	<script src="Accueil.js"></script>
	<script src="PagePerso.js"></script>
	<a href="AjouterEvenement.jsp"> Ajouter un evenement ! </a>
	<% String pseudo = (String) request.getAttribute("pseudo"); 
			out.println("<p>"+pseudo+"</p>");%>
	
		
	<% Collection<Artiste> as = (Collection<Artiste>) request.getAttribute("favoris");
			out.println("Mes Favoris : <br>");
			if (as != null) {
	 		for(Artiste a : as) { 
 				out.println("<a href=\"/projet_jee/Serv?op=lienArtiste&param="+a.getNom_groupe()+"\">"+a.getNom_groupe()+"</a> <br>"); 
			} 
			} else {
				out.println("Vous n'aimez personne? <br>");
			}
			
			Collection<Evenement> evts = (Collection<Evenement>) request.getAttribute("evtsFav");
			out.println("Futurs événements de mes Favoris : <br>");
			if (evts != null) {
	 			for(Evenement e : evts) { 
	 				out.println("<a href=\"/projet_jee/Serv?op=lienEvenement&param="+e.getTitre()+"\">"+e.getTitre()+"</a> <br>");
				} 
			}
 		%> 
 		
 		<% Collection<Evenement> ins = (Collection<Evenement>) request.getAttribute("inscriptions");
 		if (ins != null) {
 			out.println("Mes événements : <br>");
 				for(Evenement e : ins) { 		
						out.println(e.getDate()+":"+e.getTitre()+"<br>");
	 			} 
 		}
		%> 
		
		<%  
		if ( (Boolean) request.getAttribute("estArtiste") ) {
				out.println("<a href=\"/projet_jee/AjouterEvenement.jsp\">Créer un événement</a> <br>");
				out.println("<a href=\"/projet_jee/AjouterTournee.jsp\">Créer une tournée</a> <br>");
				out.println("<a href=\"/projet_jee/AjouterSalle.jsp\">Ajouter une salle</a> <br>");

			}
		%>
 		<p> ${sessionScope.sessionUtilisateur.pseudo} </p>
 	<script src="JsAccueil.js"></script>	
</body>


</html>