<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="p.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<%!
	String includeTempate = "<h1>Rollercoaster</h1>:CanRide";
%> 

<%!

boolean CanRide(Child c) {
	
	boolean rtn = false;
	
	if (!c.isHeartDisease()) {
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

%>

<%

		Child child = (Child) request.getAttribute("Child");
		String canRide = "";
		if (CanRide(child)) {
			canRide = "탑승 가능";
		} else {
			canRide = "탑승 불가";
		}
	

%>
<%-- <%
boolean include = Boolean.parseBoolean(StringUtils.defaultIfEmpty(request.getParameter("include"), "false"));
	if (include) {
		Child child = (Child) request.getAttribute("Child");
		String canRide = "";
		if (CanRide(child)) {
			canRide = "탑승 가능";
		} else {
			canRide = "탑승 불가";
		}
		String htmlPart = includeTempate.replace(":CanRide", canRide);
		out.print(htmlPart);
		return;
	}

%> --%>

<jsp:useBean id="Child" class="p.Child" />
<jsp:setProperty name="Child" property="*" />

<h1>Rollercoaster</h1>
<%=canRide %>
</html>