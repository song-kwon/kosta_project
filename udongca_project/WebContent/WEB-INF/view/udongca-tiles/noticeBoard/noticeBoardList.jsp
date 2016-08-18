<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#notice").prop("class","active");
	$(".dropdown-toggle").html("공지사항<span class='caret'></span>");
		$("#tbody").on("click","tr",function() {
			location.replace("/udongca_project/noticeBoard/noticeBoard.udc?noticeNo="+ $(this).find(":first").text());
	});
	
})
</script>

<style type="text/css">
table{
	border-collapse: collapse;
	text-align:center;
	cursor:pointer;
	border-bottom:2px solid;
}

.table{
	max-width:800px;
}

.table>thead>tr>td{
	border-collapse: collapse;
	border-bottom:2px solid;
	font-size:15pt;
	font-weight:bold;
	text-align:center;
	cursor:default;
}

.table>tbody>tr>td{
	border-collapse: collapse;
}

.target {
    max-width:200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

@media(max-width:768px){
	.table>thead>tr>td{
		font-size:medium;
		font-weight:bold;
		text-align:center;
	}
}

@media(max-width:768px){
	.table>tbody>tr>th{
		font-size:medium;
		text-align:center;
	}
}

@media(max-width:768px){
	.table>tbody>tr>td{
		font-size:medium;
		text-align:center;
	}
}

@media (max-width:768px){
 .notice_content, .notice_date{
 	display: none;
 }
 
 .notice_no{
 	width:100px;
 }
}

</style>

<div class="container">
<div style="padding-top:20px;"><h1>공지 사항</h1></div><br>
<c:if test="${sessionScope.login.memberId=='udongca' }">
	<div align="right">
		<a href="/udongca_project/noticeBoard/registerNoticeBoardform.udc?codeType=notice_type"><input type="button" value="공지사항 등록"></a>
	</div>
</c:if>
<div align="center">
<table class="table table-hover">
	<thead id="thead">
		<tr>
			<td class="notice_no" style="width:30px;">No</td>
			<td style="width:200px;">공지 제목</td>
			<td class="notice_content" style="width:300px;">공지 내용</td>
			<td class="notice_date" style="width:100px;">작성일자</td>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach items="${requestScope.map.noticeBoardList }" var="list">
			<tr id="tr">
				<td>${list.noticeNo }</td>
				<td id="td1" align="left" class="target"><span style="text-align:left; width:100px; text-weight:bold; color:red;">[${list.category }]</span>&nbsp;${list.noticeTitle }</td>
				<td class="notice_content" id="td2" align="left" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${list.noticeContent }</td>
				<td class="notice_date">${list.noticeDate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>

<div align="center">
<!-- 이전페이지그룹 -->
<ul class='pagination'>
<c:choose>
	<c:when test="${requestScope.map.pageBean.previousPageGroup }">
		<li><a href="/udongca_project/noticeBoard/noticeBoardListPaging.udc?pnum=${requestScope.map.pageBean.beginPage-1 }">
			◀ </a></li>
	</c:when>
	<c:otherwise>
	<li><a>◀ </a></li>
 	</c:otherwise>
</c:choose>
<!-- 숫자 -->
<c:forEach begin="${requestScope.map.pageBean.beginPage }"
	end="${requestScope.map.pageBean.endPage }" var="p">
	<c:choose>
		<c:when test="${p != requestScope.map.pageBean.page }">
			<li><a
				href="/udongca_project/noticeBoard/noticeBoardListPaging.udc?pnum=${p }">
				${p } </a></li>
		</c:when>
		<c:otherwise>
			<li id='pnum' class='active'><a>${p }</a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>
<!-- 다음페이지그룹 -->
<c:choose>
	<c:when test="${requestScope.map.pageBean.nextPageGroup }">
		<li><a
			href="/udongca_project/noticeBoard/noticeBoardListPaging.udc?pnum=${requestScope.map.pageBean.endPage+1 }">
			▶ </a></li>
	</c:when>
	<c:otherwise>
		<li><a>▶</a></li>
	</c:otherwise>
</c:choose>
</ul>
</div>
