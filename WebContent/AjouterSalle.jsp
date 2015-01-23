<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styleAjouterSalle.css" />
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

		<!-- Les champs necessaires a l'ajout d'une salle  -->
		
		<p>Tous les champs ci-dessous sont <span style="color: red; font-weight: bold;">obligatoires :</span></p><br />


			<form method="Get" action="Serv" id="formAjouterSalle">
			<img id="erreur1" src="erreur.png" alt="erreur1" height="12" width="12">
			Nom: 				<input type="text" name="nomSalle" /><br>
			<img id="erreur2" src="erreur.png" alt="erreur2" height="12" width="12">
			Adresse : 			<input type="text" name="adresse"/><br>
			<img id="erreur3" src="erreur.png" alt="erreur3" height="12" width="12">
			Ville : 			<input type="text" name="ville"/><br>
			<img id="erreur4" src="erreur.png" alt="erreur4" height="12" width="12">
			Description: 		<input type="text" name="descriptionSalle" /><br>
			<img id="erreur5" src="erreur.png" alt="erreur5" height="12" width="12">
			Capacité : 			<input type="text" name="capacite"/><br>
			<img id="erreur6" src="erreur.png" alt="erreur6" height="12" width="12">
			Téléphone : 			<input type="text" name="tel"/><br>
			<input type="submit" value="Ajouter" id="ajouterSalle" >  
			<input type="hidden" name="op" value="ajouterSalle"/>
			</form>

	<script src="AjouterSalle.js"></script>
	<script src="Accueil.js"></script>	
</body>
</html>