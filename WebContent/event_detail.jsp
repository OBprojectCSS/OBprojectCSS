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

<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>
<style>
#imgsize {
	width: 500px;
	height: 800px;
}
</style>

<body>

  <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			Event <small>detail</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="controller?type=event_roomALL&board_type=2">Event</a></li>
			<li class="breadcrumb-item active">상세페이지</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Map Column -->
			<div class="col-lg-8 mb-4">
				<img id="imgsize" src="imgs/${event_detail.filename} "
					alt="${event_detail.title }">
			</div>
			<!-- Contact Details Column -->
			<div class="col-lg-4 mb-4">
				<h3>${event_detail.title }</h3>
				<p>
					<abbr>글쓴이</abbr>: 관리자
				</p>
				<p>
					<abbr>&emsp; &emsp; &emsp; &emsp; [내용]</abbr>
				</p>
				<p>
					${event_detail.content}
				</p>
				<p>
					<abbr>공지날짜</abbr>: ${event_detail.write_date}
				</p>
			</div>
		</div>


	</div>
	<!-- /.container -->

	<!-- Footer -->
	 <jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
