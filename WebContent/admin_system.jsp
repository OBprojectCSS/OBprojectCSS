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
<script type="text/javascript">
	function admin_system_add_go() {
		document.frm.action = "controller?type=admin_system_add_go";
		document.frm.submit();
	}
	function admin_system_addfile_go() {
		document.frm.action = "controller?type=admin_system_addfile_go";
		document.frm.submit();
	}
	function admin_system_modify_go() {
		document.frm.action = "controller?type=admin_system_modify_go";
		document.frm.submit();
	}
	function admin_system_delete_go() {
		document.frm.action = "controller?type=admin_system_delete_go";
		document.frm.submit();
	}
	function page_back() {
		document.frm.action = "controller?type=main";
		document.frm.submit();
	}
</script>
</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>
	   <br>

	<!-- Page Content -->
	<div class="container">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	
		<form method="post" name="frm">
		<input type="button" value="글쓰기_추가" onclick="admin_system_add_go()">
		<input type="button" value="파일_추가" onclick="admin_system_addfile_go()">
		
		<input type="button" value="글쓰기_수정" onclick="admin_system_modify_go()">
		<input type="button" value="글쓰기 삭제" onclick="admin_system_delete_go()">
		<input type="button" value="목록" onclick="page_back()">
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
