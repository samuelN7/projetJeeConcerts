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
			<a href="/projet_jee/Serv?op=pagePerso">MaPagePerso</a>
			
			<br>
			<%	if ( (Integer) request.getSession().getAttribute("estInscris") == 1) {
				out.println( ((Utilisateur) request.getSession().getAttribute("uti")).getPseudo());
			} %>
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
	

	
	
	
		
	<!-- On affiche les differentes caracteristiques de l'utilisateur -->
	

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
		
		<!-- Affichage des options si on est un artiste -->
		
		<%  
		if ( (Boolean) request.getAttribute("estArtiste") ) {
				out.println("<a href=\"/projet_jee/AjouterEvenement.jsp\">Créer un événement</a> <br>");
				out.println("<a href=\"/projet_jee/AjouterTournee.jsp\">Créer une tournée</a> <br>");
				out.println("<a href=\"/projet_jee/AjouterSalle.jsp\">Ajouter une salle</a> <br>");

			}
		%>
		
		<a href="/projet_jee/Serv?op=MP">Messagerie Privée</a>
	
 		<p> ${sessionScope.sessionUtilisateur.pseudo} </p>
 	<script src="Accueil.js"></script>	
 	<script src="PagePerso.js"></script>	
</body>


</html>