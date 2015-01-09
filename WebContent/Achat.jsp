<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="Get" action="Serv" id="acheté">

			Nom : 				<input type="text" name="nom" /><br>
			Prenom : 			<input type="text" name="prenom"/><br>
			N°Carte : 			<input type="text" name="numCarte"/><br>
			Clé de sécurité :	<input type="text" name="clé"/><br>
			Date expiration :	<input type="text" name="date"/><br>
			<input type="checkbox" name="PourMoi" id="PourMoi" checked="checked"> <label for="PourMoi"> C'est pour moi !</label> <br>
			<input type="checkbox" name="Visible" id="Visible" checked="checked"> <label for="Visible"> Je veux être visible sur l'événement</label> <br>
			<input type="submit" value="J'achète !" id="acheté" >  
			<input type="hidden" name="op" value="acheté"/>
</form>

</body>
</html>