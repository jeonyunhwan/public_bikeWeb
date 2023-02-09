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
	.formdiv {
		padding: 2% 2% 2% 2%;
		border: #c8c8c8 solid 1px;
		border-radius: 5px 5px 5px 5px;
		margin-bottom: 55px;
	}
	.input-group label {
		font-weight: bold;
	}
	#button {
		margin: 0 auto;
	    margin-top: 20px;
	    text-align: center;
	}
	#button button {
		width:12%;
		height:40px;
	}
	#cancelBtn {
		border: gray solid 1px;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	var msg = "${msg}"
	if(msg=="수정되었습니다."){
		if(confirm(msg+"\n 상담 내역으로 이동하시겠습니까?")){
			location.href="${path}/qnaList.do" // qna 글 등록 후 상담 내역으로 이동 
		}
	}
	$(document).ready(function(){
		<%-- 
		
		--%>	
		
		
		$("#cancelBtn").click(function(){
			location.href="${path}/qnaList.do" // 상담 내역 화면으로 이동	
		});
		$("#regBtn").click(function(){
			var isInValid = false
			if($("#inputTitle").val() == ""){
				alert("제목을 입력해 주세요.");
				$("#inputTitle").focus();
				return false;
			}
			if($("#inputText").val() == ""){
				alert("내용을 입력해 주세요.");
				$("#inputText").focus();
				return false;
			}
			if(!$("input:checked[id='chkagree']").is(":checked")){ 
				alert("작성동의를 체크해주십시오."); 
				return false;
			}
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/uptQna.do");
				$("form").submit();
			}
		})
	});
</script>
</head>

<body>
	<div class="container">
		<jsp:include page="/a00_main/a00_header.jsp"/>
		<jsp:include page="/a32_qnaFaq/qnaFaqMenu.jsp"/>
		
		<div class="formdiv" style="clear:both;">
			<form method="post" enctype="multipart/form-data" action="${path}/insertQna.do" class="form-horizontal" novalidate>
			  <div class="input-group">
			 	<input type="hidden" name="qno" value="${qna.qno}"/>
			    <label for="inputTitle" class="col-sm-2 control-label">제목</label>
			    <div class="col-sm-10">
			      <input name="title" value="${qna.title}" type="text" class="form-control" id="inputTitle" placeholder="제목을 입력해주세요" required>
			    </div>
			  </div>
			  <div class="input-group">
			    <label for="writerId" class="col-sm-2 control-label">아이디</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="writerId">himan</p>
			      <input type="hidden" name="id" value="himan"/> <!-- 로그인 세션 아이디값 -->
			    </div>
			  </div>
			  <div class="input-group">
			    <label for="inputText" class="col-sm-2 control-label">내용</label>
			    <div class="col-sm-10">
				      <div class="checkbox" style="padding-top: 0px;">
				        <label style="font-weight: normal;">
				          <input type="checkbox" id="chkagree" required> 반복 작성, 비문, 반말, 욕설, 비난, 상업광고 게재 시 해당 글이 답변없이 삭제됨을 동의합니다.
				        </label>
				      </div>
			      <textarea name="content" rows="10" class="form-control" id="inputText" placeholder="내용을 입력해주세요" required>${qna.content}</textarea>
			    </div>
			  </div>
			  <div class="input-group">
			    <label for="inputFile" class="col-sm-2 control-label">사진 첨부</label>
			    <div class="col-sm-10 ">
			      <input type="file" name="report" class="form-control" id="inputFile" readonly>
			    </div>
			  </div>
			  <div id="button">
			      <button type="button" id="cancelBtn" class="btn btn-outline-secondary">취소</button>
			      <button type="button" id="regBtn" class="btn btn-success">저장</button>
			  </div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/a00_main/a08_footer.jsp"/>
</body>
</html>