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

<title>약관 및 동의사항</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		$(".card-header").click(function() {
			var myparent = $(this).parent();
			$(".card-body", myparent).each(function() {
				$(this).toggle();
			});
		});
	});
</script>

</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">자주 묻는 질문</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
			<li class="breadcrumb-item active">자주 묻는 질문</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="main.jsp" class="list-group-item">Home</a> <a
						href="controller?type=notice&board_type=1"
						class="list-group-item ">공지사항</a> <a
						href="controller?type=moreQue" class="list-group-item active">자주 묻는
						질문</a> <a href="controller?type=que&board_type=3"
						class="list-group-item">문의사항</a> <a
						href="controller?type=premium&board_type=4"
						class="list-group-item">프리미엄 후기</a> <a
						href="controller?type=agree" class="list-group-item">약관
						및 동의 사항</a>


				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h4>자주 묻는 질문(FAQ)</h4>
				<!-- -------------------------------------------------------------------- -->


	<div class="container">

		<div class="mb-4" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="card">
				<div class="card-header" role="tab" id="headingOne">
					<h5 class="mb-0">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">회원가입은 어떻게 하나요?</a>
					</h5>
				</div>

				<div id="collapseOne" class="collapse show" role="tabpanel"
					aria-labelledby="headingOne">
					<div class="card-body" style="display: none">
<pre>
아래 방법을 통해 간단하게 무료 회원가입하시면 바로 이용이 가능합니다.
Step1. 우측 상단 로그인 클릭
Step2. 회원가입
Step3. 약관 및 동의에 동의
Step4. 회원가입 폼 작성 후 로그인
중복 가입이 가능하지만, 여러 회원계정 간의 포인트나 사용기록의 통합은 불가능합니다.
</pre>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header" role="tab" id="headingTwo">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">회원정보 수정은 어떻게 하나요?</a>
					</h5>
				</div>
				
				
				<div id="collapseTwo" class="collapse" role="tabpanel"
					aria-labelledby="headingTwo">
					<div class="card-body" style="display: none">
<pre>
마이페이지 > 내 정보수정 관리에서 회원정보를 수정할 수 있습니다.
회원 아이디는 수정이 불가능하며 다른 정보는 언제든지 수정이 가능합니다.
궁금하신 사항은 고객행복센터 02)1234-5678로 연락 주시면 감사하겠습니다. 
</pre>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header" role="tab" id="headingThree">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">비회원도 예약 가능한가요?</a>
					</h5>
				</div>
				
				
				<div id="collapseThree" class="collapse" role="tabpanel"
					aria-labelledby="headingThree">
					<div class="card-body" style="display: none">
<pre>
나랑놀자 회원이 아니시면 예약 및 모든 서비스에 제한됩니다.
간단한 회원 가입으로 나랑놀자에서 제공하는 모든 서비스를 이용하시기 바랍니다.
회원 가입은 무료! 서비스는 최상!
</pre>
				</div>
			</div>
		</div>
		
			<div class="card">
				<div class="card-header" role="tab" id="headingFour">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">예약은 어떻게 해야되나요?</a>
					</h5>
				</div>
				
				
				<div id="collapseFour" class="collapse" role="tabpanel"
					aria-labelledby="headingFour">
					<div class="card-body" style="display: none">
<pre>
비회원이시면 무료의 간단한 회원 가입 절차를 거쳐 로그인 하시고
상단의 전체 검색에서 지역별 또는 테마별로 고객님 마음에 드시는 호텔 및 모텔을 선택하시면
보다 손쉽게 예약하실 수 있습니다.
</pre>
				</div>
			</div>
		</div>
		
			<div class="card">
				<div class="card-header" role="tab" id="headingFive">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">당일 예약도 가능한가요?</a>
					</h5>
				</div>
				<div id="collapseFive" class="collapse" role="tabpanel"
					aria-labelledby="headingFive">
					<div class="card-body" style="display: none">
<pre>
당일 예약만 아니라면 모든 호텔 및 모텔의 예약 서비스를 이용하실 수 있습니다.
급하게 당일 예약이 필요하시다면 고객행복센터 02)1234-5678로 연락 주시면 친절히 안내해 드리겠습니다. 
</pre>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header" role="tab" id="headingSix">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseSix"
							aria-expanded="false" aria-controls="collapseSix">미성년자도 예약이 가능한가요?</a>
					</h5>
				</div>
				<div id="collapseSix" class="collapse" role="tabpanel"
					aria-labelledby="headingSix">
					<div class="card-body" style="display: none">
<pre>
나랑놀자의 모든 예약 시스템은 성인 전용으로 구성되어 있습니다.
만 19세 이하의 미성년자는 청소년 보호법에 의거하여 숙박업소 출입/고용이 불가능하며,
숙박시설 이용에 제한이 있을 수 있습니다.
미성년자 예약으로 인해 발생하는 입실 거부에 대해서는 취소나 환불이 불가하오니, 예약 진행 전 반드시
숙소에 확인해 주시기 바랍니다.
</pre>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header" role="tab" id="headingSeven">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseSeven"
							aria-expanded="false" aria-controls="collapseSeven">어제까지 봤던 숙소 정보를 찾을 수 없어요.</a>
					</h5>
				</div>
				<div id="collapseSeven" class="collapse" role="tabpanel"
					aria-labelledby="headingSeven">
					<div class="card-body" style="display: none">
<pre>
숙소 사정에 의해 제휴가 종료될 경우, 해당 숙소의 정보가 확인되지 않습니다.
추후 다시 제휴가 진행되면 숙소 정보 확인이 가능한 점 이용에 참고 부탁드립니다.
</pre>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->


			<!-- // 본문 콘텐츠-->

				<!-- -------------------------------------------------------------------- -->
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
