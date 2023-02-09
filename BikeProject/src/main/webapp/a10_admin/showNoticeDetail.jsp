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
<style>
	td{text-align:center;}
	.container{
		margin-bottom: 10%;
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
		$("#listBtn").click(function(){
			location.href="${path}/adminNoticeList.do"			
		});
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#delFrm").submit()
			}
		});
		$("#uptBtn").click(function(){
			
		});
		
		var msg="${msg}"
		if(msg!=''){
			alert(msg)
		}
	});
</script>
</head>

<body>
	<div class="container">
		<jsp:include page="/a10_admin/admin_header.jsp"/>
	
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
				<img src="${path }/z01_upload/${notice.imgfile}" alt=""/> <!-- 첨부파일 경로 -->
				 
				</p>
			</div>
		</section> <!-- content -->
		
		<form id="delFrm" method="post" action="${path }/delNotice.do"> <!-- 삭제 하기 위해서 notice 번호 넘기기 -->
		<input type="hidden" name="noticeno" value="${notice.noticeno }">
		</form>
		<section id="bottom">
	    	<button id="delBtn" class="btn btn-outline-danger" type="button">삭제</button>
	    	<button id="uptBtn" class="btn btn-outline-success" type="button">수정</button>
	    	<button id="listBtn" class="btn btn-success" type="button">목록</button>
		</section> <!-- bottom -->
	</div>
	
	<jsp:include page="/a00_main/a08_footer.jsp"/>
</body>
</html>