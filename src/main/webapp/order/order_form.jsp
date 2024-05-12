<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<style>
.xans-order-form .payArea {
	overflow: hidden;
	position: relative;
	padding: 0 241px 0 0;
	border: 1px solid #777;
	color: #353535;
	line-height: 1.5;
}

.xans-order-form .payArea .payment {
	float: left;
	width: 100%;
}

.xans-order-form .payArea .method {
	padding: 17px 20px 15px;
	font-weight: bold;
	border-bottom: 3px double #dedede;
}

.xans-order-form .payArea .total {
	float: right;
	width: 240px;
	margin: 0 -241px 0 0;
	text-align: right;
	background: #fbfafa;
}

.xans-order-form .payArea .total .price input#total_price {
	width: 190px;
	height: auto;
	padding: 0;
	border: 0;
	color: #008bcc;
	font-size: 28px;
	font-weight: bold;
	letter-spacing: -1px;
	line-height: normal;
	background: #fbfafa;
}

.xans-order-form .payArea:after {
	position: absolute;
	top: 0;
	right: 240px;
	display: block;
	content: "";
	width: 1px;
	height: 100%;
	background: #777;
}

span.ec-base-help, p.ec-base-help, ul.ec-base-help li {
	margin: 2px 9px;
	padding: 1px 0 1px 20px;
	line-height: 1.4;
	background:
		url(//img.echosting.cafe24.com/skin/base/common/ico_info.gif)
		no-repeat 0 2px;
}

.xans-order-form .payArea .total h4 {
	margin: 17px 10px 0 0;
	color: #353535;
	font-size: 12px;
}

.xans-order-form .payArea .total .price {
	margin: 20px 10px 0 0;
	color: #008bcc;
	font-size: 14px;
}

.xans-order-form .payArea .total .ec-base-button {
	margin: 6px 10px 0;
}

.title {
	margin-top: 30px;
	margin-bottom: 10px;
}

.totalArea {
	margin-bottom: 30px;
}

.required {
	margin: 10px;
}

input[type=text], input[type=password] {
	height: 18px;
	line-height: 20px;
	padding: 2px 4px;
	border: 1px solid #d5d5d5;
	color: #353535;
	font-size: 12px;
	margin: 1px;
}

.payArea {
	margin-bottom: 100px;
}

th {
	text-align: center;
}

.card-pay-area {
	border: 1px solid #dedede;
}

#modal {
	padding: 0;
	display: none; /* 모달 창 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경 불투명도 */
}

#card-container {
	width: 530px;
	height: 550px;
	border: 1px solid #dedede;
	background-color: #fefefe;
	margin: auto; /* 수평 가운데 정렬 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
	/* 모달 창의 최대 너비 지정 */
	position: relative;
	top: 50%;
	/* 모달 창을 화면 상단에서 50% 위치로 이동 */
	transform: translateY(-50%);
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px; /* 모달 창의 최대 너비 지정 */
	position: relative;
	top: 50%;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px; /* 모달 창의 최대 너비 지정 */
	position: relative;
	top: 50%;
	width: 80%;
	max-width: 600px;
	/* 모달 창의 최대 너비 지정 */
	position: relative;
	top: 50%;
	max-width: 600px;
	/* 모달 창의 최대 너비 지정 */
	position: relative;
	top: 50%;
	position: relative;
	top: 50%;
	top: 50%; /* 모달 창을 수직 가운데로 이동 */
}


</style>

<script>
	$(function() {

	})//ready

	/* // 모달 열기 버튼 클릭 시 모달 표시
	$("#openModalBtn").onclick = function() {
		document.getElementById("myModal").style.display = "block";
	}

	// 모달 닫기 버튼 클릭 시 모달 숨김
	document.getElementsByClassName("close")[0].onclick = function() {
		document.getElementById("myModal").style.display = "none";
	}

	// 모달 외부 클릭 시 모달 숨김
	window.onclick = function(event) {
		var modal = document.getElementById("myModal");
		if (event.target == modal) {
			modal.style.display = "none";
		}
	} */
