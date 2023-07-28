<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="p.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ page import="org.apache.commons.beanutils.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
 
<%-- <jsp:useBean id="Child" class="p.Child" scope="request"/>
<jsp:setProperty name="Child" property="*"/>  --%>
<%
java.util.Map<String, String[]> map = request.getParameterMap();
System.out.println(map);
for(Map.Entry<String, String[]> e : map.entrySet()){
	System.out.println(e.getKey());
	for(String s : e.getValue()){
		System.out.println(s);
	}
}
Child child = new Child();
BeanUtils.populate(child, map);
System.out.println(child);
pageContext.setAttribute("child", child);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	${child.age}<br>
	${child.height}<br>
	${child.parent}<br>
	${child.heartDisease}<br>
	<c:forEach var="attraction" items="${attractions}">
	${attraction}<br>
	</c:forEach>s	
<%-- 	<%for(String attraction : Child.getAttractions()) {%>
	<jsp:include page='<%= attraction + ".jsp" %>'>
	<jsp:param name="include" value="true"/>
	</jsp:include>
	<%}%> --%>
	
</body>
</html>