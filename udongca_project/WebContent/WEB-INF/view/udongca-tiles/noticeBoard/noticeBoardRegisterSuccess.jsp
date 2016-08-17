<%@ page contentType="text/html;charset=utf-8"%>
<script>
$(document).ready(function(){
	
$("#notice").prop("class","active");
$(".dropdown-toggle").html("공지사항<span class='caret'></span>");
});
</script>
<div align="center"><h2>공지가 성공적으로 등록되었습니다!</h2></div>
<div align="center" style="padding:30px;">
	<a href="/udongca_project/noticeBoard/noticeBoardListPaging.udc"><input type="button" value="공지목록"></a>
	<a href="/udongca_project/main.udc"><input type="button" value="메인페이지"></a>
</div>