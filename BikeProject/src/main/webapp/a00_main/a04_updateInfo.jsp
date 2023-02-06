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

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" > 
<style>
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
	margin-left: 40%;
}
th{
	text-align: center;
	background: #d2d2d2;
}
.form-control{
	width: 20% !important;
	display: inline-block !important;
}
.form-control::placeholder {
	font-size: 0.7rem !important;
}
.form-select{
	display: inline-block !important;
	width: 15% !important;
	height : 2rem;
	font-size: 0.7rem;
	color: gray;
}
#checkmsg, #checkmsg2, #checkmsg3,#cerWeight{
	font-size: 0.6rem; 
	font-weight:bold;
	color:red;
	padding-left: 5px;
}
[name=newpass1]::placeholder{
	font-size: 0.5rem;
}
</style>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>
<div class="container">
	<jsp:include page="${path }/a00_main/a00_header.jsp"></jsp:include>
	<jsp:include page="${path }/a00_main/a10_myPageMemberSub.jsp"></jsp:include>
	
	<form id="uptFrm" >
	<table class="table table-bordered">
	<col width="30%">
	<tr><th>아이디</th><td id="loginId">현재 아이디</td></tr>
	<tr><th>비밀번호</th><td><button id="passBtn" class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#passModal">비밀번호 변경</button></td></tr>
	<tr><th>이메일주소</th><td><input type="text" id="emailInput" class="form-control email" placeholder="현재 이메일 아이디">
				<span>@ </span><input type="text" id="emailInput2" class="form-control email"  placeholder="이메일 주소 입력" value="gmail.com">
				 <select class="form-select" aria-label="Default select example"  id="emailsel">
				  <option value="0" selected>선택</option>
				  <option>naver.com</option>
				  <option>gmail.com</option>
				  <option>hanmail.net</option>
				  <option>yahoo.co.kr</option>
				  <option value="1">직접입력</option>
				</select></td></tr> 
	<tr><th>휴대전화번호</th><td><span id="loginPhone">현재 핸드폰 번호</span>&nbsp;&nbsp;<button id="phoneBtn" class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#phoneModal">휴대전화 변경</button></td></tr>
	<tr><th>체중</th><td><input type="text" id="weightInput" class="form-control" placeholder="65"> kg&nbsp;&nbsp;<span id="cerWeight"></span></td></tr>
	</table>
	<input type="hidden" name="id" id="formId"> 
	<input type="hidden" name="pass" id="newpassFin"> 
	<input type="hidden" name="phoneNumber" id="newphoneFin"> 
	<input type="hidden" name="email" id="neweamilFin"> 
	<input type="hidden" name="weight" id="newweightFin"> 
	<input type="hidden" id="passck">
	<input type="hidden" id="phoneck">

	

	<button class="nextbutton" type="button" style="margin-top: 2%;">수정</button>
	</form>
	
		<!-- Modal 비밀번호 -->
		<div class="modal fade" id="passModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
		      </div>
		      <div class="modal-body">
		      	<form>
		      	<input type="hidden" id="loginPass">
		        현재 비밀번호 입력 : <input type="password" name="pass" id="originPass"> <button type="button" id="passCheck" class="btn btn-primary">확인</button><span id="checkmsg"></span><br>
		        </form>
		        <form>
		        <div class="newpass">
		        변경할 비밀번호 입력 : <input type="password" name="newpass1" placeholder="영문, 숫자, 특수문자 포함 8~12자리"><br>
		        비밀번호 확인 : <input type="password" name="newpass2"><span id="checkmsg2"></span><br>
		        </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		         <button type="button" id="passCheck2" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- Modal 휴대전화-->
		<div class="modal fade" id="phoneModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">휴대전화번호 변경</h5>
		      </div>
		      <div class="modal-body">
		        변경할 전화번호 입력 : <input type="text" name="newPhone"><br><span id="checkmsg3"></span>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		         <button type="button" id="phoneCheck" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<jsp:include page="${path }/a00_main/08_footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var loginId = '${loginId}'
		
		
		$("#formId").val(loginId)
		getInfo(loginId) // 임의로 아이디의 정보 가져오기 (나중에 session으로 설정해놓은 아이디 가져와서 넣기)
		
		$("#passBtn").click(function(){
			$('#passModal').modal("show")  // 부트스트랩이랑 jquery 충돌나서 모달창 작동 안함 ㅜㅜ...
			$("#originPass").val("")
			$("[name=newpass1]").val("")
			$("[name=newpass2]").val("")
			$("#checkmsg").text("")
			$("#checkmsg2").text("")
			$(".newpass").hide()
		})
		$("#phoneBtn").click(function(){
			$('#phoneModal').modal("show")
			$("[name=newPhone]").val("")
		})
		$(".btn-close").click(function(){
			$('#passModal').modal("hide")
			$('#phoneModal').modal("hide")
		})
		// 로그인한 아이디의 비밀번호와 일치하는지 확인
		$("#passck").val("check")
		$(".newpass").hide()
		$("#passCheck").click(function(){
			$("#checkmsg2").text("")
			if($("#originPass").val()==$("#loginPass").val()){	
				$("#checkmsg").text("일치")
				$(".newpass").show()
			}else{
				$("#checkmsg").text("불일치")
				$("[name=pass]").val("")
				$("[name=pass]").focus()
			}
		})
		// 비밀번호 유효성 체크
		let newPass=""
		$("#passCheck2").click(function(){
			$("#passck").val("")
			let passVal = $("[name=newpass1]").val()
			let invalidPass = /(?=.*\d)(?=.*[a-zA-Z])(?=.*?[#?!@$%^&*-]).{8,12}/; 	
			if(!invalidPass.test(passVal)){
				$("#checkmsg2").text("유효하지 않는 비밀번호입니다.")
			}else{
				if( $("[name=newpass1]").val()==$("[name=newpass2]").val() ){
					$('#passModal').modal("hide")
					newPass = $("[name=newpass1]").val()
					$("#newpassFin").val(newPass)
					$("#passck").val("check")
				}else{
					$("#checkmsg2").text("불일치")
					$("[name=newpass1]").val("")
					$("[name=newpass2]").val("")
					$("[name=newpass1]").focus()
				}
			}

		})
		
		
		// 휴대전화번호 유효성 체크
		$("#phoneck").val("check")
		$("#phoneCheck").click(function(){
			$("#phoneck").val("")
			let newPVal = $("[name=newPhone]").val()
			let invalidPhone = /^010?([0-9]{8})$/
			if(!invalidPhone.test(newPVal)){
				$("#checkmsg3").text("유효하지 않은 번호입니다.")
				$("[name=newPhone]").val("")
				$("[name=newPhone]").focus()
			}else{
				$('#phoneModal').modal("hide")
				$("#newphoneFin").val(newPVal)
				$("#phoneck").val("check")
				
			}
		})
		// 이메일 select 선택 
		$("#emailsel").change(function(){
			if($(this).val()==1){
				$("#emailInput2").val("")
				$("#emailInput2").focus()
			}else if($(this).val()==0){
				
			}else{
				$("#emailInput2").val($(this).val())
			}
		})
		// 몸무게 유효성 체크
		$("#weightInput").keyup(function(){
			let weightVal = $("#weightInput").val()
			let invalidWeight = /^[0-9]+$/
			if(weightVal==""){
				$("#newweightFin").val(65)
				$("#cerWeight").text("")
			}else{
				if(!invalidWeight.test(weightVal)){
					$("#cerWeight").text("숫자만 입력하세요.")
				}else{
					$("#cerWeight").text("")
					$("#newweightFin").val(weightVal)
				}
			}
		})
		

	
		$(".nextbutton").click(function(){ // 수정 완료 버튼 누를 때
			let newEmail = $("#emailInput").val()+"@"+$("#emailInput2").val()
			$("#neweamilFin").val(newEmail)
			if($("#emailInput").val()!="" && $("#emailInput2").val()!="" && $("#passck").val()=='check' && $("#phoneck").val()=='check'){
				console.log("유효성체크 통과")
				uptInfo('dnjswn123') // session에 있는 아이디 넣기
			}else{
				console.log("뭐가 문젤까")
				console.log($("#emailInput").val())
				console.log($("#emailInput2").val())
				console.log($("#passck").val())
				console.log($("#phoneck").val())
			
			}
			
		
		})
	});
	function getInfo(id){
		$.ajax({
			url:"${path}/getId.do",
			type:"get",
			data:"id="+id,
			dataType:"json",
			success:function(data){
				console.log(data)
				var info = data.userInfo
				$("#loginId").text(info.id)
				$("#weightInput").val(info.weight)
				$("#loginPhone").text(info.phoneNumber)
				let emailarr = info.email.split('@')
				$("#emailInput").val(emailarr[0])
				$("#emailInput2").val(emailarr[1])
				$("#loginPass").val(info.pass)
				
				// hiddenㅇ로 넘어갈 input의 초기값
				$("#newpassFin").val(info.pass)
				$("#newphoneFin").val(info.phoneNumber)
				$("#neweamilFin").val(info.email)
				$("#newweightFin").val(info.weight)
				
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	
	function uptInfo(id){
		$.ajax({
			url:"${path}/uptInfo.do",
			type:"post",
			data:$("#uptFrm").serialize(),
			dataType:"json",
			success:function(data){
				swal("변경되었습니다.")
				console.log(data)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	
	$("#payManagerCommonTab td").eq(0).css({"background":"#001b31","color":"white"})
	
</script>
</html>