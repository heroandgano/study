<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="p.*" %>
    
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

if(ageString == null) {
	age = 0;
} else {
	age = Integer.parseInt(ageString);
}

if(heightString == null) {
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
}

if(attractions == null) {
	attractions = new String[0];
} else {

}


Child child = new Child();
child.setAge(age);
child.setHeight(height);
child.setParent(parent);
child.setHeartDisease(heartDisease);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= child.getAge() %><br>
	<%= child.getHeight() %><br>
	<%= child.isParent() %><br>
	<%= child.isHeartDisease() %><br>
</body>
</html>