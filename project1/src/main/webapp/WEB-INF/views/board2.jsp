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
<link rel="stylesheet" href="./css/board2.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div id="l-container">
		<div id="l-header">
			<img src="./img/login.png" alt="왜 안돼" width="50%">
		</div>
		<div>
			<div id="login">
				<input type="text" id="id" placeholder="아이디"> <br> <input
					type="password" id="pw" placeholder="비밀번호">
				<div id="search">
					<a href="">아이디 찾기 |</a> <a href="">비밀번호 찾기 |</a> <a href="">회원가입</a>
				</div>
				<button class="button" onclick="location.href='login.jsp'">LOGIN</button>
			</div>
		</div>
	</div>
</body>
</html>