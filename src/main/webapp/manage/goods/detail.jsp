<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function() {
		$("#goods_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
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
</style>
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
					<form
						id="dataForm" 
						name="dataForm"
						action="https://demo01.swm.whoismall.com/admin/" method="post"
						enctype="multipart/form-data" autocomplete="off">
						<div class="subtitle">
							<img
								src="http://localhost/online-shop/assets/images/manage/goods/register/bul_subtitle.gif" />
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
									<input type="text" name="good_name" value="" size="50" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>

								<tr>
									<td class="label">간략설명</td>
									<td class="box text"><input type="text" name="good_note"
										value="" style="width: 100%" class="inputbox" /></td>
								</tr>
								<tr>
									<td class="label">제조사</td>
									<td class="box text">
										<label>
											<input type="radio"
											id="good_code_type1" name="good_code_type" value="1"
											checked="" /> 삼성
										</label>
										<label>
											<input
											type="radio" id="good_code_type0" name="good_code_type"
											value="0" /> 애플
										</label> 
									</td>
								</tr>

								<tr>
									<td class="label">모델</td>
									<td class="box text">
										<select name="discount_type[]" id="discount_type00">
											<option value="0">S24</option>
											<option value="1" selected="">ZFLIP</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="label">재질</td>
									<td class="box text">
										<label>
											<input type="radio"
											id="good_code_type1" name="good_code_type" value="1"
											checked="" /> 자동입력
										</label>&nbsp;&nbsp; 
										<label>
											<input
											type="radio" id="good_code_type0" name="good_code_type"
											value="0" /> 수동입력
										</label> 
									</td>
								</tr>
							</tbody>
						</table>

						<!--가격 / 판매정보-->
						<div class="subtitle">
							<img
								src="http://localhost/online-shop/assets/images/manage/goods/register/bul_subtitle.gif" />
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
									<td class="label">매입가</td>
									<td class="box text"><input type="text"
										name="good_buy_price" id="good_buy_price" value="" size="10"
										class="inputbox2 price_only" />원&nbsp;&nbsp;</td>
								</tr>

								<tr id="good_opt_grid_setting" style="display: none">
									<td class="label">가격선택옵션 설정</td>
									<td class="box text"><input type="hidden"
										id="saved_price_option" name="saved_price_option" value="" />
										<table cellpadding="0" cellspacing="1" border="0"
											class="tbstyle06" width="100%">
											<colgroup>
												<col width="*" />
												<col width="*" />
												<col width="*" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th>옵션 개수</th>
													<td class="boxA"><select name="good_opt_info_count"
														id="good_opt_info_count">
															<option value="1">1개</option>
															<option value="2">2개</option>
													</select></td>
													<th>출력 방식</th>
													<td class="boxA"><select name="good_opt_sel_type"
														id="good_opt_sel_type">
															<option value="0">단일선택</option>
															<option value="1">분리선택</option>
													</select></td>
												</tr>
											</tbody>
										</table>
										<div class="subtitle">
											<img
												src="http://localhost/online-shop/assets/images/manage/goods/register/bul_ssubtitle.gif" />
											옵션정보 입력<span class="fc_s fc_blue">※ 옵션명과 옵션값을 입력한 뒤 <img
												src="http://localhost/online-shop/assets/images/manage/goods/register/btn_setPriceRestock.gif"
												alt="가격+재고 설정하기" />버튼을 클릭해 주세요.
											</span>
										</div>
										<table cellpadding="0" cellspacing="0" border="0"
											class="tbstyle06" width="100%">
											<colgroup>
												<col width="20%" />
												<col width="55%" />
												<col width="20%" />
											</colgroup>
											<tbody>
												<tr>
													<th>옵션명</th>
													<th>옵션값(';'로 구분)</th>
													<td class="boxA" id="option_info_cols" rowspan="3"><a
														href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;cate_code=GD&amp;ch=goods#"
														id="good_opt_grid_set"><img
															src="http://localhost/online-shop/assets/images/manage/goods/register/btn_setPriceRestock.gif"
															alt="가격+재고 설정하기" /></a></td>
												</tr>
												<tr id="option_info_name_1">
													<td class="box text"><input type="text"
														id="good_opt_row_name" name="good_opt_row_name" value=""
														class="inputbox" style="width: 95%" /></td>
													<td class="box text"><input type="text"
														id="good_opt_row_val" name="good_opt_row_val" value=""
														class="inputbox" style="width: 95%" /></td>
												</tr>
												<tr id="option_info_name_2">
													<td class="box text"><input type="text"
														id="good_opt_col_name" name="good_opt_col_name" value=""
														class="inputbox" style="width: 95%" /></td>
													<td class="box text"><input type="text"
														id="good_opt_col_val" name="good_opt_col_val" value=""
														class="inputbox" style="width: 95%" /></td>
												</tr>
											</tbody>
										</table>
										<div id="good_grid_option_table" style="display: none">
											<div class="subtitle">
												<img
													src="http://localhost/online-shop/assets/images/manage/goods/register/bul_ssubtitle.gif" />
												옵션별 가격+재고 설정
											</div>
											<span>일괄 입력하기 : 판매가 <input type="text"
												id="batch_good_opt_val_price"
												name="batch_good_opt_val_price" class="inputbox price_only"
												size="10" />원, 재고량 <input type="text"
												id="batch_good_opt_val_stock"
												name="batch_good_opt_val_stock" class="inputbox price_only"
												size="10" />개, 관리코드 <input type="text"
												id="batch_good_opt_manage_code"
												name="batch_good_opt_manage_code" class="inputbox" size="15" />
												<a
												href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;cate_code=GD&amp;ch=goods#"
												id="good_opt_grid_batch"><img
													src="http://localhost/online-shop/assets/images/manage/goods/register/btn_batch_input.gif" /></a>
											</span>
											<div id="good_grid_option_area"></div>
										</div></td>
								</tr>
								<tr>
									<td class="label">재고량</td>
									<td class="box text"><label><input type="radio"
											id="good_stock_type1" name="good_stock_type" value="1" /> 품절</label>&nbsp;&nbsp;
										<label><input type="radio" id="good_stock_type2"
											name="good_stock_type" value="2" /> 잔여수량</label> <input type="text"
										id="good_stock" name="good_stock" value="" size="5"
										class="inputbox2 number_only" disabled="disabled" /><span
										id="good_stock_unit"> 개</span></td>
								</tr>
							</tbody>
						</table>

						<!--이미지등록-->
						<div class="subtitle">
							<img
								src="http://localhost/online-shop/assets/images/manage/goods/register/bul_subtitle.gif" />
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
												확대 <span name="good_file_upload_area"> <a
													href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;cate_code=GD&amp;ch=goods#"
													name="good_file_big_name"
													onclick="onUploadClick(this); return false;"><img
														src="http://localhost/online-shop/assets/images/manage/goods/register/btn_popupSearch.gif"
														align="absmiddle" /></a> <span name="good_file_upload_result"></span>
												</span> <span name="good_file_url_area" style="display: none">
													<input type="text" name="good_file_big_url" value=""
													size="50" class="inputbox" />
												</span> <span class="fc_s"><span class="fc_blue">권장사이즈(700X700)</span></span>
											</div>
											<div id="good_file_view_input_area" style="display: none">
												상세 <span name="good_file_upload_area"> <a
													href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;cate_code=GD&amp;ch=goods#"
													name="good_file_view_name"
													onclick="onUploadClick(this); return false;"><img
														src="http://localhost/online-shop/assets/images/manage/goods/register/btn_popupSearch.gif"
														align="absmiddle" /></a> <span id="good_file_upload_result1"
													name="good_file_upload_result"></span>
												</span> <span name="good_file_url_area" style="display: none">
													<input type="text" name="good_file_view_url" value=""
													size="50" class="inputbox" />
												</span> <span class="fc_s"><span class="fc_blue">권장사이즈(550X550)</span></span>
												<br /> 목록 <span name="good_file_upload_area"> <a
													href="https://demo01.swm.whoismall.com/admin/?act=goods.good_form&amp;cate_code=GD&amp;ch=goods#"
													name="good_file_list_name"
													onclick="onUploadClick(this); return false;"><img
														src="http://localhost/online-shop/assets/images/manage/goods/register/btn_popupSearch.gif"
														align="absmiddle" /></a> <span id="good_file_upload_result2"
													name="good_file_upload_result"></span>
												</span> <span name="good_file_url_area" style="display: none">
													<input type="text" name="good_file_list_url" value=""
													size="50" class="inputbox" />
												</span> <span class="fc_s"><span class="fc_blue">권장사이즈(410X410)</span></span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!--상세설명-->
						<div class="subtitle">
							<img
								src="http://localhost/online-shop/assets/images/manage/goods/register/bul_subtitle.gif" />
							상세설명
						</div>

						<div id="area_content">
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
										<td class="label">상세설명</td>
										<td class="box text"><textarea class="textarea"
												id="good_content" name="good_content"
												style="width: 100%; height: 300px; display: none;"></textarea>
											<iframe frameborder="0" scrolling="no"
												src="./smart_editor/SmartEditor2Skin.html"
												style="width: 100%; height: 349px"></iframe></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--관련상품-->
						<div class="alignCenter">
							<img
								src="http://localhost/online-shop/assets/images/manage/goods/register/btn_allApply.gif"
								onclick="onSubmit(event);" style="cursor: pointer" />
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>