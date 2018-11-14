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

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


</head>
<style>
.btn-group .button {
	background-color: #4CAF50; /* Green */
	border: 1px solid green;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	float: left;
	width: 50%;
	height: 150px;
}

.btn-group .button:hover {
	background-color: #3e8e41;
}
</style>

<script>
	var obj = new Array();

	<c:forEach var="si_gu" items="${addressList}">
	var si = "${si_gu.room_address1 }";
	var gu = "${si_gu.room_address2}";
	var array = [ si, gu ];
	obj.push(array);
	</c:forEach>
	//alert(obj);
	//console.log(obj);
	$(document).ready(function() {
		$("#show1").click(function() {
			$("#one").css("display", "block");
			$("#two").css("display", "none");

			$("#one").css("background-color", "red");
			$("#show1").css("background-color", "red");
		});
		$("#show2").click(function() {
			$("#two").css("display", "block");
			$("#one").css("display", "none");
			$("#two").css("background-color", "blue");
			$("#show2").css("background-color", "blue");

		});

	});
</script>
<script>
	function search_go(frm) {
		frm.action = "controller?type=search_list";
		frm.submit();
	}
	function search_theme(frm) {
		frm.action = "controller?type=search_theme";
		frm.submit();
	}
	function showSecond(self) {
		console.log(self);
		var result = "<div>";
		for (var i = 0; i < obj.length; i++) {
			if (obj[i][0] == self.value) {
				//alert(obj[i][1]);
				console.log("check : " + obj[i][1]);
				result += "<input type = 'radio' name = 'chk_gu' value = '"+obj[i][1]+"'>"
						+ obj[i][1] + "</input>";
			}
		}
		result += "</div>";
		var temp = document.getElementById("secondRadio");
		//alert(temp);
		temp.innerHTML = result;

		console.log(result);

	}
</script>


<body>


	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="main.jsp">나랑 놀자</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="controller?type=search">전체검색</a></li>
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
								<a class="dropdown-item" href="full-width.html">회원정보수정</a> <a
									class="dropdown-item" href="controller?type=logout">로그아웃</a>
								<c:if test="${sessionScope.uservo.getAccount() == 'admin'}">
									<a class="dropdown-item" href="pricing.html">관리자모드</a>
								</c:if>
							</div></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">

		<!------------------------------------------------------------------  -->

		<div class="btn-group">
			<button class="button" id="show1">지역별</button>
			<button class="button" id="show2">테마별</button>
		</div>
		<form method="post">
			<div id="one" style="display: none;">
				<c:forEach var="si" items="${si}">
					<input type="radio" name="chk_si" value="${si }"
						onclick="showSecond(this)">${si }						
			</c:forEach>
				<hr>
				<div id="secondRadio"></div>

				<input type="button" value="조 회" onclick="search_go(this.form)">
			</div>
		</form>


		<form method="post">
			<div id="two" style="display: none;">
				<c:forEach var="theme" items="${theme}">
					<input type="radio" id="chk_theme" name="chk_theme"
						value="${theme }">${theme }				
			</c:forEach>
				<input type="button" value="조 회" onclick="search_theme(this.form)">
			</div>
		</form>
		<!------------------------------------------------------------------  -->



	</div>
	<!-- /.row -->
	<c:if test="${not empty getRoomimp}">
		<jsp:include page="search_list.jsp"></jsp:include>

	</c:if>
	<c:if test="${not empty getRoomthemeimp}">
		<jsp:include page="search_themelist.jsp"></jsp:include>

	</c:if>


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
