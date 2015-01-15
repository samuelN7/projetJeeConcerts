<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artiste</title>
</head>
<body>
	<% Artiste a = (Artiste)request.getAttribute("artiste");
	out.println(a.getNom_groupe()+ "<br>");
	out.println(a.getDescription_groupe() + "<br>");
	%>
	
	<form method="Get" action="Serv">
	<input type="submit" value="Suivre cet artiste !"/>
	<input type="hidden" name="op" value="suivreArtiste"/>
	<input type="hidden" name="artiste" value=<%=a%>/>
	</form>
	
	 
	<% 
	/* Collection<Utilisateur> followers = a.getFollowers();
	out.println("Les followers de " + a.getNom());
	out.println("");
	for(Utilisateur u : followers) {
		out.println(u.getPseudo()+" <br>");		
	}
	out.println("");
	
	Collection<Evenement> events = a.getEvenements();
	out.println("Les futurs événements de "+a.getNom_groupe());
	out.println("");
	for(Evenement e : events) {
		out.println(e.getTitre()+" <br>");		
	}
	out.println("");
	
	Collection<Tournee> tournees = a.getTournees();
	out.println("Les tournées à venir de " + a.getNom_groupe());
	out.println("");
	for(Tournee t : tournees) {
		out.println(t.getTitre()+" <br>");		
	}
	out.println("");
	
	Collection<Message> messages = a.getCommentaires();
	out.println("Commentaires :");
	out.println("");
	for(Message m : messages) {
		out.println(m.getAuteur()+" "+m.getDate() +" <br>");
		out.println(m.getMessage());		
	}
	out.println(""); 
	*/
	%>
	
	</body>
</html>