<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="projet_jee.Salle,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Collection<Salle> salles =(Collection<Salle>) Facade.listerSalles(); 
for(Salle s:salles) {
	out.println(s.getNom());
	
}	
%>

</body>
</html>