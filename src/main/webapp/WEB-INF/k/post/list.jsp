<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"	/>
</head>
<body class="bg-dark gothic-a1-regular">
	<jsp:include page="../common/header.jsp"/>
	<c:if test="${not empty user}">
		<jsp:include page="../common/idshower.jsp"/>
    </c:if>
	<main class="container mt-5">
		<h1 class="mt-3" id="post-list-name"> ${categoryName}</h1>
		<hr>
        <table class="table table-hover text-center table-dark text-white">
            <thead class="border-bottom border-light">
                <tr>
                    <th style="width: 10%;"> 글 번호 </th>
                    <th> 제목 </th>
                    <th style="width: 20%;"> 작성자 </th>
                    <th style="width: 15%;"> 날짜 </th>
                    <th style="width: 10%;"> 조회수 </th>
                </tr>
            </thead>
            <tbody >
            	<c:forEach items="${posts}" var="p">
            		<c:if test="${empty posts}">
	            		<tr>
	            			<td class="small text-light"> Ooops! there's no contents to show!!</td>
		                <tr>
            		</c:if>
            		<tr>
            			<td>${p.pno}</td>
                   		<td class="text-start text-truncate"><a href="${cp}list/view?pno=${p.pno}" class="text-white text-decoration-none" data-bs-toggle="tooltip" title="${p.title}">${p.title}</a></td>
            			<td><button type="button" class="btn text-decoration-none text-white post-writer" data-bs-toggle="popover" title="${p.userId}" data-bs-content="프로필 정보">${p.userId}</button></td>
           			    <td><fmt:formatDate value="${p.createDate}" pattern="yyyy/MM/dd" /></td>
   	                    <td>${p.viewCnt}</td>
	                <tr>
            	</c:forEach>
                </tbody>
        </table>
        
        <div class="row text-light mt-4 mb-5">
        	<div class="col-sm-10"></div>
        	<c:if test="${cno!=1}">
		        <div class="col-sm-2">
		        	<button class="btn btn-outline-light bg-secondary write-button" type="button"><i class="fa-regular fa-pen-to-square"></i> 글 작성하기 </button>
		       	</div>
	       	</c:if>
        </div>
		<jsp:include page="../common/paging.jsp"/>
        <d class="small text-secondary allign-center mb-3"><i class="small"> 운영정책에 위반되는 게시글 게시 시 통보 없이 이용이 정지될 수 있습니다. </i></d>
    </main>
	<jsp:include page="../common/footer.jsp"/>
	<script src="${cp}js/profilecard.js"></script>
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
</html>