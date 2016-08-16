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
	width:600px;
	text-align:center;
	margin:30px;
}
</style>

<div class="container">
<div class="col-sm-12" align="center">
<div class="nonav_bodyDiv" style="width:600px;">
<div><h1>우동카 회원가입</h1></div><br>
<table>
	<tr>
		<td style="font-size:x-large; cursor:pointer;"><label>일반 회원 가입<br><input type="radio" name="memberType" value="generalMember"></label></td>
		<td style="font-size:x-large; cursor:pointer;"><label>사업자 회원 가입<br><input type="radio" name="memberType" value="licenseeMember"></label></td>
	</tr>
</table>

<div id="a" align="center" style="padding-bottom:30px;">
	<input type="button" value="회원가입하기">
</div>
</div>
</div>
</div>