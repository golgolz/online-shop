<%@page import="admin.order.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.order.AdminOrderDAO"%>
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
		$("#order_menu").addClass("bg-gradient-primary");
    	$("#btn_search").click(function(){
    		$("#frmGoods").submit();
    	});
    	
		$("#btn_today").click(function(){
			$("#date").val("today");
			$("#btn_week").removeClass('clicked');
			$("#btn_month").removeClass('clicked');
			$("#btn_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_week").click(function(){
			$("#date").val("week");
			$("#btn_today").removeClass('clicked');
			$("#btn_month").removeClass('clicked');
			$("#btn_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_month").click(function(){
			$("#date").val("month");
			$("#btn_today").removeClass('clicked');
			$("#btn_week").removeClass('clicked');
			$("#btn_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_total").click(function(){
			$("#date").val("total");
			$("#btn_today").removeClass('clicked');
			$("#btn_week").removeClass('clicked');
			$("#btn_month").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_update_today").click(function(){
			$("#updateDate").val("today");
			$("#btn_update_week").removeClass('clicked');
			$("#btn_update_month").removeClass('clicked');
			$("#btn_update_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_update_week").click(function(){
			$("#updateDate").val("week");
			$("#btn_update_today").removeClass('clicked');
			$("#btn_update_month").removeClass('clicked');
			$("#btn_update_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_update_month").click(function(){
			$("#updateDate").val("month");
			$("#btn_update_today").removeClass('clicked');
			$("#btn_update_week").removeClass('clicked');
			$("#btn_update_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_update_total").click(function(){
			$("#updateDate").val("total");
			$("#btn_update_today").removeClass('clicked');
			$("#btn_update_week").removeClass('clicked');
			$("#btn_update_month").removeClass('clicked');
			$(this).addClass('clicked');
		});
		
		$(".sort").click(function(){
			$("#sort").val($(this).text() === "가격순" ? "price" : "input_date");
    		$("#frmGoods").submit();
		});
	});
</script>
<!-- golgolz start -->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var tb_url		 = "http://demofran.com";
var tb_bbs_url	 = "http://demofran.com/bbs";
var tb_shop_url  = "http://demofran.com/shop";
var tb_admin_url = "http://demofran.com/admin";
</script>
<script src="http://demofran.com/js/jquery-1.8.3.min.js"></script>
<script src="http://demofran.com/js/jquery-ui-1.10.3.custom.js"></script>
<script src="http://demofran.com/js/common.js?ver=20240430173618"></script>
<script src="http://demofran.com/js/categorylist.js?ver=20240430173618"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
.od_status {
	font-size: 12px;
	color: black;
}
.clickable-image{
	border: 2px solid transparent;
}

.clicked {
  border-color: red; 
}

</style>
<!-- golgolz end -->
</head>
<body>
	<%
	AdminOrderDAO adminOrderDAO = AdminOrderDAO.getInstance();
	List<OrderVO> orders = adminOrderDAO.selectOrders();
	%>
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
							aria-current="page">주문 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">주문 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div class="s_wrap">
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
              						<td class="box text">
              							<input type="hidden" id="date" name="date" value="${param.date}" />
              							<img id="btn_today" class="clickable-image${param.date eq 'today' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_today.gif" />
										<img id="btn_week" class="clickable-image${param.date eq 'week' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_thisWeek.gif" />
										<img id="btn_month" class="clickable-image${param.date eq 'month' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_thisMonth.gif" />
					                	<img id="btn_total" class="clickable-image${param.date eq 'total' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_total.gif" />
              						</td>
								</tr>
								<tr>
									<th scope="row">주문상태</th>
									<td><label class="od_status"><input type="radio"
											name="od_status" value="" checked="checked"> 전체</label> <label
										class="od_status"><input type="radio" name="od_status"
											value="3"> 배송준비</label> <label class="od_status"><input
											type="radio" name="od_status" value="4"> 배송중</label> <label
										class="od_status"><input type="radio" name="od_status"
											value="5"> 배송완료</label></td>
								</tr>
								<tr>
									<th scope="row">구매확정</th>
									<td><label class="od_status"><input type="radio"
											name="od_final" value="" checked="checked"> 전체</label> <label
										class="od_status"><input type="radio" name="od_final"
											value="1"> 구매확정</label> <label class="od_status"><input
											type="radio" name="od_final" value="0"> 구매미확정</label></td>
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
					전체 : <b class="fc_red"><%= adminOrderDAO.selectCount() %></b> 건 조회
				</div>
				<form name="forderlist" id="forderlist" method="post">
					<input type="hidden" name="q1" value="code=list"> 
					<input type="hidden" name="page" value="1">
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
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">주문일시</th>
							<th scope="col">주문번호</th>
							<th scope="col">주문자ID</th>
							<th scope="col">주문자명</th>
							<th scope="col">구매현황</th>
							<th scope="col">배송상태</th>
							<th scope="col">수령자</th>
							<th scope="col">총주문액</th>
							<th scope="col">결제수단</th>
						</tr>
						</thead>
						<tbody>
						<% for(OrderVO order: orders){ %>
						<tr class="list0">
							<td><%= order.getOrderDate() %></td>
							<td><a href="http://localhost/online-shop/manage/order/detail.jsp?id=<%= order.getCartId() %>"><%= order.getCartId() %></a></td>
							<td><%= order.getCustomerId() %></td>
							<td><%= order.getCustomerName() %></td>
							<td><%= order.getPurchaseStatus() %></td>
							<td><%= order.getDeliveryStatus() %></td>
							<td><%= order.getReceiver() %></td>
							<td><%= order.getPurchaseSum() %></td>
							<td><%= order.getPayment() %></td>
						</tr>
						<% } %>
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
		</div>
	</main>
</body>
</html>