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
		var result = confirm("해당 게시물을 삭제하시겠습니까?");
		if(result==true){
			location.replace("/udongca_project/oneToOneInquiry/deleteOneToOneInquiryMember.udc?inquiryNo=${requestScope.map.oneToOneInquiry.inquiryNo}");
		}
	});
	$("#deleteBtn2").on("click",function(){
		var result = confirm("해당 게시물을 삭제하시겠습니까?");		
		if(result==true){
			location.replace("/udongca_project/oneToOneInquiry/deleteOneToOneInquiryMaster.udc?inquiryNo=${requestScope.map.oneToOneInquiry.inquiryNo}");
		}
	});
});
</script>

<div><h1>1:1문의</h1></div>
<table class="table" style="table-layout: fixed;">
	<tr id="tr">
		<td class="col-sm-8 cut" style="font-weight:bold;">[${requestScope.map.oneToOneInquiry.inquiryType }]&nbsp${requestScope.map.oneToOneInquiry.inquiryTitle }</td>
		<td class="col-sm-4">작성자 : ${requestScope.map.oneToOneInquiry.memberId }</td>
	</tr>
	
	<tr class="tr1">
		<td colspan="2" style="font-weight:bold;">[${requestScope.map.oneToOneInquiry.inquiryType }]&nbsp${requestScope.map.oneToOneInquiry.inquiryTitle }</td>
	</tr>
	<tr class="tr1">
		<td colspan="2" >작성자 : ${requestScope.map.oneToOneInquiry.memberId }</td>
	</tr>
	
	
	
	<tr>
		<td colspan="2" style="width:100%; height:250px;">${requestScope.map.oneToOneInquiry.inquiryContent }</td>
	</tr>
	<c:choose>
		<c:when test="${! empty requestScope.map.oneToOneInquiry.inquiryReply and requestScope.map.oneToOneInquiry.inquiryReply!=' '}">
			<tr><td colspan="2" align="center" style="width:100%; height:30px; font-weight:bold;">문의 답변</td></tr>
			<tr>
				<td colspan="2" style="width:100%; height:200px;">${requestScope.map.oneToOneInquiry.inquiryReply }</td>
			</tr>
		</c:when>
		
		<c:otherwise>
			<tr><td colspan="2" align="center" style="width:100%; height:30px; border-top:3px double; font-weight:bold;">문의 답변</td></tr>
			<tr>
				<td colspan="2" style="width:100%; height:200px;">아직 답변이 달리지 않았습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<div align="center" style="padding-bottom:30px;">
	<c:if test="${sessionScope.login.memberId == requestScope.map.oneToOneInquiry.memberId}">
		<a href="/udongca_project/oneToOneInquiry/modifyOneToOneInquiryform.udc?inquiryNo=${requestScope.map.oneToOneInquiry.inquiryNo}&codeType=inquiry_type"><input type="button" id="modifyBtn" value="문의수정"></a>
		<input type="button" id="deleteBtn" value="문의삭제">
		<a href="/udongca_project/member/memberInquiryListPaging.udc"><input type="button" value="내 문의 내역"></a>
	</c:if>
	<c:if test="${sessionScope.login.memberId == 'udongca' }">
		<a href="/udongca_project/oneToOneInquiry/modifyOneToOneInquiryReplyform.udc?inquiryNo=${requestScope.map.oneToOneInquiry.inquiryNo }"><input type="button" value="답변등록"></a>
		<input type="button" id="deleteBtn2" value="문의삭제">
		<a href="/udongca_project/oneToOneInquiry/oneToOneInquiryListPaging.udc"><input type="button" value="문의목록"></a>
	</c:if>
	<a href="/udongca_project/main.udc"><input type="button" value="메인페이지"></a>
</div>
