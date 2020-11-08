<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.dao.MemberDAO,com.member.bean.MemberVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>정보수정 - 실전프로젝트 회원관리 V1</title>

<link rel='stylesheet'
	href='member.css'>
<!-- <style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
</style>  -->
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='delete_ok.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>회원 목록</h1>

<table id="list" width="90%">
<tr>
	<th>No</th>
	<th>User ID</th>
	<th>User Name</th>
	<th>E-mail</th>
	<th>Regdate</th>
	<th>View</th>
	<th>Edit</th>
	<th>Delete</th>
	
</tr>
<%
	MemberDAO memberDAO = new MemberDAO();
	List<MemberVO> list = memberDAO.getList();
	request.setAttribute("list",list);
%>
<c:forEach items="${list}" var="u" varStatus="status">
	<tr>
		<td>${fn: length(list)-status.index }</td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="view.jsp?id=${u.getSid()}">View</a></td>
		<td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>

<td><a href="addform.jsp?id=${u.getSid()}">Add New Member</a></td>
</body>
</html>