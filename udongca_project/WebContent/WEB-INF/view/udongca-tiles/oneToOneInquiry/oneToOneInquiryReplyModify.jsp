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
.cut{
  	overflow:hidden;
  	text-overflow: ellipsis;
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
	$("#oneToOneMaster").prop("class","active");
	$(".dropdown-toggle").html("1:1문의관리<span class='caret'></span>");
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

<div><h1>1:1문의</h1></div>
<form action="/udongca_project/oneToOneInquiry/modifyOneToOneInquiryReply.udc?inquiryNo=${requestScope.oneToOneInquiry.inquiryNo}" method="post" onsubmit="return checkSubmit();">
<table class="table" style="table-layout: fixed;">
	<tr id="tr">
		<td class="col-sm-8 cut" style="font-weight:bold;"><nobr>[${requestScope.oneToOneInquiry.inquiryType }]&nbsp${requestScope.oneToOneInquiry.inquiryTitle }</nobr></td>
		<td class="col-sm-4">작성자 : ${requestScope.oneToOneInquiry.memberId }</td>
	</tr>
	<tr class="tr1">
		<td colspan="2" style="font-weight:bold;"><nobr>[${requestScope.oneToOneInquiry.inquiryType }]&nbsp${requestScope.oneToOneInquiry.inquiryTitle }</nobr></td>
	</tr>
	<tr class="tr1">	
		<td colspan="2">작성자 : ${requestScope.oneToOneInquiry.memberId }</td>
	</tr>
	<tr>
		<td colspan="2" style="width:100%; height:250px;">${requestScope.oneToOneInquiry.inquiryContent }</td>
	</tr>
	<tr><td colspan="2" align="center" style="width:100%; height:30px; border-top:3px double; font-weight:bold;">문의 답변</td></tr>
	<tr>
		<td colspan="2"  style="width:100%; height:200px;"><textarea name="inquiryReply" rows="10" cols="140" placeholder="아직 답변이 달리지 않았습니다. 문의에 대한 답변을 남겨주세요..">${requestScope.oneToOneInquiry.inquiryReply }</textarea></td>
	</tr>
</table>
<div align="center" style="padding-bottom:30px;">
	<input type="submit" value="답변등록">
	<input type="button" id="deleteBtn" value="문의삭제">
	<a href="/udongca_project/oneToOneInquiry/oneToOneInquiryListPaging.udc"><input type="button" value="문의목록"></a>
	<a href="/udongca_project/main.udc"><input type="button" value="메인페이지"></a>
</div>
</form>
