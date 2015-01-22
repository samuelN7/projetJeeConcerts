<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Salle</title>
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


	<%
	Salle s = (Salle)request.getAttribute("salle");
	out.println(s.getNom()+" <br>");
	out.println("<br>");
	out.println("Capacité : "+s.getCapacite()+" places <br>");
	out.println("<br>");
	out.println("Adresse : "+s.getAdresse()+ " <br>");
	out.println("<br>");
	out.println("Ville : "+s.getVille()+" <br>");
	out.println("<br>");
	out.println("Téléphone :"+s.getTelephone()+ "<br>");
	out.println("<br>");
	out.println("Infos :"+s.getDescription()+" <br>");
	out.println("<br>");
	/*
	Collection<Utilisateur> followers = s.getFollowers();
	out.println("Les followers de " + s.getNom());
	out.println("<br>");
	for(Utilisateur u : followers) {
		out.println(u.getPseudo()+" <br>");		
	}	
	out.println("<br>");
	

	Collection<Evenement> events = s.getEvenements();
	out.println("Les futurs événements de la salle : <br>");
	out.println("<br>");
	for(Evenement e : events) {
		out.println(e.getTitre()+" <br>");		
	}
	out.println("<br>"); 
	
	
	Collection<Message> messages = s.getCommentaires();
	out.println("Commentaires :");
	out.println("");
	for(Message m : messages) {
		out.println(m.getAuteur()+" "+m.getDate() +" <br>");
		out.println(m.getMessage());		
	}
	out.println("<br>");
	*/
	
	
	%>
	<form method="Get" action="Serv">
	<input type="submit" value="Ajouter aux favoris !"/>
	<input type="hidden" name="op" value="suivreSalle"/>
	<input type="hidden" name="salle" value=<%=s%>/>
	</form>
	<script src="JsAccueil.js"></script>
</body>
</html>