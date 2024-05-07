<%@page import="admin.goods.AdminGoodsSimpleVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.goods.AdminGoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<style type="text/css">
#goodsTable thead tr th{
	font-weight: bold;
}

#goodsTable tbody{
	font-size: 15px;
}

.clickable-image{
	border: 2px solid transparent;
}

.clicked {
  border-color: red; 
}
</style>
<script type="text/javascript">
	$(function(){
    	$("#goods_menu").addClass("bg-gradient-primary");
    	$("#btn_search").click(function(){
    		$("#frmGoods").submit();
    	});
    	
		$("#btn_today").click(function(){
			$("#date").val("today");
			$("#btn_week").removeClass('clicked');
			$("#btn_month").removeClass('clicked');
			$("#btn_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_week").click(function(){
			$("#date").val("week");
			$("#btn_today").removeClass('clicked');
			$("#btn_month").removeClass('clicked');
			$("#btn_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_month").click(function(){
			$("#date").val("month");
			$("#btn_today").removeClass('clicked');
			$("#btn_week").removeClass('clicked');
			$("#btn_total").removeClass('clicked');
			$(this).addClass('clicked');
		});
    	
		$("#btn_total").click(function(){
			$("#date").val("total");
			$("#btn_today").removeClass('clicked');
			$("#btn_week").removeClass('clicked');
			$("#btn_month").removeClass('clicked');
			$(this).addClass('clicked');
		});
	});
</script>
<!-- golgolz start -->
<link href="../../assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="../../assets/css/manage/goods/goods.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
	<jsp:useBean id="searchVO" class="admin.goods.SearchVO" scope="page" />
	<jsp:setProperty property="*" name="searchVO" />
	<%
		String nameCodeValue = (String)request.getParameter("ss");
		int nameCodeField = searchVO.getField();
		
		if(nameCodeValue != null && nameCodeValue != ""){
			if(nameCodeField == 1){
			    searchVO.setName(nameCodeValue);
			} else if(nameCodeField == 2){
			    searchVO.setCode(nameCodeValue);
			}
		}
		
		AdminGoodsDAO adminGoodsDAO = AdminGoodsDAO.getInstance();
		List<AdminGoodsSimpleVO> goods = adminGoodsDAO.selectGoods(searchVO);
	%>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">상품 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">상품 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
      			<div class="contents">
			        <!--subtitle-->
			        <form id="frmGoods">
				        <table class="tbstyleB" width="100%" >
				          	<colgroup>
				            	<col align="left" width="100px" />
				            	<col align="left" />
				          	</colgroup>
	          				<tbody>
					            <tr>
					              <td colspan="2" class="top2"></td>
					            </tr>
            					<tr>
              						<td class="label">검색어</td>
              						<td class="box text">
                						<select name="field" style="width: 90px">
                  							<option value="1"${param.field eq '1' ? " selected" : "" }>상품명</option>
                  							<option value="2"${param.field eq '2' ? " selected" : "" }>상품코드</option>
                						</select>
                						<input type="text" name="ss" value="${param.ss}" class="inputbox" size="20" />
              						</td>
            					</tr>
            					<tr>
              						<td class="label">판매가</td>
              						<td class="box text">
                						<input type="text" name="priceMin" value="${param.priceMin}" class="inputbox2 price_only" size="10" />원 ~
                						<input type="text" name="priceMax" value="${param.priceMax}" class="inputbox2 price_only" size="10" />원
              						</td>
            					</tr>
            					<tr>
              						<td class="label">등록일</td>
              						<td class="box text">
              							<input type="hidden" id="date" name="date" value="" />
              							<img id="btn_today" class="clickable-image${param.date eq 'today' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_today.gif" />
										<img id="btn_week" class="clickable-image${param.date eq 'week' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_thisWeek.gif" />
										<img id="btn_month" class="clickable-image${param.date eq 'month' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_thisMonth.gif" />
					                	<img id="btn_total" class="clickable-image${param.date eq 'total' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_total.gif" />
              						</td>
            					</tr>
          					</tbody>
        				</table>
        			</form>
        				<div class="alignCenter">
          					<input
            				type="image"
            				src="http://localhost/online-shop/assets/images/manage/goods/btn_search.gif"
            				id="btn_search"
          					/>
        				</div>
        				<!--검색갯수-->
        				<div class="boxContainer">
          					<table cellpadding="0" cellspacing="0" border="0" width="100%">
            					<tbody>
              						<tr>
                						<td class="left">
					                  		<span class="bul">검색결과 : </span>
					                  		<span class="fc_red"><strong>40</strong>건</span>
					                  		<span class="bul">전체상품 : </span>
						                  	<span class="fc_red"><strong>40</strong>건</span>
						                  	<span class="bul">품절 : </span>
						                  	<span class="fc_red"><strong>0</strong>건 </span>
                						</td>
              						</tr>
            					</tbody>
          					</table>
        				</div>
        				<!--정렬-->
        				<div class="alignContainer01">
          					<table cellpadding="0" cellspacing="0" border="0" width="100%">
            					<tbody>
              						<tr>
	                					<td align="left"></td>
	                					<td align="right">등록일 | 상품명 | 가격</td>
				              		</tr>
				            	</tbody>
				          	</table>
				        </div>
				        <!--테이블 header-->
				        <div class="bgtbheader01">
				         	<table width="100%" class="tablelistH31" id="goodsTable">
				            	<colgroup>
				              		<col width="20%" />
				              		<col width="15%" />
				              		<col width="15%" />
				              		<col width="15%" />
				              		<col width="10%" />
				              		<col width="10%" />
				              		<col width="10%" />
				            	</colgroup>
					            <thead>
					             	<tr>
					                	<th>상품명(상품코드)</th>
						                <th>등록일</th>
						                <th>가격</th>
						                <th>재고</th>
						                <th>복사</th>
						                <th>수정</th>
						                <th>삭제</th>
					            	</tr>
					            </thead>
				            	<tbody>
				            		<% for(AdminGoodsSimpleVO product : goods){ %>
				              		<tr>
				                		<td class="tdL" align="left">
				                    		<a href="http://192.168.10.211/online-shop/manage/goods/detail.jsp?code=<%= product.getCode() %>">
				                  				<div class="left_layer">
						                      		<img src="http://localhost/online-shop/assets/images/goods/<%= product.getDefaultImage() %>" width="60" height="60" class="imgborder" />
				                  				</div>
				                  				<div style="line-height: 160%; margin-left: 72px; position: relative;">
				                    				<strong><%= product.getCode() %></strong>
				                    				<br />
				                    				<span><%= product.getName() %></span>
				                  				</div>
				                    		</a>
				                		</td>
				                		<td class="tdL" align="center"><%= product.getInputDate() %></td>
				                		<td class="tdL" align="center">
					                  		<span><%= product.getPrice() %>원</span>
				                		</td>
				                		<td class="tdL" align="center"><%= product.getAmount() %></td>
				                		<td class="tdL" align="center">
				                    			<input type="button" value="품절" class="btn" />
				                		</td>
				                		<td class="tdL" align="center">
				                  			<a
				                    		href="http://192.168.10.211/online-shop/manage/goods/detail.jsp?req=update">
				                    			<input type="button" value="수정" class="btn" />
				                    		</a>
				                		</td>
				                		<td class="tdR" align="center">
				                    			<input type="button" value="삭제" class="btn" />
				                		</td>
				              		</tr>
				              		<% } %>
				            	</tbody>
				          	</table>
				      	</div>
        				<div class="alignCenter">
          					<table cellpadding="0" cellspacing="0" border="0" width="100%">
            					<tbody>
              						<tr>
                						<td align="center">
                  							<!-- 페이징 -->
                  							<span class="paging">
                  							<a
                      						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header&amp;page=1"
                      						class="first">
                      							<img
                        						src="http://localhost/online-shop/assets/images/manage/goods/btn_navi_arrLL.gif"
                        						border="0"
                        						align="absmiddle" />
                        					</a>
                        					<a
					                      	href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header&amp;page=1"
					                      	class="pre">
						                      	<img
	                        					src="http://localhost/online-shop/assets/images/manage/goods/btn_navi_arrL.gif"
	                        					border="0"
	                        					align="absmiddle" />
                        					</a>
                    						<a
                      						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header&amp;page=1"
                      						class="on"> 1 
                      						</a>
                      						<a
                      						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header&amp;page=2"
                      						class="normal"> 2 </a>
                      						<a
                      						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header&amp;page=2"
                      						class="next">
                      							<img
                        						src="http://localhost/online-shop/assets/images/manage/goods/btn_navi_arrR.gif"
                        						border="0"
                        						align="absmiddle" />
                        					</a>
                        					<a
                      						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header&amp;page=2"
                      						class="last">
	                      						<img
	                        					src="http://localhost/online-shop/assets/images/manage/goods/btn_navi_arrRR.gif"
	                        					border="0"
	                        					align="absmiddle" />
                        					</a>
                        				</span>
                					</td>
                					<td width="10%" align="right">
                  						<a
                    					href="http://192.168.10.211/online-shop/manage/goods/detail.jsp?req=create"
                    					>
                    						<img src="http://localhost/online-shop/assets/images/manage/goods/btn_goodsAdd.gif" />
                  						</a>
                					</td>
              					</tr>
            				</tbody>
          				</table>
        			</div>
      			</div>
    		</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>