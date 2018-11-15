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
<style>
	#frm {
		margin-left: 20px;
	}
</style>
<script>
	function myPage_go() {
		var inputPwd = document.frm.inputPwd.value;
		var dbPwd = "${uservo.password}";
		if (inputPwd != dbPwd) {
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.inputPwd.value = "";
			document.frm.inputPwd.focus();
			return false;
		} else {
			location.href = "controller?type=myPageModi";
		}
	}
</script>

</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	
	<h3>개인 정보 수정을 위한 비밀번호 입력</h3>
	<form method="POST" name="frm" id="frm">
	<input type="password" name="inputPwd">
	<input type="button" name="button" value="확인" onclick="myPage_go()">
	<br><br>
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
