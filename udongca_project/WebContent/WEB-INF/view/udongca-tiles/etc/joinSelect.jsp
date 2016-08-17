<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$("input[name='memberType']").on("change",function(){
		var value = $(this).val();
		if(value=="generalMember"){
			$("#a").html("<a href='/udongca_project/generalMemberJoinform.udc'><input type='button' class='btn btn-default' value='회원가입하기'></a>");
		}else{
			$("#a").html("<a href='licenseeMemberJoinform.udc'><input type='button' class='btn btn-default' value='회원가입하기'></a>");
		}
	});
});
</script>

<style type="text/css">
table{
	border-collapse: collapse;
	text-align:center;
}

.table{
	max-width:600px;
}

.table>tbody>tr>td{
	border:none;
}

@media(max-width:768px){
	.table>tbody>tr>td{
		font-size:large;
	}
}

@media(min-width:768px){
	.table>tbody>tr>td{
		font-size:x-large;
	} 
}
</style>

<div class="container">
<h1>우동카 회원가입</h1>
<div align="center">
<table class="table">
	<tr>
		<td style="cursor:pointer;"><label>일반 회원 가입<br><input type="radio" name="memberType" value="generalMember"></label></td>
		<td style="cursor:pointer;"><label>사업자 회원 가입<br><input type="radio" name="memberType" value="licenseeMember"></label></td>
	</tr>
</table>

<div id="a" align="center" style="padding-bottom:30px;">
	<input type="button" value="회원가입하기">
</div>
</div>
</div>
