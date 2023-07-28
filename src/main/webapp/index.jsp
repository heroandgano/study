<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>

	<sql:query var="rs" dataSource="jdbc/jwbookdb">
		select id, name, address, phone from customer
	</sql:query>
	
	<c:forEach var="customer" items="${rs.rows}">
		${customer.id} / ${customer.name} / ${customer.address} / ${customer.phone} <br> 
	</c:forEach>
	
<!-- 	<h1>Index</h1>
	<hr>
	<h1>Login</h1>
	<form action="login" method="post">
	
	ID: <input type="text" name="username" value="">
	PW: <input type="password" name="password" value="">
	
	<input type="submit" value="login">
	
	</form> -->
</body>
</html>