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
<title>추과과금결제 내역</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#unpaidChargeDataTab{
		/* border:1px solid black; */
		text-align:center;
		width:100%;
		font-size:9pt;
	}
	#unpaidChargeDataTab th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:40px;
		background:rgb(219, 217, 217);
	}
	#unpaidChargeDataTab td{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:35px;
	}
	#unpaidChargeMoney{
		font-size:8pt;
		color:darkgrey;
		margin-left:90%;
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
	<div id="unpaidChargeMoney">미납요금</div>
	<table id="unpaidChargeDataTab">
		<col width="33%">
	   	<col width="33%">
	   	<col width="33%">
		<thead>
			<tr><th>대여일시</th><th>내역</th><th>금액</th></tr>
		</thead>
		<tbody>
			<td colspan="3" style="color:grey;">no data</td>
		</tbody>
	</table>
</body>
</html>