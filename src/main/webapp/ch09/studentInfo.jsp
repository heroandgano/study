<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보</title>
</head>
<body>

	<h2>학생정보</h2>[<a href="/jwbook/studentControl">새로고침</a>]
	<hr>
	<table border="1">
		<thead>
		<tr><th>id</th><th>이름</th><th>대학</th><th>생일</th><th>이메일</th></tr>
		</thead>
		<tbody>
		<c:forEach items="${students}" var="s">
		<tr>
		 <td>${s.id}</td>
		 <td>${s.username}</td>
		 <td>${s.univ}</td>
		 <td><fmt:formatDate value="${s.birth}" pattern="yyyy.MM.dd" /></td>
		 <td>${s.email}</td>
		 </tr>
		 </c:forEach>
		 </tbody>
	</table>
	<hr>
	<h2>학생 추가</h2>
	<hr>
	<!-- <form method="post" action="/jwbook/studentControl?action=insert"> -->
	<form action='<c:url value="/studentControl?action=insert"/>' method ="post">
		<label>이름</label>
		<input type="text" name="username"><br>
		<label>대학</label>
		<input type="text" name="univ"><br>
		<label>생일</label>
		<input type="text" name="birth"><br>
		<label>이메일</label>
		<input type="text" name="email"><br>
		<button type="submit">등록</button>
	</form>
<%-- 	<form action='<c:url value="/custcontrol"/>' method ="get" id="goto_form">
			<input type="hidden" name ="action" value="info"/>
			<input type="hidden" name ="id" value="-1"/>
			<input type="submit" value="추가" id="add_button"/>
	</form> --%>
</body>
</html>