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

<title>이벤트 게시판</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>
<style type="text/css">
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
   border: 1px solid #dc3454;
   font-weight: bold;
   color: black;
}

.paging li a:hover {
   background-color: #dc3454;
   color: white;
}

.paging .disable {
   padding: 3px 7px;
   border: 1px solid silver;
   color: silver;
}

.paging .now {
   padding: 3px 7px;
   border: 1px solid #dc3454;
   background-color: #dc3454;
   color: white;
   font-weight: bold;
}
#imgsize {
	width: 350px;
	height: 250px;
}
</style>

<body>

  <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">이벤트 게시판</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">Event</li>
		</ol>


		<!-- Blog Post -->
		<div class="card mb-4">
			<c:forEach var="vo" items="${list }">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6">
							<a href="controller?type=event_detail&b_id=${vo.id }"> <img id="imgsize"
								class="img-fluid rounded " src="imgs/${vo.filename} "
								alt="${vo.title }">
							</a>
						</div>
						<div class="col-lg-6">
							<h2 class="card-title">${vo.title }</h2>
							<p class="card-text">${vo.content }</p>
							<a href="controller?type=event_detail&b_id=${vo.id }"
								class="btn btn-danger">상세보기 &rarr;</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>



		<!-- Pagination -->
		<div id="center">
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td colspan="4">
						<ol class="paging">
							<%--[이전으로]에 대한 사용여부 처리 --%>
							<c:choose>
								<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
								<c:when test="${pvo.beginPage == 1 }">
									<li class="disable">Previous</li>
								</c:when>
								<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
								<c:otherwise>
									<li><a
										href="controller?type=event_roomALL&board_type=2&cPage=${pvo.beginPage - 1 }">Previous</a>
									</li>
								</c:otherwise>
							</c:choose>

							<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
							<c:forEach var="k" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:choose>
									<c:when test="${k == pvo.nowPage }">
										<li class="now">${k }</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="controller?type=event_roomALL&board_type=2&cPage=${k }">${k }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<%--[다음으로]에 대한 사용여부 처리 --%>
							<c:choose>
								<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
								<c:when test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">Next</li>
								</c:when>
								<%--사용가능(enable) --%>
								<c:otherwise>
									<li><a
										href="controller?type=event_roomALL&board_type=2&cPage=${pvo.endPage + 1 }">Next</a>
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

	<!-- Footer -->
	 <jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
