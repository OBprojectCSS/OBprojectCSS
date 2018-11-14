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

<body>



	<!-- Page Content -->
	<div class="container">


		<div class="col">
			<form method="post">
				<c:forEach var="roomlist" items="${getRoomimp }">
					<div class="col-lg-8 portfolio-item">
						<div class="card h-100">
							<a
								href="controller?type=reservation&room_id=${roomlist.room_id }"><img
								class="card-img-top" src="imgs/${roomlist.filename}" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a
										href="controller?type=reservation&room_id=${roomlist.room_id }">${roomlist.room_name }</a>
								</h4>

								<table class="card-text" border="1">
									<tr>
										<th style="width: 23%">위치</th>
										<th style="width: 10%;">방번호</th>
										<th style="width: 10%;">타입</th>
										<th style="width: 15%;">하루 숙박요금</th>
										<th style="width: 15%;">수용인원</th>
										<th style="width: 30%;">간단 설명</th>
										<th style="width: 13%;">테마</th>
									</tr>
									<tr>
										<td>${roomlist.room_address1 }${roomlist.room_address2 }</td>
										<td>${roomlist.room_num }</td>
										<td>${roomlist.room_type }</td>
										<td>${roomlist.cost }원</td>
										<td>${roomlist.max_pax }명</td>
										<td>${roomlist.room_content }</td>
										<td>${roomlist.room_theme }</td>
									</tr>
								</table>
								<input type="button" value="예약하기"
									onclick="controller?type=reservation&room_id=${roomlist.room_id }">
								<input type="hidden" name="room_id" value="${roomlist.room_id}">
								<input type="hidden" name="room_type_id"
									value="${roomlist.room_type_id}"> <input type="hidden"
									name="room_name" value="${roomlist.room_name}"> <input
									type="hidden" name="room_num" value="${roomlist.room_num}">
								<input type="hidden" name="room_content"
									value="${roomlist.room_content}"> <input type="hidden"
									name="room_address1" value="${roomlist.room_address1}">
								<input type="hidden" name="room_address2"
									value="${roomlist.room_address2}"> <input type="hidden"
									name="room_theme" value="${roomlist.room_theme }">


							</div>
						</div>
					</div>

				</c:forEach>
			</form>
		</div>
		<!-- /.row -->


		<!-- Pagination -->
		<ul class="pagination justify-content-center">

			<%--[이전으로]에 대한 사용여부 처리 --%>
			<c:choose>
				<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
				<c:when test="${pvo.beginPage == 1 }">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
				</c:when>
				<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="controller?type=search_list&cPage=${pvo.beginPage - 1 }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
				</c:otherwise>
			</c:choose>

			<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
			<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li><a href="controller?type=search_list&cPage=${k }">${k }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%--[다음으로]에 대한 사용여부 처리 --%>
			<c:choose>
				<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
				<c:when test="${pvo.endPage >= pvo.totalPage }">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</c:when>
				<%--사용가능(enable) --%>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="controller?type=search_list&cPage=${pvo.endPage + 1 }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</c:otherwise>
			</c:choose>
		</ul>

	</div>
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
