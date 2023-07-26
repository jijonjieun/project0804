<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<script type="text/javascript">
	//스크립트 영역
	//전역변수
	let text = "<p>올바른 아이디를 입력하세요.</p>";

	function checkID() {
		//		alert("!");   
		let msg = document.getElementById("msg"); //지역변수
		msg.innerHTML += "<p>" +  document.getElementById("id").value + "아이디를 변경했습니다.</p>"
	}
	function check() {
		let msg = document.getElementById("msg");
		let id = document.getElementById("id");
		if (id.value.length < 4) {
			alert("아이디는 4글자 이상이어야 합니다.");
		msg.innerHTML = text;
			id.focus();
		return false;
		}
	}

	function check() {
		// alert("!");   
			let msg = document.getElementById("msg");
		let pw = document.getElementById("pw");
		if (pw.value.length < 2) {
			alert("패스워드는 2글자 이상이어야 합니다.");
			pw.focus();
		return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div id="l-container">
		<div id="l-header">
			<img src="./img/login.png" alt="왜 안돼" width="50%">
		</div>
		<div>
			<div id="login">
				<form action="./login" method="post" onsubmit="return check()">
					<input type="text" id="id" name="id" placeholder="ID"
						required="required" maxlength="10" onchange="checkID()"> <br>
					<input type="password" id="pw" name="pw" placeholder="PW"
						required="required">
					<div id="search">
						<a href="">아이디 찾기 |</a> <a href="">비밀번호 찾기 |</a> <a href="">회원가입</a>
					</div>
					<button type="submit" class="button" >LOGIN</button>
					<span id="msg"></span>
				</form>
			</div>
		</div>
	</div>
</body>
</html>