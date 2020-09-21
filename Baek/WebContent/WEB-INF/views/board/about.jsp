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
<link rel="stylesheet" href="${root}css/A1.css">
</head>
<body>

	<div class="tab-inner">
		<input type="radio" name="tabmenu" id="tab1" checked>
		<input type="radio" name="tabmenu" id="tab2">
		<input type="radio" name="tabmenu" id="tab3">
		
		<div class="tabs">

			<div class="items">
				
				<div>
					
					
					<img src="${root}image/ba007.jpg" alt="" class="i1">
					<p class="q1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil eveniet consequatur ratione laborum assumenda, doloremque at, ea fugiat vero doloribus provident molestias itaque quas explicabo nisi blanditiis perspiciatis dolorem, ipsa illum labore quisquam. Laborum labore dicta modi vel veritatis ipsa, autem velit iure voluptatem animi maxime nobis impedit nulla obcaecati veniam fugiat incidunt vero explicabo voluptatum exercitationem! Blanditiis error tenetur quidem obcaecati ea deserunt repellat eveniet reprehenderit ipsum velit sint vero vel minima voluptate, quae facilis eos amet pariatur natus illo, minus in. Earum vitae aut, illum iste quas, voluptatibus quasi voluptas, quam quibusdam quo culpa itaque necessitatibus tempora deleniti?</p>
					<p class="q1"><b class="b1">Baek</b>
						Media Analyst at <span>ZenDesk</span>
					</p>

			
				</div>
				<div>
					<img src="${root}image/ba008.jpg" alt="" class="i2">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure deleniti incidunt rerum soluta molestiae. Tempore ut veritatis neque voluptates deleniti doloremque est dolores qui, nobis a nihil similique, porro quaerat dolor iste, cupiditate magnam provident? Similique a repudiandae praesentium amet impedit quod odit? Et, a, iusto. Tenetur, dignissimos facere quidem repellendus reprehenderit, qui suscipit quas, quia quasi animi possimus nesciunt voluptatem sit itaque id architecto tempore totam incidunt? Illum rem maiores saepe neque culpa aspernatur incidunt, quae quisquam. Numquam, corporis reiciendis quo alias, neque consectetur, ex beatae perferendis eaque blanditiis expedita error adipisci aliquam asperiores quidem, qui sapiente voluptas. Vitae.</p>
					<p class="q1"><b class="b2">Ye</b>
						Graphic Designer at <span>ChowNow</span>
					</p>

				</div>

				<div>
					<img src="${root}image/ba006.jpg" alt="" class="i3">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, tempore. Qui placeat magnam, saepe, aut incidunt rem soluta minima tempore pariatur dolore officia blanditiis eligendi odio, ducimus quo facilis. Nam vitae ipsa non quam alias aspernatur, debitis voluptates. Debitis magni ullam pariatur optio nobis nisi enim, ut eveniet voluptatum modi soluta earum at consequatur, quas inventore consequuntur consectetur et repellat eum quae quo, autem eligendi eius unde. Nihil numquam nam tempora consequatur, ut laudantium praesentium pariatur obcaecati sint repellat eum dicta exercitationem, architecto reiciendis unde reprehenderit, facere a fuga saepe nobis alias quaerat! Consectetur quaerat esse distinctio, necessitatibus cum culpa.</p>
					<p class="q1"><b class="b3">lin</b>
						Media Analyst at <span>ZenDesk</span>
					</p>

				</div>
			</div>
		</div>

		<div class="btn">
			<label for="tab1"></label>
			<label for="tab2"></label>
			<label for="tab3"></label>
		</div>
		
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

</body>
</html>