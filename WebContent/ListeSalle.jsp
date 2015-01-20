<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des salles</title>
</head>
	<body>
	<h2>Liste des salles repertoriées</h2>
	
	<form method="Get" action="Serv">	
			<label for="rechercheNom">Nom : </label> 	
			<input type="text" name="rechercheNom" id="rechercheNom" />
			<label for="rechercheVille">Ville : </label> 
			<input type="text" name="rechercheVille" id="rechercheVille" />
			<input type="submit" value="RechercherSalle"/>
			<input type="hidden" name="op" value="RechercherSalle"/>
	</form>
	<br>
	
	<% Collection<Salle> salles = (Collection<Salle>)request.getAttribute("listeSalles");
	for(Salle s : salles) {
			out.println("<a href=\"/projet_jee/Serv?op=lienSalle&param="+s.getNom()+"\">"+s.getNom()+" "+s.getVille()+"</a> <br>");
			out.println("<br>");
	}	
	%>
	</body>
</html>