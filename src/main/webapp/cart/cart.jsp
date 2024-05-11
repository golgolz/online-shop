<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@page import="order.vo.OrderVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.vo.OrderProductVO"%>
<%@page import="java.util.List"%>
<%@page import="user.order.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 로그인 한 사용자만 사용 가능하게 체크하는 코드 예시 => 추후 변경 예정
<c:if test="${empty sessionScope.loginData}">
	<c:redirect url="http://192.168.10.212/jsp_prj/index.jsp"/>
</c:if> --%>
<jsp:useBean id="opVO" class="order.vo.OrderProductVO" scope="page" />
<jsp:setProperty property="*" name="opVO" />
<%
//개발의 편의성을 위해 코드를 작성한 후 작업 진행
opVO.setCartId("20240419131338");
request.setAttribute("cartId", opVO.getCartId()); 

/* String userId = (String)session.getAttribute("id"); */
CartDAO cDAO = CartDAO.getInstance();

//해당 유저의 ID로 장바구니 번호가 등록되어 있는지?
// boolean flag = cDAO.checkCartId(userId);

/* if(flag == false){// 장바구니 번호가 존재하지 않을 시 Cart,OrderProduct table에 insert
     cDAO.insertCart(oVO);
	 cDAO.insertOrderProduct(opVO) 
}//end if */

/* String code = (String)request.getParameter("code");
int quantity = Integer.parseInt(request.getParameter("quantity"));

opVO.setCode(code);
opVO.setQuantity(quantity); */
%>

<%
	String cartId = opVO.getCartId();
	
	
	List<OrderProductVO> list = new ArrayList<OrderProductVO>();
	
	try{
		list = cDAO.selectCart(cartId);
		
	}catch(Exception e){
	    e.printStackTrace();
	}
