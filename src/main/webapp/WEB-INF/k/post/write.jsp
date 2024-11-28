<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"/>
	</head>
	<body class="d-flex flex-column min-vh-100 gothic-a1-regular ">
		<div class="wrap">
			<jsp:include page="../common/header.jsp"/>
			<main class="mb-5 container">
				<form method="post">
					<div class="input-group container m-2">
						<span class="input-group-text">제목</span>
						<input type="text" class="form-control" placeholder="input title here" name="title" id="post-title">
					</div>
					<select class="form-select text-white">
					    <c:forEach items="${categories}" var="cate">
					        <option value="${cate.cname}" class="text-white post-cate">
					    </c:forEach>
					</select>
					<div>
						<jsp:include page="../common/writer.jsp"/>
					</div>
					<div class="p-3 container">
						<div class="input-group container m-2">
							<span class="input-group-text">태그</span>
							<input type="text" class="form-control" placeholder="예시 = #소통해요" name="tag" id="post-tag">
						</div>
						<div class="input-group container m-2">
							<span class="input-group-text">작성자</span>
							<input type="text" class="form-control" value="${userId}" name="writer" id="post-writer">
						</div>
					</div>
					<button type="button" class="btn btn-outline-secondary mt-2 post-button">작성하기</button>
				</form>
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
	<script>
		$(".post-button").click(function(){
			// console.log(${cno});
			// const url = "list/post/write?cno=" + ${cno};
			const myTitle = $("#post-title").val();
			const myContent = $("#editor .ql-editor").html();
			const myId = $("#post-writer").val(); 
			const myCate = 
				switch($(".post-cate").val()){
				case "자유" :
					myCate = 5;
					break;
				case "모임" :
					myCate = 6;
					break;
				case "기타메뉴" :
					myCate = 8;
					break;
				case "정보" :
					myCate = 11;
					break;
				case "지역" :
					myCate = 12;
					break;
				default :
					console.log("no matches for cate");
					console.alert("SYS :: ERR");
			}
			console.log(myTitle);
			console.log(myContent);
			console.log(myId);
			console.log(myCate);
			const data = {"title" : myTitle , "content" : myContent, "userId" : myId, "cno" : myCate};
            $.ajax({
                url: "${cp}post/write",
                type: "post",
                contentType: "application/json; charse=utf-8",
                data: JSON.stringify(data),
                success: function (res) {
                    if (res=='success') {
                        alert("적용 되었습니다.");
                    } else {
                        alert("적용 실패하였습니다");
                    }
                },
                error: function () {
                    alert("서버에서 오류가 발생했습니다.");
                }
            });
		})
	</script>
</html>