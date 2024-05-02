<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#goods_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<link href="../../assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="../../assets/css/manage/goods/goods.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
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
			        <div class="pa_t_20"></div>
				        <table
				          class="tbstyleB"
				          width="100%"
				        >
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
                						<select name="sc" style="width: 90px">
                  							<option value="good_name">상품명</option>
                  							<option value="good_code">상품코드</option>
                						</select>
                						<input type="text" name="ss" value="" class="inputbox" size="20" />
              						</td>
            					</tr>
            					<tr>
              						<td class="label">판매가</td>
              						<td class="box text">
                						<input type="text" name="ss_price_min" value="" class="inputbox2 price_only" size="10" />원 ~
                						<input type="text" name="ss_price_max" value="" class="inputbox2 price_only" size="10" />원
              						</td>
            					</tr>
            					<tr>
              						<td class="label">등록일</td>
              						<td class="box text">
                						<a
                  						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
                  						id="date_term2"
                  						mode="this_day"
                  						><img src="http://localhost/online-shop/assets/images/manage/goods/btn_today.gif"
                						/></a>
                						<a
                  						href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
					                  	id="date_term3"
					                  	mode="this_week"
					                  	><img src="http://localhost/online-shop/assets/images/manage/goods/btn_thisWeek.gif"
					                	/></a>
					                	<a
					                  	href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
					                  	id="date_term4"
					                  	mode="this_month"
					                  	><img src="http://localhost/online-shop/assets/images/manage/goods/btn_thisMonth.gif"
					                	/></a>
					                	<a
					                  	href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
					                  	id="date_term5"
					                  	mode=""
					                  	><img src="http://localhost/online-shop/assets/images/manage/goods/btn_total.gif"
					                	/></a>
              						</td>
            					</tr>
          					</tbody>
        				</table>
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
				         	<table width="100%" class="tablelistH31">
				            	<colgroup>
				              		<col width="110" />
				              		<col width="100" />
				              		<col width="60" />
				              		<col width="35" />
				              		<col width="45" />
				              		<col width="45" />
				              		<col width="45" />
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
				              		<tr>
				                		<td class="tdL" align="left">
				                  			<div class="left_layer">
				                    			<a
						                      	href="https://demo01.swm.whoismall.com/?act=shop.goods_view&amp;GS=21&amp;GC="
						                      	target="_blank">
						                      	<img
				                        		src="http://localhost/online-shop/assets/images/goods/APPLE_IPHONE14_1.png"
				                        		width="60"
				                        		height="60"
				                        		class="imgborder" />
				                    			</a>
				                  			</div>
				                  			<div
				                    		xclass="left_layer"
				                    		style="
				                      		line-height: 160%;
				                      		margin-left: 72px;
				                      		position: relative;">
				                    			<strong>G638DA46797295</strong>
				                    			<br />
				                    			<input
				                      			type="text"
				                      			name="good_name[21]"
				                      			value="안젤라 미스 오 드 퍼퓸"
				                      			class="inputbox"
				                      			style="width: 100%; box-sizing: border-box"
				                    			/>
				                  			</div>
				                		</td>
				                		<td class="tdL" align="center">22.12.05 16:57</td>
				                		<td class="tdL" align="center">
					                  		<input
					                    	type="text"
					                    	name="good_price[21]"
					                    	value="84000"
					                    	style="width: 70px"
					                    	class="inputbox2 price_only"
					                  		/>
					                  		<input
					                    	type="hidden"
					                    	name="good_price_org[21]"
					                    	value="84000"
					                  		/>
				                		</td>
				                		<td class="tdL" align="center">무한대</td>
				                		<td class="tdL" align="center">
				                  			<a
				                    		href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
				                    		id="btn_good_copy19"
				                    		seq="21">
				                    			<input type="button" value="품절" />
				                    		</a>
				                		</td>
				                		<td class="tdL" align="center">
				                  			<a
				                    		href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;good_seq=21&amp;ch=goods&amp;page=1">
				                    			<input type="button" value="수정" />
				                    		</a>
				                		</td>
				                		<td class="tdR" align="center">
				                  			<a
				                    		href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
				                    		id="btn_good_delete19"
				                    		seq="21"
				                    		cate_multi_seq="21"
				                    		multi="0"
				                    		>
				                    			<input type="button" value="삭제" />
				                  			</a>
				                		</td>
				              		</tr>
				              		
				              		<tr>
				                		<td class="tdL" align="left">
				                  			<div class="left_layer">
				                    			<a
						                      	href="https://demo01.swm.whoismall.com/?act=shop.goods_view&amp;GS=21&amp;GC="
						                      	target="_blank">
						                      	<img
				                        		src="http://localhost/online-shop/assets/images/goods/APPLE_IPHONE14_1.png"
				                        		width="60"
				                        		height="60"
				                        		class="imgborder" />
				                    			</a>
				                  			</div>
				                  			<div
				                    		xclass="left_layer"
				                    		style="
				                      		line-height: 160%;
				                      		margin-left: 72px;
				                      		position: relative;">
				                    			<strong>G638DA46797295</strong>
				                    			<br />
				                    			<input
				                      			type="text"
				                      			name="good_name[21]"
				                      			value="안젤라 미스 오 드 퍼퓸"
				                      			class="inputbox"
				                      			style="width: 100%; box-sizing: border-box"
				                    			/>
				                  			</div>
				                		</td>
				                		<td class="tdL" align="center">22.12.05 16:57</td>
				                		<td class="tdL" align="center">
					                  		<input
					                    	type="text"
					                    	name="good_price[21]"
					                    	value="84000"
					                    	style="width: 70px"
					                    	class="inputbox2 price_only"
					                  		/>
					                  		<input
					                    	type="hidden"
					                    	name="good_price_org[21]"
					                    	value="84000"
					                  		/>
				                		</td>
				                		<td class="tdL" align="center">무한대</td>
				                		<td class="tdL" align="center">
				                  			<a
				                    		href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
				                    		id="btn_good_copy19"
				                    		seq="21">
				                    			<input type="button" value="품절" />
				                    		</a>
				                		</td>
				                		<td class="tdL" align="center">
				                  			<a
				                    		href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;good_seq=21&amp;ch=goods&amp;page=1">
				                    			<input type="button" value="수정" />
				                    		</a>
				                		</td>
				                		<td class="tdR" align="center">
				                  			<a
				                    		href="https://demo01.swm.whoismall.com/admin/?act=goods.good_list&amp;ch=goods&amp;menu=header#"
				                    		id="btn_good_delete19"
				                    		seq="21"
				                    		cate_multi_seq="21"
				                    		multi="0"
				                    		>
				                    			<input type="button" value="삭제" />
				                  			</a>
				                		</td>
				              		</tr>
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
                    					href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;cate_code=GD&amp;ch=goods"
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