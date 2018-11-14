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

<style type="text/css">
#bbs_view table th {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
	background-color: lightsteelblue;
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
</style>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">공지사항</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">공지사항</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="main.jsp" class="list-group-item">Home</a> <a
						href="controller?type=notice&board_type=1"
						class="list-group-item active">공지사항</a> <a
						href="controller?type=moreQue" class="list-group-item">자주 묻는
						질문</a> <a href="controller?type=que&board_type=3"
						class="list-group-item">문의사항</a> <a
						href="controller?type=premium&board_type=4"
						class="list-group-item">프리미엄 후기</a> <a
						href="controller?type=agree" class="list-group-item">약관 및 동의
						사항</a>


				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h4>공지사항</h4>
				<div id="bbs_view">

					<table border="1">
						<thead>
							<tr class="title">
								<th class="no">번호</th>
								<th colspan="2" class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="write_date">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="5">
											<h2>현재 등록된 게시글이 없습니다.</h2>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.id}</td>
											<td colspan="2"><a
												href="controller?type=noticeView&board_type=1&id=${vo.id}&cNoticePage=${noticePvo.nowPage}">${vo.title}</a></td>
											<td><b>관리자(admin)</b></td>
											<td>${vo.write_date.substring(0, 10)}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<ol class="paging">
										<%-- [이전으로]에 대한 사용 여부를 처리 --%>
										<c:choose>
											<%-- 사용불가(disable): 첫번째 블록인 경우에만 --%>
											<c:when
												test="${noticePvo.beginPage < noticePvo.pagePerBlock }">
												<%-- <c:when test="${noticePvo.beginPage != 1}"> 같은 의미--%>
												<li class="disable">이전으로</li>
											</c:when>
											<%-- 사용가능(enable): 두번재 블록 이상(첫번째만 아닌 경우) --%>
											<c:otherwise>
												<li><a
													href="controller?type=notice&board_type=1&cNoticePage=${noticePvo.beginPage - 1 }">이전으로</a>
												</li>
											</c:otherwise>
										</c:choose>

										<%-- 블록내에 표시할 페이지 반복처리(시작 페이지 ~ 끝 페이지) --%>
										<c:forEach var="k" begin="${noticePvo.beginPage}"
											end="${noticePvo.endPage}">
											<c:choose>
												<c:when test="${k == noticePvo.nowPage}">
													<li class="now">${k}</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="controller?type=notice&board_type=1&cNoticePage=${k}">${k}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<%-- [다음으로]에 대한 사용여부 처리 --%>
										<c:choose>
											<%-- 사용불가(disable): 끝 페이지(endPage) 수가 전체 페이지(totalPage) 수 보다  크거나 같은 경우 --%>
											<c:when test="${noticePvo.endPage >= noticePvo.totalPage }">
												<li class="disable">다음으로</li>
											</c:when>
											<%-- 사용가능(enable) --%>
											<c:otherwise>
												<li><a
													href="controller?type=notice&board_type=1&cNoticePage=${noticePvo.endPage + 1 }">다음으로</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ol> <c:if test="${sessionScope.uservo.getAccount() == 'admin' }">
										<input type="button" value="작성하기"
											onclick="javascript:location.href='controller?type=noticeWrite&board_type=1'">
									</c:if> <c:if test="${sessionScope.uservo.getAccount() != 'admin' }">
									</c:if>
						</tfoot>
					</table>
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