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
#bbs_view table {
	width: 580px;
	margin-left: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs_view table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs_view table th {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
	width: 30%;
	background-color: lightsteelblue;
}

#bbs_view table td {
	text-align: left;
	border: 1px solid black;
	padding: 4px 10px;
}

#setting {
	margin-left: 10px;
}
</style>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">문의사항</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">문의 사항</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="main.jsp" class="list-group-item">Home</a> <a
						href="controller?type=notice&board_type=1" class="list-group-item">공지사항</a>
					<a href="controller?type=moreQue" class="list-group-item ">자주
						묻는 질문</a> <a href="controller?type=que&board_type=3"
						class="list-group-item  active">문의사항</a> <a
						href="controller?type=premium&board_type=4"
						class="list-group-item">프리미엄 후기</a> <a
						href="controller?type=agree" class="list-group-item">약관 및 동의
						사항</a>


				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h4>문의 사항</h4>
				<!--@@@@@@@@@@@@@@@@@@@@@ 내용 쓰는 곳! start!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!입력하세요 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->



				<div id="que_bbs">

					<table border="1">
						<caption>문 의 사 항</caption>
						<thead>
							<tr class="title">
								<th class="no">번호</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="write_date">작성일</th>
								<th class="read_count">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty quelist}">
									<tr>
										<td colspan="5">
											<h2>현재 등록된 게시글이 없습니다.</h2>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="vo" items="${quelist}">
										<tr>
											<td>${vo.id}</td>
											<td><a
												href="controller?type=queView&board_type=3&id=${vo.id}&quePage=${quePvo.nowPage}">${vo.title}</a></td>
											<td>${vo.nickname}</td>
											<td>${vo.write_date.substring(0, 10)}</td>
											<td>${vo.read_count}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4">
									<ol class="paging">
										<%-- [이전으로]에 대한 사용 여부를 처리 --%>
										<c:choose>
											<%-- 사용불가(disable): 첫번째 블록인 경우에만 --%>
											<c:when test="${quePvo.beginPage < quePvo.pagePerBlock }">
												<%-- <c:when test="${quePvo.beginPage != 1}"> 같은 의미--%>
												<li class="disable">이전으로</li>
											</c:when>
											<%-- 사용가능(enable): 두번재 블록 이상(첫번째만 아닌 경우) --%>
											<c:otherwise>
												<li><a
													href="controller?type=que&board_type=3&quePage=${quePvo.beginPage - 1 }">이전으로</a>
												</li>
											</c:otherwise>
										</c:choose>

										<%-- 블록내에 표시할 페이지 반복처리(시작 페이지 ~ 끝 페이지) --%>
										<c:forEach var="k" begin="${quePvo.beginPage}"
											end="${quePvo.endPage}">
											<c:choose>
												<c:when test="${k == quePvo.nowPage}">
													<li class="now">${k}</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="controller?type=que&board_type=3&quePage=${k}">${k}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<%-- [다음으로]에 대한 사용여부 처리 --%>
										<c:choose>
											<%-- 사용불가(disable): 끝 페이지(endPage) 수가 전체 페이지(totalPage) 수 보다  크거나 같은 경우 --%>
											<c:when test="${quePvo.endPage >= quePvo.totalPage }">
												<li class="disable">다음으로</li>
											</c:when>
											<%-- 사용가능(enable) --%>
											<c:otherwise>
												<li><a
													href="controller?type=que&board_type=3&quePage=${quePvo.endPage + 1 }">다음으로</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ol>
								</td>

								<td><input type="button" value="작성하기"
									onclick="javascript:location.href='controller?type=queWrite&board_type=3&user_id=${uservo.id}'"></td>
							</tr>
						</tfoot>
					</table>
				</div>





				<!--@@@@@@@@@@@@@@@@@@@@@ 내용 쓰는 곳!!!!end!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!입력하세요 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			</div>
			<!-- /.row -->

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
