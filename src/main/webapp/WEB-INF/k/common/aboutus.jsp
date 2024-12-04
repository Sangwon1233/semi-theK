<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular ">
		<div class="wrap">
			<jsp:include page="../common/header.jsp"/>
			<main class="">
				<div data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">

					<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed">
					  <div class="container-fluid"> 
						<ul class="navbar-nav">
						  <li class="nav-item">
							<a class="nav-link" href="#section1">Section 1</a>
						  </li>
						  <li class="nav-item">
							<a class="nav-link" href="#section2">Section 2</a>
						  </li>
						  <li class="nav-item">
							<a class="nav-link" href="#section3">Section 3</a>
						  </li>
						</ul>
					  </div>
					</nav>
					
						<div id="section1" class="container-fluid bg-secondary text-white" style="padding:100px 20px;">
						<h1>Section 1</h1>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						</div>
						
						<div id="section2" class="container-fluid bg-secondary" style="padding:100px 20px;">
						<h1>Section 2</h1>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						</div>
						
						<div id="section3" class="container-fluid bg-secondary text-white" style="padding:100px 20px;">
						<h1>Section 3</h1>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						</div>
					
					</div>
			
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>