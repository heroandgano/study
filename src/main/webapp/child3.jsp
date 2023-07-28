<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form name="canride" action="canride.jsp" method="post">
		나이: <input type="text" name="age"/><br>
		&nbsp;&nbsp;키: <input type="text" name="height"/>
		<br>
		부모동반 여부:<br>
		<input type="checkbox" name="parent" value="true"/><br>
		심장병 여부:<br>
		여 <input type="radio" name="heartDisease" value="true"/>
		부 <input type="radio" name="heartDisease" value="false" checked/>
		<br>
		선호 놀이 기구: <br>
		롤러코스터 <input type="checkbox" name="attractions" value="rollercoaster"/>
		범퍼카 <input type="checkbox" name="attractions" value="bumpercar"/>
		회전목마 <input type="checkbox" name="attractions" value="merrygoround"/>
		<br>
		<input type="submit" name="제출" value="제출"/>
	</form>


</body>
</html>