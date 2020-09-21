<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/Qstyle.css">
</head>
<body>
	
		<div class="inner1">
			<h1>Modify</h1>
		</div>
		<div class="inner2">
			


			<form:form action="${root}user/modify_pro" class="in2" method="post" modelAttribute="modifyUserBean">
			
				
				<div class="form">
					
					<form:label path="user_name">이름</form:label>
					<form:input path="user_name" readonly="true" class="re1"/>
				

				</div>

				<div class="form">
					
					<form:label path="user_id">아이디</form:label>
					<form:input path="user_id" readonly="true" class="re2"/>
				

				</div>

				<div class="form">
					
					<form:label path="user_pw">비밀번호</form:label>
					<form:password path="user_pw"/> <br>
					<div class="e1">
					<form:errors path="user_pw" style="color:red"/>
					</div>
				</div>

				<div class="form">
					
					<form:label path="user_pw2">비밀번호 확인</form:label>
					<form:password path="user_pw2"/> <br>
					<div class="e2">
					<form:errors path="user_pw2" style="color:red"/>
					</div>
				</div>

					<form:button>정보수정</form:button>

			</form:form>


		</div>


		<div class="menu">
    		<div class="submenu">
    			
    			<c:choose>
					<c:when test="${loginUserBean.userLogin==true}">
				<a href="${root}">Home</a>
    			<a href="${root}user/logout">Logout</a>
    			<a href="${root}user/modify">Modify</a>
					</c:when>
					
					<c:otherwise>
				<a href="${root}">Home</a>
    			<a href="${root}user/login">Login</a>
    			<a href="${root}user/sign_up">Sign Up</a>
					</c:otherwise>
				</c:choose>
    			
    		</div>
    	</div>
</html>