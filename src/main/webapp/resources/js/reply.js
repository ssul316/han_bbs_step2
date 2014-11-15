/**
 * 
 */
function deliveryDelete(num){
	replyDelete(num);
}
function changeForm(num, msg){
	var target = document.getElementById('reply_' + num);
	target.innerHTML ="<div>덧글을 수정해주세요."
		+"<textarea name='cont' rows='1' cols='50'>\"+msg+\"</textarea>"
		+"<input type='hidden' name='rno' value='\"+num+\"'>"
		+"<input type='button' value='수정' onclick='deliveryUpdate(\"+num+\")'>"
		+"</div>"
}
function deliveryUpdate(num1){
	var num = document.reply.reply_+num1.rno.value;
	var msg = document.reply.reply_+num1.cont.value;
	replyUpdate(num, msg);
}