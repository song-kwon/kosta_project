<%@ page contentType="text/html;charset=utf-8" %>
<style type="text/css">
table{
	border-collapse: collapse;
	font-size:15px;
}

table, th{
	text-align:left;
}

.table{
	border: none;
	max-width:300px;
}

.table>tbody>tr>td,
.table>tbody>tr>th{
	border-top: none;
}


</style>

<div><h1>회원 정보 수정</h1></div>
<div align="center">
<table class="table">
	<tr>
		<th style="min-width:90px;">아이디</th>
		<td><input id="id" readonly="readonly" style="border: none;" value='${sessionScope.login.memberId}'/></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" id="password"></td>
	<tr>
		<td colspan="2" align="center"><button id="verify" class="btn btn-default" style="margin-top:6px;">확인</button>
</table>
</div>
