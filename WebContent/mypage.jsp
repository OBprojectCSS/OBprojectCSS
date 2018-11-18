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
	function myPage_go(frm) {
		var inputPwd = frm.inputPwd.value;
		var dbPwd = "${uservo.password}";
		if (inputPwd != dbPwd) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.inputPwd.value = "";
			frm.inputPwd.focus();
			return false;
		} else {
			frm.action = "controller?type=myPageModi";
			frm.submit();
		}
	}
</script>

</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<h3 >개인 정보 수정을 위한 비밀번호 입력</h3> -->
<!-- 	<form method="POST" name="frm" id="frm"> -->
<!-- 	<input type="password" name="inputPwd"> -->
<!-- 	<input type="button" name="button" value="확인" onclick="myPage_go()"> -->
<!-- 	<br><br> -->
<!-- 	</form> -->
	
	<div class="container" style="padding-left: 300px; padding-right: 300px;">
	   <div class="innerContainer">
	   <form class="form-signin" method="POST" name="frm" id="frm" style="margin-bottom: 250px;">
	   <img class="mb-4" src="imgs/loginlogo.png" style="padding-left: 100px;">
	      <h1 class="h3 mb-3 font-weight-normal" style="text-align:center">개인 정보 변경을 위한 비밀번호 입력</h1>
	      <br>
	      
	      <label for="inputPassword" class="sr-only">비밀번호</label>
	      <input type="password" name="inputPwd" id="inputPwd" class="form-control" placeholder="비밀번호" required>
	      <br>
	      <br>
	      <button class="btn btn-lg btn-danger btn-block" type="submit" class="submit" onclick="myPage_go(this.form)">확인</button>
	      
	      <p class="mt-5 mb-3 text-muted" style="text-align:center">&copy; 2017-2018</p>
	   </form>
	   </div>
   </div>

	
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
