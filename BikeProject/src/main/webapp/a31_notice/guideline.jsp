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
<title>안전수칙</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	#title {
    	padding: 50px 0 40px 0;
	}
	.d-block {
		margin: auto;
	}
	.carousel-inner {
		padding-bottom: 70px;
	}
	.carousel-inner img {
		max-width: 339px;
		max-height: 620px;
	}
	.carousel-control-prev-icon {
		background-image: url(https://www.bikeseoul.com/images/prevBtn.jpg) !important;
		width: 16px !important;
		height: 25px !important;
	}
	.carousel-control-next-icon {
		background-image: url(https://www.bikeseoul.com/images/nextBtn.jpg) !important;
		width: 16px !important;
		height: 25px !important;
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
	});
</script>
</head>

<body>
	<div class="container">
		<jsp:include page="/a00_main/a00_header.jsp"/>
		
		<div id="title" class="text-left">
		  <h2>안전하게 자전거 이용하기</h2>
		</div>
		
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="${path}/b01_img/guide01.png" alt="First slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${path}/b01_img/guide02.png" alt="Second slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${path}/b01_img/guide03.png" alt="Third slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${path}/b01_img/guide04.png" alt="Fourth slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${path}/b01_img/guide05.png" alt="Fifth slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${path}/b01_img/guide06.png" alt="Sixth slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${path}/b01_img/guide07.png" alt="Seventh slide">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	<jsp:include page="/a00_main/a08_footer.jsp"/>
</body>
</html>