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
	li{list-style:none;}
	#title {
    	padding: 50px 0 40px 0;
	}
	ul.tabs {
	    padding-left: 0px;
	}
	ul.tabs li {
	    border: 1px solid #ccc;
	    background: #fff;
	    float: left;
	    width: 475px;
	    height: 130px;
	    box-sizing: border-box;
	    font-size: 22px;
	    color: #333;
	    font-weight: bold;
	    line-height: 24px;
	    padding: 30px 15px;
	    margin-bottom: 50px;
	}
	ul.tabs li:first-child {
	    margin-right: 30px;
	}
	ul.tabs li.current {
	    border: 2px solid #4cab6a;
	    color: #fff;
	    background: #4cab6a;
	}
	ul.tabs li p {
	    font-size: 14px;
	    font-weight: normal;
	    letter-spacing: -0.05em;
	    margin-top: 10px;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javaScript">	
	$(document).ready(function () {
    	$(function() {   		
    		//tab 설정
        	var urlParam = getUrlParams();
            if (urlParam["gbn"] === "faq") {
            	$("#faq_tab").trigger("click");  
            }
            
    	});

    $('ul.tabs li').click(function(){
    	var tab_id = $(this).attr('data-tab');	
	    var tab_idx = tab_id.substring(4);
	    
	    $('ul.tabs li').removeClass('current');
	    //$('.tab-content').hide();
	    $("#tab-1").hide();
	    $("#tab-2").hide();
	    
	    $(this).addClass("current");
	    $("#"+tab_id).show();

	    if(tab_idx == 1){
	    	//$("#title").html('안전수칙');	
	    	location.href="${path}/a31_notice/guideline.jsp"
	    }else{
	    	//$("#title").html('자주하는 질문');
	    	location.href="${path}/faqList.do"
	    }
	  })
    });
    
	
</script>
</head>

<body>
	<div class="container">
		<div id="title" class="text-left">
		  <h2>안전하게 자전거 이용하기</h2>
		</div>
	
		<ul class="tabs">
	        <li class="tab-link current" data-tab="tab-1">안전수칙<p>안전수칙을 읽으시면 따릉이를 더욱 안전하게 이용하실 수 있습니다.</p></li>
	        <li class="tab-link" data-tab="tab-2">자주하는 질문<p>자주하는질문을 이용하시면 보다 빠르게 답변을 얻으실 수 있습니다. </p></li>
	    </ul>
	</div>
</body>
</html>