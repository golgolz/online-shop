<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
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
							<li><a href="/">홈</a></li>
							<li><a href="/myshop/index.html">마이쇼핑</a></li>
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
							fw-label="주문번호" fw-msg="" value="20240407-0000129" type="hidden">
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorydetail xans-record-">
							<!--
        $print_spec_url = /myshop/order/print/spec.html
        $print_pg_card_url = /myshop/order/print/pg.html
        $print_tax_url = /myshop/order/print/tax.html
        $issue_tax_url = /myshop/order/issue/tax.html
        $issue_cash_url = /myshop/order/issue/cash.html
        $select_gift_url = /order/gift_select.html
     -->
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
												<td>20240407-0000129</td>
											</tr>
											<tr>
												<th scope="row">주문일자</th>
												<td>2024-04-07 11:19:50</td>
											</tr>
											<tr>
												<th scope="row">주문자</th>
												<td><span>정명호</span></td>
											</tr>
											<tr>
												<th scope="row">반품처리상태</th>
												<td>반품완료</td>
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
														class="txt14">23,000</strong>원 <span class="displaynone"></span>
												</span></td>
											</tr>
										</tbody>
										<tbody class="displaynone">
											<tr class="sum">
												<th scope="row">총 할인금액</th>
												<td><strong class="txt14">0</strong>원</td>
											</tr>
											<tr class="displaynone">
												<th scope="row">쿠폰할인</th>
												<td><span class="gSpace20">0원</span> <a href="#none"
													class="eUsedCouponDetail btnNormal">내역보기</a></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">추가할인금액</th>
												<td><span class="gSpace20">0원</span> <a href="#none"
													class="btnNormal"
													onclick="OrderLayer.onDiv('order_layer_addsale', event);">내역보기</a>
												</td>
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
												<td><strong><span>2024-04-10 12:11:30</span></strong></td>
											</tr>
											<tr class="">
												<th scope="row">환불수단</th>
												<td><strong><span>카드</span></strong></td>
											</tr>
											<tr class="sum">
												<th scope="row">총 결제금액</th>
												<td><span class="txtEm"> <strong class="txt18">23,000</strong>원
														<span class="displaynone"></span>
												</span></td>
											</tr>
											<tr class="sum">
												<th scope="row">총 환불금액</th>
												<td><span class="txtEm"> <strong class="txt18">23,000</strong>원
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
												<td colspan="8">상품구매금액 <strong>20,000</strong> - 환불금액
													20,000 = 합계 : <strong class="txtEm gIndent10"><span
														class="txt18">0원</span></strong> <span class="displaynone"></span>
												</td>
											</tr>
										</tfoot>
										<tbody
											class="xans-element- xans-myshop xans-myshop-orderhistorydetailbasic center">
											<tr class="xans-record-">
												<td class="thumb"><a
													href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
														src="//insideobject.com/web/product/tiny/202307/dc3d88d084c7dee41b2c4dbd08933e6c.jpg"
														style="width: 100%;" alt=""
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"></a></td>
												<td class="left"><strong class="name"><a
														href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
														class="ec-product-name">[i live with six cats] 고양이의 바다
															유광 카드 하드 케이스</a></strong>
													<div class="option ">[옵션: galaxy s22 (카드하드불가)/유광하드]</div>
													<p class="gBlank5 displaynone">무이자할부 상품</p></td>
												<td>1</td>
												<td class="right">
													<div class="">
														<strong>20,000원</strong>
														<div class="displaynone"></div>
													</div>
													<div class="displaynone">
														<strong>20,000원</strong>
														<div class="displaynone"></div>
													</div>
												</td>

												<td class="state">
													<p class="txtEm">반품완료</p>
													<p class="displaynone">
														<a href="#" target="_self"></a>
													</p>
													<p class="displaynone">
														<a href="#none" class="line" onclick="">[]</a>
													</p>
												</td>
												<td>
													<p>2024-04-10</p>
													<p class="displaynone">-</p>
												</td>
												<td class="state">
													<p>20,000원</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="ec-base-table typeList">
									<table border="1" summary="" class="displaynone">
										<caption>개별배송</caption>
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
												<th scope="col">배송구분</th>
												<th scope="col">반품상태</th>
												<th scope="col">반품</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td colspan="7"><span class="gLeft">[개별배송]</span>
													상품구매금액 <strong>0</strong><span class="displaynone">
														+ 부가세 0</span> + 배송비 0 + 지역별배송비 0<span class="displaynone">
														- 상품할인금액 0</span> = 합계 : <strong class="txtEm gIndent10"><span
														class="txt18">0원</span></strong> <span class="displaynone"></span>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>

								<div class="ec-base-table typeList">
									<table border="1" summary="" class="displaynone">
										<caption>해외배송</caption>
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
												<th scope="col">배송구분</th>
												<th scope="col">주문처리상태</th>
												<th scope="col">취소/교환/반품</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td colspan="7"><span class="gLeft">[해외배송]</span>
													상품구매금액 <strong>0</strong><span class="displaynone">
														+ 부가세 0</span> + 배송비 0<span class="displaynone"> - 상품할인금액
														0</span> = 합계 : <strong class="txtEm gIndent10"><span
														class="txt18">0원</span></strong> <span class="displaynone"></span>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="orderArea displaynone">
								<div class="title">
									<h6>사은품</h6>
								</div>
								<div class="ec-base-table typeList">
									<table border="1" summary="">
										<caption>사은품</caption>
										<colgroup>
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 60px">
											<col style="width: 110px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">이미지</th>
												<th scope="col">상품정보</th>
												<th scope="col">수량</th>
												<th scope="col">사은품 구분</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td colspan="4"><span class="gLeft">[사은품]</span></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>

							<div class="orderArea displaynone">
								<div class="title">
									<h6>반품 신청 정보</h6>
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
												<td><strong></strong>
													<ul class="list">
														<li>- 주소 :</li>
														<li>- 전화번호 :</li>
														<li>- 영업시간 :</li>
														<li>- 수령 가능일 :</li>
														<li>- 수령지 안내 :</li>
													</ul>
													<div class="map displaynone">
														<p>* 약도</p>
													</div></td>
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
												<td><span>010-1234-5678</span></td>
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
							</div>
							<div class="orderArea displaynone">
								<div class="title">
									<h6>추가정보</h6>
								</div>
								<div class="ec-base-table">
									<table border="1" summary="">
										<caption>추가 정보</caption>
										<colgroup>
											<col style="width: 160px">
											<col style="width: auto">
										</colgroup>
										<tbody class="xans-element- xans-myshop xans-myshop-ordadd">
											<tr class="">
												<th scope="row"></th>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="orderArea displaynone">
								<div class="title">
									<h6>수거신청 정보</h6>
								</div>
							</div>
							<div class="orderArea displaynone">
								<div class="title">
									<h3>고객알림</h3>
								</div>
								<p class="customer"></p>
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