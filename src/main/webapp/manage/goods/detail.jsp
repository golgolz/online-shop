<%@page import="admin.goods.AdminGoodsDetailVO"%>
<%@page import="admin.goods.AdminGoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

if (!Boolean.TRUE.equals(isLoggedIn)) {
%>
  <script type="text/javascript">
      alert('로그인이 필요합니다.');
      window.location.href = 'http://localhost/manage/adminLogin/adminLogin.jsp';
  </script>
<%
  return;
}
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<!-- golgolz start -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="../../assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="../../assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="../../assets/css/manage/goods/default.css" rel="stylesheet" />
<style>
.subtitle{
	padding: 0px;
	margin-top: 20px;
}

#dataForm div:first-child{
	margin-top: 0px;
}

.container-fluid py-4 {
	padding-top: 0px;!important
}

.detail-control {
	font-size: 15px;
	margin-right: 2px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#goods_menu").addClass("bg-gradient-primary");
		
		$("#btn-register").click(function(){
	        $("#dataForm").submit();
		});
		
		$("#btn-update").click(function(){
	        $("#dataForm").attr("action", "http://localhost/manage/goods/update_process.jsp");
	        $("#dataForm").submit();
		});
		
		$("#btn-soldout").click(function(){
	        $("#dataForm").attr("action", "http://localhost/manage/goods/soldout_process.jsp");
	        $("#dataForm").submit();
		});
		
		$("#btn-delete").click(function(){
	        $("#dataForm").attr("action", "http://localhost/manage/goods/delete_process.jsp");
	        $("#dataForm").submit();
		});
		
		$('input[name="maker"]').change(function(){
			// 선택된 라디오 버튼 값 확인
	        var selectedOption = $('input[name="maker"]:checked').val();
	        
	        // select 박스 초기화
	        $('#discount_type00').empty();
	        
	        // 선택된 값에 따라 옵션 추가
	        if (selectedOption === '1') {
	            $('#discount_type00').append('<option value="S24">S24</option>');
	            $('#discount_type00').append('<option value="ZFLIP">ZFLIP</option>');
	        } else if (selectedOption === '0') {
	            $('#discount_type00').append('<option value="IPHONE14">아이폰14</option>');
	            $('#discount_type00').append('<option value="IPHONE15-Y">아잎</option>');
	        }
		});
	});
