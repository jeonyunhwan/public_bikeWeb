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
<title>공지사항</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
	button {
	    background-color: #4cab6a;
	    color: white;
	}	
	#title {
    	padding: 50px 0 40px 0;
	}	
	#schBtn {
		margin-right: 10px;
	}
	#table-th {
		background-color: #4cab6a;
	    color: white;
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

		// 관리자 공지사항 등록
		$("#regBtn").click(function(){
			location.href="${path}/insertNotice.do" 
		})
		
	});
	// 공지사항 상세화면
	function goDetail(noticeno){
		location.href="${path}/noticeView.do?noticeno="+noticeno
	}

</script>
</head>

<body>
	<div class="container">
		<jsp:include page="/a00_main/a00_header.jsp"/>
		
		<div id="title" class="text-left">
		  <h2>공지사항</h2>
		</div>
	
		<form id="frm01" class="form-group"  method="post">
	  	<nav class="navbar navbar-expand-sm bg-transparent">
		    <input name="title" value="${sch.title}" class="form-control mr-sm-5" placeholder="검색어를 입력해주세요" />
		    <button id="schBtn" class="btn" type="submit">검색</button>
		    <!-- <button id="regBtn" class="btn btn-outline-success" type="button">등록</button> -->
	 	</nav>
		</form>
	   <table class="table table-hover">
	   	<col width="70%">
	   	<col width="30%">
	    <thead>
	    
	      <tr id="table-th" class="table text-center">
	        <th>제목</th>
	        <th>날짜</th>
	      </tr>
	    </thead>	
	    <tbody id="dyn_tbody">
	    	<c:forEach var="notice" items="${list}">
				<tr onclick="goDetail('${notice.noticeno}')">
					<td>${notice.title}</td>
					<td><fmt:formatDate value="${notice.writedate}"/></td>
				</tr>
	    	</c:forEach>  
	    </tbody>
		</table>  
		  
		<nav aria-label="Page navigation example">		
		  <ul id="dyn_ul" class="pagination" style="justify-content: center;">
		    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>	   
		    <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>	     
		    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
		  </ul>
		</nav>
	    
	</div>
	
	<jsp:include page="/a00_main/a08_footer.jsp"/>
</body>
</html>