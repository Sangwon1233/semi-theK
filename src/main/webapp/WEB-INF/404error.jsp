<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
</head>
<body class="gothic-a1-regular ">
	<div class="wrap">
		<main class="mt-5 mb-5">
			<div class="container p-2">
				<h1 class="text-light"> Sorry, couldn't find a page. </h1>
				<hr class="mb-5">
				<h2 class="">죄송합니다, 페이지를 찾을 수 없습니다.</h2>
				<a class="btn" href="${cp}/intro"> return </a>
			</div>
			
		</main>
	</div>
</body>
</html>