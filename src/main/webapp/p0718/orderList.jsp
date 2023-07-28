<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<td>
	<tr><a href="<c:url value="ocontrol?action=orderList"/>">주문</a></tr>
    <tr><a href="<c:url value="ccontrol?action=customerList"/>">고객</a></tr>
    <tr><a href="<c:url value="control?action=books"/>">도서</a></tr>
	</td>
    <br />


	<form action = "<c:url value="/ocontrol?action=addOrdering"/>" method="post" id="orderList_form">
	<h2>고객</h2>
	
	<c:forEach var="c" varStatus="i" items="${customers}">
	<tr><input type="radio" name="customerId" value="${c.id}">${c.name} </tr>
	</c:forEach>
	<br>
	<h2>도서</h2>
	<c:forEach var="b" varStatus="i" items="${books}">
	<tr><input type="radio" name="bookId" value="${b.id}">${b.title} </tr>
	</c:forEach>
	
	<h3>주문 하기</h3>
	<input type="text" name="saleprice" size="60" value="" name=""/>
	<br>
	<input type="submit" value="주문">
	<br>
	
	</form>
	
	

	<h2>주문리스트</h2>
	<hr>
	<table border="1">
	<tr><th>고객번호</th><th>고객명</th><th>도서번호</th><th>도서명</th><th>판매가격</th><th>주문일자</th></tr>
	<c:forEach var="o" varStatus="i" items="${orders}">
	<tr>
		<td>${o.customerId}</td>
		
		<c:forEach var="c" varStatus="j" items="${customers}">
		<c:if test="${o.customerId == c.id}">
		<td>${c.name}</td>
		</c:if>
		</c:forEach>
		
		<td>${o.bookId}</td>
		
		<c:forEach var="b" varStatus="k" items="${books}">
		<c:if test="${o.bookId == b.id}">
		<td>${b.title}</td>
		</c:if>
		</c:forEach>
		
		<td>${o.saleprice}</td>
		<td>${o.orderdate}</td>
	</tr>
	</c:forEach>
	</table>




<%-- 		<h2>고객</h2>
	<hr>
	<table border="1">
	<tr><th>고객번호</th><th>고객명</th><th>주소</th><th>전화번호</th></tr>
	<c:forEach var="c" varStatus="i" items="${customers}">
	<tr>
		<td><a href="/jwbook/custcontrol?action=info&id=${c.id}">${c.id}</a></td>
		<td>${c.name}</td>
		<td>${c.address}</td>
		<td>${c.tel}</td>
		</tr>
	</c:forEach>
	</table> --%>
</body>
</html>