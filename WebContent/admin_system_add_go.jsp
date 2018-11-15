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
<script>
	function save_go(frm) {
		//frm.action = "write_ok.jsp";
		frm.action = "controller?type=admin_system";
		frm.submit();
	}
</script>

</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>
	   <br>

	<!-- Page Content -->
	<div class="container">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	
	<h2>관리자: 게시판별 추가 페이지</h2>
<hr>

<p><a href="controller?type=main">메인으로 가기</a></p>
<form method="post">

<%-- <p>${uservo}
</p>
<hr>
<p>${userboardtotalList}</p> --%>
<table>


		<tbody>
		
			<tr>
				<th>USER_ID</th>
				<td>
					<input type="text" name="user_id" value="${uservo.id } "readonly> 관리자 1
				</td>
			</tr>
			<tr>
				<th>BOARD_TYPE</th>
				<td>
				<input type="radio" name="board_type" value="0">구분없음
				<input type="radio" name="board_type" value="1">공지사항
			<input type="radio" name="board_type" value="2">이벤트
			<input type="radio" name="board_type" value="3">방명록
			<input type="radio" name="board_type" value="4">프리미엄후기
<!-- 			(0:잘못된값/1:공지사항/2:이벤트/3:방명록/4:ex-프리미엄후기 ) -->
				</td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td>
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60"></textarea>
				</td>
			</tr>
				<tr>
				<th>WRITE_DATE</th>
				<td><input type="text" name="write_date" value="작성일(SYSDATE)"></td>
			</tr>
				<tr>
				<th>READ_COUNT</th>
				<td><input type="text" name="read_count" value="0">초기값 0</td>
			</tr>		
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저 장"
						onclick="save_go(this.form)">
					<input type="reset" value="초기화">
					
					<input type="hidden" name="type" value="admin_system">
					<!-- write요청 구분값 -->
					<input type="hidden" name="chk" value="chk">
				</td>
			</tr>
		</tfoot>	

</table>
</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	 <jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
