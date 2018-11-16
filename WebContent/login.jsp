<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>나랑 놀자-로그인페이지</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- <link href="css/modern-business.css" rel="stylesheet"> -->
<!-- <link href="dist/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<script>
	function login_go(frm) {
		if (frm.id.value.length == 0) {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return false;
		}
		if (frm.pwd.value.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			frm.pwd.focus();
			return false;
		} else {
			frm.action = "controller?type=loginCheck";
			frm.submit();
		}
	}
	function join_go(frm) {
		frm.action = "controller?type=contract"
		frm.submit();
	}
	function back_go(frm) {
		frm.action = "controller?type=main"
		frm.submit();
	}
</script>

<body>
	
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<!-- 	<div class="container"> -->

	<!-- Page Heading/Breadcrumbs -->
	<!-- 		<h1 class="mt-4 mb-3"> -->
	<!-- 			로그인 <small>login</small> -->
	<!-- 		</h1> -->

	<!-- 		<ol class="breadcrumb"> -->
	<!-- 			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li> -->
	<!-- 			<li class="breadcrumb-item active">Login</li> -->
	<!-- 		</ol> -->

	<!-- 		<form method="post" name="frm"> -->
	<!-- 			<div class="col-lg-4 mb-4"> -->
	<!-- 				<div class="card card-outline-primary h-100"> -->
	<!-- 					<h3 class="card-header bg-primary text-white">Login</h3> -->


	<!-- 					<ul class="list-group list-group-flush"> -->
	<!-- 						<li class="list-group-item"><label>User ID</label> <br> -->
	<!-- 						<input name="id" type="text"></li> -->
	<!-- 						<li class="list-group-item"><label>Password</label><br> -->
	<!-- 							<input name="pwd" type="password"></li> -->

	<!-- 						<li class="list-group-item">
							<input type="button" value="로그인" class="btn btn-primary" onclick="login_go(this.form)">&nbsp;&nbsp; -->
	<!-- 							<input type="button" value="회원가입" class="btn btn-primary" -->
	<!-- 							onclick="join_go(this.form)"></li> -->
	<!-- 						<li class="list-group-item"><input type="button" value="돌아가기" -->
	<!-- 							class="btn btn-primary" onclick="back_go(this.form)"></li> -->
	<!-- 					</ul> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</form> -->

	<!-- 	</div> -->
	<!-- /.row -->
	<div class="container d-flex flex-column">

		<form class="form-signin" method="POST" name="frm">
			<img class="mb-4" src="imgs/loginlogo.png">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">회원
				로그인</h1>

			<label for="inputId" class="sr-only">아이디</label> <input type="text"
				name="id" id="inputId" class="form-control" placeholder="아이디"
				required autofocus> <label for="inputPassword"
				class="sr-only">비밀번호</label> <input type="password" name="pwd"
				id="inputPassword" class="form-control" placeholder="비밀번호" required>

			<button class="btn btn-lg btn-danger btn-block" type="submit"
				class="submit" onclick="login_go(this.form)">로그인</button>
			<button class="btn btn-lg btn-danger btn-block" type="submit"
				class="submit" onclick="join_go(this.form)">회원가입</button>

			<p class="mt-5 mb-3 text-muted" style="text-align: center">&copy;
				2017-2018</p>
		</form>
	</div>

	<!-- /.container -->
	<!-- Footer -->
	
		<!-- The content of your page would go here. -->
	 <jsp:include page="footer.jsp"></jsp:include> 


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
