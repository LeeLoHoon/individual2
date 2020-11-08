<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.member.dao.MemberDAO,com.member.bean.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 - 실전프로젝트 회원관리 V1</title>
<link rel='stylesheet' href='member.css'>
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("id");
	System.out.println("here");
	MemberVO u=memberDAO.getOne(Integer.parseInt(id));
	System.out.println("here2");
	request.setAttribute("vo", u);
%>

<h1>회원정보 보기</h1>
<table id ="edit">
	<tr>
		<td>User ID</td><td>${vo.getUserid()} </td>
	</tr>
	<tr>
		<td>Name</td><td>${vo.getUsername()}</td>
	</tr>
	<tr>
		<td>Photo</td><td><c:if test="${vo.getPhoto() ne ''}"><br />
		<img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo"></c:if></td>
	</tr>
	<tr>
		<td>Email</td><td>${vo.getEmail()}</td>
	</tr>
	<tr>
		<td>Detail</td><td>${vo.getDetail()}</td>
	</tr>
</table>
	<button type="button" onclick="history.back()">뒤로 가기</button>
	<button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'">수정하기</button>
	<%-- <td><a href="editform.jsp?id=${vo.getSid()}">Add New Member</a></td> --%>

</body>
</html>