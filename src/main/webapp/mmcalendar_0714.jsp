<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>July Calendar</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: lightgray;
        }
    </style>
</head>
<body>
    <h1>July Calendar</h1>
    <table>
        <tr>
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
        </tr>
        <c:set var="month" value="7" />
        <c:set var="year" value="2023" />
        <c:set var="firstDay" value="${year}-${month}-01" />
        <c:set var="cal" value="<%=java.util.Calendar.getInstance()%>" />
        <c:set target="${cal}" property="time" value="${firstDay}" />
        <c:set target="${cal}" property="DAY_OF_WEEK" value="1" />
        <c:set var="dayOfWeek" value="${cal.time.dayOfWeek}" />
        <c:choose>
            <c:when test="${dayOfWeek == 1}">
                <c:set var="first" value="0" />
            </c:when>
            <c:otherwise>
                <c:set var="first" value="${7 - dayOfWeek + 1}" />
            </c:otherwise>
        </c:choose>
        <c:set var="last" value="${first + 30}" />

        <c:forEach var="week" begin="0" end="5">
            <tr>
                <c:forEach var="day" begin="${week * 7 + 1}" end="${week * 7 + 7}">
                    <c:choose>
                        <c:when test="${day >= first && day <= last}">
                            <td>${day}</td>
                        </c:when>
                        <c:otherwise>
                            <td>&nbsp;</td>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
