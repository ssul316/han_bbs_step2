<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록</title>
</head>
<h1>게시글을 작성해 주세요</h1>

<form action="/bbs/create">
	글 제목<input type="text" name="title"><br>
	작성자<input type="text" name="userid"><br>
	본문<textarea rows="3" cols="50" name="cont"></textarea><br>
	<input type="submit" value="전송">
</form>
<body>

</body>
</html>