<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="java.time.*"
    import="java.time.temporal.*"
    import="java.util.stream.*" 
    import= "java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 

LocalDate ld = LocalDate.of(2023,7,1);
LocalDate start = ld.with(
		TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY)
		);
LocalDate end = start.plusDays(42);
List<LocalDate> days = start.datesUntil(end).collect(Collectors.toList());

for(int i=0; i<days.size();i++){
	int firstDay = ld.getMonthValue();
	pageContext.setAttribute("firstDay", firstDay);
}
pageContext.setAttribute("days", days);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlCalendar</title>
</head>
<body>
<p>2023년 7월</p>
<table border="5">
	<c:if test="${firstDay == 7}">
	<c:forEach varStatus="i" begin="0" end="5" step="1">
		<tr>
		<c:forEach varStatus="j" begin="0" end="6" step="1">
			<td>${days[7*i.index+j.index]}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</c:if>
</table>

</body>
</html>