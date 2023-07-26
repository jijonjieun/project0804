<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 남겨주삼 불고기</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<script type="text/javascript">
	function linkPage(pageNo){
		location.href = "/board?pageNo="+pageNo;
	}	
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<%-- 길이검사 : ${fn:length(list) } --%>
	<h1>ELLY'S GUEST BOOK</h1>
	<div>
	<c:choose>
	<c:when test="${fn:length(list) gt 0 }">
	<table>
		<tr>
			<th class ="rr1">번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th class ="rr2">좋아요</th>
		</tr>
		<c:forEach items="${list }" var="row">
			<!-- onclick 자바스크립트 페이지 이동, URL?파라미터=값 -->
			<tr onclick="location.href='./detail?bno=${row.bno }'">
				<td class="td1">${row.bno }</td>
				<td class="title">${row.btitle }</td>
				<td class="td1">${row.m_name }</td>
				<td class="td2">${row.bdate }</td>
				<td class="td1">${row.blike }</td>
			</tr>
		</c:forEach>
	</table>
		<br>
	<ui:pagination paginationInfo = "${paginationInfo}"
	type="image"
	jsFunction="linkPage"/>
	 </c:when>
	<c:otherwise>출력할 데이터가 없습니다.</c:otherwise>
	</c:choose>
	<br>
	<div></div>
	<br>
	로그인 한 이름 : ${sessionScope.mname } / ${sessionScope.mid }
	</div>
	<c:if test="${sessionScope.mname ne null}">
	<button onclick="location.href='./write'">글쓰기</button>
	</c:if>
</body>
</html>