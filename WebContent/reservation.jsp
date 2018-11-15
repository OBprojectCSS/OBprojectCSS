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

<style>
img#room_image{
	width:30%;
}

</style>
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
			if("${uservo}"=="") {
				alert("회원만 예약이 가능합니다.\n로그인 해 주십시오.");
				location.href="login.jsp";
			}
			else{
			frm.action = "controller?type=reservationOk";
			frm.submit();
			}
		} else {
			return;
		}
	}
	function toDate(dateStr) {
		var parts = dateStr.split("-");
		var toDate = new Date(parts[0], parts[1] - 1, parts[2]);
		return toDate;
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
		//temp += '<c:forEach var="ed" items="${ableDates}">';
		//temp += '<c:if test="${ed>=sd}">';
		//temp += '<option>${ed }1</option>';
		//temp += '</c:if>';
		//temp += '</c:forEach>';
		<c:forEach var = "ed" items = "${ableDates}">
		var date = "${ed}";

		console.log("sd : " + sd + "date : " + date);

		nsd = toDate(sd);
		ned = toDate(date);
		console.log("nsd : " + nsd + "ned : " + ned);
		if (nsd < ned) {
			temp += '<option>${ed}</option>';
		}
		</c:forEach>

		temp += '</select>';
		console.log(temp);
		document.getElementById("checkout").innerHTML = temp;
	}
	function setVal2(val) {
		var diff = dateDiff(sd, val);
		var cost = diff * ${cost*1000};
		var temp2 = cost + '원';
		document.getElementById("cost").innerHTML = temp2;
		document.getElementById("total_cost").value = cost;
		console.log("cost : " + cost);
	} 
</script>
<script>
	$(function(){
	})
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
			<c:forEach var="img" items="${filenameList}">
				<img class="img-fluid rounded mb-4" id="room_image" src="imgs/${img}"
				alt="${room_name } 사진">
			</c:forEach>
			

			<!-- Marketing Icons Section -->
			<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">숙소명</h4>
						<div class="card-body">
							<p class="card-text">${room_name }</p>
						</div>
						<h4 class="card-header">주소</h4>
						<div class="card-body">
							<p class="card-text">${room_address1 }&nbsp;
								${room_address2 }</p>
						</div>
						<h4 class="card-header">호실</h4>
						<div class="card-body">
							<p class="card-text">${room_num }</p>
						</div>
						<h4 class="card-header">타입</h4>
						<div class="card-body">
							<p class="card-text">${room_type }</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">숙박가격(1일)</h4>
						<div class="card-body">
							<p class="card-text">${cost*1000 }원</p>
						</div>
						<h4 class="card-header">최대인원</h4>
						<div class="card-body">
							<p class="card-text">${max_pax }명</p>
						</div>
						<h4 class="card-header">테마</h4>
						<div class="card-body">
							<p class="card-text">${room_theme }</p>
						</div>
						<h4 class="card-header">숙소설명</h4>
						<div class="card-body">
							<p class="card-text">${room_content }</p>
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
									<c:forEach var="ed" items="${ableDates}">
										<option>${ed }</option>
									</c:forEach>
								</select>
							</div>
							<!--
			체크아웃 날짜는 이미 예약된 날 이전이어야 하지만 아직 구현되지 않음
			-->
							<div id="checkout"></div>
						</div>
						<h4 class="card-header">숙박인원</h4>
						<div class="card-body">
							<p class="card-text">
								<input type="number" name="pax" min="1"
									max="${max_pax }" value="1"><br> (최대인원 :
								${max_pax }명)
							</p>
						</div>
						<h4 class="card-header">숙박료</h4>
						<div class="card-body">
							<div id="cost" class="card-text"></div>
							<input type="hidden" id="total_cost" name="total_cost" value="1000">
							<input type="hidden" name="room_id" value="${room_id}">
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
