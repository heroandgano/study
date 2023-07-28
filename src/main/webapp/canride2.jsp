<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="p.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%
 
request.setCharacterEncoding("UTF-8");
String ageString = request.getParameter("age");
String heightString = request.getParameter("height");
String parentString = request.getParameter("parent");
String heartDiseaseString = request.getParameter("heartDisease");
String[] attractions = request.getParameterValues("attractions");
int age;
int height;
boolean parent;
boolean heartDisease;
age = Integer.parseInt(StringUtils.defaultIfEmpty(ageString, "0"));
height = Integer.parseInt(StringUtils.defaultIfEmpty(heightString, "0"));
parent = Boolean.parseBoolean(
		StringUtils.defaultIfEmpty(parentString, "false"));
heartDisease = Boolean.parseBoolean(
		StringUtils.defaultIfEmpty(heartDiseaseString, "false"));
attractions = ArrayUtils.nullToEmpty(attractions);


Child child = new Child();
child.setAge(age);
child.setHeight(height);
child.setParent(parent);
child.setHeartDisease(heartDisease);
child.setAttractions(attractions);


pageContext.setAttribute("child", child);


/* if(ageString == null || "".equals(ageString)) {
	age = 0;
} else {
	age = Integer.parseInt(ageString);
} */

/* if(heightString == null || "".equals(heightString)) {
	height = 0;
} else {
	height = Integer.parseInt(heightString);
}

if(parentString == null) {
	parent = false;
} else {
	parent = Boolean.parseBoolean(parentString);
}

if(heartDiseaseString == null) {
	heartDisease = false;
} else {
	heartDisease = Boolean.parseBoolean(heartDiseaseString);
} */


/* if(attractions == null) {
	attractions = new String[0];
} else {

} */




%>    
<%-- <jsp:useBean id="child" class="p.Child"/>
<jsp:setProperty name="child" property="*"/> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 	<jsp:getProperty name="child" property="age"/>
	<jsp:getProperty name="child" property="height"/>
	<jsp:getProperty name="child" property="parent"/>
	<jsp:getProperty name="child" property="heartDisease"/>
	<jsp:getProperty name="child" property="attractions"/> --%>

	
<%-- 
	<%= child.getAge() %><br>
	<%= child.getHeight() %><br>
	<%= child.isParent() %><br>
	<%= child.isHeartDisease() %><br>
	<%= child.getAttractions() %><br>
	 --%>
 	<% for(String attraction : child.getAttractions()){ %>
		<%= attraction%>
	<%}%>
	
<%-- 		<jsp:getProperty name="child" property="canride"/> --%>

	<c:out value="${child}" /><br>
	<c:out value="${child.age}" /><br>
	<c:out value="${child.height}" /><br>
	<c:out value="${child.parent}" /><br>
	<c:out value="${child.heartDisease}" /><br>
	<c:out value="${child.attractions}" /><br>
	
	
<form>	
<table class ="cl" border="1" align="left" width="480px" height="100px">

<c:forEach varStatus="i" begin="0" end="15" step="1">
	<tr> 
	 <c:forEach varStatus="j" begin="0" end="5" step="1">
		
			<td width="30px" align="center"></td>
		
	 </c:forEach>
		</tr>
	</c:forEach>
</table>
</form>

	
</body>
</html>