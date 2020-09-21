<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="${root}css/sss.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
</head>

<script>
function checkUserIdExist(){
	
	var user_id = $("#user_id").val()
	
	if(user_id.length == 0){
		alert('아이디를 입력해주세요')
		return
	}
	
	$.ajax({
		url : '${root}user/checkUserIdExist/' + user_id,
		type : 'get',
		dataType : 'text',
		success : function(result){
			if(result.trim() == 'true'){
				alert('사용할 수 있는 아이디입니다')
				$("#userIdExist").val('true')
			} else {
				alert('사용할 수 없는 아이디 입니다')
				$("#userIdExist").val('false')
			}
		}
	})
}

function resetUserIdExist(){
	$("#userIdExist").val('false')
}
	
</script>

<body>
		
	<div class="inner">
		
		<div class="top">
			<div></div>
		</div>

		<div class="log">
			
			<h1>Sign Up</h1>

		</div>

		<div class="log_input">
			<form:form action="${root}user/sign_up_pro" modelAttribute="signUpUserInfo" method="post">
				<form:hidden path="userIdExist"/>
			<div class="form">
			<form:label path="user_name"></form:label>
				<form:input path="user_name" placeholder="이름"/><br>
				<form:errors path="user_name" style="color:red"/>
			</div>

			<div class="form">
			
				<form:label path="user_id"></form:label>
			    <form:input path="user_id" placeholder="아이디" onkeypress='resetUserIdExist()'/><br>
			    
					<button type="button" class="bu1" onclick="checkUserIdExist()">중복확인</button>
					<form:errors path="user_id" style="color:red"/>
					
			</div>
				
				
			<div class="form">
				<form:label path="user_pw"></form:label>
				<form:password path="user_pw" placeholder="비밀번호"/><br>
				<form:errors path="user_pw" style="color:red"/>
				
			</div>
					
			<div class="form">
				<form:label path="user_pw2"></form:label>
				<form:password path="user_pw2" placeholder="비밀번호 확인"/><br>
				<form:errors path="user_pw2" style="color:red"/>
			
				<form:button class="bu2" >회원가입</form:button>

			</div>
			
					</form:form>
						
														
		</div>

			

			


		</div>
			
			
		

			<div class="menu">
    		<div class="submenu">
    		
    			
    			<a href="${root}">Home</a>
    			<a href="${root}user/login">Login</a>
    			<a href="${root}user/sign_up">Sign Up</a>
    			
    		</div>
    	</div>
	

</body>
</html>