<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.member.dao.MemberDAO,com.member.bean.MemberVO"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 - 실전프로젝트 회원관리 V1</title>
<link rel='stylesheet' href='member.css'>
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("id");	
	MemberVO u=memberDAO.getOne(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<h1>Edit Form</h1>
<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
<table id ="edit">
<tr><td>User ID:</td><td><input type="text" name="userid" value="<%= u.getUserid()%>" disabled /></td></tr>
<tr><td>User name:</td><td><input type="text" name="username" value="<%= u.getUsername()%>"/></td></tr>
<tr><td>Email address:</td><td><input type="text" name="email" value="<%= u.getEmail()%>" /></td></tr>
<%-- <tr><td>Photo:</td><td><textarea cols="50" rows="5" name="photo"><%= u.getPhoto()%></textarea></td></tr> --%>
<tr>
	<td>Photo</td><td><input type="file" name="photo" value="{vo.getPhoto()}"/>
	<c:if test="${vo.getPhoto() ne ''}"><br />
	<img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo"></c:if></td>
</tr>
<tr><td>Introduce myself:</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
<!-- <tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="List" onclick="history.back()"/></td></tr> -->
</table>

<button type="button" onclick="history.back()">뒤로 가기</button>
<button type="submit">회원정보 수정</button>
</form>


</body>
</html>