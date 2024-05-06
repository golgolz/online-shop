<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<link rel="stylesheet"
	href="http://demofran.com/admin/css/admin.css?ver=20240430144650">
<link type="text/css"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css"
	rel="stylesheet">
<link type="text/css"
	href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240430144650">
<link rel="shortcut icon"
	href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico"
	type="image/x-icon">
<script type="text/javascript">
	$(function() {
		$("#refund_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
.od_status {
	font-size: 12px;
	color: black;
}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;"> 관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">반품 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">반품 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div class="s_wrap">
				<h5>반품리스트(전체)</h5>
 
				<script type="text/javascript"
					src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
				<script>
					jQuery(function($) {
						$.datepicker.regional["ko"] = {
							closeText : "닫기",
							prevText : "이전달",
							nextText : "다음달",
							currentText : "오늘",
							monthNames : [ "1월(JAN)", "2월(FEB)", "3월(MAR)",
									"4월(APR)", "5월(MAY)", "6월(JUN)", "7월(JUL)",
									"8월(AUG)", "9월(SEP)", "10월(OCT)",
									"11월(NOV)", "12월(DEC)" ],
							monthNamesShort : [ "1월", "2월", "3월", "4월", "5월",
									"6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
							dayNames : [ "일", "월", "화", "수", "목", "금", "토" ],
							dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
							dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
							weekHeader : "Wk",
							dateFormat : "yymmdd",
							firstDay : 0,
							isRTL : false,
							showMonthAfterYear : true,
							yearSuffix : ""
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
									<td><select name="sfl">
											<option value="od_id">주문번호</option>
											<option value="mb_id">회원아이디</option>
											<option value="name">주문자명</option>
											<option value="b_name">수령자명</option>
									</select> <input type="text" name="stx" value="" class="frm_input"
										size="30"></td>
								</tr>
								<tr>
									<th scope="row">기간검색</th>
									<td><select name="sel_field">
											<option value="od_time">주문일</option>
									</select> <label for="fr_date" class="sound_only">시작일</label> <input
										type="text" name="fr_date" value="" id="fr_date"
										class="frm_input w80 hasDatepicker" maxlength="10"> ~
										<label for="to_date" class="sound_only">종료일</label> <input
										type="text" name="to_date" value="" id="to_date"
										class="frm_input w80 hasDatepicker" maxlength="10"> <span
										class="btn_group"><input type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="오늘"><input
											type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="어제"><input
											type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="일주일"><input
											type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="지난달"><input
											type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="1개월"><input
											type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="3개월"><input
											type="button"
											onclick="search_date('fr_date','to_date',this.value);"
											class="btn_small white" value="전체"></span></td>
								</tr>

								<tr>
									<th scope="row">반품상태</th>
									<td><label class="od_status"><input type="radio"
											name="od_final" value="" checked="checked"> 전체</label> <label
										class="od_status"><input type="radio" name="od_final"
											value="1"> 반품접수</label> <label class="od_status"><input
											type="radio" name="od_final" value="0"> 반품완료</label></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="submit" value="검색" class="btn_medium"> <input
							type="button" value="초기화" id="frmRest" class="btn_medium grey">
					</div>
				</form>

				<div class="local_ov mart30">
					전체 : <b class="fc_red">n</b> 건 조회 <select id="page_rows"
						onchange="location='/admin/order.php?code=list&amp;page=1&amp;page_rows='+this.value;"
						class="marl5">
						<option value="30" selected="selected">30줄 정렬</option>
						<option value="50">50줄 정렬</option>
						<option value="100">100줄 정렬</option>
						<option value="150">150줄 정렬</option>
					</select> <strong class="ov_a">총주문액 : n원</strong>
				</div>

				<form name="forderlist" id="forderlist" method="post">
					<input type="hidden" name="q1" value="code=list"> <input
						type="hidden" name="page" value="1">
				</form>

				<div class="tbl_head01">
					<table id="sodr_list">
						<colgroup>
							<col class="w120">
							<col class="w100">
							<col class="w40">
							<col class="w40">
							<col class="w60">
							<col class="w120">
							<col class="w100">
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">주문일시</th>
							<th scope="col">주문번호</th>
							<th scope="col">주문자ID</th>
							<th scope="col">주문자명</th>
							<th scope="col">반품상태</th>
							<th scope="col">반품일시</th>
							<th scope="col">환불금액</th>
							<th scope="col">결제수단</th>
						</tr>
						</thead>
						<tbody>
						<tr class="list0">
							<td>2024-02-01 11:53</td>
							<td>202402011153</td>
							<td>lee</td>
							<td>이명화</td>
							<td>반품완료</td>
							<td>2024-02-07 22:11</td>
							<td>100,000원</td>
							<td>카드결제</td>
						</tr>
						</tbody>
					</table>
				</div>

				<nav class="pg_wrap">
					<span class="pg"><span class="pg_start">처음</span> <span
						class="pg_prev">이전</span> <span class="sound_only">열린</span><strong
						class="pg_current">1</strong><span class="sound_only">페이지</span> <a
						href="/admin/order.php?code=list&amp;page=2" class="pg_page">2<span
							class="sound_only">페이지</span></a> <span class="pg_next">다음</span> <a
						href="/admin/order.php?code=list&amp;page=2"
						class="pg_page pg_end">맨끝</a> </span>
				</nav>
				<script>
					$(function() {
						$("#fr_date, #to_date").datepicker({
							changeMonth : true,
							changeYear : true,
							dateFormat : "yy-mm-dd",
							showButtonPanel : true,
							yearRange : "c-99:c+99",
							maxDate : "+0d"
						});

						// 주문서출력
						$("#frmOrderPrint, #frmOrderExcel")
								.on(
										"click",
										function() {
											var type = $(this).attr("id");
											var od_chk = new Array();
											var od_id = "";
											var $el_chk = $("input[name='chk[]']");

											$el_chk.each(function(index) {
												if ($(this).is(":checked")) {
													od_chk.push($(
															"input[name='od_id["
																	+ index
																	+ "]']")
															.val());
												}
											});

											if (od_chk.length > 0) {
												od_id = od_chk.join();
											}

											if (od_id == "") {
												alert("처리할 자료를 하나 이상 선택해 주십시오.");
												return false;
											} else {
												if (type == 'frmOrderPrint') {
													var url = "./order/order_print.php?od_id="
															+ od_id;
													window
															.open(
																	url,
																	"frmOrderPrint",
																	"left=100, top=100, width=670, height=600, scrollbars=yes");
													return false;
												} else {
													this.href = "./order/order_excel2.php?od_id="
															+ od_id;
													return true;
												}
											}
										});
					});
				</script>
			</div>
			<!-- golgolz end -->
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>