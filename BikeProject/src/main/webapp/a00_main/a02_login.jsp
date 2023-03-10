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
			if(loginCk==1 && auth=='????????????'){
				location.href="${path}/main.do" // ????????? ??? ?????????????????? ??????
				
			}else if(loginCk==1 && auth=='?????????'){
				location.href="${path}/adminMain.do" //????????? ?????? ???????????? ???????????????
			}
			else{
				swal("???????????? ??????????????? ??????????????????");
				
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
             scope: 'profile_nickname, account_email', //???????????? ???????????? ?????? ???????????? ?????? ???????????? ???????????? ID?????? ????????????.
             success: function(response) {
                 console.log(response) // ????????? ???????????? ???????????? ?????????
                 window.Kakao.API.request({ // ????????? ?????? ???????????? 
                     url: '/v2/user/me',
                     success: (res) => {
                         const kakao_account = res.kakao_account;
                         console.log(kakao_account)
                         console.log(kakao_account.profile.nickname)
                         kakaoNickname = kakao_account.profile.nickname
                         console.log(kakao_account.email)
                     }
                 });
                 // window.location.href='/a00_main/a01_main.jsp' //??????????????? ?????? ??????
                 // db??? ?????? id -> kakao_account.email ??? ????????? / name -> kakao_account.profile.nickname
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
		    		//callback(); //????????????(??????)????????? ???????????? ????????? ??????
		    		//window.location.href='/'
		    	},
		    	fail: function(error) {
		    		console.log('?????? ?????????')
		    		console.log(error);
		    		console.log(kakaoNickname)
		    	},
			});
		};
	 /*  // ?????????!!!
	 # ???????????? ????????????
	 window.Kakao.init('?????? JAVASCRIPT API ???');
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
	
	#???????????? ?????? ??????
	function secession() {
		Kakao.API.request({
	    	url: '/v1/user/unlink',
	    	success: function(response) {
	    		console.log(response);
	    		//callback(); //????????????(??????)????????? ???????????? ????????? ??????
	    		window.location.href='/'
	    	},
	    	fail: function(error) {
	    		console.log('?????? ?????????')
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
	    	<input class="form-control" name="id" type="text" placeholder="?????????" aria-label="default input example">
	    	<input class="form-control" name="pass" type="password" placeholder="????????????" aria-label="default input example">
	    	<input type="checkbox" name="rememberId" id="flexCheckDefault">
			<label class="form-check-label" for="flexCheckDefault">????????? ?????? ??????</label><br>
			<button type="button" id="logBtn" class="btn btn-success">?????????</button><br>
			<a class="join" href="${path}/a00_main/a03_signup.jsp">????????????</a>
			<a class="find" href="#">?????????/???????????? ??????</a><br>
			<span class="snslogin">sns ?????????</span><br>
			<button type="button" id="kakaoBtn" class="kakao"><img class="kakaoImg" src="${path }/b01_img/kakao.png" width="30px"></button>
			<button type="button" class="naver"><img class="naverImg" src="${path }/b01_img/naver.png" width="30px"></button>
			<button type="button" class="btn btn-secondary">?????????</button>
				  
	    </form>
	 </div>
	 
</body>
</html>