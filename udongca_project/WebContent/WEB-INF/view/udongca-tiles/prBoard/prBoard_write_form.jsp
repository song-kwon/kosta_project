<%@ page contentType="text/html;charset=utf-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/udongca_project/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("input[type='text']").prop({"class":"form-control"});
	
	$("#cafeAddress").on("click", function(){
		execDaumPostcode();
	});
	
	$("#cafeAddress").on("select", function(){
		execDaumPostcode();
	});
	
	$("#cafeAddress").on("focusin", function(){
		execDaumPostcode();
	});
	
	$("#searchAddressButton").on("click", function(){
		execDaumPostcode();
	});
	
	$("#cafeName").on("blur", function(){
		$("#cafeNameTd").text(($("#cafeName").val()) ? (countUtf8($("#cafeName").val()) > 50 ? "글자 수 한도 초과" : "") : "입력 필수");
	});
	
	$("#cafeIntro").on("blur", function(){
		$("#cafeIntroTd").text(($("#cafeIntro").val()) ? "" : "입력 필수");
	});
	
	$("#operationHour").on("blur", function(){
		$("#operationHourTd").text(($("#operationHour").val()) ? (countUtf8($("#operationHour").val()) > 50 ? "글자 수 한도 초과" : "") : "입력 필수");
	});
	
	$("#cafeTel").on("blur", function(){
		$("#cafeTelTd").text(($("#cafeTel").val()) ? (countUtf8($("#cafeTel").val()) > 50 ? "글자 수 한도 초과" : "") : "입력 필수");
	});
	
	$("#managerName").on("blur", function(){
		$("#managerNameTd").text(($("#managerName").val()) ? (countUtf8($("#managerName").val()) > 50 ? "글자 수 한도 초과" : "") : "입력 필수");
	});
	
	$("#managerTel").on("blur", function(){
		$("#managerTelTd").text(($("#managerTel").val()) ? (countUtf8($("#managerTel").val()) > 50 ? "글자 수 한도 초과" : "") : "입력 필수");
	});
	
	$("#coporateNumber").on("change", function(){
		var result = isValidCoporateNumber();
		if (result){
			$("#coporateNumberTd").text("중복 확인 필요");
		}
	});
	
	$("#isCoporateNumberDuplicated").on("click", function(){
		var result = isValidCoporateNumber();
		if (result){
			$.ajax({
				"url":"/udongca_project/prBoard/isCoporateNumberDuplicated.udc",
				"type":"POST",
				"data":"coporateNumber=" + $("#coporateNumber").val(),
				"dataType":"text",
				"success":function(text){
					$("#coporateNumberTd").text(((text == "true") ? "중복된 사업자 등록 번호" : "사용 가능" ));
				},
				"error":function(xhr){
					alert("An error occured: " + xhr.status + " " + xhr.statusText);
				}
			});
		}
	});
	
	$("#themeCheck").on("change", function(){
		if ($("#themeCheck").prop("checked")){
			$.ajax({
				"url":"/udongca_project/prBoard/cafeThemeList.udc",
				"type":"POST",
				"data":"",
				"dataType":"json",
				"success":function(json){
					$("#cafeFeature2").empty().append("<option>테마 선택</option>");
					for (var i = 0; i < json.length; i++){
						$("#cafeFeature2").append("<option value=" + json[i].codeId + ">" + json[i].codeName + "</option>");
					}
				},
				"error":function(xhr){
					alert("An error occured: " + xhr.status + " " + xhr.statusText);
				}
			});
		}
		else{
			$("#cafeFeature2").empty().append("<option>테마 선택</option>");
		}
	});
	
	$("#cancel").on("click", function(){
		history.back();
	});
	
	$("form").on("submit", function(){
		if (!($("#cafeName").val() && $("#operationHour").val() && $("#cafeTel").val() && $("#managerName").val() && $("#managerTel").val() && $("#cafeAddress").val() && $("#coporateNumberTd").text() == "사용 가능")){
			alert("필수 사항이 입력되지 않았거나 입력 문장이 너무 깁니다");
			return false;
		}
	});
});

function execDaumPostcode(){
	new daum.Postcode({
        oncomplete: function(data) {
        	$("#cafeAddress").val(data.jibunAddress);
        	$("#cafeAddressTd").text("");
        },
		onclose: function(state) {
	        //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
	        if(state === 'FORCE_CLOSE' && !($("#cafeAddress").val())){
	            //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
	        	$("#cafeAddressTd").text("입력 필수");
	        }
	    }
    }).open();
};

