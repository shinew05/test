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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>correct</title>
<style>

.top_menu {
	position: relative;
	width: 100%;
	padding: 0 100px 0 100px;
}

.table.table-hover {
	width: 82%;
	margin: 50px 100px 0 100px;
	text-align: center;
}

.table.table-hover tr th {
	text-align: center;
}

.table.table-bordered {
	text-inline:block;
	width: 82%;
	margin: 50px 100px 0 100px;
	text-align: center;
}
</style>
</head>

<script>
	function go_text(val){
		var tmp = $("#td"+val+"").html();
		$("input[name=userName]").val(tmp);
		$("input[name=editNum]").val(val);
		$("input[name=userNo]").val(val);
		
		var table = $("form[name=menuType]");
		$(".trcolor").css("background-color","");
		$("#tr"+val).css("background-color","#AAD7A5");
		
		
	}
	
	function go_edit(){
		var chkNm = $("input[name=userName]").val();
		var chkNo = $("input[name=userNo]").val();
		var finChk = "Y";
		if(chkNo == ""){
			alert("수정할 사용자를 체크해 주세요.");
			finChk = "N";
		}
		if(chkNm == "" && finChk == "Y"){
			alert("수정할 사용자명을 정확히 입력해 주세요.");
			finChk = "N";
		}
		
		if(finChk == "Y"){	
			var queryString = $("form[name=menuType]").serialize();
		    $.ajax({
		        url: "proc.jsp",
		        data:queryString,
		        type: "POST",
		        dataType : "text",
		        success: function(){
		        	location.href = "correct.jsp";
		        },
		        error: function(xhr, status, msg){alert("error");},
		    });
		}
	}
</script>
<body>
	<div class="container">
		<form name="menuType" action="#" method="post">
		<input type="text" name="editNum" style="display:none" value="">
		<input type="text" name="procNum" value="2" style="display: none">
		<input type="text" name="userNo" style="display: none">
			<div class="top_menu">
				<h3>UMS</h3>
				<ul class="nav nav-pills nav-justified">
					<li><a href="./listUsers.jsp">사용자 목록</a></li>
					<li><a href="./join.jsp">사용자 추가</a></li>
					<li class="active"><a href="./correct.jsp">사용자 수정</a></li>
					<li><a href="./secede.jsp">사용자 삭제</a></li>
				</ul>
			</div>

			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>
								이름 : 
								<input type="text" name="userName" style="width:290px;">
								<button type="button" class="btn btn-warning" onclick="go_edit()" style="float:right;">
								사용자이름 수정
								</button>
							</th>
						</tr>
					</thead>
				</table>
			</div>

			<table class="table table-hover">
				<col width="20%">
				<col width="*">
				<col width="35%">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
			       <c:forEach var="users" items="${users}">
			         <tr id="tr${users.userNo}" class="trcolor">
			           <td>${users.userNo}</td>
			           <td input type="radio" name="select" value="1" onclick="go_text(${users.userNo})" id="td${users.userNo}">${users.userName}</td>
			           <td>${users.regDate}</td>
			         </tr>
			       </c:forEach>					
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>