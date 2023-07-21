<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<nav>
	<ul>
		<li onclick="link('')">메인</li>
		<li onclick="link('board')">게시판</li>
		<li onclick="link('board2')">게시판2</li>
		<li onclick="link('mooni')">문의사항</li>
		<li onclick="link('notice')">공지</li> 

		<c:choose>
			<c:when test="${sessionScope.mname eq null}">
				<li id="inout1" onclick="link('login')">로그인</li>
			</c:when>
			<c:otherwise>
				<li id="inout2" onclick="link('logout')">로그아웃</li>
				<li id="hello" onclick="link('myinfo')">${sessionScope.mname }(${sessionScope.mid })님
					반갑습니다</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<div style="height: 50px; width: 100%;"></div>
<script>
	function link(url) {
		location.href = "./" + url;
	}
</script>