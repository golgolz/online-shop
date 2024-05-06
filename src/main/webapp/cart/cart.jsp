<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<style>
.btnSubmit, .btnNormal {
	margin: 3px;
}

table, td {
	text-align: center; 
}
</style>
<script>
	$(function() {
	})//ready
	
	function addQuantity(inputId,price) {
		var input = document.getElementById(inputId);
		/* var productPrice = document.getElementById(price).innerHTML; */
		var productPrice = document.getElementById(price).textContent.trim(); // "20,000원"
		productPrice = productPrice.replace(/[^0-9]/g, ''); // "20000"
				
		if(parseInt(input.value) < 99) {
			var curval = parseInt(input.value);
			var newValue = curval+1;
			input.value = newValue;
			
			var sum = parseInt(productPrice) * newValue;
			document.getElementById('sum_price_front0').innerHTML = formatNumber(sum);
		}
	}
	
	function decQuantity(inputId,price) {
		var input = document.getElementById(inputId);
		var productPrice = document.getElementById(price).textContent.trim();
		productPrice = productPrice.replace(/[^0-9]/g, '');
		
		if(parseInt(input.value) > 1){
			var subval = parseInt(input.value);
			var newValue = subval-1;
			input.value = newValue;
			
			var sub = parseInt(productPrice) * newValue;
			document.getElementById("sum_price_front0").innerHTML = formatNumber(sub);
		}
	}
	
	function formatNumber(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
</script>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	<!-- wrap start -->
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div id="container">
				<div id="contents">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li title="현재 위치"><strong>장바구니</strong></li>
						</ol>
					</div>

					<div class="titleArea">
						<h2>장바구니</h2>
					</div>

					<div class="xans-element- xans-order xans-order-basketpackage ">
						<p class="orderStep">
							<img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/order/img_order_step1.gif"
								alt="01 장바구니">
						</p>

						<div
							class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight ">
							<ul class="menu">
								<li class="selected "><a href="/order/basket.html">배송상품
										(1)</a></li>
								<li class=" "></li>
							</ul>
							<p class="right displaynone">장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
						</div>
						<div class="orderListArea ec-base-table typeList gBorder">
							<div class="xans-element- xans-order xans-order-normtitle title ">
								<h6>장바구니 상품 (1)</h6>
							</div>

							<table border="1" summary=""
								class="xans-element- xans-order xans-order-normnormal xans-record-">
								<caption>배송상품</caption>
								<colgroup>
									<col style="width: 27px">
									<col style="width: 92px">
									<col style="width: auto">
									<col style="width: 98px">
									<col style="width: 75px">
									<col style="width: 85px">
									<col style="width: 98px">
									<col style="width: 110px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox"
											onclick="Basket.setCheckBasketList('basket_product_normal_type_normal', this);"></th>
										<th scope="col">이미지</th>
										<th scope="col">상품정보</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">배송비</th>
										<th scope="col">합계</th>
										<th scope="col">선택</th>
									</tr>
								</thead>
								<tfoot class="right">
									<tr>

									</tr>
								</tfoot>
								<tbody class="xans-element- xans-order xans-order-list center">
									<tr class="xans-record-">
										<td><input type="checkbox" id="basket_chk_id_0"
											name="basket_product_normal_type_normal"></td>
										<td class="thumb gClearLine"><a
											href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
												src="http://localhost/online-shop/assets/images/goods/APPLE_IPHONE15_6.png"
												onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
												alt="APPLE_IPHONE15_6"
												width="100px"></a></td>
										<td class="left gClearLine"><strong class="name"><a
												href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
												class="ec-product-name">APPLE_IPHONE15_6</a></strong> <span class="displaynone engName">(영문명
												: )</span>
											<ul
												class="xans-element- xans-order xans-order-optionall option">
												<li class="xans-record-"><strong class="displaynone">[APPLE_IPHONE15_6]</strong>[옵션: APPLE_IPHONE15] <span
													class="displaynone">(1개)</span><br> <span class=""><a
														href="#none"
														onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))"
														class="btnNormal gBlank5 displaynone">옵션변경</a></span></li>
											</ul></td>
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
										<td><span class=""> <span class="ec-base-qty"><input
													id="quantity_id_0" name="quantity_name_0" size="2"
													value="1" type="text"><a href="javascript:;"
													onclick="addQuantity('quantity_id_0','product_price_div0');"><img
														src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
														alt="수량증가" class="up"></a><a href="javascript:;"
													onclick="decQuantity('quantity_id_0','product_price_div0');"><img
														src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
														alt="수량감소" class="down"></a></span> <a href="javascript:;"
												class="btnNormal gBlank5" onclick="Basket.modifyQuantity()">변경</a>
										</span> <span class="displaynone">1</span></td>


										<td rowspan="1" class="">
											<p class="">
												3,000원<span class="displaynone"><br></span><br>
											</p>
										</td>
										<td class="right"><strong><span
												id="sum_price_front0">20,000</span>원</strong>
											<div class="displaynone"></div></td>
										<td class="button">
											<!--임시 주석처리 : 주문서 작성 페이지 이동--> <!--<a href="javascript:;" class="btnSubmit" onclick="Basket.orderBasketItem(0);">주문하기</a>-->
											<a href="http://localhost/online-shop/order/order_form.jsp"
											class="btnSubmit">주문하기</a> <a href="javascript:;"
											class="btnNormal" onclick="Basket.deleteBasketItem(0);"><i
												class="icoDelete"></i> 삭제</a>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="orderListArea ec-base-table typeList gBorder"></div>
						<div
							class="xans-element- xans-order xans-order-basketpriceinfoguide  ">

							<p class="info displaynone">추가증정 이벤트 상품의 옵션 및 수량 변경은 상품상세에서
								가능합니다.</p>
						</div>
						<div
							class="xans-element- xans-order xans-order-selectorder ec-base-button ">
							<span class="gLeft"> <strong class="text">선택상품을</strong> <a
								href="#none" class="btnEm" onclick="Basket.deleteBasket()"><i
									class="icoDelete"></i> 삭제하기</a>



							</span> <span class="gRight"> <a href="#none" class="btnNormal"
								onclick="Basket.emptyBasket()">장바구니비우기</a>

							</span>
						</div>
						
						<div
							class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
							<a href="#none" onclick="Basket.orderAll(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html" class="btnSubmitFix sizeM  ">전체상품주문</a>
							<a href="#none" onclick="Basket.orderSelectBasket(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html" class="btnEmFix sizeM ">선택상품주문</a><span
								class="gRight"> <a
								href="http://localhost/user_src/index_user.html"
								class="btnNormalFix sizeM">쇼핑계속하기</a>
							</span>
							<!-- 네이버 체크아웃 구매 버튼  -->
							<div id="NaverChk_Button"></div>
						</div>
					</div>

					<div
						class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList displaynone xans-record-">
						<!--
        $login_page = /member/login.html
        $count = 5
        $mode = basket
    -->
						<div class="title">
							<h3>관심상품</h3>
						</div>
						<table border="1" summary="">
							<caption>관심상품 목록</caption>
							<colgroup>
								<col style="width: 92px">
								<col style="width: auto">
								<col style="width: 105px">
								<col style="width: 100px">
								<col style="width: 100px">
								<col style="width: 85px">
								<col style="width: 105px">
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">판매가</th>
									<th scope="col" class="mileage">적립금</th>
									<th scope="col">배송구분</th>
									<th scope="col">배송비</th>
									<th scope="col">합계</th>
									<th scope="col">선택</th>
								</tr>
							</thead>
						</table>
						<p class="message ">관심상품 내역이 없습니다.</p>
					</div>

					<div id="ec-basketOptionModifyLayer"
						class="optionModify ec-base-layer" style="display: none;">
						<div class="header">
							<h3>옵션변경</h3>
						</div>
						<div class="content">
							<ul class="prdInfo">
								<li class="ec-basketOptionModifyLayer-productName">{$product_name}</li>
								<li class="ec-basketOptionModifyLayer-optionStr">{$layer_option_str}</li>
							</ul>
							<div class="prdModify">
								<h4>상품옵션</h4>
								<ul>
									<li class="ec-basketOptionModifyLayer-options"
										style="display: none;"><span>{$option_name}</span>
										{$form.option_value}</li>
									<li class="ec-basketOptionModifyLayer-addOptions"
										style="display: none;"><span>{$option_name}</span>
										{$form.option_value}</li>
								</ul>
							</div>
						</div>
						<div class="ec-base-button">
							<a href="#none"
								class="btnSubmitFix sizeS ec-basketOptionModifyLayer-add">추가</a>
							<a href="#none"
								class="btnNormalFix sizeS ec-basketOptionModifyLayer-modify">변경</a>
						</div>
						<a href="#none" class="close"
							onclick="$('#ec-basketOptionModifyLayer').hide();"><img
							src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif"
							alt="닫기"></a>
					</div>
				</div>
			</div>
			<hr class="layout">
			<div id="banner"></div>
			<div id="quick"></div>
		</div>
	</div>
	<!-- wrap end -->
	<!-- golgolz end -->
</body>
</html>