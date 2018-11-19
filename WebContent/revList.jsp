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
	function cancelRes(frm){
		var ok = confirm("정말로 예약을 취소하시겠습니까?");
		if(ok==true){
			frm.action="controller?type=reservationDelete";
			frm.submit();
		} else{
			return;
		}
	}
</script>
</head>

<body>

	   <jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container" style="margin-bottom: 350px; padding-top: 50px;">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<br>
		<br>
	
	
	<form method="POST" id="revTable">
			<div id="revList">
				<table class="table table-striped">
				<tbody>
				
					<c:if test="${empty userReservationvo}">
						<tr>
							<td><h2>예약 내역이 없습니다.</h2></td>
						</tr>
						<tr>
							<td><a href="controller?type=search">예약하러가기</a></td>	
						</tr>
					</c:if>
					
					
					<c:if test="${not empty userReservationvo}">
						<thead>
							<tr>
								<th>이미지</th>
								<th>방이름</th>
								<th>방타입</th>
								<th>방번호</th>
								<th>시작날짜</th>
								<th>끝날짜</th>
								<th>입실예정인원</th>
								<th>합계</th>
								<th>예약취소</th>
							</tr>
						</thead>
						
						<%-- <c:forEach var="i" begin="0" end="1000" step="1">
						<tr>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										 <img id="img" src="imgs/${vo.filename}" alt="${vo.filename}" height="120" width="130">
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										${vo.room_name}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										${vo.room_type}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td style="text-align: center;">
										${vo.room_num}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										${vo.s_date}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										${vo.e_date}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										${vo.pax}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">				
								<c:if test="${status.index == i}">			
									<td>
										${vo.cost}
									</td>
								</c:if>
							</c:forEach>
							<c:forEach var="vo" items="${userReservationvo}" varStatus="status">
								<c:if test="${status.index == i}">
									<td>
										<input type="button" id="revDel" value="삭제" onclick="rev_del()">
									</td>
							</c:if>
							</c:forEach>
						</tr>
						</c:forEach> --%>
						
						
						<c:forEach var="vo" items="${userReservationvo}">
						<tr>		
							<td>
								 <img id="img" src="imgs/${vo.filename}" alt="${vo.filename}" height="120" width="130">
							</td>
							<td>
								${vo.room_name}
							</td>
							<td>
								${vo.room_type}
							</td>
							<td style="text-align: center;">
								${vo.room_num}
							</td>
							<td>
								${vo.s_date}
							</td>
							<td>
								${vo.e_date}
							</td>
							<td>
								${vo.pax}
							</td>
							<td>
								${vo.cost}
							</td>
							<td>
								<c:if test="${vo.day_chk==1 }">
									<form method="get">
									<input type="hidden" name="resId" value="${vo.id}">
									<button type="submit" id="revDel" class="btn btn-danger" onclick="cancelRes(this.form)">예약취소</button>
<!-- 									<input type="button" id="revDel" value="예약취소" onclick="cancelRes(this.form)"> -->
									</form>
								</c:if>
							</td>
						</c:forEach>
					</c:if>
				</tbody>
			 	</table>
			</div>
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
