<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Salle</title>
</head>
<body>
	<%
	Salle s = (Salle)request.getAttribute("salle");
	out.println(s.getNom()+" "+s.getVille()+" "+s.getCapacite()+" <br>");
	out.println(s.getAdresse()+ " <br>");
	out.println(s.getTelephone()+ "<br>");
	out.println(s.getDescription());
	out.println("<br>");
	/*
	Collection<Utilisateur> followers = s.getFollowers();
	out.println("Les followers de " + s.getNom());
	out.println("<br>");
	for(Utilisateur u : followers) {
		out.println(u.getPseudo()+" <br>");		
	}	
	out.println("<br>");
	

	Collection<Evenement> events = s.getEvenements();
	out.println("Les futurs événements de la salle : <br>");
	out.println("<br>");
	for(Evenement e : events) {
		out.println(e.getTitre()+" <br>");		
	}
	out.println("<br>"); 
	
	
	Collection<Message> messages = s.getCommentaires();
	out.println("Commentaires :");
	out.println("");
	for(Message m : messages) {
		out.println(m.getAuteur()+" "+m.getDate() +" <br>");
		out.println(m.getMessage());		
	}
	out.println("<br>");
	*/
	
	
	%>
	<form method="Get" action="Serv">
	<input type="submit" value="Ajouter aux favoris !"/>
	<input type="hidden" name="op" value="suivreSalle"/>
	<input type="hidden" name="salle" value=<%=s%>/>
	</form>
</body>
</html>