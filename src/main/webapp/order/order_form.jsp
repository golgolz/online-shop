<%@page import="order.vo.DeliveryVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.order.CartDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="order.vo.OrderProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<!-- 로그인 확인 -->
<%
String userId = (String)session.getAttribute("userId");


if (userId == null) {
    //System.out.println("로그인이 필요합니다. ");
%>
<script>
        alert('로그인이 필요합니다.');
        window.location.href = 'http://localhost/user/login/userLogin.jsp'; // 경로 수정 필요

</script>
<%
    return;
}
%>
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
<jsp:useBean id="opVO" class="order.vo.OrderProductVO" scope="page" />
<jsp:setProperty property="*" name="opVO" />
<%
	
    String isCart = (request.getParameter("isCart") == null ? "-1" : request.getParameter("isCart"));
	System.out.println(isCart);
	CartDAO cDAO = CartDAO.getInstance();
    List<OrderProductVO> list = (List<OrderProductVO>)session.getAttribute("data");
    
	int result = 0;
	
   
    // 장바구니가 아닌 상품 상세 페이지에서 바로 주문서 작성 페이지로 넘어오는 경우
    if(isCart.equals("0")){
        String code = (String)request.getParameter("code");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        session.setAttribute("code", code);
        session.setAttribute("quantity", quantity);
        opVO.setCode(code);
        try {
            opVO = cDAO.selectProductInfo(code);
	        opVO.setQuantity(quantity);
	        result = opVO.getPrice()*quantity+opVO.getDelivertyFee();
	        opVO.setTotal(result);
            
        }catch(SQLException se){
            se.printStackTrace();
        }
    }//end if
    
    // 장바구니에서 넘어온 주문
    if(isCart.equals("1")){
	    for(int i=0; i<list.size(); i++){
	        opVO = list.get(i);
	        result += opVO.getTotal();
	    }
    }//end if
    
    String name = "";
    String zipcode="";
    String defaultAddr="";
    String detailAddr="";
    String tel="";
    String middleTel="";
    String lastTel="";
    
    try {
    
        DeliveryVO dVO = cDAO.selectDefaultDelivery(userId);
        session.setAttribute("dVO", dVO);
        name=dVO.getRecipient();
        zipcode=dVO.getZipcode();
        defaultAddr=dVO.getDefaultAddr();
        detailAddr=dVO.getDetailAddr();
        tel=dVO.getTel();
        middleTel= tel.substring(tel.indexOf("-")+1,tel.lastIndexOf("-"));
        lastTel = tel.substring(tel.lastIndexOf("-")+1);
    
    }catch(SQLException se){
        se.printStackTrace();
    }
%>

