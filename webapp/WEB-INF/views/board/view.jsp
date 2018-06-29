<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>비트교육센터</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
			<div id="board" class="board-form">
				<table class="tbl-ex">
				
					<c:forEach items="${boardView}" var = "vo">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<tr>
						<td class="label">글 번호</td>
						<td>${vo.no }</td>
					</tr>
					<tr>
						<td class="label">제목</td>
						<td>${vo.title }</td>
					</tr>
					<tr>
						<td class="label">이름</td>
						<td>${vo.name }</td>
					</tr>
					<tr style = "height:150px; ">
						<td class="label">내용</td>
						<td>
							<div class="view-content" style = "height:150px; border-collapse:collapse; border:1px solid;">
								${vo.content }
							</div>
						</td>
					</tr>
					</c:forEach>
					
				</table>
				
				<form action="${pageContext.request.contextPath }/comment/write" method = "post">
				
					<table style = "  width:100%; ">
						<tr >
							<th >
								댓글
							</th>
							<td style = "border : solid 1px; border-collapse : collapse;">
								<input type = "text" name = "writer" rows = "5" style = "width:100%; border:0;" ></textarea> 
							</td>
							<td style = "border : solid 1px; border-collapse : collapse;">
								<textarea name = "content" rows = "5" style = "width:100%; border:0;" ></textarea> 
							</td>
							<th>
								<input type = "submit" value = "등록" style = "border : 0px">
							</th>
						</tr>
					</table>
					
					
					<table style = " border : solid 1px; boarder-collapse : collapse; width:100%; ">
						<c:forEach items="${commentList }" var = "comment">
					
						<tr >
							<th >
								${comment.writer }
							</th>
							<td style = "border : solid 1px; border-collapse : collapse;">
								${comment.content }
							</td>
						</tr>
						
						</c:forEach>
					</table>
					
				</form>
				
				<div class="bottom">
					<c:forEach items="${boardView}" var = "vo">
					<a href="${pageContext.request.contextPath }/board/list">글목록</a>
					<a href="${pageContext.request.contextPath }/board/editform?no=${vo.no}">글수정</a>
					</c:forEach>
				</div>
			</div>
		</div>

		<div id="footer">
			<p>(c)opyright 2015,2016,2017</p>
		</div> <!-- /footer -->
	</div>
</body>
</html>