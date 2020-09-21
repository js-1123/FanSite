<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/style2.css">
	
	
</head>
<body>
	
	<div class="inner">
		 <input type="checkbox" id="trigger">

		<input type="radio" id="tab1" name="tabmenu" checked>
    	<input type="radio" id="tab2" name="tabmenu">
    	<input type="radio" id="tab3" name="tabmenu">

			<div class="slide">
				
				<div class="items">
					<div>
						<h1>Baek Ye lin</h1>
					</div>
					<div>
						<h1>Baek Ye lin</h1>
					</div>
					<div>
						<h1>Baek Ye lin</h1>
					</div>


				</div>
				<div class="sidebar">
					<div class="sidemenu">
					
						<a href="${root}board/community?board_info_idx=1">Community</a>
						<a href="${root}board/about">About</a>
				
					</div>
				</div>
			</div>	

			 <div class="btn">
      			<label for="tab1"></label>
     			<label for="tab2"></label>
     			<label for="tab3"></label>
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

    		
    			<!-- <span>Home</span>
    			<span>Login</span>
    			<span>Sign Up</span> -->
    			
    		</div>
    	</div>

		<label for="trigger">
				<span></span>
				<span></span>
				<span></span>
			</label>
			

			
    	


	</div>


</body>
</html>