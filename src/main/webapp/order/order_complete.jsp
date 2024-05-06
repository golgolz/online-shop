<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<style>
		.btnSubmit,
		.btnNormal {
			margin: 3px;
		}

		#wrap {
			position: relative;
			width: 100%;
			margin: 0 auto;
			min-height: 550px;
			text-align: center;
		}

		#container {
			width: 1240px;
			zoom: 1;
			position: relative;
			margin: 0 auto;
		}
 
		#container #contents {
			width: 1240px;
			margin: 0 auto;
		}

		table,
		th,
		td {
			border: 1px solid #e9e9e9;
			vertical-align: middle;
			margin-top: 20px;
			margin-bottom: 30px;
			padding: 10px;
		}

		th {
			background-color: #fbfafa;
		}

		p {
			margin: 3px;
		}

		.con_header {
			padding-top: 30px;
			padding-bottom: 10px;
		}

		.con_body_top {
			padding-top: 10px;
			padding-bottom: 50px;
		}
		
		.ec-base-table,.con_product_table,.paymentArea{
			margin-bottom: 60px;
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
					<div class="con_header" style="padding: 20px;">
						<div><img src="http://localhost/online-shop/assets/images/order/success_check.png" width="100px" /></div>
						<h2 style="padding: 10px; font-size: 24px;"><strong>고객님의 주문이 완료 되었습니다.</strong></h2>
						<p>주문내역 및 배송에 관한 안내는 <a href="#void">주문조회</a>를 통하여 확인 가능합니다.</p>
					</div>
					<div class="con_body" style="font-size: 13px; margin: 10px;">
						<div class="con_body_top">
							<p style="font-size: 14px;">주문번호 : <strong>202404251617</strong></p>
							<p>주문일자 : 2024-04-25 16:17:22</p>
						</div>
						<div class="con_product_table">
							<p style="text-align: left; font-size: 15px;"><strong>주문상품</strong></p>
							<table
								style="border: 1px solid #333; width: 100%; margin-left:auto; margin-right:auto; border-bottom: #e9e9e9;"
								summary="" class="xans-element- xans-order xans-order-normnormal xans-record-">
								<caption>배송상품</caption>
								<colgroup>
									<col style="width:92px">
									<col style="width:auto">
									<col style="width:98px">
									<col style="width:75px">
									<col style="width:85px">
									<col style="width:98px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">이미지</th>
										<th scope="col">상품정보</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">배송비</th>
										<th scope="col">합계</th>
									</tr>
								</thead>
								<tfoot class="right">
									<tr>
									</tr>
								</tfoot>
								<tbody class="xans-element- xans-order xans-order-list center">
									<tr class="xans-record-">
										<td class="thumb gClearLine"><a
												href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
													src="http://localhost/online-shop/assets/images/goods/APPLE_IPHONE14_1.png"
													onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
													alt="APPLE_IPHONE14" style="width: 100px"></a>
										</td>
										<td class="left gClearLine">
											<strong class="name"><a
													href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
													class="ec-product-name">APPLE_IPHONE14
													케이스</a></strong> <span class="displaynone engName">(영문명 : )</span>
											<ul class="xans-element- xans-order xans-order-optionall option">
												<li class="xans-record-">
													<strong class="displaynone">APPLE_IPHONE14</strong>[옵션: APPLE_IPHONE14] <span
														class="displaynone">(1개)</span><br>
												</li>
											</ul>
										</td>
										<td class="right">
											<div id="product_price_div0" class="">
												<strong>20,000원</strong>
												<p class="displaynone"></p>
											</div>
											<div id="product_sale_price_div0" class="displaynone">
												<strong><span id="product_sale_price_front0">20,000</span>원</strong>
												<p class="displaynone"></p>
											</div>
										</td>
										<td>
											<span>1</span>
										</td>


										<td rowspan="1" class="">
											<p class="">3,000원<span class="displaynone"><br></span><br></p>
										</td>
										<td class="right">
											<strong><span id="sum_price_front0">23,000</span>원</strong>
											<div class="displaynone"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="paymentArea">
							<p style="text-align: left; font-size: 15px;"><strong>결제 정보</strong></p>
							<table border="1" summary="">
								<caption>결제정보</caption>
								<colgroup>
									<col style="width:160px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr class="sum">
										<th scope="row">총 결제금액</th>
										<td>
											<span class="txtEm">
												<strong class="txt18">23,000</strong>원 <span class="displaynone"></span>
											</span>
										</td>
									</tr>
									<tr class="">
										<th scope="row">결제수단</th>
										<td>
											<strong><span>카드 결제</span></strong>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="ec-base-table">
							<p style="text-align: left; font-size: 15px;"><strong>배송지 정보</strong></p>
							<table border="1" summary="" style="text-align: left;">
								<caption>배송지정보</caption>
								<colgroup>
									<col style="width:160px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr class="displaynone">
										<th scope="row">수령지</th>
										<td>
											<strong></strong>
											<ul class="list">
												<li>- 주소 : </li>
												<li>- 전화번호 : </li>
												<li>- 영업시간 : </li>
												<li>- 수령 가능일 : </li>
												<li>- 수령지 안내 : </li>
											</ul>
											<div class="map displaynone">
												<p>* 약도</p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">받으시는분</th>
										<td><span>정명호</span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">영문이름</th>
										<td><span></span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">이름(발음기호)</th>
										<td><span></span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">국가</th>
										<td></td>
									</tr>
									<tr class="">
										<th scope="row">우편번호</th>
										<td><span></span></td>
									</tr>
									<tr class="">
										<th scope="row">주소</th>
										<td><span></span></td>
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
										<th scope="row">일반전화</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td><span>010-4017-8712</span></td>
									</tr>
									<tr>
										<th scope="row">배송메시지</th>
										<td><span>지문 찍어주세요.</span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">희망 배송일</th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">희망 배송시간</th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">희망배송업체/방식</th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">수령가능일</th>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="xans-element- xans-order xans-order-totalorder ec-base-button justify" style="margin-bottom: 60px;">
							<span class="gRight">
								<a href="http://localhost/online-shop/index.jsp"
									class="btnNormalFix sizeM">쇼핑계속하기</a>
								<a href="http://localhost/online-shop/user/OrderReturn/order_list.jsp"
									class="btnSubmitFix sizeM">주문확인하기</a>
							</span>
					</div>
					</div>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>