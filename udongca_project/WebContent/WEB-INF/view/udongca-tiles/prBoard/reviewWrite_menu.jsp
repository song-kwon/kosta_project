<%@ page contentType="text/html;charset=utf-8" %>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		"url":"/udongca_project/prBoard/cafeMenuList.udc",
		"type":"GET",
		"data":"",
		"dataType":"json",
		"success":function(json){
			for(var i = 0; i < json.length; i++){
				var a= "'"+json[i].codeName+"'" ;
				$("#menuCategoryList").append('<li class="li"><a onclick="toMenuImage(' + a + ')">' + json[i].codeName + '</a></li>');
			}
		},
		"error":function(xhr){
			alert("An error occured while loading cafeMenuList.udc: " + xhr.status + " " + xhr.statusText);
		}
	});
})
	function toMapLocation(){
		location.href = "/udongca_project/prBoard/prView.udc?cafeNo=" + "${requestScope.cafeNo}";
	}
	function toReviewList(page){
		location.href = "/udongca_project/prBoard/prView.udc?cafeNo=" + "${requestScope.cafeNo}" + "&initialPage=reviewList";
	}
	function toMenuImage(menuType){
		location.href = "/udongca_project/prBoard/prView.udc?cafeNo=" + "${requestScope.cafeNo}" + "&initialPage=menuImage&initialPage2=" + menuType;
	}
	function collapseMenu() {
		if ($('#cafeMenuList').prop('class') != 'collapsed')
			$('#cafeMenuList').trigger('click');
	}
	function deleteMenuType() {
		$("#menuType").empty();
	}
</script>
<style type="text/css">
.nav-pills>li.active>a, .nav-pills>li.active>a:hover, .nav-pills>li.active>a:focus
	{
	background-color: #6b4004;
}

.nav>li>a {
	font-size: 15pt;
}

.nav>li>a:hover, .nav>li>a:focus {
	font-weight: bold;
	background-color: #faebd7;
}

.nav-pills>li.active>div#dropBtn, .nav-pills>li.active>div#dropBtn:hover,
	.nav-pills>li.active>div#dropBtn:focus {
	background-color: #6b4004;
}

.nav>li>div#dropBtn:hover, .nav>li>a:focus {
	font-weight: bold;
	background-color: #faebd7;
	cursor: pointer;
}
</style>
<div id="optionList">
	<div class="panel-group">
		<ul class="nav nav-pills">
			<li class="li"><a data-toggle="collapse" style='cursor: pointer'
				onclick="deleteMenuType();collapseMenu();toMapLocation();return false;">지도</a></li>
			<li class="li"><a id="cafeMenuList" class="collapsed"
				data-toggle="collapse" href="#collapse1">메뉴</a></li>
			<li class="li"><a data-toggle="collapse" style='cursor: pointer'
				onclick="deleteMenuType();collapseMenu();toReviewList();return false;">리뷰</a></li>
		</ul>
		<div id="collapse1" class="panel-collapse collapse">
			<ul class="nav nav-pills" id="menuCategoryList">
			</ul>
		</div>
	</div>
</div>