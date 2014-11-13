<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${vo.title}</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

	$(document).ready(function(){
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
				html: items.join("")
			}).appendTo(target);
		});
	});
</script>
<h1>${vo.title }</h1>
글쓴이 : ${vo.userid }   작성일 : ${vo.regdate }
<br>
<p>${vo.cont }</p>
<br>
<button><a href="uboard?bno=${vo.bno }">수정</a></button>
<button><a href="delete?bno=${vo.bno }">삭제</a></button>

<p>여기 아래부터 덧글</p>
<div class="bbs">
</div>

</body>
</html>