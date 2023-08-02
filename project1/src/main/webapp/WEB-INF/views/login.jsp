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
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	//스크립트 영역
	//전역변수
	let text = "<p>올바른 아이디를 입력하세요.</p>";

	function checkID() {
		//		alert("!");   
		let msg = document.getElementById("msg"); //지역변수
		msg.innerHTML += "<p>" + document.getElementById("id").value
				+ "아이디를 변경했습니다.</p>"
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
	//jquery
	$(function() {
		$(".button").click(function() {

			let id = $('#id').val();
			let pw = $('#pw').val();

			if (id.length < 5) {
				alert("아이디를 입력하세요.");
				$("#id").focus();
			}
			if (pw.length < 5) {
				alert("암호를 입력하세요.");
				$("#pw").focus();

			} else {
				// 아이디하고 암호하고 정확하게 입력되었습니다.
				let form = $("<form></form>");
				form.attr("method", "post");
				form.attr("action", "./login");

				form.append($("<input/>", {
					type : 'hidden',
					name : 'id',
					value : id
				}));
				form.append($("<input/>", {
					type : 'hidden',
					name : 'pw',
					value : pw
				}));

				form.appendTo("body");
				form.submit();
			}
		});
	});
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
				<form action="./login" method="post" onsubmit="return check()"></form>
				<input type="text" id="id" name="id" placeholder="ID"
					required="required" maxlength="10" onchange="checkID()"> <br>
				<input type="password" id="pw" name="pw" placeholder="PW"
					required="required">
				<div id="search">
					<a href="">아이디 찾기 |</a> <a href="">비밀번호 찾기 |</a> <a href="./join">회원가입</a>
				</div>
				<button type="submit" class="button">LOGIN</button>
				<span id="msg"></span>

			</div>
		</div>
	</div>
</body>
</html>