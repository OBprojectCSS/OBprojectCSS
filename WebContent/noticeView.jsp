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
<script>
      function modify_go() {
         frm.action = "controller?type=noticeModi&board_type=1&id=${BPVO.id}";
         frm.submit();
      }
      function delete_go() {
         var isDeleteOk = confirm("정말 삭제하시겠습니까?");
         
         if (isDeleteOk) {
            frm.action = "controller?type=noticeDel&board_type=1&id=${BPVO.id}";
            frm.submit();
         } else {
            alert("취소되었습니다.");
         }
      } 
      function list_go() {
         frm.action = "controller?type=notice&board_type=1";
         frm.submit();
      }
      
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
            <h4>공지사항</h4>
            <div id="bbs_view">
               <%-- 게시글 내용 표시 --%>
               <form method="post" name="frm">
                  <table>
                     <tbody>
                        <tr>
                           <th>제목</th>
                           <td>${BPVO.title }</td>
                        </tr>
                        <tr>
                           <th>작성자</th>
                           <td><b>관리자(admin)</b></td>
                        </tr>
                        <tr>
                           <th>내용</th>
                           <td><pre>${BPVO.content}</pre></td>
                        </tr>
                     </tbody>
                  </table>
                  <div id="setting">
                     <br>
                     <c:if test="${sessionScope.uservo.getAccount() == 'admin' }">
                        <input type="button" value="수  정" onclick="modify_go()">
                        <input type="button" value="삭  제" onclick="delete_go()">
                        <input type="button" value="목  록" onclick="list_go()">
                        <input type="hidden" name="delete_chk" value="chk">
                        <input type="hidden" name="delete_id" value="${BPVO.id}">
                     </c:if>
                     <c:if test="${sessionScope.uservo.getAccount() != 'admin' }">
                        <input type="hidden" name="delete_chk" value="chk">
                        <input type="hidden" name="delete_id" value="${BPVO.id}">
                     </c:if>
                  </div>
               </form>
            </div>




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