%>

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
			
			var sum = parseInt(productPrice) * newValue + 3000;
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
			
			var sub = parseInt(productPrice) * newValue + 3000;
			document.getElementById("sum_price_front0").innerHTML = formatNumber(sub);
		}
	}
	
	function formatNumber(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function modifyQuantity() {
		/* $("#cartFrm").submit(); */
		var param = {
			orderGoodsId : $("#orderProductId").val(),
			quantity : $("#quantity_id_0").val(),
			method : "modify"
		};
		$.ajax({
			url : "cart_process.jsp",
			type : "POST",
			data : param,
			dataType : "JSON",
			error : function(xhr){
				alert("AJAX 요청 실패: " + xhr.status + " " + xhr.statusText);
			},
			success : function(jsonObj){
				if(jsonObj.result){
		            $("#quantity_id_0").val(jsonObj.quantity);
					alert("수량을 변경했습니다.");
				}else{
					alert(jsonObj);
				}
			}
		})
	}
	
	function deleteCartItem(){
		
		var flag = confirm("정말 삭제하시겠습니까?");
		
		if(flag == false){//아니오를 누른 경우
			return;
		}//end if
		
		//예를 누른 경우 삭제 코드 실행
		var param = {
				orderGoodsId : $("#orderProductId").val(),
				cartId : $("#orderCartId").val(),
				method : "deleteOne"
		};
		$.ajax({
			url : "cart_process.jsp",
			type : "POST",
			data : param,
			dataType : "JSON",
			error : function(xhr){
				alert("AJAX 요청 실패: " + xhr.status + " " + xhr.statusText);
			},
			success : function(jsonObj){
				if(jsonObj.result){
					alert("삭제가 완료되었습니다.");
					location.reload();
				}else{
					alert("삭제를 실패했습니다. 잠시 후 다시 시도해주세요.");
				}
			}
		})
		}
	
	function deleteCartAll(){
		
		var flag = confirm("장바구니가 모두 비워집니다. 삭제하시겠습니까?");
		
		if(flag == false){
			return;
		}//end if
		
		//예를 누른 경우 삭제 코드 실행
		var param = {
				cartId : $("#orderCartId").val(),
				method : "deleteAll"
		};
		$.ajax({
			url : "cart_process.jsp",
			type : "POST",
			data : param,
			dataType : "JSON",
			error : function(xhr){
				alert("AJAX 요청 실패:"+ xhr.status + " " + xhr.statusText);
			},
			success : function(jsonObj){
				if(jsonObj.result){
					alert("장바구니가 비워졌습니다.");
					location.reload();
				}else{
					alert("장바구니 비우기를 실패했습니다. 잠시 후 다시 시도해주세요.");
				}
			}
		})
	}
	
	function refreshCartList(){
		var param = {
				cartId : $("#orderCartId").val(),
				method : "refresh"
		}
		
		$.ajax({
			url : "cart_process.jsp",
			type : "POST",
			data : param,
			dataType : "JSON",
			error : function(xhr){
				alert("AJAX 요청 실패:"+ xhr.status + " " + xhr.statusText);
			},
			success : function(data){
				for(var i=0; i<data.length; i++){
					$("#quantity_id_0").val(data.quantity);
				}
				alert("갱신성공");
			}
		})
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
										(<%= list.size() %>)</a></li>
								<li class=" "></li>
							</ul>
							<p class="right displaynone">장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
						</div>
						<div class="orderListArea ec-base-table typeList gBorder">
							<div class="xans-element- xans-order xans-order-normtitle title ">
								<h6>장바구니 상품 (<%= list.size() %>)</h6>
							</div>
							<form id="cartFrm" name="cartFrm" action="cart_process.jsp" method="post">
							<input type="hidden">
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
										<th scope="col"></th>
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
								<%
						for(OrderProductVO oVO : list){
						%>
								<tbody class="xans-element- xans-order xans-order-list center">
									<tr class="xans-record-">
										<td></td>
										<td class="thumb gClearLine"><a
											href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
												src="http://localhost/online-shop/assets/images/goods/<%= oVO.getProductImg() %>"
												onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
												alt="APPLE_IPHONE15_6"
												width="100px"></a></td>
										<input type="hidden" value="<%= oVO.getOrderGoodsId() %>" name="orderProductId" id="orderProductId"/>
										<input type="hidden" value="<%= oVO.getCartId() %>" name="orderCartId" id="orderCartId" />
										<td class="left gClearLine"><strong class="name"><a
												href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
												class="ec-product-name"><%= oVO.getProductName() %></a></strong> <span class="displaynone engName">(영문명
												: )</span>
											<uls
												class="xans-element- xans-order xans-order-optionall option">
												<li class="xans-record-"><strong class="displaynone"><%= oVO.getCode() %></strong>[옵션: <%= oVO.getCode() %>] <span
													class="displaynone">(<%= list.size() %>)</span><br></li>
											</ul></td>
										<td class="right">
											<div id="product_price_div0" class="">
												<strong><%= String.format("%,d", oVO.getPrice()) %>원</strong>
												<p class="displaynone"></p>
											</div>
											<div id="product_sale_price_div0" class="displaynone">
												<strong><span id="product_sale_price_front0"><script><%= oVO.getPrice() %></script></span>원</strong>
												<p class="displaynone"></p>
											</div>
										</td>
										<td><span class=""> <span class="ec-base-qty"><input
													id="quantity_id_0" name="quantity" size="2"
													value="<%= oVO.getQuantity() %>" type="text"><a href="javascript:;"
													onclick="addQuantity('quantity_id_0','product_price_div0');"><img
														src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
														alt="수량증가" class="up"></a><a href="javascript:;"
													onclick="decQuantity('quantity_id_0','product_price_div0');"><img
														src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
														alt="수량감소" class="down"></a></span> <a href="javascript:;"
												class="btnNormal gBlank5" onclick="modifyQuantity()">변경</a>
										</span> <span class="displaynone"><%= oVO.getQuantity() %></span></td>

	
										<td rowspan="1" class="">
											<p class="">
												<%= String.format("%,d", oVO.getDelivertyFee()) %>원<span class="displaynone"><br></span><br>
											</p>
										</td>
										<td class="right"><strong><span
												id="sum_price_front0"><%= String.format("%,d", oVO.getTotal()) %></span>원</strong>
											<div class="displaynone"></div></td>
										<td class="button">
											<!--임시 주석처리 : 주문서 작성 페이지 이동--> <!--<a href="javascript:;" class="btnSubmit" onclick="Basket.orderBasketItem(0);">주문하기</a>-->
											<a href="javascript:;" class="btnNormal" onclick="deleteCartItem()"><i class="icoDelete"></i> 삭제</a>
										</td>
									</tr>
								</tbody>
								<% }//end for %>
							</table>
						</form>
						
						</div>
						<div class="orderListArea ec-base-table typeList gBorder"></div>
						<div
							class="xans-element- xans-order xans-order-basketpriceinfoguide  ">

							<p class="info displaynone">추가증정 이벤트 상품의 옵션 및 수량 변경은 상품상세에서
								가능합니다.</p>
						</div>
						<div class="xans-element- xans-order xans-order-selectorder ec-base-button ">

							</span> <span class="gRight"> <a href="javascript:;" class="btnNormal"
								onclick="deleteCartAll()">장바구니비우기</a>

							</span>
						</div>
						
						<div
							class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
							<a href="#none" onclick="Basket.orderAll(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html" class="btnSubmitFix sizeM  ">전체상품주문</a>
							 <a href="http://localhost/online-shop/index.jsp" class="btnNormalFix sizeM">쇼핑계속하기</a>
							<!-- 네이버 체크아웃 구매 버튼  -->
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