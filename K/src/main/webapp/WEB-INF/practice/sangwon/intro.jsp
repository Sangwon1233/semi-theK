<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <title>intro</title>
 
  <style>
      body  {
        /* overflow: hidden; */
      }
      video{
        width: 100%;
        height: 100vh;
        object-fit: fill;
      }
      .class-box{
        position: absolute;
        right: 15%;
        top: 30%;
        z-index: 0;
        width: 20%;
      }
       .login-box{
        margin-bottom: 20%;
        text-align: center;    
      } 
      s
      
  </style>
</head>
  <body>
      <div>  
        <video src="k_1.mp4" muted autoplay playsinline></video>
        <div class="class-box text-center">
          <p class="fs-1"style="color: #fff;">한국 여행 어디든</p>
          <!-- <form name="frm"> -->
            <div>
              <button class="login-box btn btn-light w-75">로그인</button>
            </div>
            <div> 
              <!-- <button id="signup" class="signup-box btn btn-light w-75" data-bs-toggle="modal" data-bs-target="#exampleModal">회원가입</button> -->
              <button type="button" id="signup" class="signup-box btn btn-light w-75" data-bs-toggle="modal" data-bs-target="#exampleModal">
                회원가입
              </button>
            </div>
          <!-- </form> -->
        </div>  
      </div>


      <div class="bg-color-test" id="signupcolor" style="width: 100%; height: 100vh; background-color: rgb(155, 156, 156);opacity: 0.5; z-index: 100; position:absolute; top:0;left: 0;"></div>
  




      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top :10%;">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #000;">
                <div class="modal-header">
                    <img src="-2024-11-14--7.59.32.jpg"width="50%";style=text-align:center; >
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close btn btn-light" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                    <div class="modal-body">
                        <input type="email" class="form-control my-3" id="email" placeholder="사용 할 이메일" name="email">
                        <input type="text" class="form-control my-3" id="number" placeholder="인증번호" name="num"><button class="btn btn-primary">인증번호 발송</button>
                        <input type="email" class="form-control my-3" id="email" placeholder="이메일 인증" name="email">
                        <input type="password" class="form-control my-3" id="email" placeholder="비밀번호" name="pwd">
                        <input type="password" class="form-control my-3" id="email" placeholder="비밀번호 확인" name="pwd">
                        <input type="text" class="form-control my-3" id="name" placeholder="닉네임" name="name">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark">가입하기</button>
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
                    </div>
            </div>
        </div>
    </div>


      <script>
        $("#signup").click(function(){
            $("signupcolor").click(function(){   
                $("signupcolor").css("backgroundColor",'#8c8c8c');
            });
        });
      </script>
  </body>
  
</html>