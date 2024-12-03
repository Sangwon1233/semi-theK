<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<div class="wrap">
			<main class="container mt-5 mb-5">
				<p class="small"><i class="small">the-K에서 보증하는 <b class="text-warning">프리미엄 프로모터</b>의 게시글을 만나보세요.</i></p>
				<hr>
					<div class="my-4 row align-items-stretch d-flex justify-content-center text-center">
						<c:forEach items="${posts}" var="po">
							<div class="col-sm-3">
								<div class="card bg-secondary mx-1 my-2 container border border-white shadow-lg">
									<div class="text-center shadow-lg overflow-hidden p-0 bg-secondary" style="width:280px; height:280px">
										<img class="card-img-top mt-1 z-3" src="${po.imgData}" alt="Card image" style="object-fit:cover;">
									</div>
									<div class="card-body">
										<h4 class="card-title small text-truncate border border-warning border-2 p-3 big bg-light" style="object-fit:contain"><a href="${cp}list/view?pno=${po.pno}" class="text-decoration-none"><strong>${po.title}</strong></a></h4>
										<hr>
										<div class="border border-light my-0 border-2 small bg-dark">
											<p class="card-text small">프로모터 : ${po.userId}</p>
										</div>
										<hr>
										<div class="mb-1 small mt-1 row">
											<span class="col-sm-4">조회수 : ${po.viewCnt}</span>
											<span class="col-sm-4"> / </span>
											<span class="col-sm-4">댓글 : [0]</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				<hr>
				<div class="row small">
					<div class="col-sm-6 small">
						<h3>프로모터가 되고 싶은가? 지금 당장 신청하십시오!</h3>
						<hr class="border-light">
						<p class="small">
							광고자가 되어 자유롭게 홍보하십시오! 상단에 자신의 광고를 노출시키고 싶으신가요?
							<br> 
							그렇다면 우리에게 돈을 바치다. 그렇게 고급 광고자가 될 수 있습니다.
							<br>
							취소할까요? 그러나 결제되었습니다. 이것은 우리에게 유효. 
							<br>
							당신의 지갑, 우리의 회식으로 대체되었다.
							<br>
							항상 감사하십시오, 이 프로모터들아. and I also, 한국좋아.
						</p>
					</div>
					<div class="col-sm-4">
					</div>
					<div class="col-sm-2"><button class="btn btn-outline-light bg-secondary write-button" type="button"><i class="fa-regular fa-pen-to-square"></i> 프로모션 작성하기 </button></div>
				</div>
				<jsp:include page="../common/paging.jsp"/>
			</main>
		</div>
		<jsp:include page="../common/footer.jsp"/>
		<script>
		$(".write-button").click(function(){
			if(${user.id == null}){
				alert("SYS :: No Session ; Log in first")
				const noSessionUrl = "intro"
				location.href = noSessionUrl;
			}
			const url = "post/write?cno="+${cno};
			location.href = url;
		})
		</script>
	</body>