function isValidCoporateNumber(){
	if (!($("#coporateNumber").val())){
		$("#coporateNumberTd").text("입력 필수");
		return 0;
	}
	else if ($("#coporateNumber").val().length != 10 || !($("#coporateNumber").val().match(/\d{10}/))){
		$("#coporateNumberTd").text("양식에 맞게 입력");
		return 0;
	}
	else{
		$("#coporateNumberTd").text("");
		return 1;
	}
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
<div class="container" align="center">
<div><h1>카페 홍보글 등록</h1></div><br>
<div style="color:red;"><font size="3">*표시 항목은 필수 입력 사항입니다.</font></div>
<div><font size="2">사업자등록번호는 10글자로 - 없이 입력해주십시오.</font></div><br>
<form action="/udongca_project/prBoard/moveToNewPr2Jsp.udc"	method="post" role="form">
<table class="table">
	<tr>
		<th colspan="3">*카페 이름</th>
	</tr>
	<tr>
		<td colspan="3" class="width_size"><input type="text" name="cafeName" value="${requestScope.cafeName}" id="cafeName"></td>
	</tr>
	<tr>
		<td colspan="3"><span id="cafeNameTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">특징</th>
	</tr>
	<tr>
		<td colspan="3">
			<div class="col-sm-12">
				<label class="col-sm-3"><input type="checkbox" name="cafeFeature1" value="wifi" >와이파이</label>
				<label class="col-sm-3"><input type="checkbox" name="cafeFeature1" value="socket" >콘센트</label>
				<label class="col-sm-3"><input type="checkbox" name="cafeFeature1" value="park" >주차</label>
				<label class="col-sm-3"><input type="checkbox" name="cafeFeature1" value="smoking" >흡연실</label>
			</div>
			<div class="col-sm-12">
				<label class="col-sm-3"><input type="checkbox" id="themeCheck">테마</label>
				<select class="col-sm-9" style="max-width:200px" name="cafeFeature2" id="cafeFeature2" class="form-control">
					<option>테마 선택</option>
				</select>
			</div>
		</td>
	</tr>
	
	<tr>
		<th colspan="3">*영업 시간</th>
	</tr>
	<tr>
		<td colspan="3" class="width_size"><input type="text" name="operationHour" value="${requestScope.operationHour}" id="operationHour"></td>
	</tr>
	<tr>
		<td colspan="3"><span id="operationHourTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">*카페 연락처</th>
	</tr>
	<tr>
		<td colspan="3" class="width_size"><input type="text" name="cafeTel" value="${requestScope.cafeTel}" id="cafeTel"></td>
	<tr>
		<td colspan="3"><span id="cafeTelTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">*카페 주소</th>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="cafeAddress" value="${requestScope.cafeAddress}" id="cafeAddress"></td>
		<td><input type="button" value="주소검색" id="searchAddressButton"></td>
	</tr>
	<tr>
		<td colspan="3"><span id="cafeAddressTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">*사업자 등록 번호</th>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="coporateNumber" id="coporateNumber" value="${requestScope.coporateNumber}" placeholder=" - 없이 입력"></td>
		<td><input type="button" value="중복확인" id="isCoporateNumberDuplicated"></td>
	</tr>
	<tr>
		<td><span id="coporateNumberTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">*관리자명</th>
	<tr>
		<td colspan="3" class="width_size"><input type="text" name="managerName" value="${requestScope.managerName}" id="managerName"></td>
	</tr>
	<tr>
		<td colspan="3"><span id="managerNameTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">*관리자 연락처</th>
	</tr>
	<tr>
		<td colspan="3" class="width_size"><input type="text" name="managerTel" value="${requestScope.managerTel}" id="managerTel"></td>
	</tr>
	<tr>
		<td colspan="3"><span id="managerTelTd"></span></td>
	</tr>
	
	<tr>
		<th colspan="3">*카페 소개</th>
	</tr>
	<tr>
		<td colspan="3" class="width_size"><textarea rows="15" style="width:100%" name="cafeIntro" id="cafeIntro" class="form-control">${requestScope.cafeIntro}</textarea></td>
	</tr>
	<tr>
		<td colspan="3"><span id="cafeIntroTd"></span></td>
	</tr>
</table>
<div class="form-group" align="center">
	<button class="btn btn-default" type="submit">다음 단계</button>
	<button class="btn btn-default" type="reset">다시 입력</button>
	<button class="btn btn-default" type="button" id="cancel">취소</button>
</div>
</form>
</div>