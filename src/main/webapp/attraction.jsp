<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="p.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%!

boolean CanRide(Child c) {
	
	boolean rtn = false;
	
	if (c.isHeartDisease() == false) {
	if (c.getAge() >= 6 && c.getHeight() >= 120) {
		rtn = true;
	} else {
		if (c.getHeight() >= 120 && c.isParent()){
			rtn = true;
		}
	}
	}	
	return rtn;
}
	
	/* boolean qustn1 = false;
	if (this.heartDisease == false) {
		if (this.age >= 6 && this.height >= 120) {
			qustn1 = true;
		} else {
			if (this.height >= 120 && this.parent) {
				qustn1 = true;
			} else {
				qustn1 = false;
			}
		}
	} else {
		qustn1 = false;
	}
	return qustn1;
} */



%>

<jsp:useBean id="Child" class="p.Child" />
<jsp:setProperty name="Child" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>rollercoaster</h1>
	<%if (CanRide(Child)) {%>
	탑승 가능
	<% } else { %>
	탑승 불가능
	<% } %>
</body>
</html>