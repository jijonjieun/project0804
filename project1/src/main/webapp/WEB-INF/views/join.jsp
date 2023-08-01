<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>엘리 회원가입</title>

<link href="./css/join.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#idCheck").click(function(){
        let id = $("#id").val();
        if(id=="" || id.length < 5 ) {
            $("#resultMSG").text("아이디는 5글자 이상이어야 합니다.");
            $("#id").focus();
            
        } else {
        	$.ajax({
        		url:"./checkID",
        		type: "post",
        		data: {"id":id}, //checkID?id=poseidon
        		dataType: "html", 		
        		success: function(data) {
        			$("#resultMSG").text("data: " +data);
        		},
        		error: function(request, status, error){
        			$("#resultMSG").text("error: " +error);
        		
        		}
        	});
        	
        	 $("#resultMSG").text("완");
        	 $("#resultMSG").css("color", "green");
        	 
        	
        }
            return false;
       
    });
});

</script>

</head>
<body>
	<%@ include file="menu.jsp"%>


	<div class="member">

		<form action="./join" method="post">

			<div class="field">
				<b>아이디</b> <input type="text" name="id" id="id">
				<button id="idCheck"> 중복검사</button>
				<span id="resultMSG"></span>
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password" name="pw1">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password"
					name="pw2">
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="name">
			</div>

			<div class="field">
				<b>주소</b> <input type="text" name="addr">
			</div>
			<div class="field">
				<b>MBTI</b> <select name="mbti">
					<option value="">선택하세요</option>
					<optgroup label="너 E야?">
						<option value="ESTJ">ESTJ</option>
						<option value="ESTP">ESTP</option>
						<option value="ESFJ">ESFJ</option>
						<option value="ESFP">ESFP</option>
						<option value="ENTJ">ENTJ</option>
						<option value="ENTP">ENTP</option>
						<option value="ENFJ">ENFJ</option>
						<option value="ENFP">ENFP</option>
					</optgroup>
					<optgroup label="너 I야?">
						<option value="ISTJ">ISTJ</option>
						<option value="ISTP">ISTP</option>
						<option value="ISFJ">ISFJ</option>
						<option value="INTJ">INTJ</option>
						<option value="INTP">INTP</option>
						<option value="INFJ">INFJ</option>
						<option value="INFP">INFP</option>
					</optgroup>
				</select>
			</div>
			<div class="field birth">
				<b>생년월일</b>
				<div>
					<input type="date" name="birth">
				</div>
			</div>
			<div class="field gender">
				<b>성별</b>
				<div>
					<label><input type="radio" name="gender" id="m" value="1">남자</label>
					<label><input type="radio" name="gender" id="f" value="0">여자</label>
				</div>
			</div>
			<div class="field submit">
				<input type="submit" value="가입하기">
			</div>
		</form>

		<div class="member-footer">
			<div>
				<a href="#none">이용약관</a> <a href="#none">개인정보처리방침</a> <a
					href="#none">법적고지</a> <a href="#none">고객센터</a>
			</div>
			<span><a href="#none">Copyright © Elly Corp. All Rights
					Reserved.</a></span>
		</div>
	</div>

</body>
</html>