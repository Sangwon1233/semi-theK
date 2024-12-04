<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
		 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular ">
		<div class="wrap">
			<main class="">
				<jsp:include page="../common/header.jsp"/>
				<hr class="mb-5">
				
				<!-- 여기를 수정하면 됨 -->
				 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
				<body class="card-body d-flex flex-column justify-content-center align-items-center vh-100">
		   		 <div class="container text-left"> <!-- text-left로 변경하여 왼쪽 정렬 -->
		        <!-- 검색 입력창 -->
		      <div class="container mt-3">
				  <div class="card">
				    <div class="card-body">Search About Us</div>
				  </div>
				</div>
		       <hr>
		        <div class="col-md-5 content mx-5">
		            <h2>세계에 K의 바람이 불고 있다.</h2>	
		            <div>the-k에 따르면 작년 한 해 동안 독자들의 호응과 관심을 가장 많이 받은 이야기는 'the-k 입점 후 주문 폭발로 행복한 고민 중’이라는 도곡시장 전라도 사장님의 인터뷰인 것으로 확인됐다.</div>
					<p>인터뷰에는 코로나로 인해 발길이 뜸해진 악조건 속에서 the-k 입점 후 배달로만 월 1500만원의 매출을 내게 된 사장님의 성공 스토리를 담아냈다.</p>
		             
		           		<div class="support mt-5">
		                <!-- 지원 항목 -->
		                 <div class="container mt-3">
						  <div class="card">
						    <div class="card-body">Support US with,,</div>
						  </div>
						</div> 
		                <!-- PayPal -->
		               	<div class="col-md-12">
			                <div class="col-md-12 d-flex align-items-center mb-3">
			                  <img src="${cp}/files/common/paypal.png"
			                  style="width: 100px; height: 100px">
		                   	 <h3><span class="col-md-5">Support us with PayPal</span></h3>
		                </div>
		              </div>  
		                <div class="mb-4">
		                    <span>the-k 관계자는 “사업에 대한 소식은 물론, 그냥 지나쳐 버릴 수도 있는 파트너와 직원들의 이야기들도 뉴스룸을 통해 적극적으로 소개하고 있다”며 “2025년 새해에도 the-k에 대한 독자분들의 많은 관심을 부탁드린다”고말했다.</span>
		                </div>
		                
		                <!-- BTC -->
		               <div class="row"> 
		                	<div class="col-md-12 mx-4">
		                		<div class="row">
		                			<div class="col-md-12 d-flex align-items-center mb-1">
			                			<i class="fa-brands fa-btc fa-3x"></i>
			                			<i class="row"></i>
				                			<h4><span class="col-md-10 mx-5 d-flex flex-row-reverse">Support us with BTC</span></h4>
				                				<i class="col-md-2"></i>
			                			<i class="row"></i>
			                				<i class="col-md-12"></i>
			                				<img src="${cp}/files/common/1.png" class="p-2 col-md-5"style="width: 150px; height: 150px" >
			                			<i class="col-md-7"></i>
		                			</div>
								</div>
							</div>
						<div class="row"></div>
						</div>	
		              <p class="mb-5">누구에게나 언제든지 결제가 가능합니다. 이메일 주소 하나로 더욱 쉽고 안전하게 물건이나 서비스 금액을 결제하세요.</p>
		            </div>
		        </div>
		    </div>
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>