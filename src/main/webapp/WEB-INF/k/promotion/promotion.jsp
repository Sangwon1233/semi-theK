<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
		<style>
		.card-target {
		    transition: transform 0.3s ease, box-shadow 0.3s ease;
		    cursor: pointer;
		}
		
		.card-target:hover {
		    transform: scale(1.1);
		}
		</style>
	</head>
	<body class="gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<c:if test="${not empty user}">
			<jsp:include page="../common/idshower.jsp"/>
    	</c:if>
		<div class="wrap">
			<main class="container mt-5 mb-5">
				<div class="row">
					<div class="col-sm-6">
						<p class="small"><i class="small">the-K에서 보증하는 <b class="text-warning">프리미엄 프로모터</b>의 게시글을 만나보세요.</i></p>
					</div>
					<div class="col-sm-4">
					</div>
					<div class="col-sm-2">
					</div>
				</div>
				<hr>
					<div class="my-4 row align-items-stretch d-flex justify-content-center text-center">
						<c:forEach items="${posts}" var="po">
							<div class="col-sm-3" id="card" >
								<div class="card bg-secondary mx-1 my-2 container border border-white shadow-lg card-target" data-pno="${po.pno}">
									<div class="text-center overflow-hidden p-0 bg-secondary " style="width:280px; height:280px">
										<div class="p-1 img-size-target d-flex justify-content-center align-items-center border-3 border-light shadow-lg" 
												style="background-image: url('${po.imgData}'); background-size: cover; width:280px; height:280px;" id="cardImg">
										</div>
									</div>
									<div class="card-body">
										<p class="card-title text-truncate border border-warning border-2 p-3 big bg-light lead " style="object-fit:contain" data-bs-toggle="tooltip" title="${po.title}">
											<a href="${cp}list/view?pno=${po.pno}" class="text-decoration-none text-dark" ><strong class="small">${po.title}</strong></a></p>
										<hr>
										<div class="border border-light my-0 border-2 small bg-dark">
											<p class="card-text small">프로모터 : ${po.userId}</p>
										</div>
										<hr>
										<div class="mb-1 small mt-1 row">
											<span class="col-sm-12">조회수 : ${po.viewCnt}</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				<jsp:include page="../common/paging.jsp"/>
				<hr>
				<div class="row small">
					<div class="col-sm-6 small my-3">
						<h3>후원을 통해 <strong class="text-warning">프리미엄 프로모터</strong>가 되세요!</h3>
						<h4>비용 부담 없이, 자유롭게 홍보하세요!</h4>	
						<hr class="border-light">
						<p class="small">
							<br> 
							The-K 프로모션에 우선적으로 자신의 상품을 노출시키고 싶으신가요?
							<br>
							그렇다면 후원을 통해 프리미엄 프로모터가 되세요! 
						</p>
						<a class="text-warning text-end" href="">후원하기</a>
					</div>
					<div class="col-sm-4">
					</div>
					<div class="col-sm-2"><button class="btn btn-outline-light bg-secondary write-button" type="button"><i class="fa-regular fa-pen-to-square"></i> 프로모션 작성하기 </button></div>
				</div>
				
			</main>
		</div>
		<jsp:include page="../common/footer.jsp"/>
		<script>
			$(".card-target").click(function(){
				console.log($(this).data("pno"));
				location.href = "list/view?pno="+$(this).data("pno");
				
			})
		
		
		/* 
			$(".write-button").click(function(){
				if(${user.id == null}){
					alert("SYS :: No Session ; Log in first")
					const noSessionUrl = "intro"
					location.href = noSessionUrl;
				}
				const url = "post/write?cno="+${cno};
				location.href = url;
			})			 */
		</script>
	</body>