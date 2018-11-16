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
					<legend>회원 정보 수정</legend>
					
					<label>아이디</label>
					<span>${uservo.getAccount()}<span><br><br>
					
					<label>비밀번호</label>
					<input type="password" name="pwd" value="${uservo.getPassword()}"><br><br>
					
					<label>이름</label>
					<input type="text" name="name" value="${uservo.getNickname()}"><br><br>
					
					<label>휴대폰 번호</label>
					<input type="text" name="tel" value="${uservo.getTel() }"><br><br>
					
					<label>주소</label>
					<input type="text" name="zipcode" id="zipcode" value="${uservo.getZipcode()}" size="15"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" id="roadaddress" value="${uservo.getAddress1()}"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="detail" value="${uservo.getAddress2()}"><br><br>		

					
					<label>E-Mail</label>
					<input type="text" name="email" value="${uservo.getEmail()}"><br><br>
					
					<label>생년월일</label>
					<input type="text" name="birthday" value="${uservo.getBirthday().substring(0, 10)}"><br><br>
													
					<label>광고 수신 동의</label>
					<input type="radio" name="e_confirm" value="0" checked>동의함&nbsp;&nbsp;&nbsp;
					<input type="radio" name="e_confirm" value="1">동의안함 <br>
				</fieldset>
				<br>
				<br>
				<div>
					<input type="submit" value="저장" class="submit" onclick="go_save(this.form)">
					<input type="reset" value="취소" class="cancel" onclick="cancel()">
					
					<input type="hidden" name="chk" value="chk">
					<input type="hidden" name="idx" value="${uservo.getId()}">
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
