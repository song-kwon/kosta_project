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

@media (max-width: 768px){
	.table>#tr{
	display:none;
	}
}
@media (min-width: 768px){
	.table>.tr1{
	display:none;
	}
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#oneToOneMaster").prop("class","active");
	$(".toggle-caret").html("1:1문의관리<span class='caret'></span>");
	$("#deleteBtn").on("click",function(){
		var result = confirm("게시물을 삭제하시겠습니까?");
		if(result==true){
			location.replace("/udongca_project/oneToOneInquiry/deleteOneToOneInquiry.udc?inquiryNo=${requestScope.oneToOneInquiry.inquiryNo}");
		}
	});
});

function checkSubmit(){
	var result = confirm("답변을 등록하시겠습니까?");
	if(result==true)
		return true;
	else
		return false;
}
</script>

<div><h1>1:1문의</h1></div><br>
<form action="/udongca_project/oneToOneInquiry/modifyOneToOneInquiryReply.udc?inquiryNo=${requestScope.oneToOneInquiry.inquiryNo}" method="post" onsubmit="return checkSubmit();">
<div align="center">
<table class="table table-bordered">
	<tr id="tr">
		<td style="width:20px; color:red; font-weight:bold;">[${requestScope.oneToOneInquiry.inquiryType}]</td>
		<td class="col-sm-9" style="font-weight:bold;">${requestScope.oneToOneInquiry.inquiryTitle }</td>
		<td class="col-sm-2" align="left">작성자 : ${requestScope.oneToOneInquiry.memberId }</td>
	</tr>
	<tr>
		<td colspan="3" style="width:100%; height:250px;" align="left">${requestScope.oneToOneInquiry.inquiryContent }</td>
	</tr>
	<tr><td colspan="3" align="center" style="width:100%; height:30px; border-top:3px double; font-weight:bold;">문의 답변</td></tr>
	<tr>
		<td colspan="3"  style="width:100%; height:200px;" align="left"><textarea name="inquiryReply" rows="15" cols="140" placeholder="아직 답변이 달리지 않았습니다. 문의에 대한 답변을 남겨주세요..">${requestScope.oneToOneInquiry.inquiryReply }</textarea></td>
	</tr>
</table>
</div>
<div align="center" style="padding-bottom:30px;">
	<input type="submit" value="답변등록">
	<input type="button" id="deleteBtn" value="문의삭제">
	<a href="/udongca_project/oneToOneInquiry/oneToOneInquiryListPaging.udc"><input type="button" value="문의목록"></a>
	<a href="/udongca_project/main.udc"><input type="button" value="메인페이지"></a>
</div>
</form>
