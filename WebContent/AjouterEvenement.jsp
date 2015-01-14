<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form method="Get" action="Serv" id="ajouterEvenement">
			Nom: 				<input type="text" name="nomEvt" /><br>
			Description : 			<input type="text" name="descriptionEvt"/><br>
			Salle : 			<input type="text" name="nomSalle"/><br>
			<input type="submit" value="Ajouter" id="ajouterEvt" >  
			<input type="hidden" name="op" value="ajouterEvt"/>
		<form/>
		
		<p> ${sessionScope.sessionUtilisateur.pseudo} </p>
</body>
</html>