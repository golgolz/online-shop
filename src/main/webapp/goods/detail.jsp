<%@page import="user.review.UserReviewDAO"%>
<%@page import="util.PageController"%>
<%@page import="admin.review.AdminReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="admin.review.SearchVO"%>
<%@page import="java.util.List"%>
<%@page import="user.wishlist.WishlistDAO"%>
<%@page import="user.wishlist.WishlistVO"%>
<%@page import="user.goods.UserGoodsDAO"%>
<%@page import="user.main.GoodsSimpleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
		// goods 
		String code = (String)request.getParameter("goods");
		GoodsSimpleVO currentGoods = null;
		if(code != null){
			currentGoods = UserGoodsDAO.getInstance().selectOneGoods(code);
		}
		
		// pagenation for review 
		int pageScale = 5;
		int currentPage = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		int startNum = pageScale * (currentPage - 1) + 1;
		int endNum = startNum + pageScale - 1;
		
		PageController pageController = PageController.getInstance();
		String params = pageController.createQueryStr(request);
		
		// review
		SearchVO searchVO = new SearchVO("3", request.getParameter("goods"), null, startNum, endNum);
		UserReviewDAO reviewDAO = UserReviewDAO.getInstance();
		List<ReviewBoardVO> reviews = reviewDAO.selectReviewBoard(searchVO);
	    int totalCount = reviewDAO.selectTotalCount(searchVO);
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<link href="../assets/css/goods/detail.css" rel="stylesheet" />
<link href="http://localhost/assets/css/pagenation.css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		var orderBaseURL = "http://localhost/cart/input_process.jsp?code=<%= currentGoods.getCode() %>&quantity=";
		var buyBaseURL = "http://localhost/order/order_form.jsp?code=<%= currentGoods.getCode() %>&isCart=0&quantity=";
		
		setTotalInfo(1);
		
		$("#quantity_up").click(function(){
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
		
		$("#sub_cart").click(function(){
			var quantity = $("#quantity").val();
			$("#sub_cart").attr("href", function(){
				return orderBaseURL + quantity;
			});
		});
		
		$("#sub_buy").click(function(){
			var quantity = $("#quantity").val();
			$("#sub_buy").attr("href", function(){
				return buyBaseURL + quantity;
			});
		});
		
		$(".pages").click(function(event){
			event.preventDefault();
			var currentPage = parseInt($(this).text());
			var startNum = (currentPage - 1) * <%= pageScale %> + 1;
			var param = {
					start: startNum, 
					end: startNum + <%= pageScale %> - 1, 
					code: "<%= code %>"
					};
			
			$.ajax({
				url: "review_json.jsp",
				type: "GET",
				data: param,
				datatype: "JSON",
				error: function(xhr){
					alert("error occurred");
				},
				success: function(reviewObj){
					if(reviewObj.flag){
						var $tbody = $("#review_content tbody");
						var reviews = reviewObj.review;
						var output = "";
							
						$tbody.empty();
						$.each(reviews, function(i, review) {
							output = "";
						    output += "<tr class='xans-record-'>";
						    output += "<td>" + (startNum + i) + "</td>";
						    output += "<td class='subject left txtBreak'>";
						    output += "<a href='http://localhost/review/review_detail_user.jsp?reviewId=" + review.review_id + "'>" + review.title + "</a></td>"; // </td> 추가
						    output += "<td>" + review.id + "</td>";
						    output += "<td class='txtInfo txt11'>" + review.input_date + "</td>";
						    output += "</tr>";
						    
						    $tbody.append(output);
						});
						
						$(".pages").children().each(function(){
							$(this).removeClass("this");
						});
						
						$("#page_" + currentPage + " a").addClass("this");
					}
				}
			});
		});

		$(".need_login").click(function(event){
		 	$.ajax({
		        url: "http://localhost/goods/check_login.jsp",
		        type: "GET",
		        dataType: "JSON",
		        error: function(xhr){
		        	alert("로그인 체크 실패" + xhr.status);
		        },
		        success: function(response) {
		             if (!response.flag) {
		     			event.preventDefault();
		                //alert('로그인이 필요합니다.22');
		                location.href = 'http://localhost/user/login/userLogin.jsp';
		            } 
		        }
		    });
		});
	});
	
	function setTotalInfo(quantity){
		$("#quantity").val(quantity);
		var price_text = $("#price").text();
		var price = parseInt(price_text.substring(0, price_text.length - 1));
		$("#total_quantity").html("(" + quantity + "개)");
		$("#total_price").text(price * quantity + "원");
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
						<li><a href="http://localhost/index.jsp">홈</a></li>
						<li class=""><a
							href="http://localhost/goods/best.jsp">BEST</a></li>
					</ol>
				</div>
				<div class="xans-element- xans-product xans-product-detail">
					<div class="detailArea">
						<div class="xans-element- xans-product xans-product-image imgArea">
							<div class="keyImg">
								<div class="thumbnail">
										<img
										src="http://localhost/assets/images/goods/<%= currentGoods.getDefaultImage() %>"
										alt="<%= currentGoods.getName() %>" class="BigImage" />
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
									<h2><%= currentGoods.getName() %></h2>
								</div>
								<div
									class="xans-element- xans-product xans-product-detaildesign">
									<table border="3" summary="">
										<caption>기본 정보</caption>
										<tbody>
											<tr rel="상품명" class="xans-record-">
												<th scope="row"><span
													style="font-size: 16px; color: #555555">상품명</span></th>
												<td><span style="font-size: 16px; color: #555555"><%= currentGoods.getName() %></span></td>
											</tr>
											<tr rel="판매가" class="xans-record-">
												<th scope="row"><span
													style="font-size: 11px; color: #333333">판매가</span></th>
												<td><span style="font-size: 11px; color: #333333"><strong
														id="span_product_price_text"><%= currentGoods.getPrice() %>원</strong></span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="guideArea">
									<p class="info">(최소주문수량 1개 이상)</p>
								</div>

								<div id="totalProducts" class="">
									<p class="ec-base-help txtWarn txt11 displaynone">수량을 선택해주세요.</p>
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
												<td><%= currentGoods.getName() %></td>
												<td><span class="quantity">
														<input id="quantity" name="quantity_name" style="" value="0" type="text">
														<img
															src="http://localhost/assets/images/goods/btn_count_up.gif"
															class="QuantityUp up" id="quantity_up"/>
														<img
															src="http://localhost/assets/images/goods/btn_count_down.gif"
															class="QuantityDown down" id="quantity_down"/>
												</span></td>
												<td class="right">
													<span id="price" class="quantity_price"><%= currentGoods.getPrice() %>원</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="totalPrice" class="totalPrice">
									<strong>총 상품금액</strong> (수량) : 
									<span class="total">
										<strong>
											<em id="total_price"><%= currentGoods.getPrice() %>원</em>
										</strong>
										<span id="total_quantity">(0개)</span>
									</span>
								</div>
								<div class="xans-element- xans-product xans-product-action">
									<div class="ec-base-button">
										<a href="http://localhost/cart/input_process.jsp?code=<%= currentGoods.getCode() %>&quantity=" class="sub_cart need_login" id="sub_cart">장바구니</a>
										<a href="http://localhost/wishlist/wishlist_insert_process.jsp?code=<%= currentGoods.getCode() %>" class="sub_wish need_login">관심상품</a>
										<a href="http://localhost/order/order_form.jsp?code=<%= currentGoods.getCode() %>&isCart=0&quantity=" class="first sub_buy need_login" id="sub_buy">
											<span id="btnBuy">구매하기</span>
										</a>
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
							<a id="info_tab" href="#none">상품상세정보</a>
						</li>
						<li id="tab02">
							<a id="review_tab" href="#none">리뷰</a>
						</li>
					</ul>
					<!-- 상품 상세 이미지 시작-->
					<div id="prdDetail" class="tab_box01">
						<div class="cont">
							<p>
								<img
									src="http://localhost/assets/images/goods/<%= currentGoods.getDetailImage() %>"
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
									<table border="1" summary="" class="" id="review_content">
										<caption>상품사용후기</caption>
										<colgroup>
											<col style="width: 70px" />
											<col style="width: auto" />
											<col style="width: 100px" />
											<col style="width: 100px" />
										</colgroup>
										<thead>
											<tr class="center">
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">작성일</th>
											</tr>
										</thead>
										<tbody class="center">
											<% for(ReviewBoardVO review: reviews){ %>
											<tr class="xans-record-">
												<td><%= startNum++ %></td>
												<td class="subject left txtBreak">
													<a href="http://localhost/review/review_detail_user.jsp?reviewId=<%= review.getReviewId() %>">
														<%= review.getTitle() %>
													</a>
												<td><%= review.getId() %></td>
												<td class="txtInfo txt11"><%= review.getInputDate() %></td>
											</tr>
											<% } %>
										</tbody>
									</table>
								</div>
							</div>
							<%
					        	String pageNation = 
					        	pageController.createPagingBtns("http://localhost/goods/detail.jsp", params
					        	        , Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page")), (totalCount / pageScale) + 1);
					        %>
					        <div id="pageNation" style="margin-top: 30px;">
						        <%= pageNation %>
					        </div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>