<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

@media (max-width:992px){
 .inquiry_content, .inquiry_result{
 	display: none;
 }
 
 .inquiry_no{
 	width:100px;
 }
}
</style>

<div><h1>나의 1:1 문의 내역</h1></div><br>
<div align="center">
	<table class="table table-hover" id="memberInquiryList">
		<thead>
			<tr>
				<td class="inquiry_no"  style="width:30px;">No</td>
				<td  style="width:200px;">문의 제목</td>
				<td class="inquiry_content" style="width:300px;">문의 내용</td>
				<td class="inquiry_result" style="width:100px;">처리 결과</td>
			</tr>
		</thead>
		<tbody class="tbody">
		<c:choose>
			<c:when test="${empty requestScope.error }">
			<c:forEach items="${requestScope.list }" var="list">
				<tr class="tr">
					<td id="${list.inquiryNo }">${list.myInquiryNo }</td>
					<td id="td1" align="left" class="target"><span style="text-align:left; width:100px; text-weight:bold; color:red;">[${list.inquiryType }]</span>&nbsp;${list.inquiryTitle }</td>
					<td id="td2" class="inquiry_content" align="left" style="max-width:300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${list.inquiryContent }</td>
					<td class="inquiry_result">${empty list.inquiryReply or list.inquiryReply==' '?'처리 중':'답변 완료' }</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" align="center"><h3 style="color:red;">${requestScope.error }</h3></td>
				</tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
	<!-- 이전페이지그룹 -->
	<div align="right" style="margin:30px;">
		<a
			href="/udongca_project/oneToOneInquiry/registerOneToOneInquiryform.udc?codeType=inquiry_type"><input
			type="button" value="문의 등록"></a>
	</div>
	<div align="center">
		<ul class="pagination">
		<c:choose>
			<c:when test="${requestScope.pageBean.previousPageGroup }">
				<li><a
					href="/udongca_project/member/memberInquiryListPaging.udc?pnum=${requestScope.pageBean.beginPage-1 }">◀</a></li>
			</c:when>
			<c:otherwise><li><a href="#">◀</a></li></c:otherwise>
		</c:choose>
		<!-- 숫자 -->
		<c:if test="${requestScope.pageBean.endPage == 0 }"><li class="active"><a href="#" >1</a></li></c:if>
		<c:forEach begin="${requestScope.pageBean.beginPage }"
			end="${requestScope.pageBean.endPage }" var="p">
			<c:choose>
				<c:when test="${p != requestScope.pageBean.page }">
					<li><a 
						href="/udongca_project/member/memberInquiryListPaging.udc?pnum=${p }">
						${p } </a></li>
				</c:when>
				<c:otherwise>
			<li class="active"><a href="#" >${p }</a></li>
		</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 다음페이지그룹 -->
		<c:choose>
			<c:when test="${requestScope.pageBean.nextPageGroup }">
				<li><a
					href="/udongca_project/member/memberInquiryListPaging.udc?pnum=${requestScope.pageBean.endPage+1 }">▶</a></li>
			</c:when>
			<c:otherwise><li><a href="#">▶</a></li></c:otherwise>
		</c:choose>
		</ul>
	</div>
