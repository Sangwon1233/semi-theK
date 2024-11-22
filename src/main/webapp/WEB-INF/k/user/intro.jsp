<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- font start -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap"
	rel="stylesheet">
<!-- font end -->
<title>intro</title>
<style>
video {
	width: 100%;
	height: 100vh;
	object-fit: fill;
}

.gothic-a1-regular {
	font-family: "Gothic A1", sans-serif;
	font-weight: 400;
	font-style: normal;
}

.class-box {
	position: absolute;
	right: 15%;
	top: 30%;
	z-index: 0;
	width: 20%;
}
</style>
</head>
<body class="gothic-a1-regular">
	<div>
		<video src="${cp}files/common/k_intro.mp4" muted autoplay playsinline></video>
		<div class="class-box text-center">
			<p class="fs-1" style="color: #fff;">한국 여행 어디든</p>
			<div>
				<button type="button" id="signin"
					class="login-box btn btn-light w-100 m-0" data-bs-toggle="modal"
					data-bs-target="#signinModal">로그인</button>
				<div class="d-flex justify-content-between">
					<button type="button" id="id_pw" class="btn text-secondary p-0"
						data-bs-toggle="modal" data-bs-target="#id_pwModal">아이디/비밀번호
						찾기</button>
					<button type="button" id="signup" class="btn text-secondary p-0"
						data-bs-toggle="modal" data-bs-target="#signupModal">회원가입</button>

					<body class="gothic-a1-regular">
						<div class="modal fade" id="signupModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="false">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>