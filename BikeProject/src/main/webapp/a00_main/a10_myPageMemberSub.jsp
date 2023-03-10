<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%-- 
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >--%>
<style>
	#mypageCommonHr{
		margin-top:1%;
	}
	#idposition{
		margin-top:2%;
		margin-left:2%;
	}
	#greyBox{
		background: rgb(128, 138, 146);
		opacity: 0.8;
		width:100%;
		height:70px;
		margin-top:1%;
		position:absolute;
		left:0%;
	}
	#greyBox .MypageMenu{
		margin-top:0%;
		height:85%;
		width:220px;
		height:100%;
		text-align:center;
		color:white;
	}
	#greyBox #userInfoBox{
		margin-left:20%;
	}
	#greyBox #payManagerBox{
		margin-left:40%;
		position:absolute;
		top:0%;
	}
	#greyBox #useInfoBox{
		margin-left:60%;
		position:absolute;
		top:0%;
	}
	.Mypagehr{
		border:solid 3px green;
		width:90%;
	}
	#payManagerCommonTab{
		backgroung:white;
		border:2px solid #001b31;
		color:#001b31;
		width:80%;
		margin-left:10%;
		margin-top:12%;
		margin-bottom:5%;
		font-weight: bolder;
	}
	#payManagerCommonTab td{
		border:2px solid #001b31;
		width:25%;
		text-align:center;
		height:50px;
	}
	#payManagerCommonTab td:hover{
		background:#001b31;
		color:white;
	}
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var loginId = '${loginId}'
		$("#idposition").text(loginId+"님")
		
		var hrPosition01 = document.querySelector("#hrposition01")
		var hrPosition02 = document.querySelector("#hrposition02")
		var hrPosition03 = document.querySelector("#hrposition03")
		
		$(".MypageMenu").click(function(){
			hrPosition01.innerHTML =""
			hrPosition02.innerHTML =""
			hrPosition03.innerHTML =""
			$(".MypageMenu").css({"background":"","color":""})
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon.png");
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon.png");
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon.png");
			var clickMenu = ""
			
			$(this).css({"background":"white","color":"green"})
			if($(this).attr("value")=="회원정보"){
				$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon(click).png");
				hrPosition01.innerHTML = "<hr class='Mypagehr'>"
				location.href="${path}/a00_main/a04_updateInfo.jsp"
				
			}else if($(this).attr("value")=="결제관리"){
				$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon(click).png");
				hrPosition02.innerHTML = "<hr class='Mypagehr'>"
				location.href="${path}/a41_PayManager/getPayMethod.jsp"
			}else{
				$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon(click).png");
				hrPosition03.innerHTML = "<hr class='Mypagehr'>"
				location.href=""
			}
		}) 
		
		
		$("#payManagerCommonTab td").click(function(){
			$("#payManagerCommonTab td").css({"background":"","color":""})
			$(this).css({"background":"#001b31","color":"white"})	
		})
		
		$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon(click).png");
		document.querySelector("#hrposition01").innerHTML = "<hr class='Mypagehr'>"
		$("#userInfoBox").css({"background":"white","color":"green"})
	});
</script>
</head>

<body>
	<div id="idposition">test님</div><!-- 로그인한 아이디 출력 -->
	<box id="greyBox">
		<div id="userInfoBox" class="MypageMenu" value="회원정보">
			<img id="iconID01" src="${path}\b01_img\userInfoManagerIcon.png"><br>
			회원정보 관리
			<div id="hrposition01" class="hrPosition"></div>
		</div>
		<div id="payManagerBox" class="MypageMenu" value="결제관리">
			<img id="iconID02" src="${path}\b01_img\payInfoManagerIcon.png"><br>
			결제 관리
			<div id="hrposition02" class="hrPosition"></div>
		</div>
		<div id="useInfoBox" class="MypageMenu" value="이용정보관리">
			<img id="iconID03" src="${path}\b01_img\useInfoManagerIcon.png"><br>
			이용정보 관리
			<div id="hrposition03" class="hrPosition"></div>
		</div>
	</box>
	
	<table id="payManagerCommonTab">
		<tr>
			<td id="payhistory" onclick="location.href='${path}/myPage.do'">개인정보 수정</td>
			<td id="addPay" onclick="location.href='${path}/withdrawal.do'">회원 탈퇴</td>
			<td id="getPayMethod" onclick="location.href='${path}/rank.do'">부릉이 이용랭킹</td>
			<td id="qnaHistory" onclick="location.href='${path}/qnaList.do'">상담내역</td>
			
		</tr>
	</table>
</body>
</html>