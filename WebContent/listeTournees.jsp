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
	<% Collection<Tournee> tournees = (Collection<Tournee>)request.getAttribute("listeTournees");
	 for(Tournee t : tournees) {
		 out.println("<a href=\"/projet_jee/Serv?op=lienTournee&param="+t.getTitre()+"\">"+t.getTitre()+"</a> <br>");
	}%>
	</body>
</html>