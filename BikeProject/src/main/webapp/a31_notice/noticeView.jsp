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
<title>공지사항 상세</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	img {
		max-width: 100%;
	}
	#title {
    	padding: 50px 0 40px 0;
	}
	#top {
		padding-bottom: 32px;
	    width: 1140px;
	    margin: 0 auto;
	    border-bottom: 1px solid rgb(234, 235, 238);
	}
	#notice_date {
		font-size: 15px;
	    margin-top: 10px;
	    margin-bottom: 0px;
	    color: rgb(134, 142, 150);
	}
	#content {
		padding: 32px 0;
	    width: 1140px;
	    margin: 0 auto;
	    border-bottom: 1px solid rgb(234, 235, 238);
	}
	#bottom {
		margin: 0 auto;
	    margin-top: 20px;
	    padding-bottom: 55px;
	    text-align: center;
	}
	#bottom button {
		width: 12%;
		height: 40px;
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
		<%-- 
		
		--%>	
		$("#listBtn").click(function(){
			location.href="${path}/noticeList.do"			
		});
		$("#delBtn").click(function(){
			
		});
		$("#uptBtn").click(function(){
			
		});
	});
</script>
</head>

<body>	
	<jsp:include page="/a00_main/a00_header.jsp"/>

	<div class="container">
		<div id="title" class="text-left">
		  <h2>공지사항</h2>
		</div>
		
		<section id="top">	
			<h3 id="notice_title" style="margin:0px;">${notice.title}</h3>
			<p id="notice_date"><fmt:formatDate value="${notice.writedate}"/></p>
		</section> <!-- top -->
		
		<section id="content">
			<div>
				<p>
				${notice.content}
				<img src="${path}/b01_img/${notice.imgfile}" alt=""/> <!-- 첨부파일 경로 -->
				</p>
			</div>
		</section> <!-- content -->
		
		<section id="bottom">
	    	<button id="delBtn" class="btn btn-outline-danger" type="button">삭제</button>
	    	<button id="uptBtn" class="btn btn-outline-success" type="button">수정</button>
	    	<button id="listBtn" class="btn btn-success" type="button">목록</button>
		</section> <!-- bottom -->
	</div>
	
	<jsp:include page="/a00_main/a08_footer.jsp"/>
</body>
</html>