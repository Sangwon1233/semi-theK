	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<!DOCTYPE html>
	<html lang="ko" data-bs-theme="dark">
		<head>
			<jsp:include page="../common/head.jsp"/>
		</head>
		<body class="gothic-a1-regular">
			<jsp:include page="../common/header.jsp"/>
			<c:if test="${not empty user}">
				<jsp:include page="../common/idshower.jsp"/>
			</c:if>
			<div class="wrap">
				<main class="mb-5 container">
					<form method="post">
						<div class="input-group">
							<span class="input-group-text">제목</span>
							<input type="text" class="form-control" placeholder="input title here" name="title" id="post-title">
						</div>
						<select class="form-select form-select-sm text-white bg-secondary my-3 border-light" name="cat" id="cate-select">
						    <c:forEach items="${categories}" var="cate">
						        <option value="${cate.cno}" class="post-cate border-light" ${urlCno == cate.cno ? "selected" : "" }>${cate.cname}</option>
						    </c:forEach>
						    	<option value="${promotion.cno}" class="post-cate" ${urlCno == promotion.cno? "selected":""}>${promotion.cname}</option>
						</select>
						<div class="my-target">
							<jsp:include page="../common/writer.jsp"/>
						</div>
						<div class="my-target-promo d-none">
							<textarea class="form-control" rows="5" id="comment" name="text">일반</textarea>
							<input type="file" id="files" name="files" accept="image/png, image/jpeg, image/gif">
							<div id="preview"></div>
						</div>
						<div class="p-3 container">
							<div class="input-group container m-2">
								<span class="input-group-text">태그</span>
								<input type="text" class="form-control" placeholder="예시 #소통해요" name="tag" id="post-tag">
							</div>
							<div class="input-group container m-2">
								<span class="input-group-text">작성자</span>
								<input type="text" class="form-control" value="${user.id}" name="writer" id="post-writer" disabled>
								<div id="preview">
			            		</div>
							</div>
						</div>
						<button type="button" class="btn btn-outline-secondary mt-2 post-button">작성하기</button>
					</form>
				</main>
				<jsp:include page="../common/footer.jsp"/>
			</div>
		</body>
	<script>
	    $(function() {
			let val = ${promotion.cno}; // 프로모션 게시판 cno
			if(${urlCno == 3}){
				$('.my-target').addClass('d-none');
				$('.my-target-promo').removeClass('d-none');
			}
	        
	        $("#cate-select").change(function() {
	            if (val != $(this).val()) { // 일반 quill 사용시
	                $('.my-target-promo').hasClass('d-none') ? '' : $('.my-target-promo').addClass('d-none');
	                $('.my-target').hasClass('d-none') ?  $('.my-target').removeClass('d-none') : '' ;
	            }else{ // 프로모션 전용 업로드 사용시
	            	$('.my-target-promo').hasClass('d-none') ? $('.my-target-promo').removeClass('d-none') : '';
	                $('.my-target').hasClass('d-none') ?  '' : $('.my-target').addClass('d-none');
	            }
	        });

			const attachs = [];
			
            function previewFiles() {
                const preview = document.querySelector("#preview");
                const files = document.querySelector("input[type=file]").files;

            function readAndPreview(file) {
                if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
                const reader = new FileReader();

                reader.addEventListener("load",() => {
                    const image = new Image();
                    image.height = 100;
                    image.title = file.name;
                    image.src = reader.result;
                    attachs.push({base64:reader.result});
                    preview.appendChild(image);
                });

                reader.readAsDataURL(file);
                }
            }

                if (files) {
                    Array.prototype.forEach.call(files, readAndPreview);
                }
                //let obj = {content, title, writer, attachs};
                //console.log(obj);
            }

            const picker = document.querySelector("#files");
            picker.addEventListener("change", previewFiles);
            
			$(".post-button").click(function(){
				
				const myCate = $("select[name=cat]").val();
				
				//console.log(myTitle);
				//console.log(myContent);
				//console.log(myId);
				//console.log(myCate);
				
				if(myCate != 3){
					const myTitle = $("#post-title").val();
					const myContent = $("#editor .ql-editor").html();
					const myId = $("#post-writer").val(); 
					 
					
					const data = {"title" : myTitle , "content" : myContent, "userId" : myId, "cno" : myCate};
		            $.ajax({
		                url: "${cp}post/write",
		                type: "post",
		                contentType: "application/json; charse=utf-8",
		                data: JSON.stringify(data),
		                success: function (res) {
		                	console.log(res);
		                    if (res == "success") {
		                        alert("적용 되었습니다. 작성된 게시판을 확인해 보세요!");
		                		const url = "${cp}list?cno="+myCate;
		                		window.location.href= url;
		                    } else {
		                        alert("적용 실패하였습니다");
		                    }
		                },
		                error: function () {
		                    alert("서버에서 오류가 발생했습니다.");
		                }
		            });
				}else{
					const myTitle = $("#post-title").val();
					const myContent = $("#comment").val();
					const myId = $("#post-writer").val(); 
					if(attachs[0] == null){
						alert("다른 사용자들을 위해서, 프로모션을 대표하는 이미지를 첨부해 주세요.")
					}
					const data = {"title" : myTitle , "content" : myContent, "userId" : myId, "cno" : myCate, "imgData" : attachs[0]["base64"]};
					console.log(data);
		            $.ajax({
		                url: "${cp}post/write",
		                type: "post",
		                contentType: "application/json; charse=utf-8",
		                data: JSON.stringify(data),
		                success: function (res) {
		                	console.log(res);
		                    if (res == "success") {
		                        alert("적용 되었습니다. 작성된 게시판을 확인해 보세요!");
		                		const url = "${cp}promotion?cno="+myCate;
		                		window.location.href= url;
		                    } else {
		                        alert("적용 실패하였습니다");
		                    }
		                },
		                error: function () {
		                    alert("서버에서 오류가 발생했습니다.");
		                }
		            });
				}
			})
        });
	</script>
	
	</html>