</script>
<!-- golgolz end -->
</head>
<body>
	<jsp:useBean id="goods" class="admin.goods.AdminGoodsDetailVO" />
	<jsp:setProperty property="*" name="goods" />
	<%
		AdminGoodsDAO adminGoodsDAO = AdminGoodsDAO.getInstance();
		if(request.getParameter("code") != null){
			goods = adminGoodsDAO.selectOneGoods((String)request.getParameter("code"));
		}
	%>
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
							class="opacity-5 text-dark" href="javascript:;"> 관리자 기능</a></li>
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
					<form id="dataForm" name="dataForm" action="http://localhost/manage/goods/register_process.jsp" method="post" enctype="multipart/form-data">
						<div class="subtitle">
							<img
								src="http://localhost/assets/images/manage/goods/register/bul_subtitle.gif" />
							상품 기본정보
						</div>
						<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB"
							width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td colspan="4" class="top2"></td>
								</tr>
								<tr>
									<td class="label">상품명</td>
									<td class="box text">
									<input type="hidden" name="code" value="<%= goods.getCode() %>" />
									<input type="text" name="name" value="<%= goods.getName() == null ? "" : goods.getName() %>" size="50" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">간략설명</td>
									<td class="box text">
									<input type="text" name="description"
										value="<%= goods.getDescription() == null ? "" : goods.getDescription() %>" style="width: 100%" class="inputbox" /></td>
								</tr>
								<tr>
									<td class="label">제조사</td>
									<td class="box text">
										<label>
											<input type="radio" id="good_code_type1" name="maker" value="1"<%= "삼성".equals(goods.getMaker()) ? " checked" : "" %> /> 삼성
										</label>
										<label>
											<input type="radio" id="good_code_type0" name="maker" value="0"<%= "애플".equals(goods.getMaker()) ? " checked" : "" %> /> 애플
										</label> 
									</td>
								</tr>

								<tr>
									<td class="label">모델</td>
									<td class="box text">
										<select name="model" id="discount_type00">
											<option value="S24"<%= "S24".equals(goods.getModel()) ? " selected" : "" %>>S24</option>
											<option value="ZFLIP"<%= "ZFLIP".equals(goods.getModel()) ? " selected" : "" %>>ZFLIP</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="label">재질</td>
									<td class="box text">
										<label>
											<input type="radio" id="good_code_type1" name="material" value="1"
											<%= "실리콘".equals(goods.getMaterial()) ? " checked" : "" %>/> 실리콘
										</label>&nbsp;&nbsp; 
										<label>
											<input type="radio" id="good_code_type0" name="material" value="0" 
											<%= "하드".equals(goods.getMaterial()) ? " checked" : "" %>/> 하드
										</label> 
									</td>
								</tr>
							</tbody>
						</table>

						<!--가격 / 판매정보-->
						<div class="subtitle">
							<img
								src="http://localhost/assets/images/manage/goods/register/bul_subtitle.gif" />
							가격 / 판매정보
						</div>
						<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB"
							width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td colspan="4" class="top2"></td>
								</tr>
								<tr>
									<td class="label">가격</td>
									<td class="box text"><input type="text"
										name="price" id="good_buy_price" value="<%= goods.getPrice() %>" size="10"
										class="inputbox2 price_only" />원&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td class="label">배송비</td>
									<td class="box text"><input type="text"
										name="deliveryCharge" id="good_buy_price" value="<%= goods.getDeliveryCharge() %>" size="10"
										class="inputbox2 price_only" />원&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td class="label">재고량</td>
									<td class="box text">
										<label>
											<input type="radio"
											id="good_stock_type1" name="soldOutFlag" value="T" 
											<%= "T".equals(goods.getSoldOutFlag()) ? " checked" : "" %>/> 품절
										</label>&nbsp;&nbsp;
										<label>
											<input type="radio" id="good_stock_type2"
											name="soldOutFlag" value="F" 
											<%= "F".equals(goods.getSoldOutFlag()) ? " checked" : "" %>/> 잔여수량
										</label> 
										<input type="text"
										id="good_stock" name="amount" value="<%= "F".equals(goods.getSoldOutFlag()) ? goods.getAmount() : "" %>" size="5"
										class="inputbox2 number_only"/>
								</tr>
							</tbody>
						</table>

						<!--이미지등록-->
						<div class="subtitle">
							<img
								src="http://localhost/assets/images/manage/goods/register/bul_subtitle.gif" />
							상품 이미지
						</div>

						<div id="area_file" style="display: block">
							<table id="good_file_input_area" cellpadding="0" cellspacing="1"
								border="0" class="tbstyleB" width="100%">
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" class="top2"></td>
									</tr>

									<tr>
										<td class="label">기본 이미지</td>
										<td class="box text">
											<div id="good_file_big_input_area">
												<input type="hidden" name="defaultImageOrigin" value="<%= goods.getDefaultImage() %>" />
												<input type="file" name="defaultImage" style="width: 300px" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!--상세설명-->
						<div class="subtitle">
							<img
								src="http://localhost/assets/images/manage/goods/register/bul_subtitle.gif" />
							상세설명 이미지
						</div>

							<table cellpadding="0" cellspacing="1" border="0"
								class="tbstyleB" width="100%">
								<colgroup>
									<col width="15%" />
									<col width="#" />
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" class="top2"></td>
									</tr>
									<tr>
										<td class="label">상세설명 이미지</td>
										<td class="box text">
											<input type="hidden" name="detailImageOrigin" value="<%= goods.getDetailImage() %>" />
											<input type="file" name="detailImage" style="width: 300px" />
										</td>
									</tr>
								</tbody>
							</table>
						<div class="alignCenter">
							<% if(request.getParameter("code") == null){ %>
								<input type="button" id="btn-register" class="btn btn-success btn-sm detail-control" value="등록하기" />
							<% } else { %>
								<input type="button" id="btn-update" class="btn btn-warning btn-sm detail-control" value="수정하기" />
								<input type="button" id="btn-delete" class="btn btn-danger btn-sm detail-control" value="삭제하기" />
								<input type="button" id="btn-soldout" class="btn btn-secondary btn-sm detail-control" value="품절처리하기" />
							<% } %>
								<input type="button" id="btn-back" class="btn btn-success btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/>
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>