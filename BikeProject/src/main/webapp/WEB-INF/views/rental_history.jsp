<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
.align-self-center{
	margin: 0 5px 0px 5px;
}
/*
#header, #navbar{
	padding : 0 10% 0 10%;
}*/
.nav-item{
	margin-left: 5px;
	font-weight: bolder;
}
.headertext{
	font-size: 0.8rem;
	margin-left: 3px;
}
.headertext, .headertext:active, .nav-link, .nav-link:active{
	padding-left: 5px;
	color:black;
	text-decoration: none;
}
.headertext:hover, .nav-link:hover{
	color:gray;
	text-decoration: none;
}
.navbar-collapse{
	width:1000%
}
hr{
	width:100%;
	margin-top: 5px;
	margin-bottom: 2px;
}
.col-4{
	text-align: right;
}
.loginheader{ /*로그인 했을 때 메뉴 숨겨놓기*/
	display: none;
}
#idposition{
		margin-top:1%;
		margin-left:2%;
	}
	#greyBox{
		background: rgb(122, 127, 130);
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
	}
	#content{
            background-color: white;
            height: 80px;
        }
        #useBoxIndex{
            background-color: fff;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        #HistoryBox1{
            margin:0.5px;
            width: 20%;
            height:40px;
            background-color: rgb(10, 10, 49);
            border: 1px solid black;
            text-align: center;
            cursor:pointer;
        }
        #HistoryBox2{
            margin:0.5px;
            width: 20%;
            background-color: fff;
            border: 1px solid black;
            text-align: center;
            cursor:pointer;
        }
        #HistoryBox3{
            margin:0.5px;
            width: 20%;
            background-color: fff;
            border: 1px solid black;
            text-align: center;
            cursor:pointer;
        }
        #HistoryBox4{
            margin:0.5px;
            width: 20%;
            background-color: fff;
            border: 1px solid black;
            text-align: center;
            cursor:pointer;
        }
        #HistoryBox1>h2{
            color:white;
            font-size:18px;
            margin-top:6px;
        }
        #HistoryBox2>h2{
            color:rgb(6, 6, 54);
            font-size:18px;
            margin-top:6px;
        }
        #HistoryBox3>h2{
            color:rgb(6, 6, 54);
            font-size:18px;
            margin-top:6px;
        }
        #HistoryBox4>h2{
            color:rgb(6, 6, 54);
            font-size:18px;
            margin-top:6px;
        }
        #schBox{
            border-top: 0.5px solid rgb(86, 85, 85);
            border-bottom: 0.5px solid rgb(86, 85, 85);
            background-color: white;
            width: 100%;
            height: 60px;
            justify-content:center;
        }
        #dateContent{
            display: flex;
            justify-content:center;
            align-items: center;
        }
        .dateButton{
            margin-top: 13px;
            width: 70px;
            margin-left: 20px;
            height: 30px;
            border-radius: 2px;
            border: 2px solid black;
            text-align: center;
            cursor: pointer;
        }
        .dateButton>b{
            font-size: 13px;
        }
        #dateInput{
            margin-left: 20px;
            margin-top: 20px;
            color: bisque;
            width: 350px;
            height: 30px;
        }
        #dateInput>input{
            width: 150px;
            height: 20px;
        }
        #dtButton>button{
            margin-top: 10px;
            cursor: pointer;
            width:80px;
            height:40px;
            border: 0 solid rgb(7, 7, 44);
            background-color: rgb(7, 7, 44);
            color: white;
        }
        p{
            font-size: 12px;
        }
        #dataCalContent{
            border-bottom: 0.5px solid rgb(86, 85, 85);
            height: 110px;
            display: flex;
            justify-content:space-around;
            width: 100%;
        }
        #dataCalContent>.dataContent>p{
            font-size: 20px;
            color:rgb(145, 143, 143);
        }
        #dataCalContent>.dataContent>b{
            font-size: 20px;
            margin-left: 50px;
        }
        #dataCalContent>.dataContent>#show{
            font-size: 20px;
            margin-left: 90px;
        }
        #dataContent1{
            display: flex;
            border-bottom: 0.5px solid rgb(86, 85, 85);
            justify-content:space-around;
            height: 40px;
            background-color: gainsboro;
            text-align: center;
        }
        #dataContent1>.cont>b{
            text-align: center;
            line-height:2.5; 
        }
        #dataContent2{
            display: flex;
            justify-content:space-around;
            height: 30px;
            background-color: white;
            text-align: center;
           
        }
        #dataContent2>.cont>p{
            font-size: 12px;
            padding-right: 5px;
        }
        #contIndex{
            width:100%;
            height:220px;
            border-bottom:0.1px solid rgb(86, 85, 85);
            
        } #paging{
            margin-top:30px;
            display: flex;
            height:20px;
            justify-content: space-around;
            
        }
        /* pagination position styling */
  .pagination_section {
    display: flex;
    justify-content: center;
  }
 
  /* pagination styling */
  .pagination_section a {
    color: black;
    padding: 10px 18px;
    text-decoration: none;
  }
 
  /* pagination hover effect on non-active */
  .pagination_section a:hover:not(.active) {
    background-color: #031F3B;
    color: white;
  }
 
  /* pagination hover effect on active*/
 
  a:nth-child(5) {
    background-color: green;
    color: white;
  }
 
  a:nth-child(1) {
    font-weight: bold;
  }
 
  a:nth-child(7) {
    font-weight: bold;
  }
        #floor{
            width:100%;
            height:100px; 
        }
        .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      #footer {
      	background-color: #ededed;
      }
      
      #footer_info h6 {
      	font-weight: bold;
      }
      
      #footer_copyright {
      	font-size: 0.9rem;
      }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
	});
