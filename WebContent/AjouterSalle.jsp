<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form method="Get" action="Serv" id="ajouterSalle">
			Nom: 				<input type="text" name="nomSalle" /><br>
			Adresse : 			<input type="text" name="adresse"/><br>
			Ville : 			<input type="text" name="ville"/><br>
			Description: 				<input type="text" name="descriptionSalle" /><br>
			Capacité : 			<input type="text" name="capacite"/><br>
			Téléphone : 			<input type="text" name="tel"/><br>
			<input type="submit" value="Ajouter" id="ajouterSalle" >  
			<input type="hidden" name="op" value="ajouterSalle"/>
			<form/>

</body>
</html>