<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.nav-pills > li.active > a,
.nav-pills > li.active > a:hover,
 .nav-pills > li.active > a:focus{
	background-color:#6b4004;
}
.nav>li>a{
	font-size:15pt;
}
.nav > li > a:hover,
.nav > li > a:focus{
	font-weight:bold;
	background-color:#faebd7;
}
</style>
<ul class="nav nav-pills">
<li id="notice"><a href="/udongca_project/noticeBoard/noticeBoardListPaging.udc">공지사항</a></li>
<c:choose>
	<c:when test="${sessionScope.login.memberId=='udongca' }">
		<li id="oneToOneMaster"><a href="/udongca_project/oneToOneInquiry/oneToOneInquiryListPaging.udc">1:1문의관리</a></li>
	</c:when>
	<c:when test="${!empty sessionScope.login.memberId }">
		<li id="oneToOne"><a href="/udongca_project/oneToOneInquiry/registerOneToOneInquiryform.udc?codeType=inquiry_type">1:1문의하기</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="/udongca_project/loginPage.udc">1:1문의</a></li>
	</c:otherwise>
</c:choose>
</ul>