</script>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#useInfoBox").css({"background":"white","color":"green"})
		
		$("#userInfoBox").click(function(){
			$(this).css({"background":"white","color":"green"})
			document.querySelector("#hrposition01").innerHTML = "<hr class='Mypagehr'>"
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon(click).png");
			
			$("#payManagerBox").css({"background":"","color":""})
			document.querySelector("#hrposition02").innerHTML = ""
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon.png");
			
			$("#useInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition03").innerHTML = ""
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon.png");
		})
		
		$("#payManagerBox").click(function(){
			$(this).css({"background":"white","color":"green"})
			document.querySelector("#hrposition02").innerHTML = "<hr class='Mypagehr'>"
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon(click).png");
			
			$("#userInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition01").innerHTML = ""
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon.png");
			
			$("#useInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition03").innerHTML = ""
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon.png");
		})
		
		$("#useInfoBox").click(function(){
			$(this).css({"background":"white","color":"green"})
			document.querySelector("#hrposition03").innerHTML = "<hr class='Mypagehr'>"
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon(click).png");
			
			$("#userInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition01").innerHTML = ""
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon.png");
			
			$("#payManagerBox").css({"background":"","color":""})
			document.querySelector("#hrposition02").innerHTML = ""
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon.png");
		})
		
	});
</script>
<html>
<head >

</head>
<body>

<div id="header" class="row">
 <div class="col-8"></div>
 <div class="col-4"><a class="headertext noneheader" href="#">로그인</a> <a class="headertext noneheader" href="#">회원가입</a>
 	<a class="headertext loginheader" href="#">마이페이지</a><a class="headertext loginheader" href="#">로그아웃</a><a class="headertext" href="#">알림</a>
 </div>
</div>

<hr>
<nav id="navbar" class="navbar navbar-expand-sm">
    <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="${path }/b01_img/logo.png" width="50%"/></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
        <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">사업소개</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">대여소 조회</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">이용권 구매</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">문의/FAQ</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">공지사항</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">안전수칙</a>
        </li>
        </ul>
    </div>
    </div>
 
</nav>
<div id = floor>
<div id="idposition">test님</div><!-- 로그인한 아이디 출력 -->
	<box id="greyBox">
		<div id="userInfoBox" class="MypageMenu">
			<img id="iconID01" src="${path}\b01_img\userInfoManagerIcon.png"><br>
			회원정보 관리
			<div id="hrposition01"></div>
		</div>
		<div id="payManagerBox" class="MypageMenu">
			<img id="iconID02" src="${path}\b01_img\payInfoManagerIcon.png"><br>
			결제 관리
			<div id="hrposition02"></div>
		</div>
		<div id="useInfoBox" class="MypageMenu">
			<img id="iconID03" src="${path}\b01_img\useInfoManagerIcon(click).png"><br>
			이용정보 관리
			<div id="hrposition03"><hr class="Mypagehr"></div>
		</div>
	</box>
	</div>
