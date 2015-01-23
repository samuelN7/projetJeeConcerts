<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des utilisateurs</title>
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
			<a href="/projet_jee/Serv?op=pagePerso">MaPagePerso</a>
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
	
	<br>
	
	<br>
	<br>
	Rechercher un utilisateur ou un artiste :
	<br>
	<br>
	
	<form method="Get" action="Serv">	
			<label for="pseudoRech">Pseudo : </label> 	
			<input type="text" name="pseudoRech" id="pseudoRech" />
			<br>
			<br>
			<input type="submit" value="Rechercher"/>
			<input type="hidden" name="op" value="RechercherPseudo"/>
	</form>
	<br>
	<br>
	
	
	
	<table border="1">

   <caption>Liste des Artistes</caption>

   <thead> <!-- En-tête du tableau -->

       <tr style="font-weight: bold;">

            <td>Pseudo</td>
           
           <td>Nom</td>

           <td>Prenom</td>
           
           <td>Adresse</td>
           
           <td>Ville</td>
           
           <td>Email</td>

       </tr>

   </thead>

   <tfoot> <!-- Pied de tableau -->
		
       <tr style="font-weight: bold;">

           <td>Pseudo</td>
           
           <td>Nom</td>

           <td>Prenom</td>
           
           <td>Adresse</td>
           
           <td>Ville</td>
           
           <td>Email</td>

       </tr>

   </tfoot>

   <tbody> <!-- Corps du tableau -->
   
		  <% Collection<Utilisateur> users2 = (Collection<Utilisateur>)request.getAttribute("listeUtilisateurs");
	 for(Utilisateur u : users2) {
		 
		 
		 out.print("<tr>");
         out.print("<td>"+u.getPseudo()+"</td>");
         out.print("<td>"+u.getNom()+"</td>");
         out.print("<td>"+u.getPrenom()+"</td>");
         out.print("<td>"+u.getAdresse()+"</td>");
         out.print("<td>"+u.getVille()+"</td>");
         out.print("<td>"+u.getEmail()+"</td>");
         out.print("</tr>");
      
	 }
	   %>
	   


   </tbody>

</table>



	<script src="JsAccueil.js"></script>
	</body>
</html>