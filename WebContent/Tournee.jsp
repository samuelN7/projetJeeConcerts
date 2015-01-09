<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<body>
	<%  
	Tournee t = (Tournee)request.getAttribute("tournee");
		out.println(t.getTitre() + "<br>");
		out.println(t.getArtiste() + "<br>");
		out.println(t.getDateDebut() + "-" + t.getDateFin() + "<br>");
		out.println(t.getDescription() + "<br>");
		// affichage evenements
		for(Evenement e : t.getEvenements()){
			out.println(e.getTitre() + "<br>");
			out.println(e.getArtiste() + "<br>");
			out.println(e.getDate() + "<br>");
			out.println(e.getPrix() + "<br>");
			out.println(e.getSalle() + "<br>");
			out.println(e.getDescription() + "<br>");
			// affichage utilisateurs
			out.println("les utilisateurs inscrits pour cet evenement");
			for(Utilisateur unc : e.getInscrisNonCacheE()){
				out.println(unc.getPseudo() + "<br>");
			}
			// affichage commentaires
			out.println("les commentaires associés a cet evenement");
			for(Message m : e.getCommentaires()){
				out.println(m.getAuteur().getPseudo() + "<br>");
				out.println(m.getMessage() + "<br>");
				out.println(m.getDate() + "<br>");
			}
		}
%>
</body>
</html>