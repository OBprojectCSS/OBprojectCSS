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

<style>
#bbs_modi table {
    width:580px;
    margin-left:10px;
    border:1px solid black;
    border-collapse:collapse;
    font-size:14px;
}
#bbs_modi table caption {
    font-size:20px;
    font-weight:bold;
    margin-bottom:10px;
}
#bbs_modi table th {
    text-align:center;
    border:1px solid black;
    padding:4px 10px;
    width: 30%;
    background-color: lightsteelblue;
}
#bbs_modi table td {
    text-align:left;
    border:1px solid black;
    padding:4px 10px;
}
#setting {
	margin-left: 10px;
}
</style>
<script>
	function save_go() {
	    frm.action = "controller?type=queModi&board_type=3";
	    frm.submit();
	 }
	function list_go() {
	    frm.action = "controller?type=que&board_type=3";
	    frm.submit();
	 }
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h2>문의사항</h2>
	</header>
	<section>
		<nav>
			<ul>
				<li><a href="controller?type=notice&board_type=3">공지사항</a></li>
				<li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
				<li id="li1">문의사항</li>
				<li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
				<li><a href="controller?type=agree">약관 및 동의사항</a></li>
			</ul>
		</nav>

		<article>
			<div id="bbs_modi">
				<form method="post" name="frm">
					<table>
						<caption>문의사항 수정하기</caption>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" value="${Bovo.title }"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><b>${Bovo.nickname}</b></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text" name="content" value="${Bovo.content}"
									style="width:300px; height:50px;"></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" value="수 정 완 료" onclick="save_go()">
									<input type="reset" value="초 기 화">
									<input type="button" value="목  록" onclick="list_go()">
									
									<input type="hidden" name="update_id" value="${Bovo.id}">
									<input type="hidden" name="update_chk" value="chk">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</article>
	</section>
	
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>