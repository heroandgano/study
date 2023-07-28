<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만다라트</title>
</head>
<body>




<form action="">
    <table border="1">
    <c:forEach begin="0" end="2" var="i">
        <tr>
        <c:forEach begin="0" end="2" var="j">
            <c:choose>
                <c:when test="${3 + j == 4}">
                    <td>${mandaratm[3 * i + j]}</td>
                </c:when>
                <c:otherwise>
                    <td><input type="submit" name="goal" value="${mandaratm[3 * i + j]}"></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        </tr>
    </c:forEach>
    </table>
</form>






<%-- <form action='<c:url value="/mandara?action=info"/>' method ="post">
<table border="1">
<c:forEach items="${mandaratm}" var="mmain">
	<c:if test = "${mmain.id == 1}">
	<tr>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list1}"></td>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list2}"></td>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list3}"></td>
	</tr>
	<tr>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list4}"></td>
		<td width="30px" align="center"><input type="text" name="goal" value="${mmain.list5}"></td>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list6}"></td>
	</tr>
	<tr>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list7}"></td>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list8}"></td>
		<td width="30px" align="center"><input type="submit" name="goal" value="${mmain.list9}"></td>
	</tr>
	</c:if>
</c:forEach>
</table>
</form> --%>


<br>
<hr>	
<br>
	


<%-- <% if(goal != null) { %>

	<table class ="cl" border="1" align="left" width="480px" height="100px">
<% for (int i = 0; i < 3; i++) { %>
	<tr> 
	 <%for (int j = 0; j < 3; j++) { %>
		<td width="30px" align="center"><%out.println(secondList.get(3*i+j)); %></td>
 		
	 <% } %>
	 </tr>
	<%}%>
</table>
<%} %>	 --%>


	
</body>
</html>