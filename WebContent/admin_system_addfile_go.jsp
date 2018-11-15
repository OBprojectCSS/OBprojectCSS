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
	function sendData() {
		var firstForm = document.forms[0];
		for (var i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3)
					continue; //파일항목
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	function list_go() {
		location.href = "controller?type=admin_add_file";
	}
</script>
</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	
	<!-- 	ID BOARD_ID FILENAME SAVED_FILENAME FILESIZE -->
	<div id="add file">
		<form action="controller?type=admin_add_file" method="post"
			enctype="multipart/form-data">

			----등록할수 있는----
			<table border="1">
				<caption>파일첨부</caption>
				<tr>
					<th>게시물 id</th>
					<th>첨부파일</th>
				</tr>
				<tr>
					<td><select name="board_id">
							<c:forEach var="list" items="${userboardtotalList}">
								<option value="${list.id }">${list.id }</option>
							</c:forEach>
					</select></td>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
						<td colspan="2"><input type="button" value="저장"
							onclick="sendData()"> <input type="reset" value="다시작성">
							<input type="button" value="목록" onclick="list_go()"></td>
					</tr>
						
					
				
				
			</table>





		
		</form>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
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
