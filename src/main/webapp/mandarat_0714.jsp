<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

Map<String, List<String>> map1 = new HashMap<>();
Map<String, List<String>> secondMap = new HashMap<>();
//Map<String, List<String>> Map3 = new HashMap<>();

map1.put("8구단 드래프트 1순위",
		Arrays.asList("몸 만들기",
				"제구",
				"구의",
				"멘탈",
				"스피드 160km/h",
				"변화구",
				"인간성",
				"운"		
				)
		);

secondMap.put("몸 만들기",
		Arrays.asList("몸관리",
				"영양제먹기",
				"FSQ90kg",
				"RSQ130kg",
				"식사저녁7숟갈아침3숟갈",
				"가동역",
				"스테미너",
				"유연성"		
				)
		);

secondMap.put("제구",
		Arrays.asList("인스텝개선",
				"몸통강화",
				"축흔들지않기",
				"불안정없애기",
				"멘탈컨트롤",
				"몸을열지않기",
				"하체강화",
				"릴리즈포인트안정"		
				)
		);



List<String> mainList = new ArrayList<>();
mainList.addAll(map1.get("8구단 드래프트 1순위"));
mainList.add(4,"8구단 드래프트 1순위");
pageContext.setAttribute("mainList", mainList); //

request.setCharacterEncoding("UTF-8");
String goal = request.getParameter("goal");

List<String> secondList = new ArrayList<>();
if (goal != null) {
	secondList.addAll(secondMap.get(goal));
	secondList.add(4,goal);
	pageContext.setAttribute("secondList", secondList); //
}




%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>	
	<table class ="cl" border="1" align="left" width="480px" height="100px">

<c:forEach varStatus="i" begin="0" end="2" step="1">
	<tr> 
	 <c:forEach varStatus="j" begin="0" end="2" step="1">
		 
		<c:if test = "${3 * i.index + j.index == 4}">
			<td width="30px" align="center">${mainList[3 * i.index + j.index]}</td>
			</c:if>
 		<c:if test = "${3 * i.index + j.index ne 4}">
		
			<td width="30px" align="center"><input type="submit" name="goal" value="${mainList[3 * i.index + j.index]}"></td>
		</c:if>
	 </c:forEach>
		</tr>
	</c:forEach>
</table>
</form>
<hr>	

	


<% if(goal != null) { %>

	<table class ="cl" border="1" align="left" width="480px" height="100px">
<% for (int i = 0; i < 3; i++) { %>
	<tr> 
	 <%for (int j = 0; j < 3; j++) { %>
		<td width="30px" align="center"><%out.println(secondList.get(3*i+j)); %></td>
 		
	 <% } %>
	 </tr>
	<%}%>
</table>
<%} %>	


	
</body>
</html>