<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	//이번달 변수
	var today = new Date();
	today = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	var year = today.getFullYear();
	var mon = today.getMonth();
	var day = today.getDate();
	var startDate = today;
	var startDate2 = today;
	var firstday = new Date(today.getFullYear(), today.getMonth(), 1);
	var lastday = new Date(today.getFullYear(), today.getMonth() + 1, 0);

	var sd = "";
</script>

<script>
	function reserveOk(frm) {
		var ok = confirm("예약하시겠습니까?");
		if (ok == true) {
			frm.action = "controller?type=reservationOk";
			frm.submit();
		} else {
			return;
		}
	}
	function toDate(dateStr) {
		var parts = dateStr.split("-")
		return new Date(parts[2], parts[1] - 1, parts[0])
	}
	function dateDiff(_date1, _date2) {
		var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
		var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

		diffDate_1 = new Date(diffDate_1.getFullYear(),
				diffDate_1.getMonth() + 1, diffDate_1.getDate());
		diffDate_2 = new Date(diffDate_2.getFullYear(),
				diffDate_2.getMonth() + 1, diffDate_2.getDate());

		var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
		diff = Math.ceil(diff / (1000 * 3600 * 24));

		return diff;
	}
	function setVal(val) {
		sd = val;
		var temp = '<span>체크아웃<br></span>';
		var nsd = new Date();
		var ned = new Date();
		temp += '<select id="e_date" onchange="setVal2(this.value)"  name="e_date">';
		//temp += '<c:forEach var="ed" items="${enableDates}">';
		//temp += '<c:if test="${ed>=sd}">';
		//temp += '<option>${ed }1</option>';
		//temp += '</c:if>';
		//temp += '</c:forEach>';
		<c:forEach var = "ed" items = "${enableDates}">
		var date = "${ed}";

		console.log("sd : " + sd + "date : " + date);

		nsd = toDate(sd);
		ned = toDate(date);
		console.log("nsd : " + nsd + "ned : " + ned);
		if (nsd <= ned) {
			temp += '<option>${ed}</option>';
		}
		</c:forEach>

		temp += '</select>';
		console.log(temp);
		document.getElementById("checkout").innerHTML = temp;
	}
	function setVal2(val) {
		var diff = dateDiff(sd, val);
		var cost = diff * $
		{
			roomTable.cost * 1000
		}
		;
		var temp2 = cost + '원';
		document.getElementById("cost").innerHTML = temp2;
		document.getElementById("total_cost").value = cost;
	}
</script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">예약하기</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">예약하기</li>
		</ol>
		<form method="post">

			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<!-- Image Header -->
			<img class="img-fluid rounded mb-4" src="imgs/${roomTable.filename}"
				alt="${roomTable.room_name }">

			<!-- Marketing Icons Section -->
			<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">숙소명</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.room_name }</p>
						</div>
						<h4 class="card-header">주소</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.room_address1 }&nbsp;
								${roomTable.room_address2 }</p>
						</div>
						<h4 class="card-header">호실</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.room_num }</p>
						</div>
						<h4 class="card-header">타입</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.room_type }</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">숙박가격(1일)</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.cost * 1000 }원</p>
						</div>
						<h4 class="card-header">최대인원</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.max_pax }명</p>
						</div>
						<h4 class="card-header">테마</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.room_theme }</p>
						</div>
						<h4 class="card-header">숙소설명</h4>
						<div class="card-body">
							<p class="card-text">${roomTable.room_content }</p>
						</div>

					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">예약가능일</h4>
						<div class="card-body">
							<font>체크인</font>
							<div id="checkin" class="card-text">
								<select id="s_date" onchange="setVal(this.value)" name="s_date">
									<c:forEach var="ed" items="${enableDates}">
										<option>${ed }</option>
									</c:forEach>
								</select>
							</div>
							<!--
			체크아웃 날짜는 체크인 날짜 이후여야 하고
			체크아웃 날짜는 예약이 가능해야 하지만 아직 구현되지 않음
			-->
							<div id="checkout"></div>
						</div>
						<h4 class="card-header">숙박인원</h4>
						<div class="card-body">
							<p class="card-text">
								<input type="number" name="pax" min="1"
									max="${roomTable.max_pax }" value="1"><br> (최대인원 :
								${roomTable.max_pax }명)
							</p>
						</div>
						<h4 class="card-header">숙박료</h4>
						<div class="card-body">
							<div id="cost" class="card-text"></div>
							<input type="text" id="total_cost" name="total_cost" value="0">

						</div>


						<div class="card-footer">
							<a href="#" class="btn btn-primary"><input type="button"
								onclick="reserveOk(this.form)" value="예약하기"></a>
						</div>
					</div>
				</div>
			</div>
		</form>

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
