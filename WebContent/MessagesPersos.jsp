<%@page import="java.util.*"%>
<%@page import="projet_jee.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mes messages</title>
</head>
<body>
			<form method="Get" action="Serv" id="ajouterEvenement">
			Pseudo du destinataire: <input type="text" name="dest" /><br>
			Message 			 <input type="text" name="mess"/><br>
			<input type="submit" value="Envoyer" id="envoyer" >  
			<input type="hidden" name="op" value="sendMP"/>
			</form>
			
		<% Collection<Message> mps = (Collection<Message>) request.getAttribute("mps");
 		if (mps != null) {
 			out.println("Mes messages : <br>");
 				for(Message m : mps) {
 					//out.println(m.getDate()+":");
	 				//out.println("<a href=\"/projet_jee/Serv?op=lienEvenement&param="+e.getTitre()+"\">"+e.getTitre()+"</a> <br>");
	 				out.println(m.getAuteur()+"<br>"+m.getMessage()+"<br><br>");						
	 			} 
 		}
		%> 
			


</body>
</html>