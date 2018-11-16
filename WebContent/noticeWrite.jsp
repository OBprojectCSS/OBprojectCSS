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
// 	function notice_go() {
// 		location.href = "controller?type=notice&board_type=1";
// 	}
</script>
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
            <h4>공지사항 작성하기</h4>
           
           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
           <div id="write">
				<form method="POST">
					<table  class="table table-striped">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" size="45" title="제목">
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><b>관리자(admin)</b></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea name="content" rows="8" cols="80" title="내용"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding-left:330px;">
<!-- 								<input class="btn btn-default" type="reset" value="다시작성"> -->
								<button type="submit" class="btn btn-danger" onclick="sendData()">저장</button>
<!-- 								<input class="btn btn-default" type="submit" value="저장" onclick="sendData()"> -->
<!-- 								<input class="btn btn-default" type="button" value="목록" onclick="notice_go()"> -->
								
								
								<input type="hidden" name="write_chk" value="chk"> 
								<input type="hidden" name="board_type" value="1"> 
								<input type="hidden" name="sysdate" value="sysdate"> 
								<input type="hidden" name="read_count" value="0">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
           
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