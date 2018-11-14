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


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var file = document.querySelector('#getfile');

	file.onchange = function() {
		var fileList = file.files;

		// 읽기
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);

		//로드 한 후
		reader.onload = function() {
			document.querySelector('#preview').src = reader.result;
		};
	};
</script>

</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">프리미엄 후기 작성</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">프리미엄 후기 작성</li>
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
				<h4>프리미엄 후기 작성</h4>

				<%-- ***[게시글목록]******************--%>

				<div id="container">
					<form action="controller?type=premiumWrite&board_type=4"
						method="post" enctype="multipart/form-data">
						<table>
							<caption>프리미엄 후기 작성란</caption>
							<tbody>
								<tr>
									<th>숙박</th>
									<td><select name="reservation">
											<c:forEach var="usedRes" items="${getUsedResDetail }">
												<option value="${usedRes.id }" size="50">
													${usedRes.room_name} ${userRes.room_type} (${usedRes.s_date }~${usedRes.e_date })
												</option>
											</c:forEach>
									</select>
									<td>
								</tr>
								<tr>
									<th>타이틀</th>
									<td><input type="text" name="title" size="50" title="타이틀">
									</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${uservo.nickname }(${uservo.account })</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><img id="preview" src="" width="100%"
										alt="로컬에 있는 이미지가 보여지는 영역"> <textarea rows="20" cols="40">
						</textarea></td>
								</tr>
								<tr>
									<th>사진첨부</th>
									<td><input multiple="multiple" id="getfile" type="file"
										name="filename[]" accept="image/*" /></td>
								</tr>
							</tbody>
						</table>

					</form>
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
