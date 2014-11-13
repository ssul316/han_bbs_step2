<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${vo.title}</title>
</head>
<body>
	<h1>${vo.title }</h1>
	글쓴이 : ${vo.userid }   작성일 : ${vo.regdate }
	<br>
	<p>${vo.cont }</p>
	<br>
	<button><a href="uboard?bno=${vo.bno }">수정</a></button>
	<button><a href="delete?bno=${vo.bno }">삭제</a></button>
	
	<form class="replyForm">
		<p>덧글을 작성하세요</p>
		작성자<input type="text" name="userid" value="han00">
		덧글내용<input type="text" name="cont" value="덧글">
		<input type="hidden" name="bno" value=${vo.bno }>
	</form>
		<button class="putReply">리플달긔</button>
	<div class="bbs"></div>
	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script>
		$(document).ready(replyList());
		console.log($(".replyForm").serialize());
	
	    $(".putReply").on("click", replyAction);
		
	    function replyAction(){
	        /* url = "reply/list?bno=" + ${vo.bno} + "&cont=" + document.replyForm.cont.value + "&userid=" + document.replyForm.userid.value; */
	        /* url = "reply/list" + $(".replyForm").serialize();
	        replyList(url); */
	        //var $reply = $("#reply");
	        //var $line = $("#line")
	        var target = $(".bbs");

	        $.post("reply/create", $(".replyForm").serialize(), function(data){
	        	console.log(data);
	        	var items = [];
	        	var content = "";
				$.each(data, function (key, val) {
					console.log(key, val);
					//items.push("<ul><li>"+val.cont+"</li></ul>") // 배열사용
					content += "<ul><li>"+val.cont+"</li></ul>"; // 문자열 사용
					/* items.push("<ul id='" + key + "'>"
						+("<li class=\"bno\">"+val.bno+"</li>")
						+("<li class=\"readtitle\"><a href='read?bno="+val.bno+"'>"+val.title+"</a></li>")
						+("<li class=\"writer\">"+val.userid+"</li>")
						+("<li class=\"writedate\">"+val.regdate+"</li>")
						+("<li class=\"viewcount\">"+val.vcount+"</li>")+"</ul>")   */
				});
				
				// 배열을 사용한 방식은 items.join("")으로 문자열을 만들어주고
				// 문자열을 사용한 방식은 문자열에 계속 붙여주는 방식임. getSql할때 StringBuilder를 사용했던것과 같음
				
				/* $("<div/>", {
					"class": "line",
					html: items.join("")
				}).appendTo(target); */
				// div가 append로 추가됨. 무한덧글할때 사용하면 될듯
 				
				target.html(content);
				// target에 innerHTML로 덮어써주는 방식
	        });
	    }
	
		
		function replyList(){
			var url = "reply/list?bno=" + ${vo.bno};
			var target = $(".bbs");
			$.getJSON(url, function (data) {
				var items = [];
				$.each(data, function (key, val) {
					console.log(key, val);
					items.push("<ul><li>"+val.cont+"</li></ul>")
					/* items.push("<ul id='" + key + "'>"
						+("<li class=\"bno\">"+val.bno+"</li>")
						+("<li class=\"readtitle\"><a href='read?bno="+val.bno+"'>"+val.title+"</a></li>")
						+("<li class=\"writer\">"+val.userid+"</li>")
						+("<li class=\"writedate\">"+val.regdate+"</li>")
						+("<li class=\"viewcount\">"+val.vcount+"</li>")+"</ul>")   */
				});
				$("<div/>", {
					"class": "line",
					html: items.join("")
				}).appendTo(target);
			});
		}
	</script>
</body>
</html>