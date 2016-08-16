<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				//major category
				/* 	$.ajax({
				 "url":"/udongca_project/search/selectAllMajorAddress.udc",
				 "type":"GET",
				 "data":"",
				 "dataType":"json",
				 "success":function(json){
				 for(var i = 0; i < json.length; i++){
				 $("#address1").append("<option value=" + json[i].majorCategoryNo + ">" + json[i].addressName + "</option>");
				 }
				
				 }
				 }); */

				//theme category
				$.ajax({
					"url" : "/udongca_project/search/selectThemeCategory.udc",
					"type" : "GET",
					"dataType" : "json",
					"success" : function(json) {
						for (var i = 0; i < json.length; i++) {
							$("#theme").append(
									"<option value=" + json[i].codeId + ">"
											+ json[i].codeName + "</option>");

							if ('${param.cafeFeature}'.length != 0) {
								$("#theme").val('${param.cafeFeature}')
							}
						}
					}
				});
			});
</script>
<style type="text/css">
@media (min-width: 768px){
.fa-search{
    display: none;
}
}
.fa-search{
 color:white;font-size:inherit;margin-right:0px;
}

.div2 {
	padding: 7px;
	text-align: center;
	background-color: antiquewhite;
	font-size: 20px;
	color: sienna;
	width: auto;
	height: 48px;
}

/* .col-xs-1 {
	width: 120px;
}

.col-xs-2 {
	width: 150px;
}

.col-xs-offset-1 {
	margin-left: 14%;
}

div#menu1, a:hover {
	color: navajowhite;
	font-weight: bold;
}

div#menu2, a:hover {
	color: navajowhite;
	font-weight: bold;
}

div#menu3, a:hover {
	color: navajowhite;
	font-weight: bold;
} */
</style>
<div class="navbar-inverse">
	<div class="container-fluid">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span><span
					class="icon-bar"></span>
			</button>
			
			<!-- <button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar2">
				<span class="icon-bar"></span> <span class="icon-bar"></span><span
					class="icon-bar"></span>
			</button> -->
			<button class="fa fa fa-search navbar-toggle" data-toggle="collapse" data-target="#myNavbar2"></button>
		
		</div>

		<c:choose>
			<c:when test="${sessionScope.login != null}">
				<c:choose>
					<c:when test="${sessionScope.login.memberType =='master'}">
						<div class="collapse navbar-collapse" id="myNavbar" align="right">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/udongca_project/main.udc" class="menu">메인&nbsp;</a></li>
								<li><a href="/udongca_project/member/logout.udc"
									class="menu">&nbsp;로그아웃&nbsp;</a></li>
								<li><a href="/udongca_project/member/master_page.udc"
									class="menu">&nbsp;관리자페이지&nbsp;</a></li>
								<li><jsp:include
										page="/WEB-INF/view/udongca-tiles/etc/customerCenter_header_menu.jsp" /></li>
								<li><div
										style="font-size: 18px; font-weight: bold; color: antiquewhite;">
										${sessionScope.login.memberName }님! 반갑습니다.&nbsp;&nbsp;</div></li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="collapse navbar-collapse" id="myNavbar" align="right">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/udongca_project/main.udc" class="menu">메인&nbsp;</a></li>
								<li><a href="/udongca_project/member/logout.udc"
									class="menu">&nbsp;로그아웃&nbsp;</a></li>
								<li><a href="/udongca_project/member/member_myPage.udc"
									class="menu">&nbsp;마이페이지&nbsp;</a></li>
								<li><jsp:include
										page="/WEB-INF/view/udongca-tiles/etc/customerCenter_header_menu.jsp" /></li>
								<li><div
										style="font-size: 18px; font-weight: bold; color: antiquewhite;">
										${sessionScope.login.memberName }님! 반갑습니다.&nbsp;&nbsp;</div></li>
								<li><c:if
										test="${sessionScope.login.memberType eq 'licenseeMember' }">
										<a href="/udongca_project/prBoard_write_form.udc"><input
											type="button" value="홍보글 등록하기"></a>
									</c:if></li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</c:when>

			<c:otherwise>
				<div class="collapse navbar-collapse" id="myNavbar" align="right">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/udongca_project/main.udc" class="menu">메인&nbsp;</a></li>
						<li><a href="/udongca_project/joinSelect.udc" class="menu">&nbsp;회원가입&nbsp;</a></li>
						<li><a href="/udongca_project/loginPage.udc" class="menu">&nbsp;로그인&nbsp;</a></li>
						<li><jsp:include
								page="/WEB-INF/view/udongca-tiles/etc/customerCenter_header_menu.jsp" /></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="jumbotron">
	<div class="container text-center">
		<h1 class="ddd">우 동 카</h1>
		<p>우리동네카페</p>
	</div>
</div>


<div class="container" style="margin-top: 5px; margin-bottom: 5px;">
	<div class="row">
		<div class="col-sm-12 form-inline">
			<div class="col-sm-6" align="center">
				<label for="sel1">주소검색</label> <select id="address1"
					class="form-control" size="1"><option value=0>시/도</option>
					<c:forEach items="${requestScope.result.majorCategory}"
						var="majorList" varStatus="status">
						<option value="${majorList.majorCategoryNo }"
							${param.address1 == majorList.addressName ? 'selected':'' }>${majorList.addressName }</option>
					</c:forEach></select> <select id="address2" class="form-control"><option
						value=0>전체</option>
					<c:forEach items="${requestScope.result.middleCategory}"
						var="middleList" varStatus="status">
						<option value="${middleList.middleCategoryNo }"
							${param.address2 == middleList.addressName ? 'selected':'' }>${middleList.addressName }</option>
					</c:forEach></select>
				<button class="form-control btn-danger" id="searchAddress">검색</button>
			</div>
			<div class="col-sm-6" align="center">
				<label for="sel1">테마검색</label> <select id="theme"
					class="form-control"><option value="0">테마선택</option></select>
				<button class="form-control btn-danger" id="searchTheme">검색</button>
			</div>
		</div>
	</div>
</div>




<%-- <div class="form-inline">
	<div class="div2">

		<div class="col-xs-1 col-xs-offset-1">지역선택</div>
		<div class="col-xs-2">
			<select class="form-control" id="address1" style="width: auto;">
				<option value=0>시/도</option>
				<c:forEach items="${requestScope.result.majorCategory}"
					var="majorList" varStatus="status">
					<option value="${majorList.majorCategoryNo }"
						${param.address1 == majorList.addressName ? 'selected':'' }>${majorList.addressName }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-xs-2">
			<select class="form-control" id="address2" style="width: auto;">
				<option value=0>전체</option>
				<c:forEach items="${requestScope.result.middleCategory}"
					var="middleList" varStatus="status">
					<option value="${middleList.middleCategoryNo }"
						${param.address2 == middleList.addressName ? 'selected':'' }>${middleList.addressName }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-xs-1">
			<button id="searchAddress">검색</button>
		</div>
		<div class="col-xs-1">테마검색</div>
		<div class="col-xs-2">
			<select class="form-control" id="theme" style="width: auto;">
				<option value=0>테마 선택</option>
			</select>
		</div>
		<div class="col-xs-1">
			<button id="searchTheme">검색</button>
		</div>
	</div>
	<c:if test="${sessionScope.login.memberType eq 'licenseeMember' }">
		<div>
			<a href="/udongca_project/prBoard_write_form.udc"><button>홍보글
					등록하기</button></a>
		</div>
	</c:if>
</div> --%>

