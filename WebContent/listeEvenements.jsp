<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des événements</title>
</head>
<body>
	<% Collection<Evenement> evenements = (Collection<Evenement>)request.getAttribute("listeEvenements");
	 for(Evenement e : evenements) {
		out.println(e.getTitre()+" "+e.getArtiste() +" "+e.getSalle()+"<br>");
	}%>
</body>
</html>