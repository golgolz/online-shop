<%@page import="user.main.GoodsSimpleVO"%>
<%@page import="java.util.List"%>
<%@page import="user.main.UserMainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
    <script type="text/javascript">
      $(function () {
        $(".carousel-slides").slick({
          infinite: true,
          speed: 500,
          fade: true,
          autoplay: true,
          autoplaySpeed: 2000,
          arrows: true,
          prevArrow: $(".carousel-prev"),
          nextArrow: $(".carousel-next"),
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
		                //alert('로그인이 필요합니다.');
		                location.href = 'http://localhost/user/login/userLogin.jsp';
		            } 
		        }
		    });
		});
      });
    </script>
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link href="./assets/css/index.css" rel="stylesheet" />
	<!-- golgolz end -->
</head>
<body>
	<%
		UserMainDAO userMainDAO = UserMainDAO.getInstance();
		List<GoodsSimpleVO> newGoods = userMainDAO.selectGoods(true);
		List<GoodsSimpleVO> bestGoods = userMainDAO.selectGoods(false);
	%>
	<jsp:include page="./assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div class="carousel">
				<span class="carousel-prev">
					<img src="http://localhost/assets/images/index/left-arrow.png" />
				</span>
          		<div class="carousel-slides">
					<% 
						GoodsSimpleVO tempVO = null;
						for(int i = 0; i < 5; i++){ 
						    tempVO = bestGoods.get(i);
					%>
					<div class="carousel-slide">
		            	<!-- 메인 키비주얼 01 : 링크수정 -->
		              	<a href="http://localhost/goods/detail.jsp?goods=<%= tempVO.getCode() %>">
		              		<div class="img">
		                  		<img 
		                  		src="http://localhost/assets/images/goods/<%= tempVO.getDefaultImage() %>" 
                    			style="width: 50%; margin: 0px auto"/>
		                	</div>
		                	<div class="swiper1_txt">
		                  		<div class="inner">
		                    	<!-- 메인 키비주얼 01 : 텍스트 수정 -->
		                    		<div class="t01"><%= tempVO.getName() %></div>
		                    		<div class="t02"><%= tempVO.getDetailDescription() %></div>
		                    		<div class="t03"><%= tempVO.getPrice() %></div>
		                  		</div>
		                	</div>
		              	</a>
		         	</div>
					<% } %>
            	</div>
				<span class="carousel-next">
					<img src="http://localhost/assets/images/index/right-arrow.png" />
				</span>
        	</div>
        	<div class="main_pro_title cboth">
				<div class="txt_01">NEW ARRIVAL</div>
				<div class="txt_02">오브젝트에 새롭게 들어온 제품을 소개합니다.</div>
			</div>
		    <div class="xans-element- xans-product xans-product-listmain-2 xans-product-listmain xans-product-2 ec-base-product typeThumb sort_pro">
		        <ul class="prdList grid5">
		        	<%
		        		for(GoodsSimpleVO goods : newGoods){
		        	%>
		            <li id="anchorBoxId_6371" class="xans-record-">
		                <div class="box">
		                    <div class="thumbnail">
		                        <div class="prdImg">
		                            <a href="http://localhost/goods/detail.jsp?goods=<%= goods.getCode() %>" name="anchorBoxName_6371">
		                                <img src="http://localhost/assets/images/goods/<%= goods.getDefaultImage() %>" id="eListPrdImage6371_3" alt="[오브젝트] 2024 오브젝트 다이어리 (날짜형)">
		                            </a>
		                        </div>
		                        <span class="wish">
		                        	<a href="http://localhost/wishlist/wishlist_insert_process.jsp?code=<%= goods.getCode() %>" class="need_login">
		                            	<img src="http://localhost/assets/images/index/like_icon.png" class="icon_img ec-product-listwishicon" alt="관심상품 등록">
		                            </a>
		                        </span>
		                    </div>
		                    <div class="description">
		                        <div class="name">
		                            <a href="http://localhost/goods/detail.jsp" class="">
		                                <span style="font-size:12px;color:#000000;"><%= goods.getName() %></span>
		                            </a>
		                        </div>
		                        <ul class="xans-element- xans-product xans-product-listitem-2 xans-product-listitem xans-product-2 spec">
		                            <li class=" xans-record-">
		                                <span style="font-size:12px;color:#000000;font-weight:bold;"><%= goods.getPrice() %>원</span>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </li>
		            <% } %>
		        </ul>
		    </div>
		    <div class="main_pro_title cboth">
				<div class="txt_01">BEST ITEMS</div>
				<div class="txt_02">오브젝트의 인기 제품을 소개합니다.</div>
			</div>
		    <div class="xans-element- xans-product xans-product-listmain-2 xans-product-listmain xans-product-2 ec-base-product typeThumb sort_pro">
		        <ul class="prdList grid5">
		        	<%
		        		for(GoodsSimpleVO goods : bestGoods){
		        	%>
		            <li id="anchorBoxId_6371" class="xans-record-">
		                <div class="box">
		                    <div class="thumbnail">
		                        <div class="prdImg">
		                            <a href="http://localhost/goods/detail.jsp?goods=<%= goods.getCode() %>" name="anchorBoxName_6371">
		                                <img src="http://localhost/assets/images/goods/<%= goods.getDefaultImage() %>" id="eListPrdImage6371_3" alt="<%= goods.getName() %>">
		                            </a>
		                        </div>
		                        <span class="wish">
		                        	<a href="http://localhost/wishlist/wishlist.jsp?code=<%= goods.getCode() %>">
		                            	<img src="http://localhost/assets/images/index/like_icon.png" class="icon_img ec-product-listwishicon" alt="관심상품 등록">
		                            </a>
		                        </span>
		                    </div>
		                    <div class="description">
		                        <div class="name">
		                            <a href="http://localhost/goods/detail.jsp" class="">
		                                <span style="font-size:12px;color:#000000;"><%= goods.getName() %></span>
		                            </a>
		                        </div>
		                        <ul class="xans-element- xans-product xans-product-listitem-2 xans-product-listitem xans-product-2 spec">
		                            <li class=" xans-record-">
		                                <span style="font-size:12px;color:#000000;font-weight:bold;"><%= goods.getPrice() %>원</span>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </li>
		            <% } %>
		        </ul>
		    </div>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>