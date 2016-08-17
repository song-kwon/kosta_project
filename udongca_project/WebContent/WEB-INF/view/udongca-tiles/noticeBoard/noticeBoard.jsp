<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
table{
	border-collapse: collapse;
	text-align:left;
	font-size:15px;
}

tr#tr{
	height:40px;
}

.table{
	border:1px solid;
}

.table > tbody > tr > td{
  border-top: 1px solid black;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
		
		$("#notice").prop("class","active");
		$(".dropdown-toggle").html("공지사항<span class='caret'></span>");

	$("#deleteBtn").on("click",function(){
		var result = confirm("해당 게시물을 삭제하시겠습니까?");		
		if(result==true){
			location.replace("/udongca_project/noticeBoard/deleteNoticeBoard.udc?noticeNo=${requestScope.noticeBoard.noticeNo}");
		}
	});
});
</script>

<div><h1>공지 사항</h1></div>
<table class="table">
	<tr id="tr">
		<td class="col-sm-9" style="font-weight:bold;">[${requestScope.noticeBoard.category }]&nbsp${requestScope.noticeBoard.noticeTitle }</td>
		<td class="col-sm-3" align="right">작성일 : ${requestScope.noticeBoard.noticeDate }</td>
	</tr>
	<tr>
		<td colspan="2" style="width:100%; height:300px;">${requestScope.noticeBoard.noticeContent }</td>
	</tr>
</table>
<div align="center" style="padding-bottom:30px;">
	<c:if test="${sessionScope.login.memberId=='udongca' }">
		<a href="/udongca_project/noticeBoard/modifyNoticeBoardform.udc?noticeNo=${requestScope.noticeBoard.noticeNo}&codeType=notice_type"><input type="button" value="공지수정"></a>
		<input type="button" id="deleteBtn" value="공지삭제">
	</c:if>
	<a href="/udongca_project/noticeBoard/noticeBoardListPaging.udc"><input type="button" value="공지목록"></a>
	<a href="/udongca_project/main.udc"><input type="button" value="메인페이지"></a>
</div>