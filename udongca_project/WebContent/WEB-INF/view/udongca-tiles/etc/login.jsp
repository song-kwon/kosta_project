<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#find_id').click(function() {
							$('#id_error_span').empty();
							$('#find_id_modal').modal();
						});

						$('#find_pwd').click(function() {
							$('#pwd_error_span').empty();
							$('#find_pwd_modal').modal();
						});

						$('#find_id_btn')
								.click(
										function() {

											$
													.ajax({
														'url' : '/udongca_project/memberId_find.udc',
														'type' : 'post',
														'data' : {
															'memberName' : $(
																	'#memberName_id')
																	.val(),
															'memberEmail' : $(
																	'#memberEmail_id')
																	.val()
														},
														'dataType' : 'text',
														'success' : function(
																text) {
															message = text;
														},
														'beforeSend' : function() {
															$('#loading_modal')
																	.modal();
														},
														'complete' : function() {
															setTimeout(
																	function() {
																		$(
																				'#loading_modal')
																				.modal(
																						'hide');
																		if (message != '정보가 일치하는 아이디가 없습니다.') {
																			alert(message);
																			$(
																					'#memberName_id')
																					.val(
																							"");
																			$(
																					'#memberEmail_id')
																					.val(
																							"");
																			$(
																					'#find_id_modal')
																					.modal(
																							'hide');
																		} else {
																			$(
																					'#id_error_span')
																					.empty();
																			$(
																					'#id_error_span')
																					.append(
																							'<font style="color:red;">'
																									+ message
																									+ '</font>');
																			$('#memberName_id').val('');
																			$('#memberEmail_id').val('');
																		}
																	}, 1000)
														}
													});

										})

						$('#find_pwd_btn')
								.click(
										function() {
											var message = '';
											$
													.ajax({
														'url' : '/udongca_project/memberPassword_find.udc',
														'type' : 'post',
														'data' : {
															'memberId' : $(
																	'#memberId')
																	.val(),
															'memberName' : $(
																	'#memberName_pwd')
																	.val(),
															'memberEmail' : $(
																	'#memberEmail_pwd')
																	.val()
														},
														'dataType' : 'text',
														'success' : function(
																text) {
															message = text;
														},
														'beforeSend' : function() {
															$('#loading_modal')
																	.modal();
														},
														'complete' : function() {
															setTimeout(
																	function() {
																		$(
																				'#loading_modal')
																				.modal(
																						'hide');
																		if (message != '정보가 일치하는 회원이 없습니다.') {
																			alert(message);
																			$(
																					'#memberId')
																					.val(
																							"");
																			$(
																					'#memberName_pwd')
																					.val(
																							"");
																			$(
																					'#memberEmail_pwd')
																					.val(
																							"");
																			$(
																					'#find_pwd_modal')
																					.modal(
																							'hide');
																		} else {
																			$(
																					'#pwd_error_span')
																					.empty();
																			$(
																					'#pwd_error_span')
																					.append(
																							'<font style="color:red;">'
																									+ message
																									+ '</font>');
																			$('#memberId').val('');
																			$('#memberName_pwd').val('');
																			$('#memberEmail_pwd').val('');
																		}
																	}, 1000)
														}
													});

										});
						
						$('.modal-close').click(function(){
							$('#memberName_id').val('');
							$('#memberEmail_id').val('');
							$('#memberId').val('');
							$('#memberName_pwd').val('');
							$('#memberEmail_pwd').val('');
						});

					});
</script>
<style type="text/css">
.form-group {
	vertical-align: bottom;
}

 .center {
	margin: 300px auto;
	padding: 10px;
	width: 130px;
	background-color: White;
	border-radius: 10px;
	filter: alpha(opacity = 100);
	opacity: 1;
	-moz-opacity: 1;
} 

.center img {
	height: 120px;
	width: 120px;
}
</style>
<div class="container">
	<form action="/udongca_project/member/login.udc" method="post"
		onsubmit="return loginCheck();">
		<div class="col-sm-12">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<input type="text" class="form-control"
					style="height: 60px; font-size: 20pt" placeholder="아이디" id="id"
					name="id"><br> <input type="password"
					style="height: 60px; font-size: 20pt;" placeholder="비밀번호"
					id="password" name="password">
				<c:if test="${not empty requestScope.error }">
					<div align="center">
						<font color="red">${requestScope.error }</font>
					</div>
				</c:if>
			</div>
			<div class="col-sm-3"></div>
		</div>
		<div class="col-sm-12">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<br>
				<button class="form-control btn-info" type="submit"
					style="height: 60px;">
					<font style="font-size: 20pt">로그인</font>
				</button>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</form>
	<div class="col-sm-12" align="center">
		<div style="padding-top: 15px; clear: both;">
			<a id="find_id">아이디 찾기</a> / <a id="find_pwd">비밀번호 찾기</a> / <a
				href="/udongca_project/joinSelect.udc">회원가입</a> <br> <br>
		</div>
	</div>

	<!-- 아이디 찾기 modal -->
	<div class="modal fade" id="find_id_modal" role="dialog" align="center">
		<div class="modal-dialog modal-lg" style="max-width: 400px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h3>아이디 찾기</h3>
				</div>
				<div class="modal-body">
					<form class="form-group" role="form">
						<span id="id_error_span" style="font-size: 15px;"></span> <input
							type="text" class="form-control" id="memberName_id"
							placeholder="이름을 입력하세요" style="height: 40px; font-size: 20pt;">
						<br> <input type="text" class="form-control"
							id="memberEmail_id" placeholder="이메일을 입력하세요"
							style="height: 40px; font-size: 20pt;"> <br>
						<button id="find_id_btn" type="button"
							class="btn btn-success btn-block"
							style="margin-top: 15px; font-size: 20pt;">찾기</button>
						<button id="close" class="btn btn-default btn-block modal-close"
							data-dismiss="modal" style="margin-top: 15px; font-size: 20pt;">닫기</button>
					</form>
				</div>

			</div>

		</div>
	</div>

	<!-- 비밀번호 찾기 modal -->
	<div class="modal fade" data-backdrop='static' id="find_pwd_modal" role="dialog"
		align="center">
		<div class="modal-dialog modal-lg" style="max-width: 400px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h3>비밀번호 찾기</h3>
				</div>
				<div class="modal-body">
					<form class="form-group" role="form">
						<span id="pwd_error_span"></span> <input type="text"
							class="form-control" id="memberId" placeholder="아이디를 입력하세요"
							style="height: 40px; font-size: 20pt;"> <br> <input
							type="text" class="form-control" id="memberName_pwd"
							placeholder="이름을 입력하세요" style="height: 40px; font-size: 20pt;">
						<br> <input type="text" class="form-control"
							id="memberEmail_pwd" placeholder="이메일을 입력하세요"
							style="height: 40px; font-size: 20pt;"> <br>
						<button id="find_pwd_btn" type="button"
							class="btn btn-success btn-block"
							style="margin-top: 15px; font-size: 20pt;">찾기</button>
						<button class="btn btn-default btn-block modal-close" data-dismiss="modal"
							style="margin-top: 15px; font-size: 20pt;">닫기</button>
					</form>
				</div>

			</div>

		</div>
	</div>


	<div class="modal" data-backdrop='static' role="dialog" id="loading_modal"
		style="display: none;">
		<div class="center">
			<img alt="" src="/udongca_project/images/loader.gif" />
		</div>
	</div>
</div>