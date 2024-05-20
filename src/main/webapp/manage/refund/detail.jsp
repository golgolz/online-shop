<%@page import="admin.refund.RefundDetailInfoVO"%>
<%@page import="admin.order.OrderDetailGoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.order.AdminOrderDAO"%>
<%@page import="admin.refund.AdminRefundDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<jsp:useBean id="refundInfo" class="admin.refund.RefundDetailInfoVO" />
<%
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

if (!Boolean.TRUE.equals(isLoggedIn)) {
%>
  <script type="text/javascript">
      alert('로그인이 필요합니다.');
      window.location.href = 'http://localhost/manage/adminLogin/adminLogin.jsp';
  </script>
<%
  return;
}
%>
<%
	AdminRefundDAO adminRefundDAO = AdminRefundDAO.getInstance();
	AdminOrderDAO adminOrderDAO = AdminOrderDAO.getInstance();
	String paramId = (String)request.getParameter("id");
	
	if(request.getParameter("id") != null){
	    refundInfo = adminRefundDAO.selectDetailInfo(paramId);
	} else {
%>
	<script>
		alert("잘못된 요청입니다. 주문 리스트 페이지로 돌아갑니다.");
		location.href = "http://localhost/manage/refund/refundss.jsp";
	</script>
<%
	}
	List<OrderDetailGoodsVO> goodsList = adminOrderDAO.selectDetailGoods(paramId);
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240430173216">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script type="text/javascript">
	$(function() {
		$("#refund_menu").addClass("bg-gradient-primary");
		
		$(".refund_status").click(function(){
			var params = { 
					method: "",
					cartId: <%= paramId %>
					};
			$.ajax({
				url: "status_update_process.jsp",
				type: "POST",
				datatype: "JSON",
				data: params,
				error: function(xhr){
					alert("error occurred");
				},
				success: function(data){
					if(data.flag){
						alert("해당 주문의 반품이 처리되었습니다.");
					}
				}
			});
		});
	});
</script>
<!-- golgolz start -->
<script src="http://demofran.com/js/jquery-1.8.3.min.js"></script>
<script src="http://demofran.com/js/jquery-ui-1.10.3.custom.js"></script>
<script src="http://demofran.com/js/common.js?ver=20240430173216"></script>
<script src="http://demofran.com/js/categorylist.js?ver=20240430173216"></script>

<style>
.new_win {
    overflow: auto; 
}
.status-btn-div {
	margin:10px;
	margin-left: 15px;
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
							aria-current="page">주문 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">주문 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="sodr_pop" class="new_win">
				<section id="anc_sodr_list">
					<h4 class="anc_tit">주문상품 목록</h4>
					<div class="local_desc02 local_desc">
						<p style="font-size: 13px;">
							주문번호 : ${ param.id }
						</p>
						<p style="font-size: 13px;">
							주문자ID : <%= refundInfo.getId() %>
						</p>
						<p style="font-size: 13px;">
							주문일시 : <%= refundInfo.getRefundDate() %>
						</p>
					</div>
					<form name="frmorderform" method="post">
						<div class="tbl_head01">
							<table id="sodr_list">
								<colgroup>
									<col class="w60">
									<col>
									<col class="w90">
									<col class="w90">
									<col class="w60">
									<col class="w70">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">이미지</th>
										<th scope="col">주문상품</th>
										<th scope="col">수량</th>
										<th scope="col">상품금액</th>
										<th scope="col">배송비</th>
										<th scope="col">실결제액</th>
									</tr>
								</thead>
								<tbody class="list">
									<% for(OrderDetailGoodsVO goods : goodsList){ %>
									<tr class="list0">
											<td>
												<a href="http://localhost/goods/detail.jsp?goods=<%= goods.getCode() %>">
													<img src="http://localhost/assets/images/goods/<%= goods.getDefaultImage() %>" width="40" height="40">
												</a>
											</td>
											<td class="tal">
												<a href="http://localhost/goods/detail.jsp?goods=<%= goods.getCode() %>">
													<%= goods.getName() %>
												</a>
											</td>
											<%-- <td><%= goods.getOrderStatus() %></td>
											<td id="purchaseStatus"><%= goods.getPurchaseStatus() %></td> --%>
											<td><%= goods.getAmount() %>개</td>
											<td class="tar"><%= goods.getPrice() %>원</td>
											<td class="tar"><%= goods.getDeliveryCharge() %>원</td>
											<td class="td_price"><%= goods.getPrice() * goods.getAmount() + goods.getDeliveryCharge() %>원</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</form>
				</section>
				<section>
					<form name="buttonfrm">
						<div class="status-btn-div">
							<input type="button" value="반품완료" class="btn_medium refund_status">
						</div>
					</form>
				</section>
				<section id="anc_sodr_pay" class="new_win_desc mart30">
					<h3 class="anc_tit">주문결제 내역</h3>
					<form name="frmorderreceiptform" >
						<div class="compare_wrap">
							<section id="anc_sodr_chk" class="compare_center">
								<h3>환불정보 확인</h3>
								<div class="tbl_frm01">
									<table>
										<colgroup>
											<col class="w150">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">총 상품금액</th>
												<td class="td_price"><%= refundInfo.getRefundAmount() %>원</td>
											</tr>
											<tr>
												<th scope="row">배송비</th>
												<td class="td_price">3000원</td>
											</tr>
											<tr>
												<th scope="row">총 환불금액</th>
												<td class="td_price bg0"><%= refundInfo.getRefundAmount() + 3000 %>원</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>
							<div class="btn_confirm">
								<a href="javascript:history.back();" class="btn_medium bx-white">이전</a>
							</div>
						</div>
					</form>
				</section>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>