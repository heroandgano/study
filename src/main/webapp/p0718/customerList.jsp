<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="/jwbook/ocontrol">
		<button onclick="button">주문</button>
	</form>

	<td>
	<tr><a href="<c:url value="ocontrol?action=orderList"/>">주문</a></tr>
    <tr><a href="<c:url value="ccontrol?action=customerList"/>">고객</a></tr>
    <tr><a href="<c:url value="control?action=books"/>">도서</a></tr>
	</td>
    <br />

	<div class="container">
		<label>고객</label> <br />
		<table border="1">
			<thead>
				<tr>
					<th>고객번호</th>
					<th>고객명</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody id="customers">
				<c:forEach var="customer" varStatus="j" items="${customers}">
					<tr>
						<%-- <td><a class="customer_id"
							href="<c:url value="ccontrol?action=customer&id=${c.id}"/>"
							data-id="${c.id}">${c.id}</a></td> --%>
						<td><a href="/jwbook/ccontrol?action=customer&id=${customer.id}">${customer.id}</a></th>
						<td>${customer.name}</td>
						<td>${customer.address}</td>
						<td>${customer.tel}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div class="container">
		<form id="goto_form" action="/jwbook/ccontrol?action=customer&id=-1" method="post">
			<input type="hidden" name="action" value="customer" />
			<input type="hidden" name="id" value="-1" />
			<input type="submit" value="추가" id="add_button" />
		</form>
	</div>
	
	<script src="https://cdn.korzh.com/metroui/v4.5.1/js/metro.min.js"></script>
	
	<script src="customers.js"></script>

</body>
</html>