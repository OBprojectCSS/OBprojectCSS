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

<title>문의사항</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">	</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".hhhh").click(function() {

			var myparent = $(this).parent();
			$(".ori", myparent).each(function() {
				$(this).css("display", "none");
			});
			$(".new", myparent).each(function() {
				$(this).css("display", "block");
			});

		});

	});
</script>
<script>
	function modify_go(frm) {
		frm.action = "controller?type=queModi&board_type=3&id=${Bovo.id}";
		frm.submit();
	}

	function delete_go(frm) {
		var isDeleteOk = confirm("정말 삭제하시겠습니까?");

		if (isDeleteOk) {
			frm.action = "controller?type=queDel&board_type=3&id=${Bovo.id}";
			frm.submit();
		} else {
			alert("취소되었습니다.");
		}
	}

	function view_go(frm) {
		frm.action = "controller?type=que&board_type=3";
		frm.submit();
	}

	function sendData_go(frm) {
		frm.action = "controller?type=queComments";
		frm.submit();
	}
	
	function reply_update_go(frm) {
		var answer = confirm("댓글을 수정 하시겠습니까?");
		if (answer) {
			frm.action = "controller?type=reply_update_delete&chk=1";
			frm.submit();
		} else {

		}

	}

	function reply_delete_go(frm) {
		var answer = confirm("댓글을 삭제 하시겠습니까?");
		if (answer) {
			frm.action = "controller?type=reply_update_delete&chk=2";
			frm.submit();
		} else {
			return;
		}
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
						class="list-group-item  active">문의사항</a> <!-- <a
						href="controller?type=premium&board_type=4"
						class="list-group-item">프리미엄 후기</a> --> <a
						href="controller?type=agree" class="list-group-item">약관 및 동의
						사항</a>
				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h4>문의사항</h4>
				<!--@@@@@@@@@@@@@@@@@@@@@ 내용 쓰는 곳! start!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!입력하세요 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


				<div id="bbs_view">
					<form method="post" name="frm">

						<table class="table table-striped">
							<tbody>
								<tr>
									<th>제목</th>
									<td>${Bovo.title }</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${Bovo.nickname}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${Bovo.tel}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${Bovo.email}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><pre>${Bovo.content}</pre></td>
								</tr>
								<tr>
									<td colspan="5" style="padding-left: 320px;">
									<c:if test="${writer_chk==1}">
									<button type="submit" class="btn btn-danger" onclick="modify_go(this.form)">수정</button>
									<button type="submit" class="btn btn-danger" onclick="delete_go(this.form)">삭제</button>
<!-- 									<input type="button" value="수  정" onclick="modify_go(this.form)">  -->
<!-- 									<input type="button" value="삭  제" onclick="delete_go(this.form)">  -->
									</c:if>
<!-- 									<input type="button" value="목  록" onclick="view_go(this.form)"> -->
									<input type="hidden" name="delete_chk" value="chk"> 
									<input type="hidden" name="delete_id" value="${Bovo.id}"></td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
					<%-- 댓글입력 폼 --%>

					<c:if test="${not empty uservo}">
						<form method="post">
							<p>작성자 : ${uservo.nickname }(${uservo.account })</p>
							<p>
								내용 :
								<textarea class="form-control" name="content" rows="2" cols="50" placeholder="댓글쓰기"></textarea>
								<div>
								<button type="submit" class="btn btn-danger btn-lg btn-block" onclick="sendData_go(this.form)">저장</button>
<!-- 								<button type="submit" class="btn btn-danger" onclick="sendData_go(this.form)">저장하기</button> -->
<!-- 								<input type="submit" value="댓글저장" onclick="sendData_go(this.form)">  -->
								
								<input type="hidden" name="board_id" value="${Bovo.id}"> 
								<input type="hidden" name="user_id" value="${uservo.id}"> 
								<input type="hidden" name="writer" value="${uservo.nickname }(${uservo.account })">
								<input type="hidden" name="quePage" value="${quePage}">
								</div>
						</form>
					</c:if>
					<hr>

					<%-- 댓글창 출력 --%>
					<c:forEach var="c" items="${c_list}">
						<form method="post">


							<div class="one">
								<p>작성자: ${c.writer }</p>

								<p class="ori">내용: ${c.content }</p>
								<p class="new" style="display: none">내용:<br>
									<textarea name="comm_content" rows="2" cols="50"
										placeholder="${c.content }"></textarea>
									<input type="button" value="고치기"
										onclick="reply_update_go(this.form)">

								</p>
								<p>작성일: ${c.write_date }</p>
							</div>



							<input type="hidden" name="comm_id" value="${c.id}"> <input
								type="hidden" name="comm_board_id" value="${c.board_id}">
							<input type="hidden" name="comm_user_id" value="${c.user_id}">
							<input type="hidden" name="quePage" value="${quePage}">
							<!-- <input type="button" value="수  정" onclick="reply_update_go(this.form)"> -->

							<c:if test="${uservo.id == c.user_id }">
								
								<button type="submit" class="btn btn-danger" onclick="reply_update_go(this.form)">수정</button>
								<button type="submit" class="btn btn-danger" onclick="reply_delete_go(this.form)">삭제</button>
<!--  								<input type="button" value="수  정" class="hhhh"> -->
<!--  								<input type="button" value="삭  제" onclick="reply_delete_go(this.form)"> -->
							</c:if>

						</form>
						<hr>
					</c:forEach>

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