</script>
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
							<li title="현재 위치"><strong>주문서작성</strong></li>
						</ol>
					</div>

					<div class="titleArea">
						<h2>주문서작성</h2>
					</div>

						<div class="xans-element- xans-order xans-order-form xans-record-">
							<!-- 이값은 지우면 안되는 값입니다. ($move_order_after 주문완료페이지 주소 / $move_basket 장바구니페이지 주소)
        $move_order_after=/order/order_result.html
        $move_basket=/order/basket.html
    -->
							<p class="orderStep">
								<img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/order/img_order_step2.gif"
									alt="02 주문서작성">
							</p>

							<div class="orderListArea ">
								<div class="title">
									<h6>배송상품 주문내역</h6>
								</div>

								<div class="ec-base-table typeList gBorder ">
									<table border="1" summary="">
										<caption>기본배송</caption>
										<colgroup>
											<col style="width: 27px" class="">
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 98px">
											<col style="width: 75px">

											<col style="width: 85px">
											<col style="width: 98px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class=""><input type="checkbox"
													onclick="EC_SHOP_FRONT_ORDERFORM_PRODUCT.proc.setCheckOrderList('chk_order_cancel_list_basic', this);"></th>
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
												<td colspan="8"><span class="gLeft">[기본배송]</span>
													상품구매금액 <strong>20,000</strong> + 배송비 <span
													id="domestic_ship_fee">3,000</span> <span
													id="normal_total_benefit_price_area" class="displaynone">
														- 상품할인금액 <span id="normal_total_benefit_price">0</span>
												</span> = 합계 : <strong class="txtEm gIndent10"><span
														id="domestic_ship_fee_sum" class="txt18">23,000</span>원</strong></td>
											</tr>
										</tfoot>
										<tbody
											class="xans-element- xans-order xans-order-normallist center">
											<tr class="xans-record-">
												<td class=""><input id="chk_order_cancel_list0"
													name="chk_order_cancel_list_basic0"
													value="6183:00BK:F:450720" type="checkbox"></td>
												<td class="thumb gClearLine"><a
													href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
														src="//insideobject.com/web/product/tiny/202307/dc3d88d084c7dee41b2c4dbd08933e6c.jpg"
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
														width="100px"></a></td>
												<td class="left gClearLine"><strong class="name"><a
														href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
														class="ec-product-name">[i live with six cats] 고양이의 바다
															유광 카드 하드 케이스</a></strong>
													<div class="option ">[옵션: galaxy s22 (카드하드불가)/유광하드]</div>
													<p class="gBlank5 displaynone">무이자할부 상품</p>
													<p class="gBlank5 displaynone">유효기간 :</p></td>
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
												<td>1</td>
												<td rowspan="1" class="">3,000원</td>
												<td class="right"><strong><span
														id="product_total_price_front0">20,000</span>원</strong></td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="ec-base-table typeList gBorder displaynone">
									<table border="1" summary="">
										<caption>업체기본배송</caption>
										<colgroup>
											<col style="width: 27px" class="">
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 98px">
											<col style="width: 75px">
											<col style="width: 98px">
											<col style="width: 98px">
											<col style="width: 85px">
											<col style="width: 98px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class=""><input type="checkbox"
													onclick="" disabled=""></th>
												<th scope="col">이미지</th>
												<th scope="col">상품정보</th>
												<th scope="col">판매가</th>
												<th scope="col">수량</th>
												<th scope="col">적립금</th>
												<th scope="col">배송구분</th>
												<th scope="col">배송비</th>
												<th scope="col">합계</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td class=""></td>
												<td colspan="8"><span class="gLeft">[업체기본배송]</span>
													상품구매금액 <strong><span class="displaynone">
															()</span></strong><span class="displaynone"> + 부가세 </span> + 배송비 <span
													id=""></span> <span id="" class="displaynone"> -
														상품할인금액 <span id=""></span>
												</span> = 합계 : <strong class="txtEm gIndent10"><span id=""
														class="txt18"></span></strong> <span class="displaynone"></span></td>
											</tr>
										</tfoot>
									</table>
								</div>

								<div class="ec-base-table typeList gBorder displaynone">
									<table border="1" summary="">
										<caption>개별배송</caption>
										<colgroup>
											<col style="width: 27px" class="">
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 98px">
											<col style="width: 75px">
											<col style="width: 98px">
											<col style="width: 98px">
											<col style="width: 85px">
											<col style="width: 98px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class=""><input type="checkbox"
													onclick="" disabled=""></th>
												<th scope="col">이미지</th>
												<th scope="col">상품정보</th>
												<th scope="col">판매가</th>
												<th scope="col">수량</th>
												<th scope="col">적립금</th>
												<th scope="col">배송구분</th>
												<th scope="col">배송비</th>
												<th scope="col">합계</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td class=""></td>
												<td colspan="8"><span class="gLeft">[개별배송]</span>
													상품구매금액 <strong><span class="displaynone">
															()</span></strong> + 배송비 <span id=""></span> = 합계 : <strong
													class="txtEm gIndent10"><span id="" class="txt18"></span></strong></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<ul class="ec-base-help controlInfo typeBtm">
								<li class="txtWarn txt11">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서
									가능합니다.</li>
								<li class="txtWarn txt11 displaynone">할인 적용 금액은 주문서작성의
									결제예정금액에서 확인 가능합니다.</li>
							</ul>
							<div class="ec-base-button">
								<span class="gLeft "> <strong class="text">선택상품을</strong>
									<a href="#none" id="btn_product_delete" class="btnEm"><i
										class="icoDelete"></i> 삭제하기</a>
								</span> <span class="gRight"> <a
									href="javascript:window.history.back();" class="btnNormal">이전페이지</a>
								</span>
							</div>

							<hr>
							<div id="lShippingCompanyLists" class="shippingArea displaynone">
								<div class="title">
									<h6>배송업체(방식) 선택</h6>
								</div>
								<table border="1" summary="">
									<caption>배송업체(방식) 선택</caption>
									<thead>
										<tr>
											<th scope="col">
												<div class="method">
													<span class="ec-base-label" id="delivery_app_list"></span>
													<p class="ec-base-help displaynone">스토어픽업을 사용할 수 없는 상품이
														포함되어 있어 일반 배송사만 선택 가능합니다.</p>
												</div>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<ul class="list " id="deliv_info_view">
													<li>배송업체 : <span id="deliv_company_name_custom_type"></span></li>
													<li class="">배송비 : <span
														id="deliv_company_price_custom_type">0</span></li>
													<li class="displaynone">
														<div
															class="ec-shop-shipping_additional_fee_show displaynone">
															배송비 : <strong><span
																id="f_addr_total_ship_fee_id"></span>원</strong> = 해외배송비 <span
																id="f_addr_delv_price_id"></span>원 + 보험료 <span
																id="f_addr_insurance_price_id"></span>원 <span
																class="ec-shop-shipping_additional_fee_name_show">
																+ <span id="f_addr_shipping_additional_fee_name_id"></span>
																<span id="f_addr_shipping_additional_fee_id"></span>원
															</span>
															<p>
																보험료는 배송과정에서 발생하는 분실, 도난, 파손 등으로 인한 손해에 대하여<br>규정에
																따라 배상해 드리는 서비스입니다.
															</p>
														</div>
														<div class="ec-shop-shipping_additional_fee_hide ">
															배송비 : <strong><span
																id="f_addr_total_ship_fee_id"></span>원</strong> = 해외배송비 <span
																id="f_addr_delv_price_id"></span>원 + 보험료 <span
																id="f_addr_insurance_price_id"></span>원
															<p>
																배송비에는 관세 및 세금 등의 각종 비용은 포함되어 있지 않습니다.<br>상품수령 시
																고객님이 추가로 지불하셔야 합니다.<br>보험료는 배송과정에서 발생하는 분실, 도난, 파손
																등으로 인한 손해에 대하여<br>규정에 따라 배상해 드리는 서비스입니다.
															</p>
														</div>
													</li>
													<li class="ec-deliv-company-shipping-info">배송안내 : <span
														id="deliv_company_shipping_info"></span></li>
													<li>배송소요기간 : <span
														id="deliv_company_period_custom_type"></span></li>
													<li>홈페이지주소 : <span id="deliv_company_site_custom_type"></span></li>
													<li class="displaynone" id="areaname">배송가능 지역 : <span
														id="deliv_company_areaname_custom_type"></span></li>
													<li class="displaynone" id="ordertime">주문가능 시간 : <span
														id="deliv_company_ordertime_custom_type"></span></li>
													<li></li>
												</ul>
												<ul class="list displaynone" id="store_info_view">
													<li>주소 : <span id="store_receive_addr"></span></li>
													<li>전화번호 : <span id="store_main_phone"></span></li>
													<li>영업시간 : <span id="store_office_hour"></span></li>
													<li>수령 가능일 : <span id="store_receive_period"></span></li>
													<li>수령지 안내 : <span id="store_receive_info"></span></li>
													<li class="map">약도<br> <span
														id="store_receive_map"></span></li>
												</ul>
												<ul class="list" id="delivery_app_info">
													<li id="delivery_app_name_div">배송업체 : <span
														id="delivery_app_name"></span></li>
													<li id="delivery_app_shipfee_div">배송비 : <span
														id="delivery_app_shipfee"></span></li>
													<li id="delivery_app_description_div">배송안내 : <span
														id="delivery_app_description"></span>
													</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="orderArea">
								<div class="title">
									<h6>배송 정보</h6>
									<p class="required">
										<img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"> 필수입력사항
									</p>
								</div>
								<div class="ec-base-table typeWrite"
									style="margin-bottom: 30px;">
									<table border="1" summary="">
										<caption>배송 정보 입력</caption>
										<colgroup>
											<col style="width: 139px;">
											<col style="width: auto;">
										</colgroup>
										<!-- 비회원 결제 -->
										<tbody class="displaynone ec-shop-deliverySimpleNomemberForm"
											style="display: table-row-group;">


										</tbody>
										<!-- 국내 배송지 정보 -->
										<tbody class="">
											<tr class="">
												<th scope="row">배송지 선택</th>
												<td>
													<div class="address">
														<input id="sameaddr0" name="sameaddr" fw-filter=""
															fw-label="1" fw-msg="" value="M" type="radio"
															autocomplete="off"><label for="sameaddr0">회원
															정보와 동일</label> <input id="sameaddr1" name="sameaddr" fw-filter=""
															fw-label="1" fw-msg="" value="F" type="radio"
															autocomplete="off"><label for="sameaddr1">새로운
															배송지</label> <a href="#none" id="btn_shipp_addr"
															class="btnNormal ">주소록 보기</a>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">받으시는 분 <img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
													alt="필수"></th>
												<td><input id="rname" name="rname" fw-filter="isFill"
													fw-label="수취자 성명" fw-msg="" class="inputTypeText"
													placeholder="" size="15" value="" type="text"></td>
											</tr>
											<tr>
												<th scope="row">주소 <img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
													alt="필수"></th>
												<td><input id="rzipcode1" name="rzipcode1"
													fw-filter="isFill" fw-label="수취자 우편번호1" fw-msg=""
													class="inputTypeText" placeholder="" size="6" maxlength="6"
													readonly="1" value="" type="text"> <a href="#none"
													id="btn_search_rzipcode" class="btnNormal">우편번호</a><br>
													<input id="raddr1" name="raddr1" fw-filter="isFill"
													fw-label="수취자 주소1" fw-msg="" class="inputTypeText"
													placeholder="" size="60" readonly="1" value="" type="text">
													<span class="grid">기본주소</span><br> <input id="raddr2"
													name="raddr2" fw-filter="" fw-label="수취자 주소2" fw-msg=""
													class="inputTypeText" placeholder="" size="60" value=""
													type="text"> <span class="grid">나머지주소</span><span
													class="grid ">(선택입력가능)</span></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">일반전화 <span class="displaynone"><img
														src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
														alt="필수"></span>
												</th>
												<td></td>
											</tr>
											<tr class="">
												<th scope="row">휴대전화 <span class=""><img
														src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
														alt="필수"></span>
												</th>
												<td><select id="rphone2_1" name="rphone2_[]"
													fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
													fw-alone="N" fw-msg="">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
												</select>-<input id="rphone2_2" name="rphone2_[]" maxlength="4"
													fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
													fw-alone="N" fw-msg="" placeholder="" size="4" value=""
													type="text">-<input id="rphone2_3"
													name="rphone2_[]" maxlength="4"
													fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
													fw-alone="N" fw-msg="" placeholder="" size="4" value=""
													type="text"></td>
											</tr>
										</tbody>
										<tbody
											class="email ec-orderform-emailRow ec-shop-deliverySimpleForm">
											<tr>
												<th scope="row">이메일 <img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
													alt="필수"></th>
												<td><input id="oemail1" name="oemail1"
													fw-filter="isFill" fw-label="주문자 이메일" fw-alone="N"
													fw-msg="" class="mailId" value="" type="text">@<input
													id="oemail2" name="oemail2" fw-filter="isFill"
													fw-label="주문자 이메일" fw-alone="N" fw-msg=""
													class="mailAddress" readonly="readonly" value=""
													type="text"><select id="oemail3" fw-filter="isFill"
													fw-label="주문자 이메일" fw-alone="N" fw-msg="">
														<option value="" selected="selected">- 이메일 선택 -</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="nate.com">nate.com</option>
														<option value="hotmail.com">hotmail.com</option>
														<option value="yahoo.com">yahoo.com</option>
														<option value="empas.com">empas.com</option>
														<option value="korea.com">korea.com</option>
														<option value="dreamwiz.com">dreamwiz.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="etc">직접입력</option>
												</select>
													<p class="gBlank5">이메일을 통해 주문처리과정을 보내드립니다.</p></td>
											</tr>
										</tbody>
										<!-- 국내 배송관련 정보 -->
										<tbody class="delivery ">
											<tr class="">
												<th scope="row">배송메시지 <span class="displaynone"><img
														src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
														alt="필수"></span>
												</th>
												<td><textarea id="omessage" name="omessage"
														fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="255"
														cols="70"></textarea></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<hr>
							<div class="title">
								<h6>결제 예정 금액</h6>
							</div>
							<div class="totalArea">
								<div class="ec-base-table typeList gBorder total">
									<table border="1" summary="">
										<caption>결제 예정 금액</caption>
										<colgroup>
											<col style="width: 33.33%">
											<col style="width: 33.33%" class="">
											<col style="width: 33.33%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col"><strong>총 주문 금액</strong> <a
													href="#none"
													onclick="EC_SHOP_FRONT_ORDERFORM_DISPLAY.onDiv('order_layer_detail', event);"
													class="btnNormal">내역보기</a></th>
												<th scope="col" class=""><strong>총 배송비</strong></th>
												<th scope="col"><strong>총 결제예정 금액</strong></th>
											</tr>
										</thead>
										<tbody class="center">
											<tr>
												<td class="price"><div class="box txt16">
														<strong><span id="total_order_price_view"
															class="txt23">23,000</span>원</strong> <span class="displaynone"><span
															id="total_order_price_ref_view"><span
																class="eRefPrice"></span></span></span>
													</div></td>
												<td class="option "><div class="box txt16">
														<strong><span id="total_sale_price_view"
															class="txt23">0</span>원</strong> <span class="displaynone"><span
															id="total_sale_price_ref_view"><span
																class="eRefPrice"></span></span></span>
													</div></td>
												<td><div class="box txtEm txt16">
														<strong>=</strong> <strong><span
															id="total_order_sale_price_view" class="txt23">23,000</span>원</strong>
														<span class="displaynone"><span
															id="total_order_sale_price_ref_view"><span
																class="eRefPrice"></span></span></span>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>

							<hr>

							<div id="ec-shop-gift_orderform">
								<script>
								</script>
								<script type="text/javascript">
								</script>
								<script type="text/javascript"
									src="/app/Eclog/js/cid.generate.js?vs=be4910e13365511fd914ba822d84c067&amp;u=lifelab0301.1"></script>
								<script type="text/javascript">
								</script>

								<link rel="stylesheet" type="text/css"
									href="/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&amp;type=css&amp;k=37c9481ac0212340e132f81eba4d1049fee7f18e&amp;t=1681776733">
								<script type="text/javascript"
									src="/ind-script/i18n.php?lang=ko_KR&amp;domain=front&amp;v=2404210600"
									charset="utf-8"></script>

								<script type="text/javascript">
								</script>
							</div>
							<div class="title">
								<h6>결제수단</h6>
							</div>
							<div class="payArea">
								<div class="payment">
									<div class="method">
										<span class="ec-base-label"><input id="addr_paymethod0"
											name="addr_paymethod" fw-filter="isFill" fw-label="결제방식"
											fw-msg="" value="card" type="radio" checked="checked"
											autocomplete="off"><label for="addr_paymethod0">카드
												결제</label></span>
									</div>
									<!-- 카드사 직접결제 -->
									<div class="ec-base-table">
										<!-- 무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체 -->
										<div id="pg_paymethod_info" class="payHelp" style="">
											<p id="pg_paymethod_info_shipfee" class="ec-base-help"
												style="display: none;">최소 결제 가능 금액은 결제금액에서 배송비를 제외한
												금액입니다.</p>
											<p id="pg_paymethod_info_pg" class="ec-base-help">소액 결제의
												경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
										</div>
									</div>

								</div>
								<div class="total">
									<h4>
										<strong id="current_pay_name">카드 결제</strong> <span>최종결제
											금액</span>
									</h4>
									<p class="price">
										<span></span><input id="total_price" name="total_price"
											fw-filter="isFill" fw-label="결제금액" fw-msg=""
											class="inputTypeText" placeholder=""
											style="text-align: right; ime-mode: disabled; clear: none; border: 0px; float: none;"
											size="10" readonly="1" value="23000" type="text"><span>원</span>
									</p>
									<p class="paymentAgree" id="chk_purchase_agreement"
										style="display: none;">
										<input id="chk_purchase_agreement0"
											name="chk_purchase_agreement" fw-filter="" fw-label="구매진행 동의"
											fw-msg="" value="T" type="checkbox" style="display: none;"><label
											for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에
											동의합니다.</label>
									</p>
									<div class="ec-base-button gColumn">
										<a href="#none" id="btn_payment" class="btnSubmit sizeL">
											<script>
												$("#btn_payment").click(
														function() {
															$("#modal").css(
																	"display",
																	"block");
														})
											</script> 결제하기
										</a>
									</div>
									<div class="mileage "></div>
								</div>
							</div>

							<div id="modal">
								<div id="card-container"
									style="width: 534px; height: 550px; border: 1px solid #dedede; padding: 0;">
									<div class="card-top-title"
										style="background-color: #dedede; padding: 10px; padding-right: 15px; text-align: right;">
										<h6>카드 결제</h6>
									</div>
									<form id="card-payment-form">
										<div class="card-middle-title"
											style="padding: 20px; font-size: 20px;">
											<span class="card-middle-left" style="float: left;"><label>(주)오브젝트
													생활연구소</label></span> <span class="card-middle-right"
												style="float: right; font-size: 25px; margin-bottom: 10px;"><label><strong>23,000원</strong></label></span>
										</div>

										<div class="card-input-payarea"
											style="text-align: center; margin: 20px;">
											<table class="card-input-payarea-tab" style="border: 1px solid #dedede;">
												<tr>
													<th class="card-th"
														style="width: 130px; border-bottom: 1px solid #dedede; padding: 5px; font-size: 17px; vertical-align: middle">카드번호</th>
													<td class="card-td" style="border-bottom: 1px solid #dedede; padding: 5px;"><input type="text" maxlength="16"
														placeholder="[-]없이 입력" class="card-input"
														style="width: 350px; height: 50px; border: none; font-size: 20px; "></td>
												</tr>
												<tr>
													<th class="card-th"
														style="width: 130px; border-bottom: 1px solid #dedede; padding: 5px; font-size: 17px; vertical-align: middle">카드식별번호</th>
													<td class="card-td" style="border-bottom: 1px solid #dedede; padding: 5px;"><input type="text" maxlength="3"
														placeholder="카드 뒷면 3자리" class="card-input"
														style="width: 350px; height: 50px; border: none; font-size: 20px;"></td>
												</tr>
												<tr>
													<th class="card-th"
														style="width: 130px; border-bottom: 1px solid #dedede; padding: 5px; font-size: 17px; vertical-align: middle" >휴대폰
														번호</th>
													<td class="card-td" style="border-bottom: 1px solid #dedede; padding: 5px;"><input type="text" maxlength="11"
														placeholder="[-]없이 입력" class="card-input"
														style="width: 350px; height: 50px; border: none; font-size: 20px;"></td>
												</tr>
											</table>
										</div>

										<div class="card-payarea-btn"
											style="text-align: center; vertical-align: bottom; margin-top: 200px; font-size: 20px; display: grid; grid-template-columns: 1fr 1fr; ">
											<input type="button" value="결제취소" class="card-btn-cancle"
												style="/* width: 265px; */ height: 60px; padding: 0; margin: 0; border: 1px solid #dedede; background-color: #dedede;">
											<input type="button" value="결제하기" class="card-btn-success"
												style="/* width: 265px;  */height: 60px; padding: 0; margin: 0; border: 1px solid #dedede;">
										</div>
											<script>
											$(".card-btn-cancle").click(function() {
												$("#modal").css("display","none");
											})
											$(".card-btn-success").click(function() {
												location.href = "order_complete.jsp";
											})
											</script>
									</form>
								</div>
							</div>

							<!-- // 결제진행바 -->
						</div>
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