<script>
	$(function() {
		$("#sameaddr0").change(function() {
	        if ($(this).prop("checked")) {
	            // 기본 배송지가 체크되었을 때 실행할 코드
	            $("#rname").val("<%= name %>");
	            $("#sample4_postcode").val("<%= zipcode %>");
	            $("#sample4_roadAddress").val("<%= defaultAddr %>");
	            $("#raddr2").val("<%= detailAddr %>");
	            $("#rphone2_2").val("<%= middleTel %>");
	            $("#rphone2_3").val("<%= lastTel %>");
	        }//end if
	    });//change
	    $("#sameaddr1").change(function(){
	    	if($(this).prop("checked")) {
	    		//새로운 배송지가 체크되었을 때 실행할 코드
	    		$("#rname").val("");
	            $("#sample4_postcode").val("");
	            $("#sample4_roadAddress").val("");
	            $("#raddr2").val("");
	            $("#rphone2_2").val("");
	            $("#rphone2_3").val("");
	    	}//end if
	    });//change
	});//ready
	
	function chkNull(){
		var flag = false;
		if($("#rname").val().trim() == ""){
			alert("배송 정보를 확인해주세요.");
			return flag;
		}
		if($("#sample4_postcode").val()==""){
			alert("배송 정보를 확인해주세요.");
			return flag;
		}
		if($("#sample4_roadAddress").val()==""){
			alert("배송 정보를 확인해주세요.");
			return flag;
		}
		if($("#rphone2_2").val()==""){
			alert("배송 정보를 확인해주세요.");
			return flag;
		}
		if($("#rphone2_3").val()==""){
			alert("배송 정보를 확인해주세요.");
			return flag;
		}
		flag = true;
		return flag;
	}//chkNull
	
	
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                var temp = '';

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
            }
        }).open();
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
												<th scope="col"></th>
												<th scope="col">이미지</th>
												<th scope="col">상품정보</th>
												<th scope="col">판매가</th>
												<th scope="col">수량</th>

												<th scope="col">배송비</th>
												<th scope="col">합계</th>
											</tr>
										</thead>
										<tbody
											class="xans-element- xans-order xans-order-normallist center">
											<form action="payment_process.jsp" name="productFrm" id="productFrm" method="post">
										<% if(isCart.equals("1")){
											for(OrderProductVO oVO : list){ %>
											<tr class="xans-record-">
												<td class=""></td>
												<td class="thumb gClearLine"><a
													href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
														src="http://localhost/assets/images/goods/<%= oVO.getProductImg() %>"
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
														width="100px"></a></td>
												<td class="left gClearLine"><strong class="name"><a
														href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
														class="ec-product-name"><%= oVO.getProductName() %></a></strong>
													<div class="option ">[옵션: <%= oVO.getCode() %>]</div>
													</td>
												<td class="right">
													<div id="product_price_div0" class="">
														<strong><%= oVO.getPrice() %>원</strong>
													</div>
													<div id="product_sale_price_div0" class="displaynone">
														<strong><span id="product_sale_price_front0"><%= oVO.getPrice() %></span>원</strong>
													</div>
												</td>
												<td><%= oVO.getQuantity() %></td>
												<td rowspan="1" class=""><%= oVO.getDelivertyFee() %>원</td>
												
												<td class="right"><strong><span
														id="product_total_price_front0"><%= oVO.getTotal() %></span>원</strong></td>
											</tr>
										<% }//end for
										}else { %>
											<tr class="xans-record-">
												<td class=""></td>
												<td class="thumb gClearLine"><a
													href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
														src="http://localhost/assets/images/goods/<%= opVO.getProductImg() %>"
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
														width="100px"></a><input type="hidden" id="productImg" name="productImg" value="<%= opVO.getProductImg() %>" /></td>
												<td class="left gClearLine"><strong class="name"><%= opVO.getProductName() %></strong>
													<div class="option ">[옵션: <%= opVO.getCode() %>]</div>
													<input type="hidden" id="productName" name="productName" value="<%= opVO.getProductName() %>" />
													<input type="hidden" id="code" name="code" value="<%= opVO.getCode() %>" /></td>
												<td class="right">
													<div id="product_price_div0" class="">
														<strong><%= opVO.getPrice() %>원</strong>
														<input type="hidden" id="price" name="price" value="<%= opVO.getPrice() %>" />
													</div>
													<div id="product_sale_price_div0" class="displaynone">
														<strong><span id="product_sale_price_front0"><%= opVO.getPrice() %></span>원</strong>
														<p class="displaynone"></p>
													</div>
												</td>
												<td><%= opVO.getQuantity() %>
												<input type="hidden" id="quantity" name="quantity" value="<%= opVO.getQuantity() %>" /></td>
												<td rowspan="1" class=""><%= opVO.getDelivertyFee() %>원
												<input type="hidden" id="deliveryFee" name="deliveryFee" value="<%= opVO.getDelivertyFee() %>" /></td>
												
												<td class="right"><strong><span
														id="product_total_price_front0"><%= opVO.getTotal() %></span>원</strong>
														<input type="hidden" id="total" name="total" value="<%= opVO.getTotal() %>" /></td>
											</tr>
											<% }//end else %>
											</form>
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
								 <span class="gRight"> <a
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
										<form id="deliveryFrm" name="deliveryFrm" action="payment_process.jsp" method="post">
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
															배송지</label>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">받으시는 분 <img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
													alt="필수"></th>
												<td><input id="rname" name="recipient" fw-filter="isFill"
													fw-label="수취자 성명" fw-msg="" class="inputTypeText"
													placeholder="" size="15" value="" type="text"></td>
											</tr>
											<tr>
												<th scope="row">주소 <img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
													alt="필수"></th>
												<td>
												<input id="sample4_postcode" name="zipcode" fw-filter="isFill" fw-label="수취자 우편번호1" fw-msg="" 
													class="inputTypeText" placeholder="" size="6" maxlength="6"
													readonly="1" value="" type="text"> <a href="#javaScript:;"
													id="btn_search_rzipcode" class="btnNormal" onclick="sample4_execDaumPostcode()">우편번호</a><br>
													
													<input id="sample4_roadAddress" name="defaultAddr" fw-filter="isFill"
													fw-label="수취자 주소1" fw-msg="" class="inputTypeText"
													placeholder="" size="60" readonly="1" value="" type="text">
													<span class="grid">기본주소</span><br> <input id="raddr2"
													name="detailAddr" fw-filter="" fw-label="수취자 주소2" fw-msg=""
													class="inputTypeText" placeholder="" size="60" value=""
													type="text"> <span class="grid">나머지주소</span><span
													class="grid ">(선택입력가능)</span></td>
											</tr>
											<tr class="">
												<th scope="row">휴대전화 <span class=""><img
														src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
														alt="필수"></span>
												</th>
												<td><select id="rphone2_1" name="tel1"
													fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
													fw-alone="N" fw-msg="">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
												</select>-<input id="rphone2_2" name="tel2" maxlength="4"
													fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
													fw-alone="N" fw-msg="" placeholder="" size="4" value=""
													type="text">-<input id="rphone2_3"
													name="tel3" maxlength="4"
													fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
													fw-alone="N" fw-msg="" placeholder="" size="4" value=""
													type="text"></td>
											</tr>
										</tbody>
										<!-- 국내 배송관련 정보 -->
										<tbody class="delivery ">
											<tr class="">
												<th scope="row">배송메시지 <span class="displaynone"><img
														src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
														alt="필수"></span>
												</th>
												<td><textarea id="omessage" name="deliveryMsg"
														fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="255"
														cols="70"></textarea></td>
											</tr>
										</tbody>
										</form>
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
												<th scope="col"><strong>총 주문 금액</strong></th>
												<th scope="col" class=""><strong>총 배송비</strong></th>
												<th scope="col"><strong>총 결제예정 금액</strong></th>
											</tr>
										</thead>
										<tbody class="center">
											<tr>
												<td class="price"><div class="box txt16">
														<strong><span id="total_order_price_view"
															class="txt23"><%= result-3000 %></span>원</strong> <span class="displaynone"><span
															id="total_order_price_ref_view"><span
																class="eRefPrice"></span></span></span>
													</div></td>
												<td class="option "><div class="box txt16">
														<strong><span id="total_sale_price_view"
															class="txt23"><%= opVO.getDelivertyFee() %></span>원</strong> <span class="displaynone"><span
															id="total_sale_price_ref_view"><span
																class="eRefPrice"></span></span></span>
													</div></td>
												<td><div class="box txtEm txt16">
														<strong>=</strong> <strong><span
															id="total_order_sale_price_view" class="txt23"><%= result %></span>원</strong>
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
											size="10" readonly="1" value="<%= result %>" type="text"><span>원</span>
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
															if(chkNull()==false){
																return;
															}
															
															var flag = confirm("결제를 진행하시겠습니까?");
															
															if(flag == false){
																return;
															}//end if
															
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
									<form id="cardFrm" name="cardFrm" action="http://localhost/order/payment_process.jsp" method="post">
										<div class="card-middle-title"
											style="padding: 20px; font-size: 20px;">
											<span class="card-middle-left" style="float: left;"><label>(주)골골즈 오브젝트
													생활연구소</label></span> <span class="card-middle-right"
												style="float: right; font-size: 25px; margin-bottom: 10px;"><label><strong><%= result %>원</strong></label></span>
										</div>

										<div class="card-input-payarea"
											style="text-align: center; margin: 20px;">
											<table class="card-input-payarea-tab" style="border: 1px solid #dedede;">
												<tr>
													<th class="card-th"
														style="width: 130px; border-bottom: 1px solid #dedede; padding: 5px; font-size: 17px; vertical-align: middle">카드번호</th>
													<td class="card-td" style="border-bottom: 1px solid #dedede; padding: 5px;"><input type="text" maxlength="16"
														placeholder="[-]없이 입력" class="card-input" name="cardNum" id="card-num"
														style="width: 350px; height: 50px; border: none; font-size: 20px; "></td>
												</tr>
												<tr>
													<th class="card-th"
														style="width: 130px; border-bottom: 1px solid #dedede; padding: 5px; font-size: 17px; vertical-align: middle">카드식별번호</th>
													<td class="card-td" style="border-bottom: 1px solid #dedede; padding: 5px;"><input type="text" maxlength="3"
														placeholder="카드 뒷면 3자리" class="card-input" name="cardId" id="card-id"
														style="width: 350px; height: 50px; border: none; font-size: 20px;"></td>
												</tr>
												<tr>
													<th class="card-th"
														style="width: 130px; border-bottom: 1px solid #dedede; padding: 5px; font-size: 17px; vertical-align: middle" >휴대폰
														번호</th>
													<td class="card-td" style="border-bottom: 1px solid #dedede; padding: 5px;"><input type="text" maxlength="11"
														placeholder="[-]없이 입력" class="card-input" name="cellPhone" id="cell-phone"
														style="width: 350px; height: 50px; border: none; font-size: 20px;"></td>
												</tr>
											</table>
										</div>
									</form>

										<div class="card-payarea-btn"
											style="text-align: center; vertical-align: bottom; margin-top: 200px; font-size: 20px; display: grid; grid-template-columns: 1fr 1fr; ">
											<input type="button" value="결제취소" class="card-btn-cancle"
												style="/* width: 265px; */ height: 60px; padding: 0; margin: 0; border: 1px solid #dedede; background-color: #dedede;">
											<input type="button" value="결제하기" class="card-btn-success"
												style="/* width: 265px;  */height: 60px; padding: 0; margin: 0; border: 1px solid #dedede;">
										</div>
											<script>
											$(".card-btn-cancle").click(function() {
												var cpFrm = document.cardFrm;
												cpFrm.cardNum.value = "";
												cpFrm.cardId.value = "";
												cpFrm.cellPhone.value = ""; 
												$("#modal").css("display","none");
												alert("결제가 취소되었습니다.");
											});
											$(".card-btn-success").click(function() {
												var cpFrm = document.cardFrm;
												
												if(cpFrm.cardNum.value.length != 16){
													alert("카드 번호를 정확히 입력해주세요.");
													cpFrm.cardNum.focus();
													return;
												}
												if(cpFrm.cardId.value.length != 3){
													alert("식별 번호를 정확히 입력해주세요.");
													cpFrm.cardId.focus();
													return;
												}
												if(cpFrm.cellPhone.value.length != 11){
													alert("휴대폰 번호를 확인해주세요.");
													cpFrm.cellPhone.focus();
													return;
												}
												var cFrm =$("#cardFrm");
												var dFrm =$("#deliveryFrm");
												var pFrm =$("#productFrm");
												
												dataFrm = cFrm.serialize()+'&'+dFrm.serialize()+'&'+pFrm.serialize();
												
												  // 합쳐진 데이터를 서버로 제출
										        $.post("payment_process.jsp", dataFrm, function(response) {
										            /* console.log(response); */
										            window.location.href = "payment_process.jsp";
										        }); 
										        
											});
											</script>
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