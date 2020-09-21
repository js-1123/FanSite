<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var='root' value="${pageContext.request.contextPath }/"/>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/Rs.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>


	
		<div class="inner">
			<div class="top-pic">
				<span>Community</span>
				
			</div>

			<div class="ga">
			<c:forEach var="obj" items="${boardMenuList}">
				<a style="text-decoration: none;"  href="${root}board/community?board_info_idx=${obj.board_info_idx}">${obj.board_info_name}</a>
				
				</c:forEach>
			</div>
		</div>	


	<table class="table table-striped">
		
		<thead>
			<tr>
				
				<th class="text-center d-none d-md-table-cell">글 번호</th>
				<th>제목</th>
				<th class="text-center d-none d-md-table-cell">작성자</th>
				<th class="text-center d-none d-md-table-cell">작성날짜</th>

			</tr>

		</thead>

		<tbody>
			
			<c:forEach var="obj" items="${contentList}">
			<tr>
					
					<td class="text-center d-none d-md-table-cell">${obj.content_idx}</td>
					<td><a href="${root}board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}">${obj.content_subject}</a></td>
					<td class="text-center d-none d-md-table-cell">${obj.content_writer_name}</td>
					<td class="text-center d-none d-md-table-cell">${obj.content_date }</td>

			</tr>
			</c:forEach>
			
			

		</tbody>

	</table>

	<div class="text-center c1">
		<ul class="pagination justify-content">
		<c:choose>
			<c:when test="${pageBean.prevPage <=0 }">
				<li class="page-item disabled">
				<a class="page-link" href="#">이전</a>
		</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
				<a href="${root}board/community?board_info_idx=${board_info_idx}&page=${pageBean.prevPage}" class="page-link">이전</a>
		</li>
			</c:otherwise>
		</c:choose>
		
		
			<c:forEach var ="idx" begin="${pageBean.min}" end ="${pageBean.max}">
			<c:choose>
				<c:when test="${idx == pageBean.currentPage}">
					<li class="page-item active"><a href="${root}board/community?board_info_idx=${board_info_idx}&page=${idx}">${idx}</a></li>
				</c:when>
				
				<c:otherwise>
					<li><a href="${root}board/community?board_info_idx=${board_info_idx}&page=${idx}">${idx}</a></li>
				</c:otherwise>
			</c:choose>
					
			</c:forEach>
				<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
						<li class="page-item disabled">
				<a href="#" class="page-link">다음</a>
		</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
				<a href="${root}board/community?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}" class="page-link">다음</a>
		</li>
					</c:otherwise>
				</c:choose>
			
		</ul>
	</div>

	<div class="i">
		<a href="${root}board/write?board_info_idx=${board_info_idx}" class="btn btn-danger">글 쓰기</a>
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



	
	
	
	
	<script src="js/jquery-3.1.1.js"></script>
	<script src="js/bootstrap.js"></script>


</body>

</html>