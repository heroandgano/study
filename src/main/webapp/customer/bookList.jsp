<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookList</title>
</head>
<div data-role="appbar">
            <ul class="app-bar-menu">
                <li><a href="<c:url value="mcontrol"/>">주문</a></li>
                <li><a href="<c:url value="custcontrol"/>">고객</a></li>
                <li><a href="<c:url value="bcontrol"/>">도서</a></li>
            </ul>
        </div>

        <br />
        <br />
        <br />

<body>
	<div class="container">
		<div class="container">
			<label>책정보</label>
		</div>
		<br>
		<table class="table">
		
		 <thead >
		 <tr>
		  <th>책번호</th>
		  <th>제목</th>
		  <th>출판사</th>
		  <th>금액</th>
		 </tr>
		
		 </thead>
		 <tbody id="book">
		  <c:forEach var="b" varStatus="i" items="${books}">
		 	<tr>
		 	 <td><a href="/jwbook/bcontrol?action=info&id=${b.id}"data-id="${b.id}">${i.count}</a></td>
		 	 <td>${b.title}</td>
		 	 <td>${b.publisher}</td>
		 	 <td>${b.price}</td>
		 	</tr>
		 </c:forEach>
		 </tbody>
		</table>
		<div class="container">
		<form action='<c:url value="/bcontrol"/>' method ="get" id="goto_form">
			<input type="hidden" name ="action" value="info"/>
			<input type="hidden" name ="id" value="-1"/>
			<input type="submit" value="추가" id="add_button"/>
		</form>
		</div>
		<!-- <button><a href="/jwbook/ccontrol?action=info&id=-1">추가</button> -->
	
	<!-- <script src="https://cdn.korzh.com/metroui/v4.5.1/js/metro.min.js"></script> -->
      
        <!-- <script src="customers.js"></script> -->
</body>

</html>