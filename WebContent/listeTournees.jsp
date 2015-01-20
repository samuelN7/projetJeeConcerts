<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des tournées</title>
</head>
	<body>
	<h2>Les tournées à venir</h2>
	<br>
	
	<form method="Get" action="Serv">	
			<label for="titreTournee">Titre : </label> 	
			<input type="text" name="titreTournee" id="titreTournee" />
			<br>
			<br>
			<input type="submit" value="Rechercher"/>
			<input type="hidden" name="op" value="RechercherTournee"/>
	</form>
	<br>
	<br>
	
	<% Collection<Tournee> tournees = (Collection<Tournee>)request.getAttribute("listeTournees");
	 for(Tournee t : tournees) {
		 out.println("<a href=\"/projet_jee/Serv?op=lienTournee&param="+t.getTitre()+"\">"+t.getTitre()+"</a> <br>");
		 out.println("<br>");
	}%>
	</body>
</html>