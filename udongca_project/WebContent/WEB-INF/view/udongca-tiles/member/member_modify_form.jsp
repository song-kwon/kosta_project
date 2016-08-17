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
		<td><input type="text" readonly="readonly" style="border: none;" value="${sessionScope.login.memberId }" id="id" ></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" value="${sessionScope.login.memberPassword }" id="password"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" class="form-control" value="${sessionScope.login.memberName }" id="name"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" readonly="readonly" style="border: none;" value="${sessionScope.login.memberEmail }" id="email"></td>
	</tr>
</table>
	<input type="button" value="수정하기" id="memberModifyBtn">
</div>
