<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/Rs2.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	
	<div class="top-pic">
		<span>Write</span>
	</div>

<form:form method="post" action="${root}board/write_pro" modelAttribute="writeContentBean" enctype="multipart/form-data">
	<form:hidden path="content_board_idx"/>
	<form:hidden path="content_date"/>
<div class="container">

 

  <table class="table">

    <tbody>

      <tr>
		
      	<td><form:input path="content_subject" class="form-control" placeholder="글 제목" maxlength="40"/></td>
      			
      </tr>
     
     <tr class="e1">
				<td ><form:errors path="content_subject" style="color:red" /></td>
			</tr>	

      <tr>

      	<td><form:textarea path="content_text" class="form-control" placeholder="글 내용을 작성하세요" maxlength="1024" style="height: 400px;"/></td>
      			
      </tr>
      
      <tr class="e1">
			<td >	<form:errors path="content_text"  style="color:red" /> </td>
			</tr>	

      <tr>
      	<td>
		
		<form:input path="upload_file" type="file" class="form-control" accept="image/*"/>
		</td>
      </tr>

    </tbody>

  </table>

  
  <form:button class ="btn btn-primary pull-right">글 쓰기</form:button>

</div>

</form:form>

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
	


</body>
</html>