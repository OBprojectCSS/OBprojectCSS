<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title></title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	// 다시 중복체크 가능해짐
	function inputIdChk() {
		document.form.reid.value = "idUncheck";
	}
	
	function go_save() {
		if (document.form.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.form.id.focus();
		} 
// 		else if (document.form.id.value != document.form.reid.value) {
// 			alert("중복확인을 클릭해 주세요.");
// 			document.form.id.focus();
// 		} 
		else if (document.form.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.form.pwd.focus();
		} else if (document.form.name.value == "") {
			alert("이름을 입력해 주세요.");
			document.form.name.focus();
		} else if(isNaN(document.form.tel.value)){
            alert("전화번호는 - 제외한 숫자만 입력해 주세요.");
            document.form.tel.focus();
            return false;
  		} else if (document.form.zipcode.value == "") {
			alert("주소를 입력해 주세요.");	
			document.form.zipcode.focus();
		} else if (document.form.address.value == "") {
			alert("주소를 입력해 주세요.");	
			document.form.address.focus();
		} else if (document.form.detail.value == "") {
			alert("주소를 입력해 주세요.");	
			document.form.detail.focus();
		} else if (document.form.email.value == "") {
			alert("이메일을 입력해 주세요.");	
			document.form.email.focus();
		} else if (document.form.birthday.value == "") {
			alert("생년월일을 입력해 주세요.");	
			document.form.birthday.focus();
		} else {
			document.form.action = "controller?type=joincheck";
			document.form.submit();
		}
	}
	
	function idCheck() {
		var inputId = document.form.id.value;
		if (inputId == "" || inputId.length == 0){
			alert("중복 체크할 아이디를 먼저 입력하세요.")
			document.form.id.focus();
			return;
		}
		var account = document.getElementById('account').value;
		window.open("controller?type=idCheck&id="+account, "chkForm", "width=350, height=300, resizable=no, scrollbars=no");
	}
	
	 function go_main() {
         var isCancelOk = confirm("정말 취소하시겠습니까?");
         
         if (isCancelOk) {
            form.action = "controller?type=main";
            form.submit();
         } else {
            alert("취소되었습니다.");
         }
      } 
</script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="contract header" style="margin-top: 50px;">
		<h2>JOIN US</h2>
		<p>약관동의>><b>회원가입</b></p>
		</div>

			<form id="join" method="POST" name="form">
				<fieldset>
					<legend>회원가입</legend>
					<div class="control-group form-group">
             		<div class="controls">
						<label style="width:20%;">아이디</label>
						<input type="text" class="form-control2" id="account" name="id" placeholder="회원아이디" size="22" onkeydown="inputIdChk()">
						<input type="hidden" name="reid" value="idUncheck">
						<input type="button" value="중복확인" class="btn btn-danger" onclick="idCheck()"><br><br>
					</div>
					</div>
					<div class="control-group form-group">
             		<div class="controls">
						<label style="width:20%;">비밀번호</label>
						<input type="password" class="form-control2" name="pwd" placeholder="비밀번호"><br><br>
					</div>
					</div>
					
					<label style="width:20%;">이름</label>
					<input type="text" name="name" class="form-control2" placeholder="이름"><br><br>
					
					<label style="width:20%;">휴대폰 번호</label>
					<input type="text" name="tel" class="form-control2" placeholder="휴대폰번호"><br><br>
					
					<label style="width:20%;">주소</label>
						<input type="text" name="zipcode" class="form-control2" id="zipcode" placeholder="우편번호" maxlength="6"><br>
					<label style="width:20%;"></label>
						<input type="text" name="address" id="roadaddress" placeholder="예) 서울특별시"><br>
					<label style="width:20%;"></label>
						<input type="text" name="detail" placeholder="예) 마포구 백범로..."><br><br>
						
					<label style="width:20%;">E-Mail</label>
					<input type="text" name="email" class="form-control2" placeholder="이메일"><br><br>
					
					<label style="width:20%;">생년월일</label>
					<input type="text" name="birthday" class="form-control2"  placeholder="예) 90/01/01"><br><br>
													
					<label style="width:20%;">광고 수신 동의</label>
					<input type="radio" name="e_confirm" value="0" checked>동의함&nbsp;&nbsp;&nbsp;
					<input type="radio" name="e_confirm" value="1">동의안함 <br>
				</fieldset>
				<br>
				<br>
				<div>
					<input type="button" value="회원가입" class="btn btn-danger submit" onclick="go_save()">
					<input type="button" value="취소" class="btn btn-danger cancels" onclick="go_main()">
					<br><br>
				</div>
			</form>
			
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
