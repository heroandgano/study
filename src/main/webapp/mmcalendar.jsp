<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>   
<%@ page import = "java.util.Date" %>   

<%

Calendar c = Calendar.getInstance();
Date d = null;
c.set(Calendar.MONTH, 7 - 1); // 0부터 시작, 0은 1월 이므로 원하는 달의 - 1
c.set(Calendar.DATE, 1);
int mm = c.get(Calendar.MONTH);
d = new Date(c.getTimeInMillis());
c.set(Calendar.DAY_OF_WEEK, 1);
c.add(Calendar.DATE, -1); // 하루 빼놔야 for문 시작하면서 1일부터 시작됨

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table class ="cl" border="1" align="left" width="480px" height="100px">
	<tr>
		<td style="color:#FF0000" width="30px" align="center">일</td>
		<td width="30px" align="center">월</td>
		<td width="30px" align="center">화</td>
		<td width="30px" align="center">수</td>
		<td width="30px" align="center">목</td>
		<td width="30px" align="center">금</td>
		<td style="color:#0000FF" width="30px" align="center">토</td>
	</tr>		
<% for (int i = 0; i < 6; i++) { %>
	<tr> 
	 <%for (int j = 0; j < 7; j++) { 
		 c.add(Calendar.DATE, 1); 
		d = new Date(c.getTimeInMillis());
		if ((c.get(Calendar.MONTH)) != mm) { %>
			<td width="30px" align="center"><% out.println(""); %></td>
		<% } else { 
			if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY){ %>
			<td style="color:#FF0000" width="30px" align="center"><% out.println(c.get(Calendar.DATE)); %></td>
			<% } else if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) { %>
				<td style="color:#0000FF" width="30px" align="center"><% out.println(c.get(Calendar.DATE)); %></td>
			<%} else {%> 
			<td width="30px" align="center"><% out.println(c.get(Calendar.DATE)); %></td>
			<%}
			
		}
	}%>
	</tr>
<% } %>


</table>



</body>
</html>