<%@page import="user.order.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.vo.OrderProductVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="user.order.UserOrderDAO"%>
<%@page import="order.vo.OrderDetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String userId = (String)session.getAttribute("userId");
String cartId = request.getParameter("cartId");

// 개발을 위해 임시로 사용하는 코드입니다.
/* if(cartId == null){
    cartId = "20240515060517";
} */

OrderDetailVO odVO = new OrderDetailVO();
List<OrderProductVO> list = new ArrayList<OrderProductVO>();
UserOrderDAO uDAO = UserOrderDAO.getInstance();
CartDAO cDAO = CartDAO.getInstance();
int result = 0; //총액
int priceSum = 0;
OrderProductVO opVO = new OrderProductVO();
try {
    
    odVO = uDAO.selectDetailOrder(cartId,"주문");
    list = odVO.getProductList();
    
    for(int i=0; i<list.size(); i++){
        opVO = list.get(i);
        priceSum += opVO.getPrice()*opVO.getQuantity();
        result = priceSum;
    }//end for
    result += 3000;
    
}catch(SQLException se){
    se.printStackTrace();
}//end catch


%>
<script>
function redirectToReviewPage(code, cartId) {
        // code와 cartId를 URL에 파라미터로 추가하여 리뷰 작성 페이지로 이동
        window.location.href = "http://localhost/review/review_write.jsp?code=" + code + "&cartId=" + cartId;
    	}
</script>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<style>
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0;
	padding: 0;
}

.xans-myshop-orderhistorydetail .orderArea:first-child .title {
	margin-top: 0;
}

.xans-myshop-orderhistorydetail .title {
	margin: 40px 0 10px 10px;
}

