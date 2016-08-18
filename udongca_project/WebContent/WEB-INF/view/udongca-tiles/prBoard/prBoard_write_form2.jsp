<%@ page contentType="text/html;charset=utf-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/udongca_project/scripts/jquery.js"></script>
<script type="text/javascript">
			var menuTypeList = null;

			$(document).ready(function(){
				$("input[type='text']").prop({"class":"form-control input-sm"});
				$.ajax({
					"url":"/udongca_project/prBoard/cafeMenuList.udc",
					"type":"GET",
					"data":"",
					"dataType":"json",
					"success":function(json){
						menuTypeList = json;
						for(var i = 0; i < menuTypeList.length; i++){
							$("[name='menuTypeArray']:last").append("<option>" + menuTypeList[i].codeName + "</option>");
						}
					},
					"error":function(xhr){
						alert("An error occured: " + xhr.status + " " + xhr.statusText);
					}
				});
				
				$("#menuAdd").on("click", function(){
					$("#menuList").append("<hr><div><b>종류:</b> <select name='menuTypeArray' class='form-control'><option>종류</option></select><br> <b>이름:</b> <input type='text' name='menuNameArray' class='form-control'><br> 사진: <input type='file' name='menuImageArray'></div>");
					if (menuTypeList){
						for(var i = 0; i < menuTypeList.length; i++){
							$("[name='menuTypeArray']:last").append("<option>" + menuTypeList[i].codeName + "</option>");
						}
					}
				});
				
				$("#menuDelete").on("click", function(){
					if ($("#menuList div").length > 1){
						$("#menuList div:last").remove();
					}
				});
				
				$("form").on("submit", function(){
					var flag = true;
					$("[name='menuTypeArray']").each(function(){
						if ($("option:selected", this).text() == "종류"){
							alert("종류를 선택하세요");
							flag = false;
						}
					});
					$("[name='menuNameArray']").each(function(){
						if (!($(this).val())){
							alert("메뉴 이름을 입력하세요");
							flag = false;
						}
						else if (countUtf8(($(this).val())) > 50){
							alert($(this).val() + ": 메뉴 이름이 너무 깁니다");
							flag = false;
						}
					});
					return flag;
				});
				
				$("#cancel").on("click", function(){
					history.back();
				});
			});
</script>
<style type="text/css">
table{
	border-collapse: collapse;
	font-size:15px;
}

table, th{
	text-align:left;
}

.table>tbody>tr>td
{
	border: none;
}
.table{
	border:1px solid #ddd;
	max-width:450px;
}
</style>

<div class="container" align="center">
<div><h1>카페 홍보글 등록</h1></div><br>
<div style="color:red;"><font size="2">*표시 항목은 필수 입력 사항입니다.</font></div>
<form action="/udongca_project/prBoard/prWrite.udc" enctype="multipart/form-data" method="post" role="form"><br>
	<input type="hidden" name="cafeName" value="${requestScope.cafeName}">
	<input type="hidden" name="cafeIntro" value="${requestScope.cafeIntro}">
	<input type="hidden" name="cafeFeature" value="${requestScope.cafeFeature}">
	<input type="hidden" name="operationHour" value="${requestScope.operationHour}">
	<input type="hidden" name="cafeTel" value="${requestScope.cafeTel}">
	<input type="hidden" name="cafeAddress" value="${requestScope.cafeAddress}">
	<input type="hidden" name="coporateNumber" value="${requestScope.coporateNumber}">
	<input type="hidden" name="managerName" value="${requestScope.managerName}">
	<input type="hidden" name="managerTel" value="${requestScope.managerTel}">
	
<table class="table">
	<tr>
		<th>매장 사진</th>
	<tr>
		<td><input type="file" name="cafeImage" multiple="multiple"></td>
	</tr>
	<tr>
		<th>*메뉴</th>
	<tr>
		<td >
			<div id="menuList" class="form-inline">
					<div>
						<b>종류:</b> <select name="menuTypeArray" class="form-control"><option>종류</option></select><br>
						<b>이름:</b> <input type="text" name="menuNameArray"><br>
						사진: <input type="file" name="menuImageArray">
					</div>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="메뉴 추가" id="menuAdd">&nbsp;<input type="button" value="메뉴 삭제" id="menuDelete">
		</td>
	</tr>	

</table>


	<div class="form-group" align="center">
		<input type="submit" value="등록">
		<input type="reset" value="다시 입력">
		<input type="button" value="취소" id="cancel">
	</div>
	</form>
</div>