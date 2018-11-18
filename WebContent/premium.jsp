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

<link href="./css/premium.css" rel="stylesheet" type="text/css">   <!--프리미엄 css 따로  -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		console.log("${chk}");
		if ("${chk}" == "0") {
			alert("로그인 후 이용해 주시기 바랍니다.");
			location.href = "controller?type=login";
		} else if ("${chk}" == "1") {
			alert("숙소를 이용한 사용자만 후기 작성이 가능합니다.");
		} else if ("${chk}" == "2") {
			alert("숙소를 이용한 사용자만 후기 작성이 가능합니다.");
		} else if ("${chk}" == "-1") {
			alert("[ERROR] 다시 시도해 주십시오.");
		}
	})
</script>

</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">프리미엄 후기</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">프리미엄 후기</li>
		</ol>

		<!-- Content Row -->
		<div class="row" style="padding-bottom: 120px;">
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
				<h4>프리미엄 후기</h4>

				<%-- ***[게시글목록]******************--%>
				<div id="container">
					<ul>
						<c:if test="${not empty pPageList }">
							<c:forEach var="p" items="${pPageList }">
								<li id="pcontentLi">
									<div id="pcontentDiv">
										<a id="pImg"
											href="controller?type=premiumOne&board_type=4&cPremPage=${premPvo.nowPage }&pId=${p.id }"><img
											src="" alt="썸네일이미지"></a> <a id="pTitle"
											href="controller?type=premiumOne&board_type=4&cPremPage=${premPvo.nowPage }&pId=${p.id }"><p>${p.title }</p></a>
										<div id="pcontentInfo">
											<span id="pWriter">${p.nickname }(${p.account })</span><br>
											<span id="pUsedate">숙박기간 : ${p.s_date } ~ ${p.e_date }</span><br>

											<span id="pTag">#태그1 #태그2 #태그3</span><br> <span
												id="pRegdate">작성일 : ${p.write_date }</span><br>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if>

						<c:if test="${empty pPageList }">
							<li>
								<h1>작성된 프리미엄 후기가 없습니다.</h1>
							</li>
						</c:if>
					</ul>
				</div>

				<%-- ***[버튼란]******************--%>
				<table id="buttons">
					<tr>
						<td></td>
						<td id="pages" colspan="3">
							<ol class="paging">
								<%--[이전으로]에 대한 사용여부 처리  --%>
								<c:choose>
									<%-- 사용불가(disalbe) : 첫번째 블록인 경우 --%>
									<c:when test="${premPvo.beginPage == 1}">
									</c:when>
									<%--사용가능(enable) : 두번째 이상(첫번째가 아닌 경우) --%>
									<c:otherwise>
										<li><a
											href="controller?type=premium&board_type=4&cPremPage=1">◀◀</a>
										</li>
										<li><a
											href="controller?type=premium&board_type=4&cPremPage=${premPvo.beginPage - 1 }">◀</a>
										</li>
									</c:otherwise>
								</c:choose>


								<%-- 블록 내에 표시할 페이지 반복처리 --%>
								<%-- 현재블록 시작페이지~ 끝페이지 표시 --%>
								<c:forEach var="k" begin="${premPvo.beginPage}"
									end="${premPvo.endPage }">
									<c:choose>
										<c:when test="${k == premPvo.nowPage }">
											<li class="now">${k}</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="controller?type=premium&board_type=4&cPremPage=${k}">${k}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--[다음으로]에 대한 사용여부 처리 --%>
								<c:choose>
									<%--사용불가(disable) : endPage가 totalPage 보다  크거나 같으면 --%>
									<c:when test="${premPvo.endPage >= premPvo.totalPage }">
									</c:when>
									<%--사용가능(enable) --%>
									<c:otherwise>
										<li><a
											href="controller?type=premium&board_type=4&cPremPage=${premPvo.endPage + 1 }">▶</a>
										</li>
										<li><a
											href="controller?type=premium&board_type=4&cPremPage=${premPvo.totalPage}">▶▶</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>
						<td id="writeButtonTd"><a id="writeButton"
							href="controller?type=premiumWriteRightChk&board_type=4&writeChk=1")>글쓰기</a>
						</td>
					</tr>
				</table>
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
