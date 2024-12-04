<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page errorPage ="404error.jsp" %>

<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
    <jsp:include page="../common/head.jsp" />
    <jsp:include page="../common/bxslider.jsp" />
    <link rel='stylesheet' href='css/popup.css'> 
</head>
<style>
	.img-size-target {
		width:100%;
		height:auto;
	}
	img{
		
		object-fit: contain;
	}
	.card-hover {
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	    height:392px;
	}
	
	.card-hover:hover {
	    transform: scale(1.1);
	}
	.wrap-loading{
		z-index:3000;
		background-color: #000000;
	}
</style>
<body class="gothic-a1-regular">
<div class="d-flex justify-content-center align-items-center fixed-top w-100 vh-100 wrap-loading">
  <video src="${cp}/files/common/k_intro.mp4" class="w-100 h-100" alt="mp4" muted autoplay playsinline loop></video>
</div>
    <jsp:include page="../common/header.jsp"/>
    <div class="vh-100 w-1000 position-absolute position-fixed fixed-top" style="background-color:#00000044; z-index:-100"></div> 
   	<img src="${cp}files/common/k_landscape.png" class="img-fluid position-absolute position-fixed fixed-bottom" style="z-index:-200" alt="landscape">
    <main class="container my-2 mx-auto p-3 justify-content-center z-3" style="background-color:black; border-radius: 30px;">
	    <c:if test="${not empty user}">
			<jsp:include page="../common/idshower.jsp"/>
	    </c:if>
        <div id="slide-container z-3">
            <ul class="bxslider1">
                <c:forEach var="ps" begin="1" end="3">
                    <li><img src="${cp}files/common/bx${ps}.jpg" alt="Slide ${ps}"/></li>
                </c:forEach>
            </ul>
        </div>
         <div class="layer-popup border">
	        <img src="${cp}files/common/popup.jpg" alt="굿즈소개"> 
	        <p class="clearfix">
	            <!-- <span>오늘은 그만 보기 <input type="checkbox"></span> -->
	            <a href="#">닫기</a>
	        </p>
	    </div>
        <div class="container-fluid mt-4 p-2 mx-auto text-center z-3">
            <c:forEach items="${subC}" var="s" varStatus="status">
                <c:if test="${status.index % 2 == 0}">
                    <div class="row align-items-stretch">
                </c:if>
                <div class="col-sm-5 p-3">
                    <hr class="text-light">
                    <b><a href="${cp}list?cno=${s.cno}" class="p-2 mt-4 mb-0 big text-light bg-secondary text-decoration-none">${s.icon} ${s.cname} <i class="fa-solid fa-k small"> - 시판</i></a></b>
                    <hr class="text-light">
                    <ul class="p-0 small">
                        <c:forEach items="${posts}" var="p">
                            <c:if test="${s.cno == p.cno}">
                                <li class="bg-dark">
                                  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
                                    <div class="row p-2 border-bottom border-light mx-auto text-light">
                                        <div class="col-sm-1 small">${p.pno}</div>
                                        <div class="col-sm-6 text-truncate">
                                            <a href="${cp}list/view?pno=${p.pno}" class="text-decoration-none text-light">${p.title}</a>
                                        </div>
                                        <div class="col-sm-1">
                                            <a href="#" class="text-decoration-none text-light">[0]</a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" class="text-decoration-none text-light">
                                                <i class="fa-solid fa-heart small"></i>
                                            </a>
                                        </div>
										<div class="col-sm-2 small small small">
										    <fmt:formatDate value="${p.createDate}" pattern="yyyy/MM/dd" />
										</div>
								     
					             </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <c:if test="${status.index % 2 == 0}">
                    <div class="col-sm-2"></div>
                </c:if>
                <c:if test="${status.index % 2 == 1}">
                    </div>
                </c:if>
                <c:if test="${status.index == 1}">
                    <div class="row justify-content-center mt-4 mb-4">
                        <ul class="bxslider2">
                            <c:forEach var="postG" items="${postDtos}">
                                <li>
                                    <a href="kallery?cno=2" class="text-decoration-none">
                                    	<div class="card m-2 card-hover" style="width: 250px;" >
											<div class="card-header text-truncate text-start">${postG.title}</div>
											<div class="card-body p-1 img-size-target d-flex justify-content-center align-items-center" 
												 style="background-image: url('${fnc:split(postG.content,'&%$^&')[0]}'); background-size: cover;">
											</div>
											<div class="card-footer">
												<div class="d-flex justify-content-between">
													<div class="col-6 text-truncate">
													<b >${postG.userId}</b>
													</div>
													<div class="d-flex">
														<div class="px-1">
															<i class="fa-regular fa-eye me-1"></i>
															${postG.viewCnt}
														</div>
														<div class="px-1  ms-1 d-flex align-items-center my-push" data-myPush="${postG.myPush}">
															<i class="fa-solid fa-heart   ${postG.myPush? '': 'd-none'} "></i>
															<i class="fa-regular fa-heart ${!postG.myPush? '': 'd-none'}"></i>
															<p class="p-0 m-0 ms-1 like-cnt">${postG.likeCnt}</p>
														</div>
													</div>
												</div>
												<p class="content-preview m-0  text-truncate text-start">${fnc:split(postG.content,'&%$^&')[1]}</p>
												<p class="text-samll text-secondary m-0 text-end" >2024-11-30</p>
											</div>
										</div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
    <script src="${cp}js/bxsliderindex.js"></script>
    <script src="${cp}js/searchbar.js"></script>
    <script>
	    // 하룻동안 보지 않기가 체크가 안되어 있을시 할일
	    if(!$.cookie("layer")) {
	        $(".layer-popup").show();
	    }
	    
	    // 레이어 팝업 내의 닫기 버튼 클릭시 이벤트
	    $(".layer-popup a").click(function() {
	        event.preventDefault();
	        const checked = $(this).prev().find("input:checkbox").prop("checked");
	        console.log(checked);
	        if(checked) {
	            $.cookie('layer', 'yes', {expires: 1});
	        }
	        $(".layer-popup").hide();
	    });
	    setTimeout(() => {
			$(".wrap-loading").addClass("d-none");
		}, 1000);
	    
    </script>
</body>
</html>