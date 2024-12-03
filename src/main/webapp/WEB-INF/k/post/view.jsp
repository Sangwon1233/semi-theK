<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<c:if test="${not empty user}">
			<jsp:include page="../common/idshower.jsp"/>
		</c:if>
		<div class="pathway row bg-light">
		</div>
		<div class="wrap mt-5">
			<main class="container mt-5 text-white">
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-t"></i><b> 글 제목 </b></label>
                <input type="text" class="form-control fw-bold big text-center big" id="title" placeholder="${post.title}" name="title" value="${post.title}"  readonly>
                
                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen"></i><b> 작성자 </b></label>
                <input type="text" class="form-control text-secondary small" id="writer" placeholder="${post.userId}" name="writer" value="${post.userId}" readonly>
                
                <label for="content" class="form-label mt-3"><i class="fa-solid fa-pen-to-square"></i><b> 글 내용 </b></label>
                
                <div type="text" class="ql-editor form-control"  id="content"  name="content" >${post.content}</div>
                <hr>
                <c:if test="${post.cno == 3}">
                	<div id="imgdiv" style = "width:1000px;" class="mt-3 text-center d-flex justify-content-center">
                		<img alt="이미지를 불러올 수 없습니다." src="${post.imgData}"  class="img-fluid d-block" name="${post.title}/${post}">
               		</div>
				</c:if>
                <label for="regdate" class="form-label mt-3"><i class="fa-regular fa-calendar-check"></i><b> 작성일 </b></label>
                <input type="text" class="form-control text-secondary small" id="regdate" placeholder="${post.createDate}" name="regdate" value="${post.createDate}" readonly>
                
                <label for="updatedate" class="form-label mt-3"><i class="fa-solid fa-file-signature"></i><b> 최근 수정일 </b></label>
                <input type="text" class="form-control text-secondary small" id="updatedate" placeholder="${post.updateDate}" name="updatedate" value="${post.updateDate}" readonly>
				<hr>
				<div>
					
				</div>
             	<div class="text-center mt-5 mb-5">
					<a href="${cp}list/modify?pno=${post.pno}" class="btn btn-outline-light btn-mod d-none" > 수정하기 </a>
					<c:if test="${post.cno == 3}">
						<a href="${cp}promotion?cno=${post.cno}" class="btn btn-outline-light btn-ret" > 프로모션 페이지로 돌아가기 </a>
					</c:if>
					<c:if test="${post.cno != 3}">
						<a href="${cp}list?cno=${post.cno}" class="btn btn-outline-light btn-ret" > 게시판으로 돌아가기 </a>
					</c:if>
					<a href="${cp}list/remove?pno=${post.pno}" class="btn btn-outline-light btn-del d-none" onclick="return confirm('Delete this post?')"> 삭제하기 </a>
             	</div>
			</main>
		</div>
	<script type="text/javascript">
		$(document).ready(function() {
			if ("${user.id}" == "${post.userId}") {
		        $(".btn-mod, .btn-del").removeClass("d-none");
		    } 
		    
		    const cookieValue = Cookies.get('userId');
	        if (cookieValue) {
	            console.log('쿠키 값:', cookieValue);
	        } 
		})
	</script>
	</body>
</html>