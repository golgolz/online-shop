<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<link href="../assets/css/goods/detail.css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		setTotalInfo(1);
		$("#quantity_up").on('click', function(){
			var quantity = parseInt($("#quantity").val());
			quantity += 1;
			setTotalInfo(quantity);
		});
		
		$("#quantity_down").click(function(){
			var quantity = parseInt($("#quantity").val());
			quantity -= 1;
			
			if(quantity == 0){
				alert("최소 주문 수량은 1개 입니다.");
				return;
			}
			setTotalInfo(quantity);
		});
		
		/* prdDetail, prdReview */
		$("#info_tab").click(function(){
			$("#prdReview").css("display", "none");
			$("#prdDetail").css("display", "block");
			$("#tab02").removeClass("tab_open");
			$("#tab01").addClass("tab_open");
		});

		$("#review_tab").click(function(){
			$("#prdDetail").css("display", "none");
			$("#prdReview").css("display", "block");
			$("#tab01").removeClass("tab_open");
			$("#tab02").addClass("tab_open");
		});
	});
	
	function setTotalInfo(quantity){
		$("#quantity").val(quantity);
		$("#total_quantity").html("(" + quantity + "개)");
		$("#total_price").html((quantity * 3000) + "원");
	}
</script>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="container">
			<div id="contents">
				<div
					class="xans-element- xans-product xans-product-headcategory path">
					<span>현재 위치</span>
					<ol>
						<li><a href="http://localhost/online-shop/index.jsp">홈</a></li>
						<li class=""><a
							href="http://localhost/online-shop/goods/best.jsp">BEST</a></li>
					</ol>
				</div>
				<div class="xans-element- xans-product xans-product-detail">
					<div class="detailArea">
						<div class="xans-element- xans-product xans-product-image imgArea">
							<div class="keyImg">
								<div class="thumbnail">
									<a
										href="https://insideobject.com/product/image_zoom2.html?product_no=6027&amp;cate_no=428&amp;display_group=1"
										alt="P0000IXV"
										onclick="window.open(this.href, &#39;image_zoom2&#39;, &#39;toolbar=no,scrollbars=auto,resizable=yes,width=450,height=693,left=0,top=0&#39;, this);return false;">
										<img
										src="http://localhost/online-shop/assets/images/goods/${param.goods}.png"
										alt="[오브젝트] 오브젝트 2023 로고키링" class="BigImage" />
									</a>
									<div id="zoom_wrap"></div>
								</div>
							</div>
							<div class="cboth"></div>
							<div class="color displaynone"></div>
						</div>
						<div class="tab_cate">
							<div id="tab_cate_title" class="up">옵션선택</div>
							<div class="infoArea" style="">
								<div class="headingArea">
									<div class="icon"></div>
									<h2>[오브젝트] 오브젝트 2023 로고키링</h2>
								</div>
								<div
									class="xans-element- xans-product xans-product-detaildesign">
									<!--
                    출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
                    count = 10
                -->
									<table border="3" summary="">
										<caption>기본 정보</caption>
										<tbody>
											<tr rel="상품명" class="xans-record-">
												<th scope="row"><span
													style="font-size: 16px; color: #555555">상품명</span></th>
												<td><span style="font-size: 16px; color: #555555">[오브젝트]
														오브젝트 2023 로고키링</span></td>
											</tr>
											<tr rel="판매가" class="xans-record-">
												<th scope="row"><span
													style="font-size: 11px; color: #333333">판매가</span></th>
												<td><span style="font-size: 11px; color: #333333"><strong
														id="span_product_price_text">6,500원</strong><input
														id="product_price" name="product_price" value=""
														type="hidden" /></span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<table border="1" summary=""
									class="xans-element- xans-product xans-product-option xans-record-">
									<caption>상품 옵션</caption>
									<tbody></tbody>
									<tbody>
										<tr class="displaynone" id="">
											<td colspan="2" class="selectButton"><a
												href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"
												class="btnSubmit sizeS" onclick="">옵션선택</a></td>
										</tr>
									</tbody>
								</table>
								<div class="guideArea">
									<p class="info">(최소주문수량 1개 이상)</p>
								</div>

								<div id="totalProducts" class="">
									<p class="ec-base-help txtWarn txt11 displaynone">수량을
										선택해주세요.</p>
									<p class="ec-base-help txtWarn txt11">수량을 선택해주세요.</p>
									<table border="1" summary="" style="border-top: 1px solid #9a9ba0;">
										<caption>상품 목록</caption>
										<colgroup>
											<col style="width: 284px" />
											<col style="width: 80px" />
											<col style="width: 110px" />
										</colgroup>
										<thead>
											<tr class="displaynone">
												<th scope="col">상품명</th>
												<th scope="col">상품수</th>
												<th scope="col">가격</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>[오브젝트] 오브젝트 2023 로고키링</td>
												<td><span class="quantity">
														<input id="quantity" name="quantity_name" style="" value="1" type="text">
														<img
															src="http://localhost/online-shop/assets/images/goods/btn_count_up.gif"
															class="QuantityUp up" id="quantity_up"/>
														<img
															src="http://localhost/online-shop/assets/images/goods/btn_count_down.gif"
															class="QuantityDown down" id="quantity_down"/>
												</span></td>
												<td class="right"><span class="quantity_price">6500</span>
													<span class="mileage displaynone">(<img
														src="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/" />
														&nbsp;<span class="mileage_price"></span>)
												</span></td>
											</tr>
										</tbody>
										<!-- 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
										<tbody>
											<!-- tr>
                            <td>
                                <p class="product">
                                    $상품명<br />
                                    <span>$옵션</span>
                                </p>
                            </td>
                            <td>
                                <span class="quantity">
                                    <input type="text" class="quantity_opt" />
                                    &nbsp;<a href="#none"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" class="up" /></a>
                                    <a href="#none"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" class="down" /></a>
                                </span>
                                <a href="#none"><img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
                            </td>
                            <td class="right">
                                <span>$가격</span>
                                <span class="mileage">(<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/product/ico_pay_point.gif" /> &nbsp;<span class="mileage_price">$적립금</span>)</span>
                            </td>
                        </tr -->
										</tbody>
										<!-- // 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
									</table>
								</div>
								<div id="totalPrice" class="totalPrice">
									<strong>총 상품금액</strong>
									(수량) : <span class="total">
									<strong><em id="total_price">0원</em></strong>
										<span id="total_quantity">(0개)</span></span>
								</div>
								<div class="xans-element- xans-product xans-product-action">
									<div class="ec-base-button">
										<a
											href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"
											class="sub_cart"
											onclick="product_submit(2, &#39;/exec/front/order/basket/&#39;, this)">장바구니</a>
										<a
											href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"
											onclick="add_wishlist(this, true);" class="sub_wish">관심상품</a>
										<a
											href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"
											class="first sub_buy"
											onclick="product_submit(1, &#39;/exec/front/order/basket/&#39;, this)"><span
											id="btnBuy">구매하기</span></a>
									</div>
								</div>
							</div>
						</div>
						<!-- //tab_cate -->
					</div>
				</div>
				<div class="xans-element- xans-product xans-product-additional">
					<ul class="cboth title_detail">
						<li class="tab_open" id="tab01">
							<a id="info_tab"
							href="#none">상품상세정보</a>
						</li>
						<li id="tab02">
							<a id="review_tab"
							href="#none">리뷰</a>
						</li>
					</ul>
					<!-- 상품 상세 이미지 시작-->
					<div id="prdDetail" class="tab_box01">
						<div class="cont">
							<p>
								<img
									src="http://localhost/online-shop/assets/images/goods/${param.goods}_description.png"
									style="display: block; vertical-align: top; margin: 0px auto; text-align: center;"
									name="APPLE_IPHONE14_1_description.png" />
							</p>
						</div>
						<!-- //product_relation -->
					</div>
					<!-- 리뷰 시작 -->
					<div id="prdReview" class="tab_box02" style="display: none">
						<div class="board">
							<div class="xans-element- xans-product xans-product-review">
								<div class="ec-base-table typeList">
									<table border="1" summary="" class="">
										<caption>상품사용후기</caption>
										<colgroup>
											<col style="width: 70px" />
											<col style="width: auto" />
											<col style="width: 100px" />
											<col style="width: 100px" />
											<col style="width: 80px" />
											<col style="width: 80px" class="displaynone" />
										</colgroup>
										<thead>
											<tr class="center">
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">작성일</th>
												<th scope="col">조회</th>
												<th scope="col" class="displaynone">평점</th>
											</tr>
										</thead>
										<tbody class="center">
											<tr class="xans-record-">
												<td>1</td>
												<td class="subject left txtBreak"><a
													href="https://insideobject.com/article/review/4/26462/?no=26462&amp;board_no=4&amp;spread_flag=T">귀여워요</a>
													<span class="txtWarn"></span></td>
												<td>네****</td>
												<td class="txtInfo txt11">2023-06-05</td>
												<td class="txtInfo txt11">67</td>
												<td class="displaynone"><img
													src="./user_goods_detail_files/ico_point5.gif" alt="5점" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<p class="ec-base-button typeBorder">
								<span class="gRight"> <a
									href="https://insideobject.com/board/product/write.html?board_no=4&amp;product_no=6027&amp;cate_no=428&amp;display_group=1">상품후기쓰기</a>
									<a
									href="https://insideobject.com/board/product/list.html?board_no=4">모두
										보기</a>
								</span>
							</p>

							<div
								class="xans-element- xans-product xans-product-reviewpaging ec-base-paginate">
								<a
									href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"
									class="first"><img
									src="http://localhost/online-shop/assets/images/goods/btn_page_first.gif" alt="첫 페이지" /></a>
								<a
									href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"><img
									src="http://localhost/online-shop/assets/images/goods/btn_page_prev.gif" alt="이전 페이지" /></a>
								<ol>
									<li class="xans-record-"><a
										href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/?page_4=1#use_review"
										class="this">1</a></li>
								</ol>
								<a
									href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"><img
									src="http://localhost/online-shop/assets/images/goods/btn_page_next.gif" alt="다음 페이지" /></a>
								<a
									href="https://insideobject.com/product/%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8-2023-%EB%A1%9C%EA%B3%A0%ED%82%A4%EB%A7%81/6027/category/428/display/1/#none"
									class="last"><img
									src="http://localhost/online-shop/assets/images/goods/btn_page_last.gif" alt="마지막 페이지" /></a>
							</div>
						</div>
					</div>
					<div id="prdQnA" class="tab_box03" style="display: none">
						<div class="board">
							<p class="nodata">게시물이 없습니다</p>
							<p class="ec-base-button typeBorder">
								<span class="gRight"> <a
									href="https://insideobject.com/board/product/write.html?board_no=6&amp;product_no=6027&amp;cate_no=428&amp;display_group=1">상품문의하기</a>
									<a
									href="https://insideobject.com/board/product/list.html?board_no=6">모두
										보기</a>
								</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>