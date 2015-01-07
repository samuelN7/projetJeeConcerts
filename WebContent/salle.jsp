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
	out.println(s.getNom());
	out.println(s.getAdresse());
	out.println(s.getVille());
	out.println(s.getCapacite());
	out.println(s.getTelephone());
	out.println(s.getDescription());
	out.println("");
	
	Collection<Utilisateur> followers = s.getFollowers();
	out.println("Les followers de " + s.getNom());
	out.println("");
	for(Utilisateur u : followers) {
		out.println(u.getPseudo()+" <br>");		
	}
	out.println("");
	
	
	Collection<Evenement> events = s.getEvenements();
	out.println("Les futurs événements de la salle :");
	out.println("");
	for(Evenement e : events) {
		out.println(e.getTitre()+" <br>");		
	}
	out.println("");
	
	Collection<Message> messages = s.getCommentaires();
	out.println("Commentaires :");
	out.println("");
	for(Message m : messages) {
		out.println(m.getAuteur()+" "+m.getDate()+" " +m.getMessage() +" <br>");		
	}
	out.println("");
	%>
</body>
</html>