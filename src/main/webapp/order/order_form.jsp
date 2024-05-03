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
/* 모달 창 스타일 */
.modal {
	display: none; /* 기본적으로 숨김 상태 */
	position: fixed; /* 화면 고정 */
	z-index: 1; /* 다른 요소 위에 표시 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<script>
	$(function(){
		
	})//ready

	// 모달 열기 버튼 클릭 시 모달 표시
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
	}
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

					<form id="frm_order_act" name="frm_order_act" action=""
						method="post" target="_self" enctype="multipart/form-data">
						<input id="move_order_after" name="move_order_after"
							value="/order/order_result.html" type="hidden"> <input
							id="orderform_id" name="orderform_id"
							value="O-20240424-13935244189c5bc5" type="hidden"> <input
							id="use_join_privacy_policy_required"
							name="use_join_privacy_policy_required" value="T" type="hidden">
						<input id="order_agreement_member_use_flag"
							name="order_agreement_member_use_flag" value="" type="hidden">

						<input id="is_crowd_funding" name="is_crowd_funding" value="F"
							type="hidden"> <input id="member_group_price"
							name="member_group_price" value="0" type="hidden"> <input
							id="mileage_generate3" name="mileage_generate3" value="0"
							type="hidden"> <input id="total_group_dc"
							name="total_group_dc" value="0" type="hidden"> <input
							id="total_plusapp_mileage_price"
							name="total_plusapp_mileage_price" value="" type="hidden">
						<input id="basket_type" name="basket_type" value="all_buy"
							type="hidden"> <input id="productPeriod"
							name="productPeriod" value="" type="hidden"> <input
							id="member_id" name="member_id" value="wjdaudgh10" type="hidden">
						<input id="delvType" name="delvType" value="A" type="hidden">
						<input id="isUpdateMemberEmailOrder"
							name="isUpdateMemberEmailOrder" value="F" type="hidden">
						<input id="isSimplyOrderForm" name="isSimplyOrderForm" value="F"
							type="hidden"> <input id="__ocountry" name="__ocountry"
							value="KOR" type="hidden"> <input id="__oaddr1"
							name="__oaddr1" value="" type="hidden"> <input
							id="__ocity" name="__ocity" value="" type="hidden"> <input
							id="__ostate" name="__ostate" value="" type="hidden"> <input
							id="sSinameZhAreaWord" name="sSinameZhAreaWord" value="省/市"
							type="hidden"> <input id="sSinameTwAreaWord"
							name="sSinameTwAreaWord" value="市/縣" type="hidden"> <input
							id="sGunameZhAreaWord" name="sGunameZhAreaWord" value="区"
							type="hidden"> <input id="sGunameTwAreaWord"
							name="sGunameTwAreaWord" value="區/市" type="hidden"> <input
							id="__addr1" name="__addr1" value="" type="hidden"> <input
							id="__city_name" name="__city_name" value="" type="hidden">
						<input id="__state_name" name="__state_name" value=""
							type="hidden"> <input id="__isRuleBasedAddrForm"
							name="__isRuleBasedAddrForm" value="F" type="hidden"> <input
							id="message_autosave" name="message_autosave" value="F"
							type="hidden"> <input id="hope_date" name="hope_date"
							value="" type="hidden"> <input id="hope_ship_begin_time"
							name="hope_ship_begin_time" value="" type="hidden"> <input
							id="hope_ship_end_time" name="hope_ship_end_time" value=""
							type="hidden"> <input id="is_fast_shipping_time"
							name="is_fast_shipping_time" value="" type="hidden"> <input
							id="eguarantee_id" name="eguarantee_id" value="F" type="hidden">
						<input id="is_hope_shipping" name="is_hope_shipping" value="F"
							type="hidden"> <input id="is_fast_shipping"
							name="is_fast_shipping" value="" type="hidden"> <input
							id="fCountryCd" name="fCountryCd" value="" type="hidden">
						<input id="sCpnPrd" name="sCpnPrd" value="0" type="hidden">
						<input id="sCpnOrd" name="sCpnOrd" value="0" type="hidden">
						<input id="coupon_saving" name="coupon_saving" value="0"
							type="hidden"> <input id="coupon_discount"
							name="coupon_discount" value="0" type="hidden"> <input
							id="coupon_shipfee" name="coupon_shipfee" value="0" type="hidden">
						<input id="is_used_with_mileage" name="is_used_with_mileage"
							value="F" type="hidden"> <input
							id="is_used_with_member_discount"
							name="is_used_with_member_discount" value="F" type="hidden">
						<input id="is_used_with_coupon" name="is_used_with_coupon"
							value="F" type="hidden"> <input id="is_no_ozipcode"
							name="is_no_ozipcode" value="F" type="hidden"> <input
							id="is_no_rzipcode" name="is_no_rzipcode" value="F" type="hidden">
						<input id="is_cashreceipt_displayed_on_screen"
							name="is_cashreceipt_displayed_on_screen" value="F" type="hidden">
						<input id="is_taxrequest_displayed_on_screen"
							name="is_taxrequest_displayed_on_screen" value="F" type="hidden">
						<input id="app_scheme" name="app_scheme" value="" type="hidden">
						<input id="is_store" name="is_store" value="" type="hidden">
						<input id="defer_commission" name="defer_commission" value="0"
							type="hidden"> <input id="order_form_simple_type"
							name="order_form_simple_type" value="T" type="hidden"> <input
							id="information_agreement_check_val"
							name="information_agreement_check_val" value="F" type="hidden">
						<input id="consignment_agreement_check_val"
							name="consignment_agreement_check_val" value="F" type="hidden">
						<input id="thirdParty_agreement_check_val"
							name="thirdParty_agreement_check_val" value="F" type="hidden">
						<input id="basket_sync_flag" name="basket_sync_flag" value="F"
							type="hidden"> <input id="gift_selected_item"
							name="gift_selected_item" value="" type="hidden"> <input
							id="app_discount_data" name="app_discount_data" value=""
							type="hidden"> <input
							id="is_shipping_address_readonly_by_app"
							name="is_shipping_address_readonly_by_app" value="" type="hidden">
						<input id="is_app_delivery" name="is_app_delivery" value="F"
							type="hidden"> <input id="app_delivery_data"
							name="app_delivery_data" value="" type="hidden"> <input
							id="is_available_shipping_company_by_app"
							name="is_available_shipping_company_by_app" value=""
							type="hidden"> <input id="is_multi_delivery"
							name="is_multi_delivery" value="F" type="hidden"> <input
							id="is_no_shipping_required" name="is_no_shipping_required"
							value="F" type="hidden"> <input id="use_shipping_manager"
							name="use_shipping_manager" value="F" type="hidden"> <input
							id="shipping_manager_data" name="shipping_manager_data"
							value="{&quot;reason_for_not_calculating_shipping_fee&quot;:null,&quot;shipping_manager_shipping_fees&quot;:null,&quot;selected_shipping_manager_shipping_fees&quot;:null,&quot;shipping_manager_shipping_fees_response&quot;:null,&quot;shipping_manager_shipping_fee_detail&quot;:null}"
							type="hidden"> <input id="selected_shipping_manager_data"
							name="selected_shipping_manager_data" value="null" type="hidden">
						<input id="ex_mileage" name="ex_mileage" value="" type="hidden">
						<input id="pagetype" name="pagetype" value="" type="hidden">
						<input id="is_direct_buy" name="is_direct_buy" value="F"
							type="hidden"> <input id="is_subscription_invoice"
							name="is_subscription_invoice" value="F" type="hidden"> <input
							id="order_enable" name="order_enable" value="" type="hidden">
						<input id="use_tax_manager" name="use_tax_manager" value="F"
							type="hidden"> <input id="use_external_tax_app"
							name="use_external_tax_app" value="NA" type="hidden"> <input
							id="app_tax_data" name="app_tax_data" value="" type="hidden">
						<input id="include_tax_in_prices" name="include_tax_in_prices"
							value="T" type="hidden"> <input id="total_tax_raw"
							name="total_tax_raw" value="0" type="hidden"> <input
							id="jwt" name="jwt" value="" type="hidden"> <input
							id="service_code" name="service_code" value="" type="hidden">
						<input id="used_card" name="used_card" value="" type="hidden">
						<input id="sEleID" name="sEleID"
							value="total_price||productPeriod||ophone1_1||ophone1_2||ophone1_3||ophone2_1||ophone2_2||ophone2_3||ophone1_ex1||ophone1_ex2||ophone2_ex1||ophone2_ex2||basket_type||oname||oname2||english_oname||english_name||english_name2||input_mile||input_deposit||hope_date||hope_ship_begin_time||hope_ship_end_time||is_fast_shipping_time||fname||fname2||paymethod||eguarantee_flag||eguarantee_ssn1||eguarantee_ssn2||eguarantee_year||eguarantee_month||eguarantee_day||eguarantee_user_gender||eguarantee_personal_agreement||question||question_passwd||delvType||f_country||fzipcode||faddress||fphone1_1||fphone1_2||fphone1_3||fphone1_4||fphone1_ex1||fphone1_ex2||fphone2_ex1||fphone2_ex2||fphone2||fmessage||fmessage_select||rname||rzipcode1||rzipcode2||raddr1||raddr2||rphone1_1||rphone1_2||rphone1_3||rphone2_1||rphone2_2||rphone2_3||omessage||omessage_select||ozipcode1||ozipcode2||oaddr1||oaddr2||oemail||oemail1||oemail2||ocity||ostate||ozipcode||eguarantee_id||coupon_discount||coupon_saving||order_password||is_fast_shipping||fCountryCd||message_autosave||oa_content||gift_use_flag||pname||bankaccount||regno1||regno2||escrow_agreement0||addr_paymethod||member_group_price||chk_purchase_agreement||total_plusapp_mileage_price||mileage_generate3||is_hope_shipping||sCpnPrd||sCpnOrd||coupon_shipfee||np_req_tx_id||np_save_rate||np_save_rate_add||np_use_amt||np_mileage_use_amount||np_cash_use_amount||np_total_use_amount||np_balance_amt||np_use||np_sig||flagEscrowUse||flagEscrowIcashUse||add_ship_fee||total_group_dc||pron_name||pron_name2||pron_oname||faddress2||si_gun_dosi||ju_do||is_set_product||basket_prd_no||move_order_after||is_no_ozipcode||is_no_rzipcode||__ocountry||__oaddr1||__ocity||__ostate||__addr1||__city_name||__state_name||__isRuleBasedAddrForm||sSinameZhAreaWord||sSinameTwAreaWord||sGunameZhAreaWord||sGunameTwAreaWord||delivcompany||is_store||cashreceipt_user_type||cashreceipt_user_type2||cashreceipt_regist||cashreceipt_user_mobile1||cashreceipt_user_mobile2||cashreceipt_user_mobile3||cashreceipt_reg_no||is_cashreceipt_displayed_on_screen||tax_request_regist||tax_request_name||tax_request_phone1||tax_request_phone2||tax_request_phone3||tax_request_email1||tax_request_email2||tax_request_company_type||tax_request_company_regno||tax_request_company_name||tax_request_president_name||tax_request_zipcode||tax_request_address1||tax_request_address2||tax_request_company_condition||tax_request_company_line||is_taxrequest_displayed_on_screen||isSimplyOrderForm||use_safe_phone||app_scheme||isUpdateMemberEmailOrder||defer_commission||defer_p_name||order_form_simple_type||gmo_order_id||gmo_transaction_id||receiver_id_card_key||receiver_id_card_type||simple_join_is_check||simple_join_agree_use_info||etc_subparam_member_id||etc_subparam_email1||etc_subparam_passwd||etc_subparam_user_passwd_confirm||etc_subparam_passwd_type||etc_subparam_is_sms||etc_subparam_is_news_mail||information_agreement_check_val||consignment_agreement_check_val||remind_id||remind_code||shipping_additional_fee_show||shipping_additional_fee_hide||shipping_additional_fee_name_show||save_paymethod||allat_account_nm||basket_sync_flag||member_id||input_pointfy||set_main_address0||app_discount_data||is_shipping_address_readonly_by_app||is_app_delivery||app_delivery_data||is_available_shipping_company_by_app||is_direct_buy||is_subscription_invoice||subscription_start_date||order_enable||is_crowd_funding||is_multi_delivery||is_no_shipping_required||use_tax_manager||use_external_tax_app||app_tax_data||include_tax_in_prices||total_tax_raw||pagetype||jwt||service_code||used_card||use_shipping_manager||shipping_manager_data||selected_shipping_manager_data||hope_shipping_date||ex_mileage||etc_is_user_defined||etc_is_marketing||simple_order_agreement_check_box||marketing_agreement_checkbox0||simple_join_agreement_checkbox0||privacy_optional_agreement_check_box||privacy_optional_agreement_checkbox||sms_agreement_checkbox0||email_agreement_checkbox0||third_party_providet_agreement_checkbox0||privacy_optional_agreement_checkbox0||thirdParty_agreement_check_val||orderform_id||gift_selected_item||use_join_privacy_policy_required||order_agreement_member_use_flag||order_agreement_nonmember_use_flag||is_used_with_mileage||is_used_with_member_discount||is_used_with_coupon"
							type="hidden">
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
														id="product_total_price_front0">20,000</span>원</strong>
													</td>
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
															()</span></strong> + 배송비 <span
													id=""></span> = 합계 : <strong class="txtEm gIndent10"><span id=""
														class="txt18"></span></strong></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="orderListArea displaynone">
								<div class="title">
									<h6>해외배송상품 주문내역</h6>
									<p class="button">
										<a href="javascript:window.history.back();" class="btnNormal">이전페이지</a>
									</p>
								</div>

								<div class="ec-base-table typeList gBorder">
									<table border="1" summary="">
										<caption>해외배송</caption>
										<colgroup>
											<col style="width: 27px" class="">
											<col style="width: 92px">
											<col style="width: auto">
											<col style="width: 98px">
											<col style="width: 75px">
											<col style="width: 98px">
											<col style="width: 98px">
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
												<th scope="col">합계</th>
											</tr>
										</thead>
										<tfoot class="right">
											<tr>
												<td class=""></td>
												<td colspan="7"><span class="gLeft">[해외배송]</span>
													상품구매금액 <strong>()</strong> + 배송비 <span id="f_list_total_delv_price_id"></span>원
													 = 합계 : <strong class="txtEm gIndent10"><span id=""
														class="txt18"></span></strong></td>
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
														cols="70"></textarea>
													</td>
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
									(function(i, s, o, g, r) {
										var a = s.createElement(o);
										var m = s.getElementsByTagName(o)[0];
										a.src = g;
										a.onload = function() {
											if (i[r].init) {
												i[r]
														.init(
																'https://js-error-tracer-api.cafe24.com',
																'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsaWZlbGFiMDMwMS5jYWZlMjQuY29tIiwiYXVkIjoianMtZXJyb3ItdHJhY2VyLWFwaS5jYWZlMjQuY29tIiwibWFsbF9pZCI6ImxpZmVsYWIwMzAxIiwic2hvcF9ubyI6MSwicGF0aF9yb2xlIjoiIiwibGFuZ3VhZ2VfY29kZSI6ImtvX0tSIiwiY291bnRyeV9jb2RlIjoiS1IiLCJpc195dHMiOmZhbHNlLCJpc19jb250YWluZXIiOmZhbHNlfQ.dpZaCS8VETINHSPVQUo6s25Dzy_JaQXUtcIsKYPY7dw',
																{
																	"errors" : {
																		"path" : "\/api\/v1\/store",
																		"collectWindowErrors" : true,
																		"preventDuplicateReports" : true,
																		"storageKeyPrefix" : "EC_JET.",
																		"samplingEnabled" : true,
																		"samplingRate" : 0.5
																	},
																	"vitals" : {
																		"path" : "\/api\/v1\/vitals",
																		"samplingEnabled" : true,
																		"samplingRate" : 0.3
																	},
																	"resources" : {
																		"path" : "\/api\/v1\/resources",
																		"samplingEnabled" : true,
																		"samplingRate" : 0.5,
																		"durationThreshold" : 3000
																	}
																});
											}
										};
										m.parentNode.insertBefore(a, m);
									}(window, document, 'script',
											'//optimizer.poxo.com/jet/jet.js',
											'EC_JET'));
								</script>
								<script type="text/javascript">
									if (typeof EC_ROUTE === "undefined") {
										/**
										 * 프론트용 라우트 플러그인
										 * @type {{bInit: boolean, init: EC_ROUTE.init}}
										 * CAFE24.ROUTE 참조
										 */
										var EC_ROUTE = {
											EC_DOMAIN_PATH_INFO : 'EC_DOMAIN_PATH_INFO',
											bInit : false,
											aFromList : [],
											aToList : [],
											aCleanFilter : null,
											init : function() {
												if (this.bInit
														|| typeof CAFE24.ROUTE === 'undefined') {
													return;
												}
												this.bInit = true;
												this.aCleanFilter = [
														/^shop[1-9][0-9]*$/,
														/^(m|p)$/,
														new RegExp(
																'^('
																		+ Object
																				.keys(
																						CAFE24.ROUTE.support_language_list)
																				.join(
																						'|')
																		+ ')$'),
														/^skin-(base|skin[1-9][0-9]*|mobile[0-9]*)$/, ];
											},
											isNeedRoute : function() {
												return CAFE24.ROUTE.is_need_route;
											},
											/**
											 *
											 * @param iShopNo
											 * @param bMobile
											 * @param sFrontLanguage
											 * @param sSkinCode
											 * @returns {*|string}
											 */
											getUrlDomain : function(iShopNo,
													bMobile, sFrontLanguage,
													sSkinCode) {
												var oRouteConfig = {};
												if (typeof iShopNo == 'undefined') {
													oRouteConfig.shop_no = CAFE24.SDE_SHOP_NUM;
												} else {
													oRouteConfig.shop_no = iShopNo;
												}
												if (typeof bMobile == 'undefined') {
													oRouteConfig.is_mobile = false;
												} else {
													oRouteConfig.is_mobile = bMobile;
												}
												if (typeof sFrontLanguage == 'undefined') {
													oRouteConfig.language_code = '';
												} else {
													oRouteConfig.language_code = sFrontLanguage; // 내부에서 로직으로 동작할땐 언어_지역 형태의 로케일 형태를 따른다.
												}
												if (typeof sSkinCode == 'undefined') {
													oRouteConfig.skin_code = '';
												} else {
													oRouteConfig.skin_code = sSkinCode;
												}

												var sDomain = '';
												if (oRouteConfig.shop_no != CAFE24.SDE_SHOP_NUM) {
													// 접근된 다른 멀티샵 도메인 정보는 primary domain 를 조회해야함으로 ajax 를 통해 정보를 얻는다.
													sDomain = this
															._getUrlDomainMultishop(oRouteConfig);
												} else {
													// 샵이 동일할 경우에는 접근된 domain 에 path 정보만 정리하여 반환함.
													sDomain = this
															._getUrlDomain(oRouteConfig);
												}
												return sDomain;
											},
											_getUrlDomainMultishop : function(
													oRouteConfig) {
												var sDomain = '';
												EC$
														.ajax({
															type : 'GET',
															url : '/exec/front/Shop/Domain',
															data : {
																'_shop_no' : oRouteConfig.shop_no,
																'is_mobile' : oRouteConfig.is_mobile,
																'language_code' : oRouteConfig.language_code,
																'skin_code' : oRouteConfig.skin_code,
															},
															async : false,
															dataType : 'json',
															cache : true,
															success : function(
																	oResult) {
																switch (oResult.code) {
																case '0000':
																	sDomain = oResult.data;
																	break;
																default:
																	break;
																}
																return false;
															}
														});
												return sDomain;
											},
											_getUrlDomain : function(
													oRouteConfig) {
												oRouteConfig.domain = this
														._getCreateHost(oRouteConfig);
												return location.protocol
														+ '//'
														+ oRouteConfig.domain
														+ this
																._getCreateUri(oRouteConfig);
											},
											_getCreateHost : function(
													oRouteConfig) {
												var sHost = location.host;
												var aHost = sHost.split('.');
												if (this.isBaseDomain(sHost)) {
													if (aHost.length > 3) {
														aHost[0] = '';
													}
												} else if (oRouteConfig.is_mobile) {
													if (this.isMobileDomain()) {
														oRouteConfig.is_mobile = false;
													}
												}
												return aHost.filter(Boolean)
														.join('.');
											},
											_getCreateUri : function(oRouteInfo) {
												var aUrl = [];
												if (this.isBaseDomain()
														&& oRouteInfo.shop_no > 1) {
													aUrl
															.push('shop'
																	+ oRouteInfo.shop_no);
												}
												if (oRouteInfo.is_mobile) {
													aUrl.push('m');
												}
												if (oRouteInfo.language_code != 'ZZ'
														&& oRouteInfo.language_code != '') {
													var iIndex = Object
															.values(
																	CAFE24.ROUTE.support_language_list)
															.indexOf(
																	oRouteInfo.language_code);
													if (iIndex !== -1) {
														aUrl
																.push(Object
																		.keys(CAFE24.ROUTE.support_language_list)[iIndex]);
													}
												}
												if (this.isBaseDomain()
														&& oRouteInfo.skin_code != 'default'
														&& oRouteInfo.skin_code != '') {
													aUrl
															.push('skin-'
																	+ oRouteInfo.skin_code);
												}
												var sUrl = '/';
												if (aUrl.length > 0) {
													sUrl = '/' + aUrl.join('/');
													sUrl = this
															.rtrim(sUrl, '/');
												}
												return sUrl;
											},
											/**
											 * en, en-US => en_US
											 */
											convertValidLanguageCode : function(
													sUrlLanguageCode) {
												if (typeof CAFE24.ROUTE.support_language_list[sUrlLanguageCode] != 'undefined') {
													return CAFE24.ROUTE.support_language_list[sUrlLanguageCode];
												}
												return false;
											},
											isMobileDomain : function(sHost) {
												if (typeof sHost == 'undefined') {
													sHost = location.host;
												}
												var aMatched = sHost
														.match(/^(m|mobile|skin\-mobile|skin\-mobile[0-9]+[\-]{2}shop[0-9]+|skin\-mobile[0-9]+|mobile[\-]{2}shop[0-9]+)\./i);
												return aMatched != null;
											},
											isBaseDomain : function(sHost) {
												if (typeof sHost == 'undefined') {
													sHost = location.host;
												}
												return sHost
														.indexOf(CAFE24.GLOBAL_INFO
																.getRootDomain()) !== -1;
											},
											removePrefixUrl : function(sUrl) {
												if (this.isNeedRoute()) {
													sUrl = sUrl.replace(this
															.getPrefixUrl('/'),
															'/'); // 자동으로  prefix 붙은 영역을 제거해준다.
												}
												return sUrl;
											},
											getPrefixUrl : function(sUrl) {
												if (this.isNeedRoute() === false) {
													return sUrl;
												}
												if (sUrl.indexOf('/') !== 0) {
													return sUrl;
												}
												if (sUrl.match(/^\/{2,}/) !== null) {
													return sUrl;
												}

												var iCachedPosition = this.aFromList
														.indexOf(sUrl);
												if (iCachedPosition > -1) {
													return this.aToList[iCachedPosition];
												}

												var bTailSlash = (sCleanUrl !== '/' && sUrl
														.substr(-1) === '/');
												var sCleanUrl = this
														.getCleanUrl(sUrl);
												var aPrefixPart = CAFE24.ROUTE.path.prefix
														.split('/');
												var aUrlPart = sCleanUrl
														.split('/');
												var bMatched = true;
												var sReturnUrl = sCleanUrl;
												if (aUrlPart.length < aPrefixPart.length) {
													bMatched = false;
												} else {
													for (var i = 0; i < aPrefixPart.length; i++) {
														if (aPrefixPart[i] != aUrlPart[i]) {
															bMatched = false;
															break;
														}
													}
												}
												if (bMatched === false) {
													if (sCleanUrl == '/') {
														sReturnUrl = CAFE24.ROUTE.path.prefix;
													} else {
														sReturnUrl = CAFE24.ROUTE.path.prefix
																+ sCleanUrl;
													}
													sReturnUrl = bTailSlash ? sReturnUrl
															: this.rtrim(
																	sReturnUrl,
																	'/')
													this.aFromList.push(sUrl);
													this.aToList
															.push(sReturnUrl);
												}
												return sReturnUrl;
											},
											/**
											 * document.location.pathname 이 필요할 경우 사용한다.
											 * @returns {*}
											 */
											getPathName : function() {
												if (typeof CAFE24.ROUTE.path.result == 'undefined') {
													return document.location.pathname;
												}
												return CAFE24.ROUTE.path.result;
											},
											rtrim : function(str, chr) {
												var rgxtrim = (!chr) ? new RegExp(
														'\\s+$')
														: new RegExp(chr + '+$');
												return str.replace(rgxtrim, '');
											},
											getShopNo : function() {
												return CAFE24.ROUTE.shop_no;
											},
											getSkinCode : function() {
												return CAFE24.ROUTE.skin_code;
											},
											getLanguageCode : function() {
												return CAFE24.ROUTE.language_code;
											},
											getMobile : function() {
												return CAFE24.ROUTE.is_mobile;
											},
											getIsMobile : function() {
												return CAFE24.ROUTE.is_mobile
														|| CAFE24.ROUTE.skin_code
																.match(/^mobile[0-9]*$/);
											},
											getCleanUrl : function(sUrl) {
												if (sUrl === '/') {
													return sUrl;
												}

												var aUrl = sUrl.split('/');
												aUrl.shift();

												if (aUrl.length < 1) {
													return sUrl;
												}

												// 현재 4 depth 까지 미리보기 기능이 구현되어있음
												var iPos = 0;
												var bFind = false;
												for (var i = 0; i < aUrl.length; i++) {
													bFind = false;
													for (var iSub = iPos, iSubCount = this.aCleanFilter.length; iSub < iSubCount; iSub++) {
														if (aUrl[i]
																.match(this.aCleanFilter[iSub]) !== null) {
															bFind = true;
															iPos = iSub + 1;
															aUrl.splice(i, 1);
															i--; // aUrl 을 삭제해 주었으니 검색 조건을 -1 제거하여 초기화 한다. 다음 for i++ 로 증감 조회됨.
															break;
														}
													}
													if (bFind === false) {
														break;
													}
												}
												return '/' + aUrl.join('/');
											},
											getIsEasyUrl : function() {
												return !window.location.pathname
														.match(/^[\w\/\-\.]+(php|html|htm)$/i);
											}
										};
										EC_ROUTE.init();
									}
								</script>
								<meta http-equiv="Content-Type"
									content="text/html; charset=utf-8">
								<link rel="shortcut icon"
									href="/web/upload/favicon_20180123182356.ico">
								<script type="text/javascript"
									src="/app/Eclog/js/cid.generate.js?vs=be4910e13365511fd914ba822d84c067&amp;u=lifelab0301.1"></script>
								<script type="text/javascript">
									window.CAFE24 = window.CAFE24 || {};
									CAFE24.MANIFEST_CACHE_REVISION = '2404210600';
									CAFE24.getDeprecatedNamespace = function(
											sDeprecatedNamespace,
											sSupersededNamespace) {
										var sNamespace = sSupersededNamespace ? sSupersededNamespace
												: sDeprecatedNamespace.replace(
														/^EC_/, '');
										return CAFE24[sNamespace];
									}
									CAFE24.FRONT_LANGUAGE_CODE = "ko_KR";
									CAFE24.MOBILE = false;
									CAFE24.MOBILE_DEVICE = false;
									CAFE24.MOBILE_USE = true;
									var EC_MOBILE = CAFE24.MOBILE;
									var EC_MOBILE_DEVICE = CAFE24.MOBILE_DEVICE;
									var EC_MOBILE_USE = CAFE24.MOBILE_USE;
									CAFE24.SKIN_CODE = "skin15";
									CAFE24.SDE_SHOP_NUM = 1;
									CAFE24.SHOP = {
										getLanguage : function() {
											return "ko_KR";
										},
										getCurrency : function() {
											return "KRW";
										},
										getFlagCode : function() {
											return "KR";
										},
										getTimezone : function() {
											return "Asia/Seoul"
										},
										getDateFormat : function() {
											return "Y-m-d"
										},
										isMultiShop : function() {
											return true;
										},
										isDefaultShop : function() {
											return true;
										},
										isDefaultLanguageShop : function(
												sLanguageCode) {
											return SHOP.isDefaultShop()
													&& SHOP
															.isLanguageShop(sLanguageCode);
										},
										isKR : function() {
											return true;
										},
										isUS : function() {
											return false;
										},
										isJP : function() {
											return false;
										},
										isCN : function() {
											return false;
										},
										isTW : function() {
											return false;
										},
										isES : function() {
											return false;
										},
										isPT : function() {
											return false;
										},
										isVN : function() {
											return false;
										},
										isPH : function() {
											return false;
										},
										getCountryAndLangMap : function() {
											return {
												"KR" : "ko_KR",
												"US" : "en_US",
												"JP" : "ja_JP",
												"CN" : "zh_CN",
												"TW" : "zh_TW",
												"VN" : "vi_VN",
												"PH" : "en_PH"
											}
										},
										isLanguageShop : function(sLanguageCode) {
											return sLanguageCode === "ko_KR";
										},
										getDefaultShopNo : function() {
											return 1;
										},
										getProductVer : function() {
											return 2;
										},
										isSDE : function() {
											return true;
										},
										isMode : function() {
											return false;
										},
										getModeName : function() {
											return false;
										},
										isMobileAdmin : function() {
											return false;
										},
										isNewProMode : function() {
											return true;
										},
										isExperienceMall : function() {
											return false;
										},
										isDcollection : function() {
											return false;
										},
										isYoutubeShops : function() {
											return false;
										},
										getYtShopsShopNo : function() {
											return 0;
										},
										getAdminID : function() {
											return 'wjdaudgh10'
										},
										getMallID : function() {
											return 'lifelab0301'
										},
										getCurrencyFormat : function(sPriceTxt,
												bIsNumberFormat) {
											sPriceTxt = String(sPriceTxt);
											var aCurrencySymbol = [ "",
													"\uc6d0", false ];
											if (typeof CAFE24.SHOP_PRICE !== 'undefined'
													&& isNaN(sPriceTxt.replace(
															/[,]/gi, '')) === false
													&& bIsNumberFormat === true) {
												// bIsNumberFormat 사용하려면 Ui(':libUipackCurrency')->plugin('Currency') 화폐 라이브러리 추가 필요
												sPriceTxt = CAFE24.SHOP_PRICE
														.toShopPrice(
																sPriceTxt
																		.replace(
																				/[,]/gi,
																				''),
																true,
																CAFE24.SDE_SHOP_NUM);
											}
											try {
												var sPlusMinusSign = (sPriceTxt
														.toString()).substr(0,
														1);
												if (sPlusMinusSign === '-'
														|| sPlusMinusSign === '+') {
													sPriceTxt = (sPriceTxt
															.toString())
															.substr(1);
													return sPlusMinusSign
															+ aCurrencySymbol[0]
															+ sPriceTxt
															+ aCurrencySymbol[1];
												} else {
													return aCurrencySymbol[0]
															+ sPriceTxt
															+ aCurrencySymbol[1];
												}
											} catch (e) {
												return aCurrencySymbol[0]
														+ sPriceTxt
														+ aCurrencySymbol[1];
											}
										}
									};
									CAFE24.CURRENCY_INFO = {
										getOriginReferenceCurrency : function() {
											return 'USD'
										},
										getCurrencyList : function(
												sCurrencyCode) {
											var aCurrencyList = {
												"JPY" : {
													"currency_symbol" : "&yen;",
													"decimal_place" : 0,
													"round_method_type" : "F"
												},
												"VND" : {
													"currency_symbol" : "&#8363;",
													"decimal_place" : 0,
													"round_method_type" : "F"
												},
												"PHP" : {
													"currency_symbol" : "&#8369;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"USD" : {
													"currency_symbol" : "$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"CNY" : {
													"currency_symbol" : "&yen;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"TWD" : {
													"currency_symbol" : "NT$",
													"decimal_place" : 0,
													"round_method_type" : "F"
												},
												"EUR" : {
													"currency_symbol" : "\u20ac",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"BRL" : {
													"currency_symbol" : "R$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"AUD" : {
													"currency_symbol" : "A$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"BHD" : {
													"currency_symbol" : ".&#1583;.&#1576;",
													"decimal_place" : 3,
													"round_method_type" : "R"
												},
												"BDT" : {
													"currency_symbol" : "&#2547;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"GBP" : {
													"currency_symbol" : "&pound;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"CAD" : {
													"currency_symbol" : "C$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"CZK" : {
													"currency_symbol" : "K&#269;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"DKK" : {
													"currency_symbol" : "kr",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"HKD" : {
													"currency_symbol" : "HK$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"HUF" : {
													"currency_symbol" : "Ft",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"INR" : {
													"currency_symbol" : "&#8377;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"IDR" : {
													"currency_symbol" : "Rp",
													"decimal_place" : 0,
													"round_method_type" : "F"
												},
												"ILS" : {
													"currency_symbol" : "&#8362;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"JOD" : {
													"currency_symbol" : " &#1583;&#1610;&#1606;&#1575;&#1585;",
													"decimal_place" : 3,
													"round_method_type" : "R"
												},
												"KWD" : {
													"currency_symbol" : "&#1583;&#1610;&#1606;&#1575;&#1585;",
													"decimal_place" : 3,
													"round_method_type" : "R"
												},
												"MYR" : {
													"currency_symbol" : "RM",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"MXN" : {
													"currency_symbol" : "Mex$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"NZD" : {
													"currency_symbol" : "NZ$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"NOK" : {
													"currency_symbol" : "kr",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"PKR" : {
													"currency_symbol" : "&#8360;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"PLN" : {
													"currency_symbol" : "z\u0142",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"RUB" : {
													"currency_symbol" : "\u0440\u0443\u0431",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"SAR" : {
													"currency_symbol" : "&#65020;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"SGD" : {
													"currency_symbol" : "S$",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"ZAR" : {
													"currency_symbol" : "R",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"SEK" : {
													"currency_symbol" : "kr",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"CHF" : {
													"currency_symbol" : "Fr",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"THB" : {
													"currency_symbol" : "&#3647;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"TRY" : {
													"currency_symbol" : "TL",
													"decimal_place" : 2,
													"round_method_type" : "R"
												},
												"AED" : {
													"currency_symbol" : "&#1601;&#1604;&#1587;",
													"decimal_place" : 2,
													"round_method_type" : "R"
												}
											};
											return aCurrencyList[sCurrencyCode]
										},
										isUseReferenceCurrency : function() {
											return false
										}
									};
									CAFE24.COMMON_UTIL = {
										convertSslForString : function(sString) {
											return sString.replace(/http:/gi,
													'');
										},
										convertSslForHtml : function(sHtml) {
											return sHtml
													.replace(
															/((?:src|href)\s*=\s*['"])http:(\/\/(?:[a-z0-9\-_\.]+)\/)/ig,
															'$1$2');
										},
										getProtocol : function() {
											return 'https';
										},
										moveSsl : function() {
											if (CAFE24.COMMON_UTIL
													.getProtocol() === 'http') {
												var oLocation = jQuery(window.location);
												var sUrl = 'https://'
														+ oLocation
																.attr('host')
														+ oLocation
																.attr('pathname')
														+ oLocation
																.attr('search');
												window.location.replace(sUrl);
											}
										},
										setEcCookie : function(sKey, sValue,
												iExpire) {
											var exdate = new Date();
											exdate.setDate(exdate.getDate()
													+ iExpire);
											var setValue = escape(sValue)
													+ "; domain=."
													+ CAFE24.GLOBAL_INFO
															.getBaseDomain()
													+ "; path=/;expires="
													+ exdate.toUTCString();
											document.cookie = sKey + "="
													+ setValue;
										}
									};
									CAFE24.SHOP_LIB_INFO = {
										getBankInfo : function() {
											var oBankInfo = "";
											$
													.ajax({
														type : "GET",
														url : "/exec/front/Shop/Bankinfo",
														dataType : "json",
														async : false,
														success : function(
																oResponse) {
															oBankInfo = oResponse;
														}
													});
											return oBankInfo;
										}
									};
									var EC_SDE_SHOP_NUM = CAFE24.SDE_SHOP_NUM;
									var SHOP = CAFE24
											.getDeprecatedNamespace('SHOP');
									var EC_COMMON_UTIL = CAFE24
											.getDeprecatedNamespace('EC_COMMON_UTIL');
									var EC_SHOP_LIB_INFO = CAFE24
											.getDeprecatedNamespace('EC_SHOP_LIB_INFO');
									var EC_CURRENCY_INFO = CAFE24
											.getDeprecatedNamespace('EC_CURRENCY_INFO');
									CAFE24.ROOT_DOMAIN = "cafe24.com";
									CAFE24.API_DOMAIN = "cafe24api.com";
									CAFE24.TRANSLATE_LOG_STATUS = "F";
									CAFE24.GLOBAL_INFO = (function() {
										var oData = {
											"base_domain" : "lifelab0301.cafe24.com",
											"root_domain" : "cafe24.com",
											"api_domain" : "cafe24api.com",
											"is_global" : false,
											"is_global_standard" : false,
											"country_code" : "KR",
											"language_code" : "ko_KR",
											"admin_language_code" : "ko_KR"
										};
										return {
											getBaseDomain : function() {
												return oData['base_domain'];
											},
											getRootDomain : function() {
												return oData['root_domain'];
											},
											getApiDomain : function() {
												return oData['api_domain'];
											},
											isGlobal : function() {
												return oData['is_global'];
											},
											isGlobalStandard : function() {
												return oData['is_global_standard'];
											},
											getCountryCode : function() {
												return oData['country_code'];
											},
											getLanguageCode : function() {
												return oData['language_code'];
											},
											getAdminLanguageCode : function() {
												return oData['admin_language_code'];
											}
										};
									})();
									var EC_ROOT_DOMAIN = CAFE24.ROOT_DOMAIN;
									var EC_API_DOMAIN = CAFE24.API_DOMAIN;
									var EC_TRANSLATE_LOG_STATUS = CAFE24.TRANSLATE_LOG_STATUS;
									var EC_GLOBAL_INFO = CAFE24
											.getDeprecatedNamespace('EC_GLOBAL_INFO');
									CAFE24.AVAILABLE_LANGUAGE = [ "ko_KR",
											"zh_CN", "en_US", "zh_TW", "es_ES",
											"pt_PT", "vi_VN", "ja_JP", "en_PH" ];
									CAFE24.AVAILABLE_LANGUAGE_CODES = {
										"ko_KR" : "KOR",
										"zh_CN" : "CHN",
										"en_US" : "ENG",
										"zh_TW" : "TWN",
										"es_ES" : "ESP",
										"pt_PT" : "PRT",
										"vi_VN" : "VNM",
										"ja_JP" : "JPN",
										"en_PH" : "PHL"
									};
									var EC_AVAILABLE_LANGUAGE = CAFE24.AVAILABLE_LANGUAGE;
									var EC_AVAILABLE_LANGUAGE_CODES = CAFE24.AVAILABLE_LANGUAGE_CODES;
									CAFE24.GLOBAL_PRODUCT_LANGUAGE_CODES = {
										sClearanceCategoryCode : '',
										sManualLink : '//support.cafe24.com/hc/ko/articles/7739013909529',
										sHsCodePopupLink : 'https://www.wcotradetools.org/en/harmonized-system',
										aCustomRegex : '"PHL" : "^[0-9]{8}[A-Z]?$"',
										sCountryCodeData : 'kor',
										sEnglishExampleURlForGlobal : '',
										aReverseAddressCountryCode : [ "VNM",
												"PHL" ],
										aSizeGuideCountryAlign : '["US","UK","EU","KR","JP","CN"]',
										aIsSupportTran : [ "ja_JP", "zh_CN",
												"zh_TW", "en_US", "vi_VN",
												"en_PH", "pt_PT", "es_ES" ]
									};
									var EC_GLOBAL_PRODUCT_LANGUAGE_CODES = CAFE24
											.getDeprecatedNamespace('EC_GLOBAL_PRODUCT_LANGUAGE_CODES');
									CAFE24.GLOBAL_ORDER_LANGUAGE_CODES = {
										aModifyOrderLanguage : {
											"KR" : "ko_KR",
											"JP" : "ja_JP",
											"CN" : "zh_CN",
											"TW" : "zh_TW",
											"VN" : "vi_VN",
											"PH" : "en_PH"
										},
										aUseIdCardKeyCountry : [ "CN", "TW" ],
										aLanguageWithCountryCode : {
											"zh_CN" : [ "CN", "CHN", "HK",
													"HNK" ],
											"ja_JP" : [ "JP", "JPN" ],
											"zh_TW" : [ "TW", "TWN" ],
											"ko_KR" : [ "KR", "KOR" ],
											"vi_VN" : [ "VN", "VNM" ],
											"en_PH" : [ "PH", "PHL" ]
										},
										aCheckDisplayRequiredIcon : [ "ja_JP",
												"zh_CN", "zh_TW", "en_US",
												"vi_VN", "en_PH" ],
										aSetReceiverName : {
											"zh_CN" : {
												"sCountry" : "CN",
												"bUseLastName" : true
											},
											"zh_TW" : {
												"sCountry" : "TW",
												"bUseLastName" : false
											},
											"ja_JP" : {
												"sCountry" : "JP",
												"bUseLastName" : true
											}
										},
										aSetDeferPaymethodLanguage : {
											"ja_JP" : "\uc77c\ubcf8",
											"zh_CN" : "\uc911\uad6d"
										},
										aUseDeferPaymethod : [ "ja_JP", "zh_CN" ],
										aCheckShippingCompanyAndPaymethod : [
												"ja_JP", "zh_CN" ],
										aSetDeferPaymethodLanguageForShipping : {
											"ja_JP" : "\u65e5\u672c",
											"zh_CN" : "\uc911\uad6d"
										},
										aCheckStoreByPaymethod : [ "ja_JP",
												"zh_CN" ],
										aCheckIsEmailRequiredForJs : [ "en_US",
												"zh_CN", "zh_TW", "ja_JP",
												"vi_VN", "en_PH" ],
										aSetIdCardKeyCountryLanguage : {
											"CN" : "\uc911\uad6d\uc758",
											"TW" : "\ub300\ub9cc\uc758"
										},
										aReverseGlobalAddress : [ "en_PH",
												"vi_VN", "PHL", "VNM", "VN",
												"PH" ],
										aNoCheckZipCode : [ "KOR", "JPN" ],
										aNotPostCodeAPICountryList : [ "en_US",
												"es_ES", "pt_PT", "en_PH" ],
										aEnableSearchExchangeAddr : [ "KR",
												"JP", "CN", "VN", "TW", "PH" ],
										aDuplicatedBaseAddr : [ "TW", "JP" ],
										aReverseAddressCountryCode : [ "VN",
												"PH" ],
										aCheckZipCode : [ "PHL", "en_PH", "PH" ]
									};
									var EC_GLOBAL_ORDER_LANGUAGE_CODES = CAFE24
											.getDeprecatedNamespace('EC_GLOBAL_ORDER_LANGUAGE_CODES');
									CAFE24.GLOBAL_MEMBER_LANGUAGE_CODES = {
										sAdminWebEditorLanguageCode : 'ko',
										oNotAvailDecimalPointLanguages : [
												"ko_KR", "ja_JP", "zh_TW",
												"vi_VN" ],
										oAddressCountryCode : {
											"KOR" : "ko_KR",
											"JPN" : "ja_JP",
											"CHN" : "zh_CN",
											"TWN" : "zh_TW",
											"VNM" : "vi_VN",
											"PHL" : "en_PH"
										},
									};
									var EC_GLOBAL_MEMBER_LANGUAGE_CODES = CAFE24
											.getDeprecatedNamespace('EC_GLOBAL_MEMBER_LANGUAGE_CODES');
									CAFE24.GLOBAL_BOARD_LANGUAGE_CODES = {
										bUseLegacyBoard : true
									};
									var EC_GLOBAL_BOARD_LANGUAGE_CODES = CAFE24
											.getDeprecatedNamespace('EC_GLOBAL_BOARD_LANGUAGE_CODES');
									CAFE24.GLOBAL_MALL_LANGUAGE_CODES = {
										oDesign : {
											oDesignAddReplaceInfo : {
												"group_id" : "SKIN.ADD.ADMIN.DESIGNDETAIL",
												"replacement" : {
													"KR" : "KOREAN",
													"US" : "ENGLISH",
													"JP" : "JAPANESE",
													"CN" : "SIMPLIFIED.CHINESE",
													"TW" : "TRADITIONAL.CHINESE",
													"ES" : "SPANISH",
													"PT" : "PORTUGUESE",
													"PH" : "ENGLISH"
												}
											},
											oDesignDetailLanguageCountryMap : {
												"KR" : "ko_KR",
												"JP" : "ja_JP",
												"CN" : "zh_CN",
												"TW" : "zh_TW",
												"US" : "en_US",
												"ES" : "es_ES",
												"PT" : "pt_PT",
												"PH" : "en_PH"
											},
											oSmartDesignSwitchTipLink : {
												"edibot" : {
													"img" : "\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/img_editor_dnd.png",
													"link" : "\/\/ecsupport.cafe24.com\/board\/free\/list.html?board_act=list&board_no=12&category_no=9&cate_no=9"
												},
												"smart" : {
													"img" : "\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/ko_KR\/img_editor_smart.png",
													"link" : "\/\/sdsupport.cafe24.com"
												}
											},
											oSmartDesignDecoShopList : [
													"ko_KR", "ja_JP", "zh_CN",
													"en_US", "zh_TW", "es_ES",
													"pt_PT" ],
											oSmartDesignDecoMultilingual : {
												"list" : {
													"ko_KR" : "KOREAN",
													"en_US" : "ENGLISH",
													"ja_JP" : "JAPANESE",
													"zh_CN" : "SIMPLIFIED.CHINESE",
													"zh_TW" : "TRADITIONAL.CHINESE",
													"es_ES" : "SPANISH",
													"pt_PT" : "PORTUGUESE",
													"vi_VN" : "VIETNAMESE"
												},
												"group_id" : "EDITOR.LAYER.EDITING.DECO"
											},
											aSmartDesignModuleShopList : [
													"ko_KR", "ja_JP", "zh_CN",
													"en_US", "zh_TW", "es_ES",
													"pt_PT" ]
										},
										oStore : {
											oMultiShopCurrencyInfo : {
												"en_US" : {
													"currency" : "USD"
												},
												"zh_CN" : {
													"currency" : "USD",
													"sub_currency" : "CNY"
												},
												"ja_JP" : {
													"currency" : "JPY"
												},
												"zh_TW" : {
													"currency" : "TWD"
												},
												"es_ES" : {
													"currency" : "EUR"
												},
												"pt_PT" : {
													"currency" : "EUR"
												},
												"ko_KR" : {
													"currency" : "KRW"
												},
												"vi_VN" : {
													"currency" : "VND"
												},
												"en_PH" : {
													"currency" : "PHP"
												}
											},
											oBrowserRedirectLanguage : {
												"ko" : {
													"primary" : "ko_KR",
													"secondary" : "en_US"
												},
												"en" : {
													"detail" : {
														"en-ph" : {
															"primary" : "en_PH",
															"secondary" : "en_US"
														},
														"en-us" : {
															"primary" : "en_US",
															"secondary" : "es_ES"
														},
														"default" : {
															"primary" : "en_US",
															"secondary" : "es_ES"
														}
													}
												},
												"ja" : {
													"primary" : "ja_JP",
													"secondary" : "en_US"
												},
												"zh" : {
													"detail" : {
														"zh-cn" : {
															"primary" : "zh_CN",
															"secondary" : "en_US"
														},
														"zh-tw" : {
															"primary" : "zh_TW",
															"secondary" : "zh_CN"
														},
														"default" : {
															"primary" : "en_US",
															"secondary" : "ko_KR"
														}
													}
												},
												"es" : {
													"primary" : "es_ES",
													"secondary" : "en_US"
												},
												"pt" : {
													"primary" : "pt_PT",
													"secondary" : "en_US"
												},
												"vi" : {
													"primary" : "vi_VN",
													"secondary" : "en_US"
												},
												"default" : {
													"primary" : "en_US",
													"secondary" : "ko_KR"
												}
											},
											aChangeableLanguages : [ "en_US",
													"ja_JP", "ko_KR" ],
											aNoZipCodeLanguage : [ "ko_KR",
													"ja_JP" ]
										},
										oMobile : {
											sSmartWebAppFaqUrl : "https://support.cafe24.com/hc/ko/articles/8466586607641",
											sAmpFaqUrl : "https://ecsupport.cafe24.com/board/free/read.html?no=1864&board_no=5&category_no=13&cate_no=13&category_no=13&category_no=13",
										},
										oPromotion : {
											bQrCodeAvailable : true,
											bSnsMarketingAvailable : true
										},
										oShippingReverseAddressLanguage : [
												"vi_VN", "en_PH" ],
										oGlobalStandardSwitchHelpCodeLink : {
											"SH.DS" : {
												"link" : "\/\/serviceguide.cafe24shop.com\/en_PH\/SH.DS.html"
											},
											"PR.DS" : {
												"link" : "\/\/serviceguide.cafe24shop.com\/en_PH\/PR.DS.html"
											},
											"OR.SM.BO" : {
												"link" : "\/\/serviceguide.cafe24shop.com\/en_PH\/OR.SM.BO.html"
											},
											"DE.DS" : {
												"link" : "\/\/serviceguide.cafe24shop.com\/en_PH\/DE.DS.html"
											},
											"MB.DS" : {
												"link" : "\/\/serviceguide.cafe24shop.com\/en_PH\/MB.DS.html"
											},
											"PM.DS" : {
												"link" : "\/\/serviceguide.cafe24shop.com\/en_PH\/PM.DS.html"
											}
										},
										getAdminMainLocaleLanguage : function(
												sSkinLocaleCode) {
											var oLocaleData = [];
											var locale = "";
											var shopLangName = "";
											if (sSkinLocaleCode == "US") {
												locale = "en_US";
												shopLangName = "ENGLISH";
											} else if (sSkinLocaleCode == "JP") {
												locale = "ja_JP";
												shopLangName = "JAPANESE";
											} else if (sSkinLocaleCode == "CN") {
												locale = "zh_CN";
												shopLangName = "SIMPLIFIED.CHINESE";
											} else if (sSkinLocaleCode == "TW") {
												locale = "zh_TW";
												shopLangName = "TRADITIONAL.CHINESE";
											} else if (sSkinLocaleCode == "ES") {
												locale = "es_ES";
												shopLangName = "SPANISH";
											} else if (sSkinLocaleCode == "PT") {
												locale = "pt_PT";
												shopLangName = "PORTUGUESE";
											} else if (sSkinLocaleCode == "VN") {
												locale = "vi_VN";
												shopLangName = "VIETNAMESE";
											} else if (sSkinLocaleCode == "PH") {
												locale = "en_PH";
												shopLangName = "ENGLISH.PH";
											}
											oLocaleData["locale"] = locale;
											oLocaleData["shopLangName"] = shopLangName;
											return oLocaleData;
										}
									};
									var EC_GLOBAL_MALL_LANGUAGE_CODES = CAFE24
											.getDeprecatedNamespace('EC_GLOBAL_MALL_LANGUAGE_CODES');
									CAFE24.GLOBAL_DATETIME_INFO = {
										oConstants : {
											"STANDARD_DATE_REGEX" : "\/([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))\/",
											"IN_ZONE" : "inZone",
											"OUT_ZONE" : "outZone",
											"IN_FORMAT" : "inFormat",
											"OUT_FORMAT" : "outFormat",
											"IN_DATE_FORMAT" : "inDateFormat",
											"IN_TIME_FORMAT" : "inTimeFormat",
											"OUT_DATE_FORMAT" : "outDateFormat",
											"OUT_TIME_FORMAT" : "outTimeFormat",
											"IN_FORMAT_DATE_ONLY" : 1,
											"IN_FORMAT_TIME_ONLY" : 2,
											"IN_FORMAT_ALL" : 3,
											"OUT_FORMAT_DATE_ONLY" : 1,
											"OUT_FORMAT_TIME_ONLY" : 2,
											"OUT_FORMAT_ALL" : 3,
											"DATE_ONLY" : "YYYY-MM-DD",
											"TIME_ONLY" : "HH:mm:ss",
											"FULL_TIME" : "YYYY-MM-DD HH:mm:ss",
											"ISO_8601" : "YYYY-MM-DD[T]HH:mm:ssZ",
											"YEAR_ONLY" : "YYYY",
											"MONTH_ONLY" : "MM",
											"DAY_ONLY" : "DD",
											"WEEK_ONLY" : "e",
											"TIME_H_I_ONLY" : "HH:mm",
											"TIME_HOUR_ONLY" : "HH",
											"TIME_MINUTE_ONLY" : "mm",
											"POSTGRE_FULL_TIME" : "YYYY-MM-DD HH24:MI:SS",
											"POSTGRE_TIME_ONLY" : " HH24:MI:SS",
											"MICRO_SECOND_ONLY" : "u",
											"SEOUL" : "Asia\/Seoul",
											"TOKYO" : "Asia\/Tokyo",
											"SHANGHAI" : "Asia\/Shanghai",
											"TAIPEI" : "Asia\/Taipei",
											"HANOI" : "Asia\/Bangkok",
											"LOS_ANGELES" : "America\/Los_Angeles",
											"LISBON" : "Europe\/Lisbon",
											"MADRID" : "Europe\/Madrid",
											"SINGAPORE" : "Asia\/Singapore",
											"UTC" : "Etc\/UTC",
											"MAX_DATETIME" : "9999-12-31 23:59:59"
										},
										oOptions : {
											"inZone" : "Asia\/Seoul",
											"inFormat" : "YYYY-MM-DD HH:mm:ss",
											"inDateFormat" : "YYYY-MM-DD",
											"inTimeFormat" : "HH:mm:ss",
											"outZone" : "Asia\/Seoul",
											"outFormat" : "YYYY-MM-DD HH:mm:ss",
											"outDateFormat" : "YYYY-MM-DD",
											"outTimeFormat" : "HH:mm:ss"
										},
										oPolicies : [],
										sOverrideTimezone : '',
										sMomentNamespace : 'EC_GLOBAL_MOMENT'
									};
									CAFE24.FRONT_JS_CONFIG_MANAGE = {
										"sSmartBannerScriptUrl" : "https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206",
										"sMallId" : "lifelab0301",
										"sDefaultAppDomain" : "https:\/\/app4you.cafe24.com",
										"sWebLogOffFlag" : "F"
									};
									var EC_FRONT_JS_CONFIG_MANAGE = CAFE24
											.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
									typeof window.CAFE24 === "undefined"
											&& (window.CAFE24 = {});
									CAFE24.FRONTEND = {
										"FW_MANIFEST_CACHE_REVISION" : 2404210600,
										"IS_WEB_VIEW" : "F"
									};
									CAFE24.ROUTE = {
										"is_mobile" : false,
										"is_need_route" : false,
										"language_code" : "ZZ",
										"path" : {
											"origin" : "\/order\/gift_selectorderform.html",
											"result" : "\/order\/gift_selectorderform.html",
											"prefix" : ""
										},
										"shop_no" : 0,
										"skin_code" : "default",
										"support_language_list" : {
											"ar" : "ar_EG",
											"ar-EG" : "ar_EG",
											"de" : "de_DE",
											"de-DE" : "de_DE",
											"en" : "en_US",
											"en-IN" : "en_IN",
											"en-PH" : "en_PH",
											"en-US" : "en_US",
											"es" : "es_ES",
											"es-ES" : "es_ES",
											"hi" : "hi_IN",
											"hi-IN" : "hi_IN",
											"id" : "id_ID",
											"id-ID" : "id_ID",
											"it" : "it_IT",
											"it-IT" : "it_IT",
											"ja" : "ja_JP",
											"ja-JP" : "ja_JP",
											"ko" : "ko_KR",
											"ko-KR" : "ko_KR",
											"ms" : "ms_MY",
											"ms-MY" : "ms_MY",
											"pt" : "pt_PT",
											"pt-PT" : "pt_PT",
											"ru" : "ru_RU",
											"ru-RU" : "ru_RU",
											"th" : "th_TH",
											"th-TH" : "th_TH",
											"tr" : "tr_TR",
											"tr-TR" : "tr_TR",
											"vi" : "vi_VN",
											"vi-VN" : "vi_VN",
											"zh" : "zh_CN",
											"zh-CN" : "zh_CN",
											"zh-HK" : "zh_HK",
											"zh-MO" : "zh_MO",
											"zh-SG" : "zh_SG",
											"zh-TW" : "zh_TW"
										}
									};
								</script>

								<link rel="stylesheet" type="text/css"
									href="/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&amp;type=css&amp;k=37c9481ac0212340e132f81eba4d1049fee7f18e&amp;t=1681776733">
								<script type="text/javascript"
									src="/ind-script/i18n.php?lang=ko_KR&amp;domain=front&amp;v=2404210600"
									charset="utf-8"></script>


								<script type="text/javascript">
									var sIsChannelUi = 'F';
									var sChRef = '';
									var sUseShoppingpayPg = 'F';
									var sOwnMallLanding = 'F';
									var sShoppingPayCookie = '';
									if (sIsChannelUi === 'T') {
										sessionStorage
												.setItem('ch_ref', sChRef);
									}
									CAFE24.getChRefData = function() {
										if (sIsChannelUi === 'T') {
											return sessionStorage
													.getItem('ch_ref');
										}
									}
									// 자사몰랜딩/유튜브랜딩 공용
									CAFE24.checkChannelUI = function() {
										if ((sIsChannelUi === 'T'
												&& sessionStorage
														.getItem('ch_ref') || (sUseShoppingpayPg === 'T' && sOwnMallLanding === 'T'))) {
											return true;
										} else {
											return false;
										}
									}
									// 자사몰랜딩 UI확인
									CAFE24.isOwnMallLandingUI = function() {
										return sUseShoppingpayPg === 'T'
												&& sOwnMallLanding === 'T';
									}
									CAFE24.attachShoppingpayParam = function(
											sUrl) {
										if (sUrl) {
											var sChRef = CAFE24.getChRefData();
											if (sChRef) {
												var sSeparator = (sUrl
														.includes('?')) ? '&'
														: '?';
												sUrl += sSeparator + 'ch_ref='
														+ sChRef;
											} else if (sUseShoppingpayPg === 'T'
													&& sOwnMallLanding === 'T') {
												var sSeparator = (sUrl
														.includes('?')) ? '&'
														: '?';
												sUrl += sSeparator
														+ 'co_servicetype=shoppingpay';
											}
										}
										return sUrl;
									}
									CAFE24.attachChRef = function(sUrl) {
										if (sUrl) {
											var sChRef = CAFE24.getChRefData();
											if (sChRef) {
												var sSeparator = (sUrl
														.includes('?')) ? '&'
														: '?';
												sUrl += sSeparator + 'ch_ref='
														+ sChRef;
											}
										}
										return sUrl;
									};
									CAFE24.MOBILE_WEB = false;
									var mobileWeb = CAFE24.MOBILE_WEB;
									try {
										var isUseLoginKeepingSubmit = false;
										// isSeqNoKeyExpiretime
										function isSeqNoKeyExpiretime(
												iExpiretime) {
											var sDate = new Date();
											var iNow = Math.floor(sDate
													.getTime() / 1000);
											// 유효시간 확인
											if (iExpiretime > iNow) {
												return false;
											}
											return true;
										}
										function isUseLoginKeeping() {
											// 디바이스 확인
											if (EC_MOBILE_DEVICE === false) {
												return;
											}
											// 로그인 여부
											var isLogin = document.cookie
													.match(/(?:^| |;)iscache=F/) ? true
													: false
											if (isLogin) {
												return;
											}
											var sLoginKeepingInfo = localStorage
													.getItem('use_login_keeping_info');
											var iSeqnoExpiretime;
											var iSeqNoKey;
											if (sLoginKeepingInfo == null) {
												iSeqnoExpiretime = localStorage
														.getItem('seq_no_key_expiretime');
												iSeqNoKey = localStorage
														.getItem('seq_no_key');
												// 유효시간, key 값 확인
												if (iSeqnoExpiretime === null
														|| iSeqNoKey === null) {
													return;
												}
											} else {
												var oLoginKeepingInfo = JSON
														.parse(sLoginKeepingInfo);
												iSeqNoKey = oLoginKeepingInfo.seq_no_key;
												iSeqnoExpiretime = oLoginKeepingInfo.seq_no_key_expiretime;
												if (isNaN(iSeqNoKey) === true
														|| isNaN(iSeqnoExpiretime) === true) {
													return;
												}
											}
											if (isSeqNoKeyExpiretime(iSeqnoExpiretime) === false) {
												return;
											}
											useLoginKeepingSubmit();
										}
										function findGetParamValue(paramKey) {
											var result = null, tmp = [];
											location.search
													.substr(1)
													.split('&')
													.forEach(
															function(item) {
																tmp = item
																		.split('=');
																if (tmp[0] === paramKey)
																	result = decodeURIComponent(tmp[1]);
															});
											return result;
										}
										function useLoginKeepingSubmit() {
											var iSeqnoExpiretime;
											var iSeqNoKey;
											var sUseLoginKeepingIp;
											var sLoginKeepingInfo = localStorage
													.getItem('use_login_keeping_info');
											if (sLoginKeepingInfo == null) {
												iSeqnoExpiretime = localStorage
														.getItem('seq_no_key_expiretime');
												iSeqNoKey = localStorage
														.getItem('seq_no_key');
											} else {
												var oLoginKeepingInfo = JSON
														.parse(sLoginKeepingInfo);
												iSeqNoKey = oLoginKeepingInfo.seq_no_key;
												iSeqnoExpiretime = oLoginKeepingInfo.seq_no_key_expiretime;
												sUseLoginKeepingIp = oLoginKeepingInfo.use_login_keeping_ip;
											}
											var oForm = document
													.createElement('form');
											oForm.method = 'post';
											oForm.action = '/exec/front/member/LoginKeeping';
											document.body.appendChild(oForm);
											var oSeqNoObj = document
													.createElement('input');
											oSeqNoObj.name = 'seq_no_key';
											oSeqNoObj.type = 'hidden';
											oSeqNoObj.value = iSeqNoKey;
											oForm.appendChild(oSeqNoObj);
											oSeqNoObj = document
													.createElement('input');
											oSeqNoObj.name = 'seq_no_key_expiretime';
											oSeqNoObj.type = 'hidden';
											oSeqNoObj.value = iSeqnoExpiretime;
											oForm.appendChild(oSeqNoObj);
											var returnUrl = findGetParamValue('returnUrl');
											if (returnUrl == ''
													|| returnUrl == null) {
												returnUrl = location.pathname
														+ location.search;
											}
											oSeqNoObj = document
													.createElement('input');
											oSeqNoObj.name = 'returnUrl';
											oSeqNoObj.type = 'hidden';
											oSeqNoObj.value = returnUrl;
											oForm.appendChild(oSeqNoObj);
											if (sUseLoginKeepingIp != undefined) {
												oSeqNoObj = document
														.createElement('input');
												oSeqNoObj.name = 'use_login_keeping_ip';
												oSeqNoObj.type = 'hidden';
												oSeqNoObj.value = sUseLoginKeepingIp;
												oForm.appendChild(oSeqNoObj);
											}
											oForm.submit();
											isUseLoginKeepingSubmit = true;
										}
										isUseLoginKeeping();
									} catch (e) {
									}
									sErrorMessage = '';
									var aLogData = {
										"log_server1" : "eclog2-260.cafe24.com",
										"log_server2" : "elg-db-svcm-267.cafe24.com",
										"mid" : "lifelab0301",
										"stype" : "e",
										"domain" : "",
										"shop_no" : 1,
										"lang" : "ko_KR",
										"ver" : 2,
										"hash" : "1adfaf580012a0ea6878641b22827061",
										"ca" : "cfa-js.cafe24.com\/cfa.js",
										"etc" : "",
										"mobile_flag" : "F"
									};
									var sMileageName = '적립금';
									var sMileageUnit = '[:PRICE:]원';
									var sDepositName = '예치금';
									var sDepositUnit = '원';
									CAFE24.SHOP_CURRENCY_INFO = {
										"1" : {
											"aShopCurrencyInfo" : {
												"currency_code" : "KRW",
												"currency_no" : "410",
												"currency_symbol" : "\uffe6",
												"currency_name" : "South Korean won",
												"currency_desc" : "\uffe6 \uc6d0 (\ud55c\uad6d)",
												"decimal_place" : 0,
												"round_method_type" : "F"
											},
											"aShopSubCurrencyInfo" : null,
											"aBaseCurrencyInfo" : {
												"currency_code" : "KRW",
												"currency_no" : "410",
												"currency_symbol" : "\uffe6",
												"currency_name" : "South Korean won",
												"currency_desc" : "\uffe6 \uc6d0 (\ud55c\uad6d)",
												"decimal_place" : 0,
												"round_method_type" : "F"
											},
											"fExchangeRate" : 1,
											"fExchangeSubRate" : null,
											"aFrontCurrencyFormat" : {
												"head" : "",
												"tail" : "\uc6d0"
											},
											"aFrontSubCurrencyFormat" : {
												"head" : "",
												"tail" : ""
											}
										}
									};
									var SHOP_CURRENCY_INFO = CAFE24.SHOP_CURRENCY_INFO;
									var EC_ASYNC_LIVELINKON_ID = '';
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

									<!-- 증명서류 발급 -->
									<div class="agree">
										<table border="1" summary="">
											<caption>증명서류 발급</caption>
											<tbody class="receipt">
												<tr id="cashreceipt_display_area" class=""
													style="display: none;">
													<th scope="row">현금영수증 신청</th>
													<td>
														<div class="methods">
															<input id="cashreceipt_regist0" name="cashreceipt_regist"
																fw-filter="" fw-label="현금영수증 신청 여부" fw-msg="" value="1"
																type="radio" autocomplete="off"><label
																for="cashreceipt_regist0">현금영수증 신청</label> <input
																id="cashreceipt_regist1" name="cashreceipt_regist"
																fw-filter="" fw-label="현금영수증 신청 여부" fw-msg="" value="99"
																type="radio" checked="checked" autocomplete="off"><label
																for="cashreceipt_regist1">신청안함</label>
														</div>
														<div id="cashreceipt_form_area" class="ec-base-table cash">
															<table border="1" summary="">
																<caption>현금영수증 발급 정보 입력</caption>
																<colgroup>
																	<col style="width: 129px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">구분</th>
																		<td><input id="cashreceipt_user_type2__0"
																			name="cashreceipt_user_type2" fw-filter=""
																			fw-label="현금영수증 신청자 종류-신청여부라디오버튼과 함께" fw-msg=""
																			value="0" type="radio" autocomplete="off"><label
																			for="cashreceipt_user_type2__0">개인</label> <input
																			id="cashreceipt_user_type2__1"
																			name="cashreceipt_user_type2" fw-filter=""
																			fw-label="현금영수증 신청자 종류-신청여부라디오버튼과 함께" fw-msg=""
																			value="1" type="radio" autocomplete="off"><label
																			for="cashreceipt_user_type2__1">사업자</label></td>
																	</tr>
																	<tr class="mobile" id="cashreceipt_mobile_display_area">
																		<th scope="row">핸드폰 번호</th>
																		<td><select id="cashreceipt_user_mobile1"
																			name="cashreceipt_user_mobile[]" fw-filter=""
																			fw-label="현금영수증 개인-핸드폰 번호" fw-alone="N" fw-msg="">
																				<option value="010">010</option>
																				<option value="011">011</option>
																				<option value="016">016</option>
																				<option value="017">017</option>
																				<option value="018">018</option>
																				<option value="019">019</option>
																		</select>-<input id="cashreceipt_user_mobile2"
																			name="cashreceipt_user_mobile[]" maxlength="4"
																			fw-filter="" fw-label="현금영수증 개인-핸드폰 번호" fw-alone="N"
																			fw-msg="" placeholder="" value="" type="text">-<input
																			id="cashreceipt_user_mobile3"
																			name="cashreceipt_user_mobile[]" maxlength="4"
																			fw-filter="" fw-label="현금영수증 개인-핸드폰 번호" fw-alone="N"
																			fw-msg="" placeholder="" value="" type="text"></td>
																	</tr>
																	<tr class="regno" id="cashreceipt_regno_display_area">
																		<th scope="row">사업자 번호</th>
																		<td><input id="cashreceipt_reg_no"
																			name="cashreceipt_reg_no" fw-filter=""
																			fw-label="현금영수증 사업자 번호" fw-msg="" placeholder="사업자번호"
																			value="" type="text"></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
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
										<a href="#none" id="btn_payment" class="btnSubmit sizeL">결제하기</a>
									</div>
									<div class="mileage "></div>
								</div>
							</div>

							<!-- 모달을 열기 위한 버튼 -->
							<button id="openModalBtn">모달 열기</button>
							<!-- 모달 창 -->
							<div id="myModal" class="modal">
								<div class="modal-content">
									<span class="close">&times;</span>
									<!-- 모달 닫기 버튼 -->
									<p>카드 결제하기</p>
								</div>
							</div>
							<!-- 안심번호 팝업 레이어 -->
							<div id="safe_phone_popup_layer"></div>
							<div id="ec-shop_orderConfirmLayer" class="orderConfirmLayer">
							</div>
							<!-- 결제진행바 -->
							<iframe id="h_payment" name="h_payment" width="0" height="0"
								frameborder="0" src=""></iframe>
							<!-- // 결제진행바 -->
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