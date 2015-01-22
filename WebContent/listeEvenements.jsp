<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des événements</title>
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
	
	<h2>Prochains événements disponibles</h2>
	<br>
	
	<form method="Get" action="Serv">	
			<label for="titreEvent">Titre : </label> 	
			<input type="text" name="titreEvent" id="titreEvent" />
			<br>
			<br>
			<input type="submit" value="Rechercher"/>
			<input type="hidden" name="op" value="RechercherEvenement"/>
	</form>
	<br>
	<br>
	
	
	
	
	<table border="1">

   <caption>Liste des Artistes</caption>

   <thead> <!-- En-tête du tableau -->

       <tr style="font-weight: bold;">

            <td>Nom</td>
           
           <td>Artiste</td>

           <td>Salle</td>
           
           <td>Date</td>
           
           <td>Prix</td>
           
           <td>Tournee</td>

       </tr>

   </thead>

   <tfoot> <!-- Pied de tableau -->
		
       <tr style="font-weight: bold;">

           <td>Nom</td>
           
           <td>Artiste</td>

           <td>Salle</td>
           
           <td>Date</td>
           
           <td>Prix</td>
           
           <td>Tournee</td>

       </tr>

   </tfoot>

   <tbody> <!-- Corps du tableau -->
   
		 <% Collection<Evenement> evenements = (Collection<Evenement>)request.getAttribute("listeEvenements");
	 for(Evenement e : evenements) {
		 
		 
		 out.print("<tr>");
         out.print("<td><a href=\"/projet_jee/Serv?op=lienEvenement&param="+e.getTitre()+"\">"+e.getTitre()+"</a></td>");
         if(e.getArtiste()!=null){
        	 out.print("<td>"+e.getArtiste().getNom_groupe()+"</td>");
        	 				}
         else{
        	 out.print("<td>"+e.getArtiste()+"</td>");
         }
         if(e.getSalle()!=null){
        	 out.print("<td>"+e.getSalle().getNom()+"</td>");
        	 				}
        else{
        	 out.print("<td>"+e.getSalle()+"</td>");
        }
         out.print("<td>"+e.getDate()+"</td>");
         out.print("<td>"+e.getPrix()+"</td>");
      //   out.print("<td><a href=\"/projet_jee/Serv?op=lienTournee&param="+e.getTitreTournee()+"\">"+e.getTitreTournee()+"</a></td>");
         out.print("</tr>");
      
	 }
	   %>
	   
	   
	   
	   

      



   </tbody>

</table>
	<script src="JsAccueil.js"></script>
	</body>
</html>