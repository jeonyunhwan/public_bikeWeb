<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="javax.mail.Session"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
h3{
	display: inline-block;
	font-size: 1.2rem;
	font-weight: bold;
}
.myinfo{
	display: flex;
	align-items: center;
	justify-content: center;
}
.myinfo h3{
	padding-left: 10%;
	padding-right: 10%;
}
#weekBtn, #monthBtn{
	border: none !important;
	background: none !important;
	padding: 0;
}
.ranktxt{
	background: #dcdcdc;
	font-size: 0.7rem;
}
.ranktab{
	border: #d2d2d2 solid 1px;
	text-align: center;
	background: white;
	font-size: 0.7rem;
}
.ranktab tbody tr:hover{
	background: #dcdcdc;
}
.ranktab th{
	background: #31ab7c;
	color:white;
	font-size: 0.8rem !important;
} 
.ranktab td,.ranktab th {
	border: #d2d2d2 solid 1px;
	padding-top: 1%;
	padding-bottom: 1%;
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
		
		$("#weekBtn").click(function(){
			location.href="${path}/rank.do"
		})
		$("#monthBtn").click(function(){
			location.href="${path}/rankM.do"
		})
		$("#payManagerCommonTab td").eq(2).css({"background":"#001b31","color":"white"})
		
		if(loginId!=''){
			$("#weekBtn").trigger('click')
			return
		}
		
		
		
	
		
	});
	
		
	
</script>
</head>

<body>
<%
String loginId = (String)session.getAttribute("id");
request.setAttribute("loginId", loginId);
%>
<div class="container">

<jsp:include page="${path }/a00_main/a00_header.jsp"></jsp:include>
<jsp:include page="${path }/a00_main/a10_myPageMemberSub.jsp"></jsp:include>
<button id="weekBtn" type="button"><h3>주간</h3></button>&nbsp;&nbsp; <button id="monthBtn" type="button"><h3>월간</h3></button>

<p class="ranktxt">전주 월요일~일요일까지의 이용거리 실적<br>
※ 랭킹서비스 이용거리는 실제 이용거리와 다를 수 있습니다.</p>

<p>나의 랭킹</p>
<hr>
<div class="myinfo">
<c:forEach var="w" items="${weekRank }" varStatus="status">
<c:if test="${w.id== loginId }">
<h3 id="num">${status.count }등</h3>
<h3 id="id">${w.id }</h3>
<h3 id="distance">${w.useDistance }km</h3>
</c:if>
</c:forEach>
</div>
<hr>
<p>전체 랭킹 목록</p>
<table class="ranktab" width="100%" border>
<col width="32%"><col width="32%"><col width="32%">
<thead>
<tr><th>등수</th><th>아이디</th><th>이동거리</th></tr></thead>
<!-- ajax로 불러올 부분 -->
<tbody>
<c:forEach var="w" items="${weekRank}" varStatus="status">
<tr><td id="tabnum">${status.count }</td><td id="tabid">${w.id }</td><td id="tabdistance">${w.useDistance }km</td></tr>
</c:forEach>
</tbody>
</table>
</div>
<br><br><br><br>
<jsp:include page="${path }/a00_main/a08_footer.jsp"></jsp:include>	
</body>
</html>