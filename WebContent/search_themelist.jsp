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
#imgsize {
	width: 200px;
	height: 250px;
}
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}

#imgsize {
	width: 350px;
	height: 250px;
}

#buttonbox{
	background-color:white;
	border:none;
}
</style>
<script>
	function reservationGo(frm) {
		alert("reservationGo()실행");
		alert("frm" + frm);
		frm.action = "controller?type=reservation";
		frm.submit();
	}
</script>
</head>
<body>


	<!-- Page Content -->
	<div class="container">
		<div class="row">
				<c:forEach var="roomlist" items="${getRoomthemeimp }">
					<div class="col-lg-4 col-sm-6 portfolio-item">
					<form id="hidden" method="post" action="controller">
					<button type="submit" id="buttonbox">
						<div class="card h-100">
							<img class="card-img-top" src="imgs/${roomlist.filename}" 
								id="imgsize" alt="이미지사진">
							<div class="card-body">
								<h4 class="card-title">${roomlist.room_name }</h4>
								<div class="card-text">
									<table>
										<tr>
											<th>위치</th>
										</tr>
										<tr>
											<td>${roomlist.room_address1 }&nbsp;
												${roomlist.room_address2 }</td>
										</tr>
										<tr>
											<th>방번호</th>
										</tr>
										<tr>
											<td>${roomlist.room_num }</td>
										</tr>
										<tr>
											<th>방 타입</th>
										</tr>
										<tr>
											<td>${roomlist.room_type }</td>
										</tr>
										<tr>
											<th>가격 하루당</th>
										</tr>
										<tr>
											<td>${roomlist.cost }원</td>
										</tr>
										<tr>
											<th>수용인원</th>
										</tr>
										<tr>
											<td>${roomlist.max_pax }명</td>
										</tr>
										<tr>
											<th>내용</th>
										</tr>
										<tr>
											<td>${roomlist.room_content }</td>
										</tr>
										<tr>
											<th>테마</th>
										</tr>
										<tr>
											<td>${roomlist.room_theme }</td>
	
										</tr>
										<tr>
											<td>
											<input type="hidden" name="type" value="reservation"> 
											<input type="hidden" name="room_id" value="${roomlist.room_id}">
										    <input type="hidden" name="filename" value="${roomlist.filename}">
											<input type="hidden" name="room_name" value="${roomlist.room_name}">
											<input type="hidden" name="room_address1" value="${roomlist.room_address1}">
											<input type="hidden" name="room_address2" value="${roomlist.room_address2}"> 
											<input type="hidden" name="room_num" value="${roomlist.room_num}">
											<input type="hidden" name="room_type_id" value="${roomlist.room_type_id}"> 
											<input type="hidden" name="room_type" value="${roomlist.room_type}"> 
											<input type="hidden" name="cost" value="${roomlist.cost}"> 
											<input type="hidden" name="max_pax" value="${roomlist.max_pax}">
											<input type="hidden" name="room_content" value="${roomlist.room_content}"> 
											<input type="hidden" name="room_theme" value="${roomlist.room_theme }">
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</button>
					</form>
					</div>
				</c:forEach>
		</div>

		<!-- Pagination -->
		<div id="center">
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td colspan="4">
						<ol class="paging">
							<c:choose>
								<c:when test="${pvo.beginPage == 1 }">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="controller?type=search_theme&cPage=${pvo.beginPage - 1 }">이전으로</a>
									</li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="k" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:choose>
									<c:when test="${k == pvo.nowPage }">
										<li class="now">${k }</li>
									</c:when>
									<c:otherwise>
										<li><a href="controller?type=search_theme&cPage=${k }">${k }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="controller?type=search_theme&cPage=${pvo.endPage + 1 }">다음으로</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>