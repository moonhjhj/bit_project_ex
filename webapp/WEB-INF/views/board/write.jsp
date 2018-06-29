<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>비트교육센터</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
<!-- 
		<div id="header">
			<h1>MySite</h1>
			<ul>
				<li><a href="">로그인</a><li>
				<li><a href="">회원가입</a><li>
				<li><a href="">회원정보수정</a><li>
				<li><a href="">로그아웃</a><li>
				<li>님 안녕하세요 ^^;</li>
			</ul>
		</div>
		
		<div id="navigation">
			<ul>
				<li><a href="">황일영</a></li>
				<li><a href="">방명록</a></li>
				<li><a href="">게시판</a></li>
			</ul>
		</div>
		 -->
		<div id="content">
			<div id="board">
				<form class="board-form" method="post" action="${pageContext.request.contextPath }/board/write">
<!-- 					<input type = "hidden" name = "a" value="write"> -->
					<table class="tbl-ex">
					
						<tr>
							<th colspan="2">글쓰기</th>
							<td><input type="hidden" name="group_no" value="1"></td>
							<td><input type="hidden" name="order_no" value="1"></td>
						</tr>
						
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value=""></td>
						</tr>
						
						<tr>
							<td class="label">작성자</td>
							<td><input type="text" name="name" value=""></td>
						</tr>
						
						<tr>
							<td class="label">내용</td>
							<td>
								<textarea id="content" name="content"></textarea>
							</td>
						</tr>
						
					</table>
					
					<div class="bottom">
						<a href="${pageContext.request.contextPath }/board/list">취소</a>
						<input type="submit" value="등록">
					</div>
					
				</form>				
			</div>
		</div>

		<div id="footer">
			<p>(c)opyright 2015,2016,2017</p>
		</div> <!-- /footer -->
	</div>
</body>
</html>