<div id = "content">
    <div id = "useBoxIndex">
    <div id ="HistoryBox1">
        <h2>대여/반납이력</h2>
    </div>
    <div id = "HistoryBox2">
        <h2>이용권 내역</h2>
    </div>
    <div id = "HistoryBox3">
        <h2>환승마일리지 적립내역</h2>
    </div>
    <div id = "HistoryBox4">
        <h2>따릉이 이용 랭킹</h2>
    </div>
    </div>
</div>
<p>날짜별로 대여, 반납이력을 검색하실 수 있습니다.</p>
<div id = "schBox">
<div id = "dateContent">
<div id = "col1" class = "dateButton">
    <b>일주일</b>
</div>
<div id = "col2" class = "dateButton">
    <b>1개월</b>
</div>
<div id = "col3" class = "dateButton">
    <b>3개월</b>
</div>
<div id = "col4" class = "dateButton">
    <b>6개월</b>
</div>
<div id = "dateInput">
<input id="fromDate" type="date"> ~
<input id="toDate" type="date">
</div>
<div id = "dtButton">
    <button id ="search">검색</button>
</div>
</div>
</div>
<div id = "dataCalContent">
<div class = "dataContent">
    <p>이용시간</p>
    <b id = "c1">분</b>
</div>
<div class = "dataContent">
    <p>거리(km)</p>
    <b id = "c2">km</b>
</div>
<div class = "dataContent">
    <p>칼로리</p>
    <b id = "c3">kal</b>
</div>
<div class = "dataContent">
    <p>탄소 절감 효과(kg)</p>
    <b class ="c4" id = "show">kg</b>
</div>
</div>
<div id = "dataContent1">
    <div class = "cont">
        <b>자전거</b>
    </div>
    <div class = "cont">
        <b>대여일시</b>
    </div>
    <div class = "cont">
        <b>대여소</b>
    </div>
    <div class = "cont">
        <b>반납일시</b>
    </div>
    <div class = "cont">
        <b>반납대여소</b>
    </div>
</div>

<div id = contIndex>
<c:forEach var = "r" items = "${rentalInfo}">
<div id = dataContent2>
    <div class="cont">
        <p>${r.bikeNo }</p>
    </div>
    <div class="cont">
        <p><fmt:formatDate value="${r.rentalTime}"/></p>
    </div>
    <div class="cont">
        <p>${r.startPlaceName }</p>
    </div>
    <div class="cont">
        <p><fmt:formatDate value="${r.returnTime}"/></p>
    </div>
    <div class="cont">
        <p>${r.endPlaceName }</p>
    </div>
</div>
</c:forEach>
<div id = "paging">
<div style= "display:block; text-align: center;">
<div class="pagination_section">
<c:if test="${paging.startPage != 1 }">
			<a href="/BikeProject/rental.do?id=${RentalVo.id}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/BikeProject/rental.do?id=${RentalVo.id}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/BikeProject/rental.do?id=${RentalVo.id}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
</div>
</div>
</div>
</div>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
  <symbol id="facebook" viewBox="0 0 16 16">
    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
  </symbol>
  <symbol id="instagram" viewBox="0 0 16 16">
      <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
  </symbol>
  <symbol id="twitter" viewBox="0 0 16 16">
    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
  </symbol>
</svg>

