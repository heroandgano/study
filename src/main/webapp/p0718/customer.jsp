<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

        <div data-role="appbar">
            <ul class="app-bar-menu">
                <li><a href="<c:url value="madang?action=orderings"/>">주문</a></li>
                <li><a href="<c:url value="madang?action=customers"/>">고객</a></li>
                <li><a href="<c:url value="madang?action=books"/>">도서</a></li>
            </ul>
        </div>

        <br />
        <br />
        <br />

        <div class="container">
            <label>고객 추가/수정/삭제 하기</label>
            <br />
            <br />
            
            <form id="customerList_form" action="<c:url value="ccontrol"/>" method="post">
                <input type="hidden" name="action" value="" id="customer_form_action"/>
                <div class="row">
                    <label class="cell-2">고객번호</label>
                    <div class="cell-10"><input type="number" data-role="input" name="id" value="${c.id}" id="id" readonly /></div>
                </div>
                <div class="row">
                    <label class="cell-2">고객명</label>
                    <div class="cell-10"><input type="text" data-role="input" name="name" value="${c.name}" id="name" /></div>
                </div>
                <div class="row">
                    <label class="cell-2">주소</label>
                    <div class="cell-10"><input type="text" data-role="input" name="address" value="${c.address}" id="address" /></div>
                </div>
                <div class="row">
                    <label class="cell-2">전화번호</label>
                    <div class="cell-10"><input type="text" data-role="input" name="phone" value="${c.tel}" id="tel" /></div>
                </div>
                <div class="row">
                    <div class="cell-3"></div>
                    <div class="cell-3">
                        <button class="button" id="update_button">저장</button>
                        <button class="button" id="delete_button">삭제</button>
                    </div>
                    <div class="cell-3"></div>
                    <div class="cell-3"></div>
                </div>
            </form>
        </div>



<%-- 	<h2>고객정보</h2>
	<hr>
		<ul>
			<li>고객번호: ${c.id}</li>
			<li>고객명: ${c.name}</li>
			<li>주소: ${c.address}</li>
			<li>전화번호: ${c.tel}</li>
		</ul> --%>
		
		<script src="customer.js"></script>
</body>
</html>