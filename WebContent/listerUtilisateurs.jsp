<%@page import="java.util.*"%>
<%@page import="Projet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des utilisateurs</title>
</head>
	<body>
	<% Collection<Utilisateur> users = (Collection<Utilisateur>)request.getAttribute("listeUtilisateurs");
	 for(Utilisateur u : users) {
		out.println(u.getNom()+" "+u.getPrenom() + " " + u.getPseudo() + "<br>");
	}%>
	</body>
</html>