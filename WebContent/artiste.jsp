<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artiste</title>
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
					<li><a href="/projet_jee/Serv?op=pagePerso">MaPagePerso</a></li>
				</ul>	
			</nav>
		</header>

	<% Artiste a = (Artiste)request.getAttribute("artiste");
	out.println(a.getNom_groupe()+ "<br>");
	out.println("<br>");
	out.println("Description : "+a.getDescription_groupe() + "<br>");
	out.println("<br>");

	%>
	
	<form method="Get" action="Serv">
	<input type="submit" value="Suivre cet artiste !"/>
	<input type="hidden" name="op" value="suivreArtiste"/>
	<input type="hidden" name="artiste" value="<%=a.getId()%>"/>
	</form>
	
	 
	<% 
	/* Collection<Utilisateur> followers = a.getFollowers();
	out.println("Les followers de " + a.getNom());
	out.println("");
	for(Utilisateur u : followers) {
		out.println(u.getPseudo()+" <br>");		
	}
	out.println("");
	
	Collection<Evenement> events = a.getEvenements();
	out.println("Les futurs événements de "+a.getNom_groupe());
	out.println("");
	for(Evenement e : events) {
		out.println(e.getTitre()+" <br>");		
	}
	out.println("");
	
	Collection<Tournee> tournees = a.getTournees();
	out.println("Les tournées à venir de " + a.getNom_groupe());
	out.println("");
	for(Tournee t : tournees) {
		out.println(t.getTitre()+" <br>");		
	}
	out.println("");
	*/
	Collection<Message> messages = a.getCommentaires();
	out.println("Commentaires :");
	out.println("<br>");
	if(messages != null) {
		for(Message m : messages) {
			out.println(m.getDate()+" "+m.getAuteur() +": <br>");
			out.println(m.getMessage()+"<br><br>");		
		}
		out.println("");
	//	request.setAttribute("monEvenement",e); 
		request.setAttribute("idEvt",a.getId());
	}
	%>
	<form method ="get" action="Serv" id="poster"> 
	<textarea name = "commentaire" rows="5" cols="40" placeholder="Lâchez-vous les cocos !"></textarea> <br>
	<input type="submit" value="Poster" id="poste" > 
	<input type="hidden" name="op" value="poster"/>
	<input type="hidden" name="idEvt" value="<%=a.getId()%>"/>
	<input type="hidden" name="typeC" value="2"/>	
	</form>
	<script src="JsAccueil.js"></script>
	</body>
</html>