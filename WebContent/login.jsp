<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

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


	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">나랑 놀자</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html">전체검색</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="services.html">이벤트</a>
					</li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMoreoption" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 더보기 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMoreoption">
							<a class="dropdown-item" href="portfolio-1-col.html">공지 사항</a> <a
								class="dropdown-item" href="portfolio-2-col.html">자주 묻는 질문</a> <a
								class="dropdown-item" href="portfolio-3-col.html">문의 사항</a> <a
								class="dropdown-item" href="portfolio-4-col.html">프리미엄 후기</a> <a
								class="dropdown-item" href="portfolio-item.html">약관 및 동의사항</a>
						</div></li>
					<!--  -->
					<li class="nav-item"><a class="nav-link"
						href="controller?type=login">로그인</a></li>

					<!--  -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMypage" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="full-width.html">회원정보수정</a> <a
								class="dropdown-item" href="sidebar.html">로그아웃</a> <a
								class="dropdown-item" href="pricing.html">관리자모드</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			로그인 <small>login</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
			<li class="breadcrumb-item active">Login</li>
		</ol>

		<form method="post" name="frm">
			<div class="col-lg-4 mb-4">
				<div class="card card-outline-primary h-100">
					<h3 class="card-header bg-primary text-white">Login</h3>


					<ul class="list-group list-group-flush">
						<li class="list-group-item"><label>User ID</label> <input
							name="id" type="text"></li>
						<li class="list-group-item"><label>Password</label> <input
							name="pwd" type="password"></li>

						<li class="list-group-item"><input type="button" value="로그인"
							class="btn btn-primary" onclick="login_go(this.form)">&nbsp;&nbsp;
							<input type="button" value="회원가입" class="btn btn-primary"
							onclick="login_go(this.form)"></li>
						<li class="list-group-item"><input type="button" value="돌아가기"
							class="btn btn-primary" onclick="login_go(this.form)"></li>
					</ul>
				</div>
			</div>
		</form>

	</div>
	<!-- /.row -->


	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
