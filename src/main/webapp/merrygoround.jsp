<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="p.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%!
	String includeTempate = "<h1>Merrygoround</h1>:CanRide";
%>    
<%!

boolean CanRide(Child c) {
	
	boolean rtn = true;
	
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

<jsp:useBean id="Child" class="p.Child" />
<jsp:setProperty name="Child" property="*" />

<h1>merrygoround</h1>
<%=canRide %>