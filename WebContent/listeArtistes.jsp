<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des artistes</title>
<link rel="stylesheet" href="styleConnexion.css" />
</head>
<body>

	<div id="bandeau1"></div>
		
		<div id="bandeau2"></div>
		
		<div id="connexion"> <a href="inscription.html">Inscription</a> <a href=connexion.html>Connexion</a> 
		</div>
		
		<nav id="nav">
				<ul id="listePrincipale">
					<li><a href="accueil.jsp" id=accueil>Accueil</a></li>
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
		
				
		</nav>

	<% Collection<Artiste> artistes = (Collection<Artiste>)request.getAttribute("listeArtistes");
	 for(Artiste a : artistes) {
		 out.println("<a href=\"/projet_jee/Serv?op=lienArtiste&param="+a.getNom_groupe()+"\">"+a.getNom_groupe()+"</a> <br>");
		 out.println("<br>");
	}%>
</body>
</html>