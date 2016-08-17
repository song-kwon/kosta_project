<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* .nav-pills > li.active > a,
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
} */
@media (min-width: 768px){

	.menu1{
		display:none;
	}
	.nav-pills > li.active > a{
		background-color:inherit;
		background-image:linear-gradient(to bottom, #3c3c3c 0%, #222 100%);	
	}	
	a,
	a:hover,
	a:focus
	{
		color:black;
		text-decoration:none;
	}
}
@media(max-width: 768px){
	.menu2{
	display:none;
	}
	.nav .open > a, .nav .open > a:hover{
	background-color:inherit;
	}
	.menu1{
		background-image:linear-gradient(to bottom, #3c3c3c 0%, #222 100%);	
		border-radius:4pt;
	}
	.nav > li > a:hover{
		background-color:inherit;
	}
	.dropdown-toggle:hover, .dropdown-toggle:focus{
		color:white;
		cursor:pointer;
	}
	a{
		color:white;
	}
	a:hover, a:focus{
		text-decoration:none;
	}
}
</style>
<ul class="nav nav-pills nav-stacked menu1">
<li class="dropdown">
      <a class="dropdown-toggle ff" data-toggle="dropdown">Menu<span class="caret"></span></a>
      <ul class="dropdown-menu">
	      <li><a href="/udongca_project/noticeBoard/noticeBoardListPaging.udc">공지사항</a></li>
		<c:choose>
			<c:when test="${sessionScope.login.memberId=='udongca' }">
				<li ><a href="/udongca_project/oneToOneInquiry/oneToOneInquiryListPaging.udc">1:1문의관리</a></li>
			</c:when>
			<c:when test="${!empty sessionScope.login.memberId }">
				<li><a href="/udongca_project/oneToOneInquiry/registerOneToOneInquiryform.udc?codeType=inquiry_type">1:1문의하기</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/udongca_project/loginPage.udc">1:1문의</a></li>
			</c:otherwise>
		</c:choose>
      </ul>
    </li>

</ul>
<ul class="nav nav-pills menu2">
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
