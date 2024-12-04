<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>



<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
<head>
    <jsp:include page="/WEB-INF/k/common/head.jsp" />

</head>

</head>
<body class="gothic-a1-regular">
	<%-- <img src="${cp}files/common/k_landscape.png" class="img-fluid position-absolute position-fixed fixed-bottom" style="z-index:-200" alt="landscape"> --%>
	<div class="wrap ">
			<div class="img-size-target d-flex justify-content-center align-items-center vh-100" 
									 style="background-image: url('${cp}files/common/k_landscape.png'); background-size: cover;">
				<main class="mb-5 p-5" style="background-color: black; border-radius: 15px">
								
					<div class="container p-2">
						<h1 class="text-light"> Sorry, couldn't find a page. </h1>
						<hr class="mb-5">
						<h2 class="">죄송합니다, 페이지를 찾을 수 없습니다.</h2>
						<div class="d-flex     justify-content-end">
							<button class="btn btn-secondary"  onclick="window.location.href='intro'"> return </button>
						</div>
					</div>
				</main>
			</div>
	</div>
</body>
</html>