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
	<% Collection<Salle> salles = (Collection<Salle>)request.getAttribute("listeSalles");
	 for(Salle s : salles) {
		out.println(s.getNom()+" "+s.getVille() + "<br>");
	}

	 for(Salle s : salles) {
			out.println("<a href=\"/projet_jee/Serv?op=lienSalle&salleParam="+s.getNom()+"\">"+s.getNom()+ "</a> <br>");
		}
		out.println("");
	%>
	</body>
</html>