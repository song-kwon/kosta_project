<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
table{
	border-collapse: collapse;
	text-align:center;
	border-bottom:1px dotted;
}

.table{
	max-width:800px;
}

@media(max-width:768px){
	.table>tr>th{
		font-size:medium;
		text-align:center;
	}
}

@media (max-width:768px){
 .notice_content, .notice_date{
 	display: none;
 }

@media (max-width: 768px){
	.table>tbody>#tr{
	display:none;
	}
}
@media (min-width: 768px){
	.table>tbody>.tr1{
	display:none;
	}
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

<div><h1>공지 사항</h1></div><br>
<div align="center">
<table class="table table-bordered">
	<tr id="tr">
		<td style="width:20px; color:red; font-weight:bold;">[${requestScope.noticeBoard.category }]</td>
		<td class="col-sm-9" style="font-weight:bold;">${requestScope.noticeBoard.noticeTitle }</td>
		<td class="col-sm-2" align="center">작성일 : ${requestScope.noticeBoard.noticeDate }</td>
	</tr>
	<tr>
		<td colspan="3" style="width:100%; height:300px;" align="left">${requestScope.noticeBoard.noticeContent }</td>
	</tr>
</table>
</div>

<div align="center" style="padding-bottom:30px;">
	<c:if test="${sessionScope.login.memberId=='udongca' }">
		<a href="/udongca_project/noticeBoard/modifyNoticeBoardform.udc?noticeNo=${requestScope.noticeBoard.noticeNo}&codeType=notice_type"><input type="button" value="공지수정"></a>
		<input type="button" id="deleteBtn" value="공지삭제">
	</c:if>
	<a href="/udongca_project/noticeBoard/noticeBoardListPaging.udc"><input type="button" value="공지목록"></a>
	<a href="/udongca_project/main.udc"><input type="button" value="메인페이지"></a>
</div>