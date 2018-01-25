<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ryu.minwoo.ums.service.UserService" %>
<%@ page import="ryu.minwoo.ums.service.UserServiceImpl" %>
<%@ page import="ryu.minwoo.ums.dao.UserDao" %>
<%@ page import="ryu.minwoo.ums.dao.UserDaoImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserDao userDao = new UserDaoImpl();
	UserService userService = new UserServiceImpl(userDao);
	pageContext.setAttribute("users", userService.listUsers());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>secede</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.top_menu {
	position: relative;
	width: 100%;
	padding: 0 100px 0 100px;
}

.table.table-hover {
	width: 82%;
	margin: 100px 100px 0 100px;
	text-align: center;
}

.table.table-hover tr th {
	text-align: center;
}
</style>
</head>
<script>
	function go_del(val){
		$("input[name=userNo]").val(val);
		if(confirm("삭제 하시겠습니까?")){
			var queryString = $("form[name=menuType]").serialize();
		    $.ajax({
		        url: "proc.jsp",
		        data:queryString,
		        type: "POST",
		        dataType : "text",
		        success: function(){
		        	location.href = "secede.jsp";
		        },
		        error: function(xhr, status, msg){alert("error");},
		    });	
		}			
	}
</script>
<body>
	<div class="container">
		<form name="menuType" action="#" method="post">
		<input type="text" name="procNum" value="3" style="display: none">
		<input type="text" name="userNo" style="display: none">
			<div class="top_menu">
				<h3>UMS</h3>
				<ul class="nav nav-pills nav-justified">
					<li><a href="./listUsers.jsp">사용자 목록</a></li>
					<li><a href="./join.jsp">사용자 추가</a></li>
					<li><a href="./correct.jsp">사용자 수정</a></li>
					<li class="active"><a href="./secede.jsp">사용자 삭제</a></li>
				</ul>
			</div>

			<table class="table table-hover" id="mytable">
				<col width="20%">
				<col width="*">
				<col width="35%">
				<col width="15%">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>등록일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="users" items="${users}">
						<tr>
							<td>${users.userNo}</td>
							<td>${users.userName}</td>
							<td>${users.regDate}</td>
							<td>
								<button type="button" class="btn btn-danger" onclick="go_del(${users.userNo})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>