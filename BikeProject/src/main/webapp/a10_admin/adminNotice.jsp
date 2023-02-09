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
.fs-1{
	font-size: 2.3rem;
	font-weight: bolder;
	padding: 0 0 0 2.5%;
}
.formdiv{
	padding: 2% 2% 2% 2%;
	border: #c8c8c8 solid 1px;
	border-radius: 5px 5px 5px 5px;
}
.nextbutton{
	width:28%;
	padding: 10px 20px 10px 20px;
	background: #24384a;
	color: white;
	font-size: 0.9rem;
	border: #24384a solid 1px;
	text-align: center;
	margin-left: 0; margin-right: 0;
	font-weight: bold;
}
.input-button{
	display: flex;
	justify-content: center;
	align-items: center;
}
.nextbutton.green{
	border: green solid 1px !important;
	background: green !important;
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
		$("#regBtn").click(function(){
			$("form").submit()
		})	
		var msg = "${msg}"
		if(msg!=''){
			alert(msg)
		}
		$("#backBtn").click(function(){
			location.href="${path}/adminNoticeList.do";
		})
	});
</script>
</head>

<body>
<% 
String loginId =(String)session.getAttribute("id"); // 로그인한 아이디 가져오기
request.setAttribute("mgrid", loginId);
%>
<div class="container">
	<jsp:include page="${path }/a10_admin/admin_header.jsp"></jsp:include>
<p class="fs-1 text-lg-start">공지사항 등록</p><br><br>
<div class="formdiv">
<form action="${path }/insNotice.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="mgrid" value="${mgrid }">
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
  <input name="title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력하세요">
</div>

<div class="form-floating">
  <textarea name = "content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 350px"></textarea>
  <label for="floatingTextarea2">내용을 입력하세요</label>
</div>
<br>
<div class="input-group mb-3">
  <input name="report" type="file" class="form-control" id="inputGroupFile02">
  <label class="input-group-text" for="inputGroupFile02">Upload</label>
</div>
<div class="input-button">
<button id="regBtn" class="nextbutton" type="button" style="margin-top: 1%;">등록</button>
<button id="backBtn" class="nextbutton green" type="button" style="margin-top: 1%;">목록</button>
</div>
</form>
</div>

</div>
</body>
</html>