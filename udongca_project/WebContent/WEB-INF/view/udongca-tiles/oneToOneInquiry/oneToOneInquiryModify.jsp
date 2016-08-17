<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  type="text/javascript">
$(document).ready(function(){
	$("input[type='text']").prop({"class":"form-control"});
	$("#title").on("keyup keypress", function(){
		if($(this).val().length>50){
			$(this).val($(this).val().substr(0,50));
			return false;
		}
	});
});

function chkTitle(){
	if(!$("#title").val()){
		return false;
	}else
		return true;
}
function chkContent(){
	if(!$("#content").val()){
		return false;
	}else
		return true;
}

function chkType(){
	if($("#inquiryType").val()=="유형 선택"){
		return false;
	}
	else
		return true;
}

function checkSubmit(){
	var checkType = chkType();
	var checkTitle = chkTitle();
	var checkContent = chkContent();
	
	if(checkTitle==false){
		alert("제목을 입력해주세요.");
		return false;
	}else if(checkType==false){
		alert("문의 유형을 선택해주세요.");
		return false;
	}else if(checkContent==false){
		alert("내용을 입력해주세요.");
		return false;
	}else{
		var result = confirm("수정하시겠습니까?");
		if(result==true)
			return true;
		else
			return false;
	}
}
</script>

<style type="text/css">
table{
	margin-top:20px;
	margin-bottom:20px;
	text-align:left;
	font-size:15px;
}
.table{
	max-width:800px;
	background-color:antiquewhite;
}

.text{
	font-weight:bold;
	min-width:88px;
	height:40px;
}
</style>

<div style="padding:20px;"><h1>1:1문의 수정</h1></div>
<div align="center">
<form action="/udongca_project/oneToOneInquiry/modifyOneToOneInquiry.udc?inquiryNo=${requestScope.map.oneToOneInquiry.inquiryNo}" method="post" onsubmit="return checkSubmit();">
<table class="table">
	<tr>
		<td class="text">아이디</td>
		<td>${sessionScope.login.memberId }</td>
	</tr>
	<tr>
		<td class="text">문의 유형</td>
		<td>
			<select id="inquiryType" name="inquiryType" class="form-control" style="max-width:120px;">
				<option>유형 선택</option>
				<c:forEach items="${requestScope.map.codeList }" var="code">
					<option ${code.codeName == requestScope.map.oneToOneInquiry.inquiryType?'selected="selected"':'' }>${code.codeName }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="text">제목</td>
		<td><input type="text" id="title" name="inquiryTitle" placeholder="제목은 한글 기준 최대 50자까지 입력 가능합니다.." value="${requestScope.map.oneToOneInquiry.inquiryTitle }"></td>
	</tr>
	<tr>
		<td class="text">내용</td>
		<td><textarea id="content" name="inquiryContent" style="width:100%; min-height:200px;" placeholder="내용을 입력해주세요..">${requestScope.map.oneToOneInquiry.inquiryContent }</textarea>
	</tr>
</table>
<div align="center" style="padding-bottom:30px;"><input type="submit" value="수정"> <a href="/udongca_project/member/memberInquiryListPaging.udc"><input type="button" value="취소"></a></div>
</form>
</div>