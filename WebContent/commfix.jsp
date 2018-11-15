<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<script type="text/javascript">
	var httpRequest = null;

	// httpRequest 객체 생성
	function getXMLHttpRequest() {
		var httpRequest = null;

		if (window.ActiveXObject) {
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					httpRequest = null;
				}
			}
		} else if (window.XMLHttpRequest) {
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}

	function checkValue() {
		var form = document.forms[0];
		// 전송할 값을 변수에 담는다.    
		var c_id = "${c.id}";
		var comment_content = form.comment_content.value

		if (!comment_content) {
			alert("내용을 입력하세요");
			return false;
		} else {
			var param = "&comm_id=" + c.id + "&comm_content="
					+ comment_content;

			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "controller?type=reply_update_delete&chk=1", true);
			httpRequest.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded;charset=UTF-8');
			httpRequest.send(param);
		}
	}

	function checkFunc() {
		if (httpRequest.readyState == 4) {
			// 결과값을 가져온다.
			var resultText = httpRequest.responseText;
			if (resultText == 1) {
				if (opener != null) {
					// 부모창 새로고침
					window.opener.document.location.reload();
					opener.updateForm = null;
					self.close();
				}
			}
		}
	}
</script>


<body>

	<div id="wrap">
		<br> <b><font size="5" color="gray">댓글수정</font></b>
		<hr size="1" width="550">
		<br>

		<div id="commentUpdateForm">
			<form name="updateInfo" target="parentForm">
				<textarea rows="7" cols="70" name="comment_content">${c.id}</textarea>
				<br> <br> <input type="button" value="등록"
					onclick="checkValue()"> <input type="button" value="창닫기"
					onclick="window.close()">
			</form>
		</div>
	</div>
</body>
</html>