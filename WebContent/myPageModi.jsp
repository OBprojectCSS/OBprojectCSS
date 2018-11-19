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
<script type="text/javascript">
function go_save(frm) {
	document.frm.action = "controller?type=myPageModiAct";
	document.frm.submit();
}
function cancel(frm) {
	var conf = confirm("메인 화면으로 돌아가시겠습니까?");
	if (conf) {
		document.frm.action = "controller?type=main";
		document.frm.submit();
	}
}
</script>
<style>
</style>
</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<br>
	<br>
	<br>
	<br>
	
	
	<h2>회원 정보 수정</h2>
			<form id="frm" method="POST" name="frm">
			<fieldset>
					<legend>회원가입</legend>
					<div class="control-group form-group">
             		<div class="controls">
						<label style="width:20%;">아이디</label>
						<span>${uservo.getAccount()}<span><br><br>
					</div>
					</div>
					<div class="control-group form-group">
             		<div class="controls">
						<label style="width:20%;">비밀번호</label>
						<input type="password" class="form-control2"  value="${uservo.getPassword()}" name="pwd" placeholder="비밀번호"><br><br>
					</div>
					</div>
					
					<label style="width:20%;">이름</label>
					<input type="text" name="name" class="form-control2" value="${uservo.getNickname()}" placeholder="이름"><br><br>
					
					<label style="width:20%;">휴대폰 번호</label>
					<input type="text" name="tel" class="form-control2" value="${uservo.getTel() }" placeholder="휴대폰번호"><br><br>
					
					<label style="width:20%;">주소</label>
						<input type="text" name="zipcode" class="form-control2" id="zipcode" value="${uservo.getZipcode()}" placeholder="우편번호" maxlength="6"><br>
					<label style="width:20%;"></label>
						<input type="text" name="address" id="roadaddress" value="${uservo.getAddress1()}" placeholder="예) 서울특별시"><br>
					<label style="width:20%;"></label>
						<input type="text" name="detail" value="${uservo.getAddress2()}" placeholder="예) 마포구 백범로..."><br><br>
						
					<label style="width:20%;">E-Mail</label>
					<input type="text" name="email" value="${uservo.getEmail()}" class="form-control2" placeholder="이메일"><br><br>
					
					<label style="width:20%;">생년월일</label>
					<input type="text" name="birthday" value="${uservo.getBirthday().substring(0, 10)}" class="form-control2"  placeholder="예) 90/01/01"><br><br>
													
					<label style="width:20%;">광고 수신 동의</label>
					<input type="radio" name="e_confirm" value="0" checked>동의함&nbsp;&nbsp;&nbsp;
					<input type="radio" name="e_confirm" value="1">동의안함 <br>
				</fieldset>
				<br>
				<br>
				<div>
					<input type="button" value="저장" class="btn btn-danger submit" onclick="go_save(this.form)">
					<input type="button" value="취소" class="btn btn-danger cancels" onclick="cancel()">
				<br><br>
					<input type="hidden" name="chk" value="chk">
					<input type="hidden" name="idx" value="${uservo.getId()}">
					<input type="hidden" name="id" value="${uservo.getAccount()}">
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
