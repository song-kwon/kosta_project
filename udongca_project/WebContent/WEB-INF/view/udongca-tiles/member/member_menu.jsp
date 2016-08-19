<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#dropBtn")
								.on(
										"click",
										function() {
											var result = confirm("탈퇴 후 같은 정보로는 가입이 불가능합니다. 정말로 탈퇴하시겠습니까? 확인을 누르면 탈퇴에 성공하고, 메인페이지로 이동합니다.");
											if (result == true)
												location
														.replace("/udongca_project/member/member_drop.udc");
										});

						if ("${param.nav}" == 'prboard') {
							$(".prboard").addClass("active");
							$(".toggle-caret").html(
									"회원정보관리<span class='caret'></span>");
						}
						if ("${param.nav}" == 'report') {
							$(".report").addClass("active");
							$(".toggle-caret").html(
									"신고내역<span class='caret'></span>");
						}
						if ("${param.nav}" == 'inquiry') {
							$(".inquiry").addClass("active");
							$(".toggle-caret").html(
									"1:1문의<span class='caret'></span>");
						}
						if ("${param.nav}" == 'verify') {
							$(".verify").addClass("active");
							$(".toggle-caret").html(
									"정보수정<span class='caret'></span>");
						}
						if ("${param.nav}" == 'bookmark') {
							$(".bookmark").addClass("active");
							$(".toggle-caret").html(
									"즐겨찾기<span class='caret'></span>");
						}
						if ("${param.nav}" == 'preferLocation') {
							$(".preferLocation").addClass("active");
							$(".toggle-caret").html(
									"선호지역<span class='caret'></span>");
						}
						if ("${param.nav}" == 'review') {
							$(".review").addClass("active");
							$(".toggle-caret").html(
									"내가쓴 리뷰<span class='caret'></span>");
						}

					});
</script>

<style type="text/css">
/* div#dropBtn{
	color:sienna;
}
a{
	color:sienna;
}
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

.nav-pills > li.active > div#dropBtn,
.nav-pills > li.active > div#dropBtn:hover,
 .nav-pills > li.active > div#dropBtn:focus{
	background-color:#6b4004;
}
.nav > li > div#dropBtn:hover,
.nav > li > div#dropBtn:focus{
	color:red;
	font-weight:bold;
	background-color:#faebd7;
	cursor:pointer;
} */
@media ( min-width : 768px) {
	.menu1 {
		display: none;
	}
	.nav-pills>li.active>a {
		background-color: inherit;
		background-image: linear-gradient(to bottom, #3c3c3c 0%, #222 100%);
	}
	a, a:hover {
		color: black;
	}
}

@media ( max-width : 768px) {
	.menu2 {
		display: none;
	}
	.nav .open>a, .nav .open>a:hover {
		background-color: inherit;
	}
	.menu1 {
		background-image: linear-gradient(to bottom, #3c3c3c 0%, #222 100%);
		border-radius: 4pt;
	}
	.nav>li>a:hover {
		background-color: inherit;
	}
	a:hover, a:focus {
		color: white;
		cursor: pointer;
	}
	a {
		color: white;
	}
}

.nav_section{
	padding: 0px;
}
</style>

<input type="hidden" value="${sessionScope.login.memberId }"
	id="loginId">
<ul class="nav nav-pills nav-stacked menu1">
	<li class="dropdown"><a class="dropdown-toggle toggle-caret"
		data-toggle="dropdown">Menu<span class="caret"></span></a> <c:choose>
			<c:when test="${sessionScope.login.memberType == 'licenseeMember' }">
				<ul class="dropdown-menu">
					<li class="li prboard"><a
						href="/udongca_project/member/member_prBoard_list.udc?nav=prboard">내
							홍보글</a></li>
					<li class="li report"><a
						href="/udongca_project/member/memberReportListPaging.udc?nav=report">신고내역</a></li>
					<li class="li inquiry"><a
						href="/udongca_project/member/memberInquiryListPaging.udc?nav=inquiry">1:1문의</a></li>
					<li class="li verify"><a
						href="/udongca_project/member/member_verify.udc?nav=verify">정보수정</a></li>
					<li class="li"><a id="dropBtn">회원탈퇴</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="dropdown-menu">
					<li class="li bookmark"><a id="book"
						href="/udongca_project/member/member_bookmark.udc?nav=bookmark">즐겨찾기</a></li>
					<li class="li preferLocation"><a
						href="/udongca_project/member/member_preferLocation_form.udc?nav=preferLocation">선호지역</a></li>
					<li class="li review"><a
						href="/udongca_project/member/memberReviewListPaging.udc?nav=review">내가쓴리뷰</a></li>
					<li class="li report"><a
						href="/udongca_project/member/memberReportListPaging.udc?nav=report">신고내역</a></li>
					<li class="li inquiry"><a
						href="/udongca_project/member/memberInquiryListPaging.udc?nav=inquiry">
							1:1문의</a></li>
					<li class="li verify"><a
						href="/udongca_project/member/member_verify.udc?nav=verify">정보수정</a></li>
					<li class="li"><a id="dropBtn">회원탈퇴</a></li>
				</ul>
			</c:otherwise>
		</c:choose></li>
</ul>



<ul class="nav nav-pills menu2">
	<c:choose>
		<c:when test="${sessionScope.login.memberType == 'licenseeMember' }">
			<li class="li prboard"><a
				href="/udongca_project/member/member_prBoard_list.udc?nav=prboard">내
					홍보글</a></li>
			<li class="li report"><a
				href="/udongca_project/member/memberReportListPaging.udc?nav=report">신고내역</a></li>
			<li class="li inquiry"><a
				href="/udongca_project/member/memberInquiryListPaging.udc?nav=inquiry">1:1문의</a></li>
			<li class="li verify"><a
				href="/udongca_project/member/member_verify.udc?nav=verify">정보수정</a></li>
			<li class="li"><a id="dropBtn">회원탈퇴</a></li>
		</c:when>
		<c:otherwise>
			<li class="li bookmark"><a id="book"
				href="/udongca_project/member/member_bookmark.udc?nav=bookmark">즐겨찾기</a></li>
			<li class="li preferLocation"><a
				href="/udongca_project/member/member_preferLocation_form.udc?nav=preferLocation">선호지역</a></li>
			<li class="li review"><a
				href="/udongca_project/member/memberReviewListPaging.udc?nav=review">내가쓴리뷰</a></li>
			<li class="li report"><a
				href="/udongca_project/member/memberReportListPaging.udc?nav=report">신고내역</a></li>
			<li class="li inquiry"><a
				href="/udongca_project/member/memberInquiryListPaging.udc?nav=inquiry">
					1:1문의</a></li>
			<li class="li verify"><a
				href="/udongca_project/member/member_verify.udc?nav=verify">정보수정</a></li>
			<li class="li"><a id="dropBtn">회원탈퇴</a></li>
		</c:otherwise>
	</c:choose>
</ul>
