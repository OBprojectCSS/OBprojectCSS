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

<script>
	function sendData(frm) {
		frm.action = "controller?type=queWrite&board_type=3";
		frm.submit();
	}
	function que_go(frm) {
		frm.action = "controller?type=que&board_type=3";
		frm.submit();
	}
</script>
</head>

<body>

   <jsp:include page="header.jsp"></jsp:include>

   <!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">문의사항</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">문의사항</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="main.jsp" class="list-group-item">Home</a> 
					<a href="controller?type=notice&board_type=1" class="list-group-item">공지사항</a>
					<a href="controller?type=moreQue" class="list-group-item">자주 묻는 질문</a> 
					<a href="controller?type=que&board_type=3" class="list-group-item active">문의사항</a>
					<a href="controller?type=premium&board_type=4" class="list-group-item">프리미엄 후기</a> 
					<a href="controller?type=agree" class="list-group-item">약관 및 동의 사항</a>

				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h4>문의사항 작성하기</h4>

				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
				<div id="write">
					<form method="POST">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" size="45" title="제목">
									</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td><b>${uservo.nickname}</b></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea
											placeholder="문의 사항 작성 시 문의하실 사항을 선택하여 기입해주세요. 1.회원가입문의 / 2.로그인관련문의 / 3.예약관련문의 / 4.기타문의"
											name="content" rows="10" cols="50"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" style="padding-left:330px;">
									<button type="submit" class="btn btn-danger" onclick="sendData(this.form)">저장</button>
									<button type="submit" class="btn btn-danger" onclick="que_go(this.form)">취소</button>
<!-- 									<input type="button" value="저 장" onclick="sendData(this.form)">  -->
<!-- 									<input type="reset" value="다시작성">  -->
<!-- 									<input type="button" value="돌아가기" onclick="que_go(this.form)">  -->
									<input type="hidden" name="write_chk" id="chk"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>


