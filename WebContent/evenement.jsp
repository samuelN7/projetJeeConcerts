<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evenement</title>
</head>
<body>
	<% Evenement e = (Evenement)request.getAttribute("evenement");
	out.println(e.getTitre()+" <br>");// +" "+e.getArtiste()+" "+e.getTournee());
	out.println("<br>");
//	out.println(e.getSalle());
	out.println("Date : "+e.getDate()+ "<br>");
	out.println("<br>");
	out.println("Prix : "+e.getPrix()+"€ <br>");
	out.println("<br>");
	out.println("Infos : "+e.getDescription()+"<br>");
	out.println("<br>");
	
/*	Collection<Utilisateur> inscritsNonCaches = e.getInscrisNonCacheE();
	out.println("Participants à cet événement ");
	out.println("");
	for(Utilisateur u : inscritsNonCaches) {
		out.println(u.getPseudo()+" <br>");		
	}
	out.println("");
	
	Collection<Message> messages = e.getCommentaires();
	out.println("Commentaires :");
	out.println("");
	for(Message m : messages) {
		out.println(m.getAuteur()+" "+m.getDate() +" <br>");
		out.println(m.getMessage());		
	}
	out.println("");
	request.setAttribute("monEvenement",e); */
	%>
	<form method = action="Serv" id="achat"> 
	<input type="submit" value="Prendre sa place !" id="achat" > 
	<input type="hidden" name="op" value="achat"/>
	</form>
</body>
</html>