<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 파일은 무조건 post방식  -->
<form method='post' enctype='multipart/form-data' action='fileupload.jsp'>
	title: <input type='text' name='title'/> </br>
	photo: <input type='file' name='photo'/> </br>
	<input type='submit' value='upload'/>
</form>
	

</body>
</html>