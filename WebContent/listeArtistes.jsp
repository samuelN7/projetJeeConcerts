<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des artistes</title>
</head>
<body>
	<% Collection<Artiste> artistes = (Collection<Artiste>)request.getAttribute("listeArtistes");
	 for(Artiste a : artistes) {
		 out.println("<a href=\"/projet_jee/Serv?op=lienArtiste&param="+a.getNom_groupe()+"\">"+a.getNom_groupe()+" "+a.getNom_groupe()+"</a> <br>");
	}%>
</body>
</html>