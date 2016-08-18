<%@ page contentType="text/html;charset=utf-8"%>
<script type="text/javascript">
	var cafeFakeImageArray = "${requestScope.cafeFakeImage}".split(";");
	var cafeRealImageArray = "${requestScope.cafeRealImage}".split(";");
	var cafeFakeImageArrayNumber = cafeFakeImageArray.length - 1;
	
	$(document).ready(function(){
		for(var i = 0; i < cafeFakeImageArrayNumber; i++){
			$("#cafeImages").append("<img src='/udongca_project/images/" + cafeFakeImageArray[i] + "' class='image" + i + "'width='30%'>");
			$("#cafeImages").append("<button onclick='deleteImage(" + i + ")' class='image" + i + "'>삭제</button>");
			$("#cafeImages").append("<input type='hidden' name='modifiedCafeFakeImage' value='" + cafeFakeImageArray[i] + "' class='image" + i + "'>");
			$("#cafeImages").append("<input type='hidden' name='modifiedCafeRealImage' value='" + cafeRealImageArray[i] + "' class='image" + i + "'>");
			$("#cafeImages").append("<br class='image" + i + "'>");
		}
		
		$("input[type='text']").prop({"class":"form-control"});
		$("#cancel").on("click", function(){
			history.back();
		});
	});
	
	function deleteImage(i){
		$(".image" + i).remove();
	}
</script>

<style type="text/css">
table{
	border-collapse: collapse;
	font-size:15px;
}

table, th{
	text-align:left;
	height:45px;
}

span{
	font-size:13px;
	color:red;
}

.table>tbody>tr>td
{
	border: none;
}
.table{
	border:1px solid #ddd;
	max-width:550px;
}
</style>

<div align="center">
<div><h1>카페 홍보글 수정</h1></div><br>
<div style="color:red;"><font size="3">*표시 항목은 필수 입력 사항입니다.</font></div>
<form action="/udongca_project/prBoard/prModify.udc" enctype="multipart/form-data" method="post"><br>
	<input type="hidden" name="cafeNo" value="${requestScope.cafeNo}">
	<input type="hidden" name="cafeName" value="${requestScope.cafeName}">
	<input type="hidden" name="cafeIntro" value="${requestScope.cafeIntro}">
	<input type="hidden" name="cafeFeature" value="${requestScope.cafeFeature}">
	<input type="hidden" name="operationHour" value="${requestScope.operationHour}">
	<input type="hidden" name="cafeTel" value="${requestScope.cafeTel}">
	<input type="hidden" name="cafeAddress" value="${requestScope.cafeAddress}">
	<input type="hidden" name="coporateNumber" value="${requestScope.coporateNumber}">
	<input type="hidden" name="managerName" value="${requestScope.managerName}">
	<input type="hidden" name="managerTel" value="${requestScope.managerTel}">
	<input type="hidden" name="cafeRealImage" value="${requestScope.cafeRealImage}">
	<input type="hidden" name="cafeFakeImage" value="${requestScope.cafeFakeImage}">
	<input type="hidden" name="memberId" value="${requestScope.memberId}">
<table class="table">
	<tr>
		<th>기존 매장 사진</th>
	</tr>
	<tr>
		<td id="cafeImages" align="center"></td>
	</tr>
	<tr>
		<th>추가 매장 사진</th>
	</tr>
	<tr>
		<td align="center"><input type="file" name="addCafeImage" multiple="multiple"></td>
	</tr>
</table>

	<div class="form-group" align="center">
		<input type="submit" value="등록">
		<input type="reset" value="다시 입력">
		<input type="button" value="취소" id="cancel">
	</div>
</form>
</div>