.ec-base-table table {
	position: relative;
	margin: 0 0 0;
	border: 1px solid #d7d5d5;
	border-top: 0;
	color: #fff;
	line-height: 1.5;
} 
.order-product-table{
	text-align: center;
}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div id="container">
				<div id="contents">

					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/myshop/index.html">마이쇼핑</a></li>
							<li title="현재 위치"><strong>주문상세조회</strong></li>
						</ol>
					</div>

					<div class="titleArea">
						<h2>주문상세조회</h2>
					</div>

					<form id="detailForm" name="detailForm"
						action="/exec/front/MyShop/OrderCancel/" method="POST"
						enctype="multipart/form-data">
						<input id="order_id" name="order_id" fw-filter="isFill"
							fw-label="주문번호" fw-msg="" value="<%= odVO.getCartId() %>" type="hidden">
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorydetail xans-record-">
							<div class="orderArea">
								<div class="title">
									<h6>주문정보</h6>
								</div>

								<div class="ec-base-table">
									<table border="1" summary="">
										<caption>주문정보</caption>
										<colgroup>
											<col style="width: 160px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">주문번호</th>
												<td><%= odVO.getCartId() %></td>
											</tr>
											<tr>
												<th scope="row">주문일자</th>
												<td><%= odVO.getOrderDate() %></td>
											</tr>
											<tr>
												<th scope="row">주문자</th>
												<td><span><%= odVO.getRecipient() %></span></td>
											</tr>
											<tr>
												<th scope="row">주문처리상태</th>
												<td><%= odVO.getDeliveryStatus() %>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="orderArea">
								<div class="title">
									<h6>결제정보</h6>
								</div>
								<div class="ec-base-table">
									<table border="1" summary="">
										<caption>결제정보</caption>
										<colgroup>
											<col style="width: 160px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr class="sum">
												<th scope="row">총 주문금액</th>
												<td><span class="gSpace20"> <strong
														class="txt14"><%= result %></strong>원 <span class="displaynone"></span>
												</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="ec-base-table total">
									<table border="1" summary="">
										<caption>결제정보</caption>
										<colgroup>
											<col style="width: 160px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr class="sum">
												<th scope="row">총 결제금액</th>
												<td><span class="txtEm"> <strong class="txt18"><%= result %></strong>원
														<span class="displaynone"></span>
												</span></td>
											</tr>
											<tr class="">
												<th scope="row">결제수단</th>
												<td><strong><span>카드 결제</span></strong></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">전자보증보험<br>서비스정보
												</th>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="orderArea">
								<div class="title">
									<h6>주문 상품 정보</h6>
								</div>

								<div class="ec-base-table typeList">
									<table border="1" summary="" class="order-product-table">
										<caption>기본배송</caption>
										<colgroup>
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 60px">
											<col style="width: 100px">
											<col style="width: 95px">
											<col style="width: 110px">
											<col style="width: 110px">
											<col style="width: 110px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">이미지</th>
												<th scope="col">상품정보</th>
												<th scope="col">수량</th>
												<th scope="col">판매가</th>
												<th scope="col">배송비</th>
												<th scope="col">주문처리상태</th>
												<th scope="col">구매현황</th>
												<th scope="col">상품리뷰</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td colspan="8">상품구매금액 <strong><%= priceSum %></strong> + 배송비
													<%= opVO.getDelivertyFee() %> = 합계 : <strong class="txtEm gIndent10"><span
														class="txt18"><%= result %>원</span></strong> <span class="displaynone"></span>
												</td>
											</tr>
										</tfoot>
										<% for(OrderProductVO oVO : list) { %>
										<tbody
											class="xans-element- xans-myshop xans-myshop-orderhistorydetailbasic center">
											<tr class="xans-record-">
												<td class="thumb"><a
													href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
														src="http://localhost/assets/images/goods/<%= oVO.getProductImg() %>"
														style="width: 100px;" alt=""
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"></a></td>
												<td class="left"><strong class="name"><a
														href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
														class="ec-product-name"><%= oVO.getProductName() %></a></strong>
													<div class="option ">[옵션: <%= oVO.getCode() %>]</div>
													<p class="gBlank5 displaynone">무이자할부 상품</p></td>
												<td><%= oVO.getQuantity() %></td>
												<td class="right">
													<div class="">
														<strong><%= oVO.getPrice() %>원</strong>
														<div class="displaynone"></div>
													</div>
													<div class="displaynone">
														<strong><%= oVO.getPrice() %>원</strong>
														<div class="displaynone"></div>
													</div>
												</td>
												<td><div class="txtInfo">
														<%= oVO.getDelivertyFee() %>원
														<div class="displaynone">(해외배송가능)</div>
													</div></td>
												<td class="state">
													<p class="txtEm"><%= odVO.getDeliveryStatus() %></p>
													<p class="displaynone">
														<a href="#" target="_self"></a>
													</p>
													<p class="displaynone">
														<a href="#none" class="line" onclick="">[]</a>
													</p>
												</td>
												<td>
													<p><%= odVO.getPurchaseStatus() %></p>
													<p class="displaynone">-</p>
												</td>
												<td class="state">
												<% if(odVO.getPurchaseStatus()=="구매확정") { %>
												<input type="button" class="btnNormal" value="리뷰작성" onclick="redirectToReviewPage('<%= oVO.getCode() %>', '<%= cartId %>')">
												<%}else{%>
												<input type="button"  class="btnNormal" value="리뷰작성" onclick="alert('구매 확정 시 작성이 가능합니다.')" />
												<% }//end else %>
												</td>
											</tr>
										</tbody>
										<% }//end for %>
									</table>
								</div>

							</div>

							<div class="orderArea" style="margin-bottom: 50px;">
								<div class="title">
									<h6>배송지정보</h6>
								</div>
								<div class="ec-base-table">
									<table border="1" summary="">
										<caption>배송지정보</caption>
										<colgroup>
											<col style="width: 160px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr class="displaynone">
												<th scope="row">수령지</th>
												<td>
													<ul class="list">
														<li>- 주소 :</li>
														<li>- 전화번호 :</li>
														<li>- 수령지 안내 :</li>
													</ul>
													</td>
											</tr>
											<tr>
												<th scope="row">받으시는분</th>
												<td><span><%= odVO.getRecipient() %></span></td>
											</tr>
											<tr class="">
												<th scope="row">우편번호</th>
												<td><span><%= odVO.getZipcode() %></span></td>
											</tr>
											<tr class="">
												<th scope="row">주소</th>
												<td><span><%= odVO.getDefaultAddr() %> <%= odVO.getDetailAddr() %></span></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">도시</th>
												<td></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">주/지방</th>
												<td></td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td><span><%= odVO.getTel() %></span></td>
											</tr>
											<tr>
												<th scope="row">배송메시지</th>
												<td><span><%= odVO.getDeliveryMsg() %></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div> 
						</div>
					</form>
				</div>
			</div>
			<hr class="layout">
			<div id="banner"></div>
			<div id="quick"></div>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>