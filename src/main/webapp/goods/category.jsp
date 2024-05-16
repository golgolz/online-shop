<%@page import="util.PageController"%>
<%@page import="java.util.Enumeration"%>
<%@page import="user.goods.SearchVO"%>
<%@page import="user.goods.UserGoodsDAO"%>
<%@page import="user.main.GoodsSimpleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
    <link href="http://localhost/assets/css/goods/category.css" rel="stylesheet" />
    <link href="http://localhost/assets/css/pagenation.css" rel="stylesheet" />
    <script type="text/javascript">
    	$(function(){
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
	<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	<%
		// pagenation
		int pageScale = 10;
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int startNum = pageScale * (currentPage - 1) + 1;
		int endNum = startNum + pageScale - 1;
		
		PageController pageController = PageController.getInstance();
		String params = pageController.createQueryStr(request);
		
		// get goods data
		String category = (String)request.getParameter("category");
		String subCategory = (String)request.getParameter("sub_category");
		String sort = (String)request.getParameter("sort");
		UserGoodsDAO userGoodsDAO = UserGoodsDAO.getInstance();
		
		if(category != null){
		    category = category.toUpperCase();
		}	
		
		if(subCategory != null){
		    subCategory = subCategory.toUpperCase();
		}
		
		if(sort != null){
		    sort = sort.toUpperCase();
		} else {
		    sort = "";
		}
		
		SearchVO searchVO = new SearchVO(subCategory == null ? category : subCategory, sort, startNum, endNum);
		List<GoodsSimpleVO> selectedGoods = userGoodsDAO.selectGoodsSort(searchVO);
		int goodsCount = userGoodsDAO.selectGoodsCount(subCategory == null ? category : subCategory, sort);
	%>
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div class="xans-element- xans-product xans-product-menupackage">
	        	<div class="xans-element- xans-product xans-product-headcategory path">
	          		<span>현재 위치</span>
	          		<ol>
	            		<li><a href="http://localhost/index.jsp">홈</a></li>
	            		<li class="">
	              			<a href="http://localhost/goods/category.jsp?category=${param.category}"><%= category %></a>
	            		</li>
	            		<% if(subCategory != null){ %>
	            			<li class=""><%= subCategory %></li>
	            		<% } %>
	          		</ol>
	        	</div>
	        	<div class="xans-element- xans-product xans-product-headcategory title">
	          		<p class="banner"></p>
	          		<h2>
	          			<span><%= category %></span>
		            	<% if(subCategory != null){ %>
		          			<span>  >  <%= subCategory %></span>
		            	<% } %>
	          		</h2>
	        	</div>
	        	<ul class="menuCategory" id="midCate" style="display: block"></ul>
	      	</div>
	      	<div class="xans-element- xans-product xans-product-normalpackage">
	        	<div class="xans-element- xans-product xans-product-normalmenu">
	          		<div class="function">
	            		<p class="prdCount">등록 제품 : <%= goodsCount %></p>
	            		<ul
	              		id="type"
	              		class="xans-element- xans-product xans-product-orderby">
	              			<li class="xans-record-">
	                			<a href="http://localhost/goods/category.jsp?category=<%= category %>&sort=new<%= subCategory == null ? "": "&sub_category=" + subCategory %>&page=1">신상품</a>
	              			</li>
	              			<li class="xans-record-">
	                			<a href="http://localhost/goods/category.jsp?category=<%= category %>&sort=best<%= subCategory == null ? "": "&sub_category=" + subCategory %>&page=1">판매순</a>
	              			</li>
	              			<li class="xans-record-">
	                			<a href="http://localhost/goods/category.jsp?category=<%= category %>&sort=high_price<%= subCategory == null ? "": "&sub_category=" + subCategory %>&page=1">높은가격</a>
	              			</li>
	              			<li class="xans-record-">
	                			<a href="http://localhost/goods/category.jsp?category=<%= category %>&sort=low_price<%= subCategory == null ? "": "&sub_category=" + subCategory %>&page=1">낮은가격</a>
	              			</li>
	              			<li class="xans-record-">
	                			<a href="http://localhost/goods/category.jsp?category=<%= category %>&sort=most_review<%= subCategory == null ? "": "&sub_category=" + subCategory %>&page=1">리뷰순</a>
	              			</li>
	            		</ul>
	          		</div>
	        	</div>
	        </div>
	        <div class="xans-element- xans-product xans-product-listmain-2 xans-product-listmain xans-product-2 ec-base-product typeThumb sort_pro">
		        <ul class="prdList grid5">
		        	<% for(GoodsSimpleVO goods: selectedGoods){ %>
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
		        <%
		        	String pageNation = 
		        	pageController.createPagingBtns("http://localhost/goods/category.jsp", params
		        	        , Integer.parseInt(request.getParameter("page")), (goodsCount / pageScale) + 1);
		        %>
		        <div id="pageNation">
			        <%= pageNation %>
		        </div>
		    </div>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>