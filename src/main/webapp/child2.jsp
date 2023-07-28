<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <table style="text-align: center" border="1" align="left" width="480px" height="100px">
        <thead>
            <tr>
                <th>No</th>
                <th>나이</th>
                <th>키</th>
                <th>부모동반</th>
                <th>심장병</th>
                <th>탑승</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="index" begin="0" end="15">
                <tr>
                
                    <td width="30px" align="center">${index + 1}</td>


                        <c:choose>
                            <c:when test="${ageList[index] == 6}">
                                <td style="color:#0000FF">${ageList[index]}</td>
                            </c:when>
                            <c:otherwise>
                                <td style="color:#FF0000">${ageList[index]}</td>
                            </c:otherwise>
                        </c:choose>                    
                    <%-- <td width="30px" align="center">${ageList[index]}</td> --%>
                    
                    
                       <c:choose>
                            <c:when test="${heightList[index] == 120}">
                                <td style="color:#0000FF">${heightList[index]}</td>
                            </c:when>
                            <c:otherwise>
                                <td style="color:#FF0000">${heightList[index]}</td>
                            </c:otherwise>
                        </c:choose>  
                    <%-- <td width="30px" align="center">${heightList[index]}</td> --%>
                    
                    
                        <c:choose>
                            <c:when test="${!parentList[index]}">
                                <td style="color:#0000FF">true</td>
                            </c:when>
                            <c:otherwise>
                                <td style="color:#FF0000">false</td>
                            </c:otherwise>
                        </c:choose>
                    <%-- <td width="30px" align="center">${parentList[index]}</td> --%>
                    
                       <c:choose>
                            <c:when test="${!heartDiseaseList[index]}">
                                <td style="color:#0000FF">true</td>
                            </c:when>
                            <c:otherwise>
                                <td style="color:#FF0000">false</td>
                            </c:otherwise>
                        </c:choose>
                    <%-- <td width="30px" align="center">${heartDiseaseList[index]}</td> --%>

                    
                        <c:choose>
                            <c:when test="${ageList[index] >= 6 && !heartDiseaseList[index]}">
                                <td style="color:green">true</td>
                            </c:when>
                            <c:otherwise>
                                <td style="color:#FF0000">false</td>
                            </c:otherwise>
                        </c:choose>
                    

                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>