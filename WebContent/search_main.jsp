<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>나랑 놀자-로그인페이지</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


</head>
<style>
.btn-group .button {
	background-color: #dc3544; /* Green */ /* #dc3545 */
	border: 1px solid white;
	color: white;
    margin-left:33%; 
 	padding: 50px 100px 50px 100px ; 
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 30px;
	cursor: pointer;
	float: left;
	
}

.btn-group .button:hover {
	background-color: #a71d29;/* #3e8e41 */ 
	border-color: white;
}
</style>

<script>
	var obj = new Array();

	<c:forEach var="si_gu" items="${addressList}">
	var si = "${si_gu.room_address1 }";
	var gu = "${si_gu.room_address2}";
	var array = [ si, gu ];
	obj.push(array);
	</c:forEach>
	//alert(obj);
	//console.log(obj);
	$(document).ready(function() {
		$("#show1").click(function() {
			$("#one").css("display", "block");
			$("#two").css("display", "none");

			$("#one").css("background-color", "#e04b58");//빨
			$("#show1").css("background-color", "#e04b58");//빨
		});
		$("#show2").click(function() {
			$("#two").css("display", "block");
			$("#one").css("display", "none");
			$("#two").css("background-color", "#e04b58");//피
			$("#show2").css("background-color", "#e04b58");//파

		});

	});
</script>
<script>
	function search_go(frm) {
		frm.action = "controller?type=search_list";
		frm.submit();
	}
	function search_theme(frm) {
		frm.action = "controller?type=search_theme";
		frm.submit();
	}
	function showSecond(self) {
		console.log(self);
		var result = "<div>";
		for (var i = 0; i < obj.length; i++) {
			if (obj[i][0] == self.value) {
				//alert(obj[i][1]);
				console.log("check : " + obj[i][1]);
				result += "<input type = 'radio' name = 'chk_gu' value = '"+obj[i][1]+"'>"
						+ obj[i][1] + "</input>";
			}
		}
		result += "</div>";
		var temp = document.getElementById("secondRadio");
		//alert(temp);
		temp.innerHTML = result;

		console.log(result);

	}
</script>


<body>


  <jsp:include page="header.jsp"></jsp:include>
  <br>
  
	<!-- Page Content -->
	<div class="wwrap" style="margin:3% 1% 20% ;">

		<!------------------------------------------------------------------  -->

		<div class="btn-group">
			<button class="button" id="show1">지역별</button>
			<button class="button" id="show2">테마별</button>
		</div>
		<form method="post">
			<div id="one" style="display: none;margin:0% 15%;color: white">
				<c:forEach var="si" items="${si}">
					<input type="radio" name="chk_si" value="${si }" 
						onclick="showSecond(this)">${si }	&nbsp;					
			</c:forEach>
				<hr>
				<div id="secondRadio" style="color: white;"></div>

				<input type="button" value="조 회" onclick="search_go(this.form)">
			</div>
		</form>

		<form method="post">
			<div id="two" style="display: none ;margin:0% 15%;color: white;" >
				<c:forEach var="theme" items="${theme}">
					<input type="radio" id="chk_theme" name="chk_theme"
						value="${theme }">${theme }		
						&nbsp; 
			</c:forEach>
				<input type="button" value="조 회" onclick="search_theme(this.form)">
			</div>
		</form>
		<!------------------------------------------------------------------  -->



	</div>
	<!-- /.row -->
	<c:if test="${not empty getRoomimp}">
		<jsp:include page="search_list.jsp"></jsp:include>

	</c:if>
	<c:if test="${not empty getRoomthemeimp}">
		<jsp:include page="search_themelist.jsp"></jsp:include>

	</c:if>


	<!-- /.container -->

	<!-- Footer -->

	 

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>
