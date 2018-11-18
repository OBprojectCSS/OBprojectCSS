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

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".nav-link").css("color", "white");

	});
</script>
</head>

<body>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-danger fixed-top">
		<div class="container">
			<a class="navbar-brand" href="main.jsp"><img alt="logo"
				src="imgs/logo1.jpg"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><c:if test="${not empty uservo}">
							<a class="nav-link">${uservo.nickname}님 환영합니다.</a>
						</c:if></li>
					<li class="nav-item"><a class="nav-link"
						href="controller?type=search">전체검색</a></li>
					<li class="nav-item"><a class="nav-link"
						href="controller?type=event_roomALL&board_type=2">이벤트</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMoreoption" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 더보기 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMoreoption">
							<a class="dropdown-item"
								href="controller?type=notice&board_type=1">공지 사항</a> <a
								class="dropdown-item" href="controller?type=moreQue">자주 묻는
								질문</a> <a class="dropdown-item"
								href="controller?type=que&board_type=3">문의 사항</a> <!-- <a
								class="dropdown-item"
								href="controller?type=premium&board_type=4">프리미엄 후기</a> --> <a
								class="dropdown-item" href="controller?type=agree">약관 및 동의사항</a>
						</div></li>
					<!--  -->
					<c:if test="${empty sessionScope.uservo}">
						<li class="nav-item"><a class="nav-link"
							href="controller?type=login">로그인</a></li>
					</c:if>

					<!--  -->
					<c:if test="${not empty sessionScope.uservo}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMypage" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownBlog">
								<a class="dropdown-item" href="controller?type=myPage">내
									정보수정</a> <a class="dropdown-item" href="controller?type=revList">내
									예약(숙박)내역</a> <a class="dropdown-item" href="controller?type=logout">로그아웃</a>
								<c:if test="${sessionScope.uservo.getAccount() == 'admin'}">
									<a class="dropdown-item" href="controller?type=admin_system">관리자모드</a>
								</c:if>
							</div></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>









	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
