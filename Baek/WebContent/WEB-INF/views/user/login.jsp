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
	<link rel="stylesheet" href="css/ss.css">
	<link href="${root}css/ss.css" rel="stylesheet"/>
</head>
<body>
		
	<div class="inner">
		
		<div class="top">
			<div></div>
		</div>

		<div class="log">
			
			<h1>Login</h1>

		</div>

		<div class="log_input">
			
			<form:form action="${root}user/login_pro" method="post" modelAttribute="tempLoginUserBean">
			<div class="form">
				
				
				<form:input path="user_id" placeholder="아이디"/> <br>
				<form:errors path="user_id" style="color:red"/>
				
				<form:password path="user_pw" placeholder="비밀번호"/><br>
				<form:errors path="user_pw" style="color:red"/>
					<div class="bu2">
					<button class="bu1">로그인</button>
					</div>
				
				
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