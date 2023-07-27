<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>

	<h2>회원가입</h2>

	<form action="join" method="post">
		<div id="content">

			<form class="form_design">

				<hr />

				<ul>
					<li>아이디</li>
					<li><input type="text" maxlength="25" name="id"/></li>
				</ul>
				<ul>
					<li>비밀번호</li>
					<li><input type="password" name="pw" /></li>
				</ul>
				<ul>
					<li>비밀번호 재확인</li>
					<li><input type="password" name="pw" /></li>
				</ul>
				<hr />
				<ul>
					<li>이름</li>
					<li><input type="text" name="name1" /></li>
				</ul>
				주소:<input type="text" name="address"><br />
				MBTI : <select name="mbti">
					<option>ExxP</option>
					<option>ExxJ</option>
					<option>IxxP</option>
					<option>IxxJ</option>
				</select> <br> <input type="date" name="birth"> <input
					type="radio" name="gender" value="m" checked>남자 <input
					type="radio" name="gender" value="f">여자 <input
					type="submit" value="가입">

			</form>
</body>
</body>
</html>