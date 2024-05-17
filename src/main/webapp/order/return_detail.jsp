<%@page import="user.order.UserReturnDAO"%>
<%@page import="order.vo.ReturnDetailVO"%>
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
String cartId = (String)request.getParameter("cartId");

// 개발을 위해 임시로 사용하는 코드입니다.

 cartId = "20240419131329"; 

OrderDetailVO odVO = new OrderDetailVO();
odVO.setCartId(cartId);
List<OrderProductVO> list = new ArrayList<OrderProductVO>();
UserOrderDAO uDAO = UserOrderDAO.getInstance();
CartDAO cDAO = CartDAO.getInstance();
UserReturnDAO urDAO = UserReturnDAO.getInstance();
int result = 0; //총액
int priceSum = 0;
OrderProductVO opVO = new OrderProductVO();
ReturnDetailVO rdVO = new ReturnDetailVO();
try {
    
    odVO = uDAO.selectDetailOrder(cartId,"반품");
    rdVO = urDAO.selectReturnDetail(cartId);
    list = rdVO.getProductList();
    
    for(int i=0; i<list.size(); i++){
        opVO = list.get(i);
        priceSum += opVO.getPrice()*opVO.getQuantity();
        result = priceSum;
    }//end for
    
}catch(SQLException se){
    se.printStackTrace();
}//end catch


%>
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
th{ text-align: center; }
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
							<li>홈</a></li>
							<li>마이쇼핑</li>
							<li title="현재 위치"><strong>반품상세조회</strong></li>
						</ol>
					</div>

					<div class="titleArea">
						<h2>반품상세조회</h2>
					</div>

					<form id="detailForm" name="detailForm"
						action="/exec/front/MyShop/OrderCancel/" method="POST"
						enctype="multipart/form-data">
						<input id="order_id" name="order_id" fw-filter="isFill"
							fw-label="주문번호" fw-msg="" value="<%= cartId %>" type="hidden">
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
												<th scope="row">반품처리상태</th>
												<td><%= rdVO.getReturnStatus() %></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="orderArea">
								<div class="title">
									<h6>환불정보</h6>
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
										<tbody class="">


											<tr class="displaynone">
												<th scope="row">네이버 마일리지/캐쉬</th>
												<td>0% 적립 / 0원 (마일리지 <strong>0</strong>원 + 캐쉬 <strong>0</strong>원)
												</td>
											</tr>
											<tr class="displaynone">
												<th scope="row">예치금</th>
												<td>0원</td>
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
											<tr class="">
												<th scope="row">환불일시</th>
												<td><strong><span><%= rdVO.getReturnDate() %></span></strong></td>
											</tr>
											<tr class="">
												<th scope="row">환불수단</th>
												<td><strong><span>카드</span></strong></td>
											</tr>
											<tr class="sum">
												<th scope="row">총 결제금액</th>
												<td><span class="txtEm"> <strong class="txt18"><%= result %></strong>원
														<span class="displaynone"></span>
												</span></td>
											</tr>
											<tr class="sum">
												<th scope="row">총 환불금액</th>
												<td><span class="txtEm"> <strong class="txt18"><%= result %></strong>원
														<span class="displaynone"></span>
												</span></td>
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
									<table border="1" summary="" class="">
										<caption>기본배송</caption>
										<colgroup>
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 60px">
											<col style="width: 100px">
											<col style="width: 95px">
											<col style="width: 110px">
											<col style="width: 110px">

										</colgroup>
										<thead>
											<tr>
												<th scope="col">이미지</th>
												<th scope="col">상품정보</th>
												<th scope="col">수량</th>
												<th scope="col">판매가</th>

												<th scope="col">반품처리상태</th>
												<th scope="col">반품일자</th>
												<th scope="col">환불금액</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td colspan="8">상품구매금액 <strong><%= result %></strong> - 환불금액
													<%= result %> = 합계 : <strong class="txtEm gIndent10"><span
														class="txt18"><%= result-result %>원</span></strong> <span class="displaynone"></span>
												</td>
											</tr>
										</tfoot>
										<tbody
											class="xans-element- xans-myshop xans-myshop-orderhistorydetailbasic center">
											<% for(OrderProductVO oVO : list){ %>
											<tr class="xans-record-">
												<td class="thumb"><a
													href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
														src="http://localhost/assets/images/goods/<%= oVO.getProductImg() %>"
														style="width: 100%;" alt=""
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"></a></td>
												<td class="left"><strong class="name"><a
														href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
														class="ec-product-name"><%= oVO.getProductName() %></a></strong>
													<div class="option ">[옵션: <%= oVO.getCode() %>]</div>
													<p class="gBlank5 displaynone">무이자할부 상품</p></td>
												<td>1</td>
												<td class="right">
													<div class="">
														<strong><%= oVO.getPrice() %>원</strong>
														<div class="displaynone"></div>
													</div>
												</td>

												<td class="state">
													<p class="txtEm"><%= rdVO.getReturnStatus() %></p>
													<p class="displaynone">
														<a href="#" target="_self"></a>
													</p>
													<p class="displaynone">
														<a href="#none" class="line" onclick="">[]</a>
													</p>
												</td>
												<td>
													<p><%= rdVO.getReturnDate() %></p>
													<p class="displaynone">-</p>
												</td>
												<td class="state">
													<p><%= result %>원</p>
												</td>
											</tr>
											<% }//end for %>
										</tbody>
									</table>
								</div>
								<hr>

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