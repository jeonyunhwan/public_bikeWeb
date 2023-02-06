<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
.logo{
	padding : 5% 2% 5% 2%;
	width: 17rem;
}
.justify-content-center{
	padding: 10px 10px 10px 10px;
}
.btn.btn-success, .btn.btn-secondary{
	width:100%;
	padding: 10px 0 10px 0;
	margin-bottom: 3%;
	margin-top:3%;
	font-weight: bold;
}
.form-check-label{
	padding: 2px 58% 0 0;
}
.join{
	padding-right: 10%;
}
.find{
	padding-left: 10%;
}
.join, .find{
	color: black;
	font-weight: bold;
	font-size: 0.9rem;
	margin-bottom: 100px;
}
.join:hover, .find:hover{
	text-decoration: none;
	color: gray;
}
.kakao, .kakao:focus, .naver, .naver:focus{ 
	background-color: transparent;
	width: 30px;
	height: 30px;
	border: none;
	padding: 0 0 0 0;
	outline: none;
	cursor: pointer;
}
.snslogin{
	color: #c8c8c8;
	font-size: 0.6rem;
	padding-bottom: 5px;
}
.justify-content-center.text-center{
	margin-left: 38%;
	margin-top: 5%;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrapt/vue.js"></script>
<script src="https://developers.google.com/web/ilt.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dis/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$("#logBtn").click(function(){
			login()
		})
		$("#logoImg").click(function(){
			 //secession()
			 location.href="${path}/main.do"
		})
		$("#kakaoBtn").click(function(){
			kakaoLogin()
		})

       window.Kakao.init('28827898e0bd0a6cd41080703c0513bf');

	});
	
	function login(){
		$.ajax({
		url:"${path}/login.do",
		type:"post",
		data:$("#frm").serialize(),
		dataType:"json",
		success:function(data){
			var loginCk = data.loginCk
			var auth = data.auth
			if(loginCk==1 && auth=='일반회원'){
				location.href="${path}/main.do" // 로그인 시 메인화면으로 이동
				
			}else if(loginCk==1 && auth=='관리자'){
				location.href="${path}/adminMain.do" //관리자 메인 화면으로 이동시키기
			}
			else{
				swal("아이디와 비밀번호를 확인해주세요");
				
			}
			
		},
		error:function(err){
			console.log(err)
		}
		})
	}
	
	var kakaoNickname = ""
	 function kakaoLogin() {
         window.Kakao.Auth.login({
             scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
             success: function(response) {
                 console.log(response) // 로그인 성공하면 받아오는 데이터
                 window.Kakao.API.request({ // 사용자 정보 가져오기 
                     url: '/v2/user/me',
                     success: (res) => {
                         const kakao_account = res.kakao_account;
                         console.log(kakao_account)
                         console.log(kakao_account.profile.nickname)
                         kakaoNickname = kakao_account.profile.nickname
                         console.log(kakao_account.email)
                     }
                 });
                 // window.location.href='/a00_main/a01_main.jsp' //리다이렉트 되는 코드
                 // db에 넣기 id -> kakao_account.email 의 앞자리 / name -> kakao_account.profile.nickname
             },
             fail: function(error) {
                 console.log(error);
             }
         });
     }
	 function kakaoLogout() {
	    	if (!Kakao.Auth.getAccessToken()) {
			    console.log('Not logged in.');
			    console.log(kakaoNickname)
			    return;
		    }
		    Kakao.Auth.logout(function(response) {
	    		alert(response +' logout');
	    		 console.log(kakaoNickname)
	    		//window.location.href='/'
		    });
		};
		
		function secession() {
			Kakao.API.request({
		    	url: '/v1/user/unlink',
		    	success: function(response) {
		    		console.log(response);
		    		console.log(kakaoNickname)
		    		//callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
		    		//window.location.href='/'
		    	},
		    	fail: function(error) {
		    		console.log('탈퇴 미완료')
		    		console.log(error);
		    		console.log(kakaoNickname)
		    	},
			});
		};
	 /*  // 안맞아!!!
	 # 카카오톡 로그아웃
	 window.Kakao.init('본인 JAVASCRIPT API 키');
	function kakaoLogout() {
    	if (!Kakao.Auth.getAccessToken()) {
		    console.log('Not logged in.');
		    return;
	    }
	    Kakao.Auth.logout(function(response) {
    		alert(response +' logout');
		    window.location.href='/'
	    });
	};
	
	#카카오톡 연결 끊기
	function secession() {
		Kakao.API.request({
	    	url: '/v1/user/unlink',
	    	success: function(response) {
	    		console.log(response);
	    		//callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
	    		window.location.href='/'
	    	},
	    	fail: function(error) {
	    		console.log('탈퇴 미완료')
	    		console.log(error);
	    	},
		});
	};
	*/

</script>
</head>

<body>
	
	<div class="justify-content-center text-center" style="width: 23rem;">
  	<img id="logoImg" src="${path }/b01_img/logo.png" class="logo" alt="...">
  	<br><br><br><br>
	    <form id="frm">
	    	<input class="form-control" name="id" type="text" placeholder="아이디" aria-label="default input example">
	    	<input class="form-control" name="pass" type="password" placeholder="비밀번호" aria-label="default input example">
	    	<input type="checkbox" name="rememberId" id="flexCheckDefault">
			<label class="form-check-label" for="flexCheckDefault">로그인 상태 유지</label><br>
			<button type="button" id="logBtn" class="btn btn-success">로그인</button><br>
			<a class="join" href="${path}/a00_main/a03_signup.jsp">회원가입</a>
			<a class="find" href="#">아이디/비밀번호 찾기</a><br>
			<span class="snslogin">sns 로그인</span><br>
			<button type="button" id="kakaoBtn" class="kakao"><img class="kakaoImg" src="${path }/b01_img/kakao.png" width="30px"></button>
			<button type="button" class="naver"><img class="naverImg" src="${path }/b01_img/naver.png" width="30px"></button>
			<button type="button" class="btn btn-secondary">비회원</button>
				  
	    </form>
	 </div>
	 
</body>
</html>