<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240430210223">
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240430210223">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">

<jsp:include page="../../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#user_menu").addClass("bg-gradient-primary");
	});
	
	function openInNewWindow(url) {
	    // 새 창을 열고, 크기와 위치를 지정합니다.
	    // 'width=800'과 'height=600'은 새 창의 크기를 800x600 픽셀로 설정합니다.
	    // 'left=200'과 'top=100'은 새 창의 화면에서의 위치를 설정합니다.
	    window.open(url, 'newWindow', 'width=800,height=600,left=200,top=100');
	}
	
</script>
<!-- golgolz start -->
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">사용자 관리</li>
					</ol>
					<a href="#" onclick="http://localhost/online-shop/manage/user/userManage/userInfoManage.jsp" class="original">
					<h6 class="font-weight-bolder mb-0">사용자 관리</h6>
					</a>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
		
			<!-- golgolz start -->
			
			<div class="s_wrap">
	<h4>회원 정보관리</h4>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<script>
jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});
</script>


<form name="fsearch" id="fsearch" method="get">
<input type="hidden" name="code" value="list">
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">검색어</th>
		<td>
			<select name="sfl">
				<option value="id">아이디</option>
				<option value="name">회원명</option>
			</select>
			<input type="text" name="stx" value="" class="frm_input" size="30">
		</td>
	</tr>
	<tr>
		<th scope="row">가입일</th>
		<td>
			<label for="fr_date" class="sound_only">시작일</label>
<input type="text" name="fr_date" value="" id="fr_date" class="frm_input w80 hasDatepicker" maxlength="10">
 ~ 
<label for="to_date" class="sound_only">종료일</label>
<input type="text" name="to_date" value="" id="to_date" class="frm_input w80 hasDatepicker" maxlength="10">
<span class="btn_group">
<input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="오늘">
<input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="일주일">
<input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="1개월">
</span>		</td>
	</tr>
	
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
	<input type="button" value="초기화" id="frmRest" class="btn_medium grey">
</div>
</form>

<div class="local_ov mart30">
	총 회원수 : <b class="fc_red">3</b>명
</div>
<div class="tbl_head01">
	<table>
	<colgroup>
		<col class="w50">
		<col class="w130">
		<col class="w150">
		<col>
		<col class="w130">
		<col class="w100">
		<col class="w130">
		<col class="w60">
		<col class="w60">
		<col class="w60">
				<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=name&amp;orderby=asc">회원명</a></th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=id&amp;orderby=asc">아이디</a></th>
		<th scope="col">핸드폰</th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=reg_time&amp;orderby=asc">가입일시</a></th>
		<th scope="col">구매수</th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=intercept_date&amp;orderby=asc">접근차단</a></th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=intercept_date&amp;orderby=asc">탈퇴여부</a></th>
	</tr>
	</thead>
	<tbody class="list">
	
	<tr class="list0">
		<td>3</td>
		<td class="tal"><span class="sv_wrap">
 <a href="#" onclick="openInNewWindow('http://localhost/online-shop/manage/user/userManage/detailedInfoManage.jsp');" class="sv_member">세글만</a>

</noscript></span></td>
		<td class="tal">tubeweb3</td>
		<td>010-3333-3333</td>
		<td>2020-10-04 18:05:42</td>
		<td>1</td>
		<td>X</td>
		<td>X</td>
				
	</tr>
	
	
	
		</tbody>
	</table>
</div>


<script>
function chk_use_app(mb_id) {
	var error = "";
	var token = get_ajax_token();
	if(!token) {
		alert("토큰 정보가 올바르지 않습니다.");
		return false;
	}

	$.ajax({
		url: tb_admin_url+"/member/member_use_app.php",
		type: "POST",
		data: {"mb_id": mb_id, "token": token },
		dataType: "json",
		async: false,
		cache: false,
		success: function(data, textStatus) {
			error = data.error;
		}
	});

	if(error) {
		alert(error);
		return false;
	}
}

$(function(){
	// 날짜 검색 : TODAY MAX값으로 인식 (maxDate: "+0d")를 삭제하면 MAX값 해제
	$("#fr_date, #to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" });
});
</script>
</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>