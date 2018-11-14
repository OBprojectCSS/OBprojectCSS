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

<title>공지사항</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">




</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">프리미엄 후기 상세보기</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">프리미엄 후기 상세보기</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="main.jsp" class="list-group-item">Home</a> <a
						href="controller?type=notice&board_type=1"
						class="list-group-item ">공지사항</a> <a
						href="controller?type=moreQue" class="list-group-item">자주 묻는
						질문</a> <a href="controller?type=que&board_type=3"
						class="list-group-item">문의사항</a> <a
						href="controller?type=premium&board_type=4"
						class="list-group-item active">프리미엄 후기</a> <a
						href="controller?type=agree" class="list-group-item">약관 및 동의
						사항</a>


				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h4>프리미엄 후기 상세보기</h4>
				<div id="premOneHeader">
					<a href="controller?type=premOneMod">수정</a> <a
						href="controller?type=premOneDel">삭제</a> <a
						href="controller?type=premium&board_type=4&cPremPage=${premPvo.nowPage }">목록으로</a>
				</div>
				<div id="premOneContainer">
					<div id="premOneTitleBox">${premOneVO.title }</div>
					<div id="premOneWriter">${premOneVO.nickname }(${premOneVO.account })</div>
					<div id="premOneDetailBox">${premRoomMap.ROOM_NAME }(${premRoomMap.ROOM_ADDRESS1 }
						${premRoomMap.ROOM_ADDRESS2 })<br> ${premRoomMap.ROOM_TYPE }
						(사용인원:${premRoomMap.PAX }/총 수용가능인원:${premRoomMap.MAX_PAX })<br>
						숙박날짜 : ${premRoomMap.S_DATE } ~ ${premRoomMap.E_DATE }
					</div>
					<div id="premOneImgBox"></div>
					<div id="premOneContent">${premOneVO.content }</div>
				</div>




			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