<div id="footer" class="container">
  <footer class="py-5">
    <div id="footer_info" class="row">
      <div class="col mb-3">
        <h6>이용약관</h6>
      </div>

      <div class="col mb-3">
        <h6>개인정보처리방침</h6>
      </div>

      <div class="col mb-3">
        <h6>보험안내</h6>
      </div>

    <div class="col mb-3">
      <h6>도움주신 분</h6>
    </div>

    <div class="col mb-3">
	    <ul class="nav col-md-6 justify-content-end list-unstyled d-flex">
	      <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
	      <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
	      <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
	    </ul>
      </div>
    </div>

    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 text-muted">
      <p id="footer_copyright">서울특별시 중구 세종대로 110 서울특별시 대표자 오세훈, Tel : 1599-0120 (사업자등록번호 : 104-83-00469) 우편번호 04524<br>
		COPYRIGHT &copy; 2018 bikeseoul All RIGHTS RESERVED.</p>
    </div>
  </footer>
</div>
</body>
<script type="text/javascript">
 
	$(document).ready(function() {
		$("#toDate").val(today());
		$("#fromDate").val(lastWeek());
		var id = 'dnjswn1';
		totalRental(id);
		
		$("#search").click(function(){
			
			emailform($("#toDate").val(),$("#fromDate").val(),id);
		});
		
	
	// 클릭시 데이터 변경 
	$("#col1").click(function(){
		$("#toDate").val(today());
		$("#fromDate").val(lastWeek());
	})
	$("#col2").click(function(){
		$("#toDate").val(today());
		$("#fromDate").val(lastMonth());
	})
	$("#col3").click(function(){
		$("#toDate").val(today());
		$("#fromDate").val(threeMonth());
	})
	$("#col4").click(function(){
		$("#toDate").val(today());
		$("#fromDate").val(sixMonth());
	})
	
});	
	
	//날짜 포매팅 함수 
	function getDateStr(myDate){
		var year = myDate.getFullYear();
		var month = (myDate.getMonth() + 1);
		var day = myDate.getDate();
		
		month = (month < 10) ? "0" + String(month) : month;
		day = (day < 10) ? "0" + String(day) : day;
		
		return  year + '-' + month + '-' + day;
	}	
	
	
	function totalRental(sid){
		$.ajax({
			url: "/BikeProject/rentalAPI.do",
			type:"get",
			data:{
				id:sid
			},
			dataType:"json",
			success: function(data){
	            $("#c1").text(data.InfoData.totalTime+"시간");
	            $("#c2").text(data.InfoData.distance+"km");
	            $("#c3").text(data.InfoData.kal+"kal");
	            $(".c4").text(data.InfoData.coCal+"kg");
	        },
		})
	}
	//날짜 변환 함수 
	function today() {
		  var d = new Date();
		  return getDateStr(d);
		}
	function lastWeek() {
		  var d = new Date();
		  var dayOfMonth = d.getDate();
		  d.setDate(dayOfMonth - 7);
		  return getDateStr(d);
		}
	function lastMonth() {
		  var d = new Date();
		  var monthOfYear = d.getMonth();
		  d.setMonth(monthOfYear - 1);
		  return getDateStr(d);
	}
	function threeMonth() {
		  var d = new Date();
		  var monthOfYear = d.getMonth();
		  d.setMonth(monthOfYear - 3);
		  return getDateStr(d);
	}
	function sixMonth() {
		  var d = new Date();
		  var monthOfYear = d.getMonth();
		  d.setMonth(monthOfYear - 6);
		  return getDateStr(d);
	}
	function emailform(toDate,fromDate,id){
		var frm1 = document.createElement('form');
		frm1.setAttribute('method', 'post');
		frm1.setAttribute('action', '/BikeProject/rental.do');
		var hiddenInput4 = document.createElement('input');
		hiddenInput4.setAttribute('type','hidden');
		hiddenInput4.setAttribute('name','fromDate');
		hiddenInput4.setAttribute('value',toDate);
		frm1.appendChild(hiddenInput4);
		var hiddenInput5 = document.createElement('input');
		hiddenInput5.setAttribute('type','hidden');
		hiddenInput5.setAttribute('name','toDate');
		hiddenInput5.setAttribute('value',fromDate);
		frm1.appendChild(hiddenInput5);
		var hiddenInput6 = document.createElement('input');
		hiddenInput6.setAttribute('type','hidden');
		hiddenInput6.setAttribute('name','id');
		hiddenInput6.setAttribute('value',id);
		frm1.appendChild(hiddenInput6);
		document.body.appendChild(frm1);
		frm1.submit();
	}
</script>
</html>