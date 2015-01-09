<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tournée</title>
</head>
	<body>
	<% Tournee t = (Tournee)request.getAttribute("tournee");
		out.println(t.getTitre()+" "+t.getArtiste());
		out.println(t.getDateDebut()+" "+t.getDateFin());
		out.println(t.getDescription());
		out.println(" ");
	%>
	
	<form method="Get" action="Serv">
	<input type="submit" value="S'abonner à cette tournée"/>
	</form>
		
	<% Collection<Evenement> events = t.getEvenements();
		out.println("Prochains evenements de la tournée :");
		out.println("");
		for(Evenement e : events) {
			out.println(e.getTitre() +" <br>");		
		}
		out.println("");
		
		Collection<Message> messages = t.getCommentaires();
		out.println("Commentaires :");
		out.println("");
		for(Message m : messages) {
			out.println(m.getAuteur()+" "+m.getDate() +" <br>");
			out.println(m.getMessage());
		}
		out.println("");
	%>	
	</body>
</html>