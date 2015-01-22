<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evenement</title>
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

	<% Evenement e = (Evenement)request.getAttribute("evenement");
	out.println(e.getTitre()+" <br>");// +" "+e.getArtiste()+" "+e.getTournee());
	out.println("<br>");
//	out.println(e.getSalle());
	out.println("Date : "+e.getDate()+ "<br>");
	out.println("<br>");
	out.println("Prix : "+e.getPrix()+"€ <br>");
	out.println("<br>");
	out.println("Infos : "+e.getDescription()+"<br>");
	out.println("<br>");
	
/*	Collection<Utilisateur> inscritsNonCaches = e.getInscrisNonCacheE();
	out.println("Participants à cet événement ");
	out.println("");
	for(Utilisateur u : inscritsNonCaches) {
		out.println(u.getPseudo()+" <br>");		
	}
	out.println("");*/
	//request.setAttribute("idEvt",e.getId());
	
	Collection<Message> messages = e.getCommentaires();
	out.println("Commentaires :");
	out.println("<br>");
	if(messages != null) {
		for(Message m : messages) {
			out.println(m.getDate()+" "+m.getAuteur() +": <br>");
			out.println(m.getMessage()+"<br><br>");		
		}
		out.println("");
	//	request.setAttribute("monEvenement",e); 
		request.setAttribute("idEvt",e.getId());
	}
	%>
	<form method ="get" action="Serv" id="poster"> 
	<textarea name = "commentaire" rows="5" cols="40" placeholder="Lâchez-vous les cocos !"></textarea> <br>
	<input type="submit" value="Poster" id="poste" > 
	<input type="hidden" name="op" value="poster"/>
	<input type="hidden" name="idEvt" value="<%=e.getId()%>"/>
	<input type="hidden" name="typeC" value="1"/>	
	</form>
	
	<form method ="get" action="Serv" id="achat"> 
	<input type="submit" value="Prendre sa place !" id="achat" > 
	<input type="hidden" name="op" value="achat"/>
		<input type="hidden" name="idEvt" value="<%=e.getId()%>"/>
	
	</form>
	<script src="JsAccueil.js"></script>
</body>
</html>