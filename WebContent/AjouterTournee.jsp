<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form method="Get" action="Serv" id="ajouterTournee">
			Titre:					<input type="text" name="nomT"/><br>
			1ère date: 				<input type="text" name="dateD" /><br>
			Dernière date : 			<input type="text" name="dateF"/><br>
			Description : 			<input type="text" name="descT"/><br>
			<input type="submit" value="Ajouter" id="ajouterEvt" >  
			<input type="hidden" name="op" value="ajouterTournee"/>
		<form/>
		<p> ${sessionScope.sessionUtilisateur.pseudo} </p>

</body>
</html>