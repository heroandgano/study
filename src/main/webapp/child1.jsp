<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

int[] ages = {6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5};
int[] heights = {120,120,120,120,119,119,119,119,120,120,120,120,119,119,119,119};
boolean[] parents = {true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false};
boolean[] hearchDeases = {true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false};

List<Integer> ageList = new ArrayList<>();
List<Integer> heightList = new ArrayList<>();
List<Boolean> parentList = new ArrayList<>();
List<Boolean> heartDiseaseList = new ArrayList<>();

for (int i = 0; i < ages.length; i++) {
    ageList.add(ages[i]);
}
for (int i = 0; i < heights.length; i++) {
	heightList.add(heights[i]);
}
for (int i = 0; i < parents.length; i++) {
	parentList.add(parents[i]);
}
for (int i = 0; i < hearchDeases.length; i++) {
	heartDiseaseList.add(hearchDeases[i]);
}


request.setAttribute("ageList", ageList);
request.setAttribute("heightList", heightList);
request.setAttribute("parentList", parentList);
request.setAttribute("heartDiseaseList", heartDiseaseList);
/* pageContext.setAttribute("ageList", ageList);
pageContext.setAttribute("heightList", heightList);
pageContext.setAttribute("parentList", parentList);
pageContext.setAttribute("heartDiseaseList", heartDiseaseList); */



%>
<jsp:forward page="child2.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 

</body>
</html>