<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* .nav-pills > li.active > a,
.nav-pills > li.active > a:hover,
 .nav-pills > li.active > a:focus{
	background-color:#6b4004;
}

.nav > li > a:hover,
.nav > li > a:focus{
	background-color:#faebd7;
} 
 */

</style>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.nav}"=='member'){
		$(".member").addClass("active");
		$(".dropdown-toggle").html("회원정보관리<span class='caret'></span>");
	}
	if("${param.nav}"=='master'){
		$(".master").addClass("active");
		$(".dropdown-toggle").html("신고내역<span class='caret'></span>");
	}
	if("${param.nav}"=='oneToOneInquiry'){
		$(".oneToOneInquiry").addClass("active");
		$(".dropdown-toggle").html("1:1문의관리<span class='caret'></span>");
	}
		
	
	
});
	


</script>
<style type="text/css">
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
.nav_section{
	padding: 0px;
}
</style>
<ul class="nav nav-pills nav-stacked menu1">
<li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" style="">Menu<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li class="select1"><a href="/udongca_project/member/memberListPaging.udc?nav=member">회원정보관리</a></li>
        <li class="select2"><a href="/udongca_project/master/reportBoard.udc?reportType=all&nav=master">신고내역</a></li>
        <li class="select3"><a href="/udongca_project/oneToOneInquiry/master/oneToOneList.udc?nav=oneToOneInquiry">1:1문의관리</a></li>
      </ul>
    </li>

</ul>
	
<ul class="nav nav-pills menu2">
	<li class="li member"><a href="/udongca_project/member/memberListPaging.udc?nav=member">회원정보관리</a></li>
	<li class="li master"><a href="/udongca_project/master/reportBoard.udc?reportType=all&nav=master">신고내역</a></li>
	<li class="li oneToOneInquiry"><a href="/udongca_project/oneToOneInquiry/master/oneToOneList.udc?nav=oneToOneInquiry">1:1문의관리</a></li>
</ul>
