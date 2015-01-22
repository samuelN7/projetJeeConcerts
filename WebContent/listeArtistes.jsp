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

	
	<table border="1">

   <caption>Liste des Artistes</caption>

   <thead> <!-- En-tête du tableau -->

       <tr style="font-weight: bold;">

           <td>Nom de l'Artiste</td>
           
           <td>Genre</td>

           <td>Nom du Groupe</td>

       </tr>

   </thead>

   <tfoot> <!-- Pied de tableau -->
		
       <tr style="font-weight: bold;">

           <td>Nom de l'Artiste</td>
           
           <td>Genre</td>

           <td>Nom du Groupe</td>

       </tr>

   </tfoot>

   <tbody> <!-- Corps du tableau -->
   
		<% Collection<Artiste> artistes = (Collection<Artiste>)request.getAttribute("listeArtistes");
	
	 for(Artiste a : artistes) {
		 
		 
		 out.print("<tr>");
         out.print("<td><a href=\"/projet_jee/Serv?op=lienArtiste&param="+a.getNom_groupe()+"\">"+a.getNom_groupe()+"</a></td>");
         out.print("<td>"+a.getTypeArtisteString()+"</td>");
         out.print("<td>"+a.getNom_groupe()+"</td>");
         out.print("</tr>");
      
	 }
	   %>

      



   </tbody>

</table>
<script src="JsAccueil.js"></script>
</body>
</html>