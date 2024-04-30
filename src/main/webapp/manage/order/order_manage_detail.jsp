<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240430173216">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script type="text/javascript">
	$(function() {
		$("#order_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<script src="http://demofran.com/js/jquery-1.8.3.min.js"></script>
<script src="http://demofran.com/js/jquery-ui-1.10.3.custom.js"></script>
<script src="http://demofran.com/js/common.js?ver=20240430173216"></script>
<script src="http://demofran.com/js/categorylist.js?ver=20240430173216"></script>
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
							aria-current="page">주문 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">주문 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->

			<div id="sodr_pop" class="new_win">
				<h1>주문내역 수정</h1>

				<section id="anc_sodr_list">
					<h4 class="anc_tit">주문상품 목록</h4>
					<ul class="anchor">
						<li><a href="#anc_sodr_list">주문상품 목록</a></li>
						<li><a href="#anc_sodr_pay">주문결제 내역</a></li>
						<li><a href="#anc_sodr_memo">관리자메모</a></li>
						<li><a href="#anc_sodr_addr">주문자/배송지 정보</a></li>
					</ul>
					<div class="local_desc02 local_desc">
						<p>
							주문일시 <strong>2024-04-05 11:53 (금)</strong> <span class="fc_214">|</span>
							주문총액 <strong>136,240</strong>원 <a
								href="javascript:win_open('http://demofran.com/admin/order/order_print.php?od_id=24040511530204','order_print','670','600','yes');"
								class="btn_small blue fr"><i class="fa fa-print"></i> 주문서출력</a>
						</p>
					</div>

					<form name="frmorderform" method="post"
						action="./pop_orderstatusupdate.php"
						onsubmit="return form_submit(this);">
						<input type="hidden" name="od_id" value="24040511530204">
						<input type="hidden" name="od_hp" value="010-0000-0000"> <input
							type="hidden" name="od_email" value="admin@demofran.com">
						<input type="hidden" name="mb_id" value="admin"> <input
							type="hidden" name="pt_id" value=""> <input type="hidden"
							name="pg_cancel" value="0">

						<div class="tbl_head01">
							<table id="sodr_list">
								<colgroup>
									<col class="w40">
									<col class="w60">
									<col>
									<col class="w90">
									<col class="w90">
									<col class="w60">
									<col class="w70">
									<col class="w70">
									<col class="w70">
									<col class="w70">
									<col class="w70">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><label for="chkall" class="sound_only">주문
												전체</label> <input type="checkbox" name="chkall" value="1"
											id="chkall" onclick="check_all(this.form);"></th>
										<th scope="col">이미지</th>
										<th scope="col">주문상품</th>
										<th scope="col">주문상태</th>
										<th scope="col">판매자</th>
										<th scope="col">수량</th>
										<th scope="col">상품금액</th>
										<th scope="col">배송비</th>
										<th scope="col">쿠폰할인</th>
										<th scope="col">포인트결제</th>
										<th scope="col">실결제액</th>
									</tr>
								</thead>
								<tbody class="list">
									<tr class="list0">
										<td><input type="hidden" name="od_no[0]"
											value="1175536948"> <input type="hidden"
											name="current_status[0]" value="6"> <label
											for="chk_0" class="sound_only">24040511530204</label> <input
											type="checkbox" name="chk[]" value="0" id="chk_0"></td>
										<td><a
											href="http://demofran.com/shop/view.php?index_no=14"
											target="_blank"><img
												src="http://demofran.com/data/order/2404/24040511530204/thumb-95S2lNwQks3caPhpLyDPjPWygyeCsC_40x40.jpg"
												width="40" height="40"></a></td>
										<td class="tal"><a
											href="http://demofran.com/admin/goods.php?code=form&amp;w=u&amp;gs_id=14"
											target="_blank">Mathey-Tissot 심플 서류가방+백팩 블랙세트</a> [비과세상품]
											<div class="sod_opt">
												<ul>
												</ul>
											</div></td>
										<td>취소</td>
										<td>본사</td>
										<td>1</td>
										<td class="tar">70,000</td>
										<td class="tar">0</td>
										<td class="tar">0</td>
										<td class="tar">0</td>
										<td class="td_price">70,000</td>
									</tr>
									<tr class="list1">
										<td><input type="hidden" name="od_no[1]"
											value="1121569725"> <input type="hidden"
											name="current_status[1]" value="6"> <label
											for="chk_1" class="sound_only">24040511530204</label> <input
											type="checkbox" name="chk[]" value="1" id="chk_1"></td>
										<td><a
											href="http://demofran.com/shop/view.php?index_no=20"
											target="_blank"><img
												src="http://demofran.com/data/order/2404/24040511530204/thumb-30323_NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_40x40.jpg"
												width="40" height="40"></a></td>
										<td class="tal"><a
											href="http://demofran.com/admin/goods.php?code=form&amp;w=u&amp;gs_id=20"
											target="_blank">Guy Laroche 토리노 지퍼 동전 카드케이스 GL-9300-TR-NY</a>
											<div class="sod_opt">
												<ul>
												</ul>
											</div></td>
										<td>취소</td>
										<td><span class="sv_wrap"> <a
												href="javascript:void(0);" class="sv_member">AP-100001</a> <span
												class="sv"> <a
													href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb2"
													onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
													<a
													href="http://demofran.com/admin/pop_sellerform.php?mb_id=tubeweb2"
													onclick="win_open(this,'win_seller','1200','600','yes');return false;">공급사정보수정</a>
													<a
													href="http://demofran.com/admin/formmail.php?mb_id=tubeweb2&amp;name=AP-100001&amp;email=2qyUnKnIk5ilmtHHn9JelaLO"
													onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
													<a
													href="http://demofran.com/admin/sms/sms_user.php?ph=01022222222"
													onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
													<a
													href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2"
													target="_blank">쇼핑몰로그인</a> <a
													href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2&amp;lg_type=S"
													target="_blank">공급사로그인</a>
											</span>

												<noscript class="sv_nojs">
													<span class="sv"> <a
														href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb2"
														onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
														<a
														href="http://demofran.com/admin/pop_sellerform.php?mb_id=tubeweb2"
														onclick="win_open(this,'win_seller','1200','600','yes');return false;">공급사정보수정</a>
														<a
														href="http://demofran.com/admin/formmail.php?mb_id=tubeweb2&name=AP-100001&email=2qyUnKnIk5ilmtHHn9JelaLO"
														onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
														<a
														href="http://demofran.com/admin/sms/sms_user.php?ph=01022222222"
														onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
														<a
														href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2"
														target="_blank">쇼핑몰로그인</a> <a
														href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2&lg_type=S"
														target="_blank">공급사로그인</a>
													</span>
												</noscript></span></td>
										<td>1</td>
										<td class="tar">29,520</td>
										<td class="tar">0</td>
										<td class="tar">0</td>
										<td class="tar">0</td>
										<td class="td_price">29,520</td>
									</tr>
									<tr class="list0">
										<td><input type="hidden" name="od_no[2]"
											value="1274016261"> <input type="hidden"
											name="current_status[2]" value="6"> <label
											for="chk_2" class="sound_only">24040511530204</label> <input
											type="checkbox" name="chk[]" value="2" id="chk_2"></td>
										<td><a
											href="http://demofran.com/shop/view.php?index_no=16"
											target="_blank"><img
												src="http://demofran.com/data/order/2404/24040511530204/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_40x40.jpg"
												width="40" height="40"></a></td>
										<td class="tal"><a
											href="http://demofran.com/admin/goods.php?code=form&amp;w=u&amp;gs_id=16"
											target="_blank">Guy Laroche 사피아노 핸들 카드케이스 GL-9307-OR</a>
											[비과세상품]
											<div class="sod_opt">
												<ul>
												</ul>
											</div></td>
										<td>취소</td>
										<td>본사</td> 
										<td>1</td>
										<td class="tar">36,720</td>
										<td class="tar">0</td>
										<td class="tar">0</td>
										<td class="tar">0</td>
										<td class="td_price">36,720</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="local_frm02">
							<i class="ionicons ion-alert-circled fc_red"></i> 환불, 반품완료 후 <b>"PG부분취소"</b>를
							통해 신용카드 및 계좌이체 결제취소를 해주셔야 <b>"PG 신용카드 승인취소 처리"</b>가 완료됩니다.
						</div>

					</form>

					<div class="od_test_caution">주의) 이 주문은 테스트용으로 실제 결제가 이루어지지
						않았으므로 절대 배송하시면 안됩니다.</div>

				</section>


				<section id="anc_sodr_pay" class="new_win_desc mart30">
					<h3 class="anc_tit">주문결제 내역</h3>
					<ul class="anchor">
						<li><a href="#anc_sodr_list">주문상품 목록</a></li>
						<li><a href="#anc_sodr_pay">주문결제 내역</a></li>
						<li><a href="#anc_sodr_memo">관리자메모</a></li>
						<li><a href="#anc_sodr_addr">주문자/배송지 정보</a></li>
					</ul>
					<form name="frmorderreceiptform" action="./pop_orderformupdate.php"
						method="post" autocomplete="off">
						<input type="hidden" name="od_id" value="24040511530204">
						<input type="hidden" name="mod_type" value="receipt">

						<div class="compare_wrap">
							<section id="anc_sodr_chk" class="compare_left">
								<h3>결제상세정보 확인</h3>

								<div class="tbl_frm01">
									<table>
										<colgroup>
											<col class="w150">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">총 주문금액</th>
												<td class="td_price">136,240원</td>
											</tr>
											<tr>
												<th scope="row">총 상품금액</th>
												<td class="td_price bg0">136,240원</td>
											</tr>
											<tr>
												<th scope="row">총 배송비</th>
												<td class="td_price fc_197">(+) 0원</td>
											</tr>
											<tr>
												<th scope="row">총 쿠폰할인</th>
												<td class="td_price fc_red">(-) 0원</td>
											</tr>
											<tr>
												<th scope="row">포인트결제</th>
												<td class="td_price fc_red">(-) 0원</td>
											</tr>
											<tr>
												<th scope="row">실 결제금액</th>
												<td class="td_price bg0">136,240원</td>
											</tr>
											<tr>
												<th scope="row" class="fc_red">환불액(PG승인취소)</th>
												<td class="td_price bg1 fc_red">(-) 0원</td>
											</tr>
											<tr>
												<th scope="row">포인트적립</th>
												<td class="tar">0원</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>

							<section id="anc_sodr_paymo" class="compare_right">
								<h3>결제상세정보 수정</h3>

								<div class="tbl_frm01">
									<table>
										<colgroup>
											<col class="w150">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">주문번호</th>
												<td>24040511530204</td>
											</tr>
											<tr>
												<th scope="row">주문일시</th>
												<td>2024-04-05 11:53:50 (금)</td>
											</tr>
											<tr>
												<th scope="row">주문채널</th>
												<td><strong>admin</strong> PC 쇼핑몰에서 주문</td>
											</tr>
											<tr>
												<th scope="row"><label for="pt_id">가맹점 ID</label></th>
												<td><input type="text" name="pt_id" value="" id="pt_id"
													class="frm_input" placeholder="없음"> (배송완료 후 수정불가)</td>
											</tr>
											<tr>
												<th scope="row">결제방법</th>
												<td>무통장</td>
											</tr>
											<tr>
												<th scope="row"><label for="bank">계좌번호</label></th>
												<td><select id="bank" name="bank">
														<option value="">선택하십시오</option>
														<option value="우리은행 1005-123-316074 샘플샵"
															selected="selected">우리은행 1005-123-316074 샘플샵</option>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="deposit_name">입금자명</label></th>
												<td><input type="text" name="deposit_name" value="관리자"
													id="deposit_name" class="frm_input" placeholder="실 입금자명"></td>
											</tr>
											<tr>
												<th scope="row">무통장 입금액</th>
												<td>136,240원</td>
											</tr>
											<tr>
												<th scope="row">입금확인일시</th>
												<td>입금 확인일시 정보가 없습니다.</td>
											</tr>





											<tr>
												<th scope="row">개별 전자결제(PG)</th>
												<td><strong>admin</strong> PG설정으로 주문</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>
						</div>

						<div class="btn_confirm">
							<input type="submit" value="결제정보 수정" class="btn_medium">
							<a href="javascript:window.close();" class="btn_medium bx-white">닫기</a>
						</div>
					</form>
				</section>

				<section id="anc_sodr_memo">
					<h3 class="anc_tit">관리자메모</h3>
					<ul class="anchor">
						<li><a href="#anc_sodr_list">주문상품 목록</a></li>
						<li><a href="#anc_sodr_pay">주문결제 내역</a></li>
						<li><a href="#anc_sodr_memo">관리자메모</a></li>
						<li><a href="#anc_sodr_addr">주문자/배송지 정보</a></li>
					</ul>
					<div class="local_desc02 local_desc">
						<p>현재 열람 중인 주문에 대한 내용을 메모하는곳입니다.</p>
					</div>

					<form name="frmorderform3" action="./pop_orderformupdate.php"
						method="post">
						<input type="hidden" name="od_id" value="24040511530204">
						<input type="hidden" name="mod_type" value="memo"> <label
							for="shop_memo" class="sound_only">관리자메모</label>
						<textarea name="shop_memo" id="shop_memo" rows="8"
							class="frm_textbox">미입금 자동 주문취소 - 2024-04-13 01:08:26 (취소이유 : 7일경과)</textarea>

						<div class="btn_confirm">
							<input type="submit" value="관리자메모 수정" class="btn_medium">
							<a href="javascript:window.close();" class="btn_medium bx-white">닫기</a>
						</div>
					</form>
				</section>

				<section id="anc_sodr_addr">
					<h3 class="anc_tit">주문자/배송지 정보</h3>
					<ul class="anchor">
						<li><a href="#anc_sodr_list">주문상품 목록</a></li>
						<li><a href="#anc_sodr_pay">주문결제 내역</a></li>
						<li><a href="#anc_sodr_memo">관리자메모</a></li>
						<li><a href="#anc_sodr_addr">주문자/배송지 정보</a></li>
					</ul>
					<form name="frmorderform2" action="./pop_orderformupdate.php"
						method="post">
						<input type="hidden" name="od_id" value="24040511530204">
						<input type="hidden" name="mod_type" value="info">

						<div class="compare_wrap">
							<section id="anc_sodr_orderer" class="compare_left">
								<h3>주문하신 분</h3>

								<div class="tbl_frm01">
									<table>
										<colgroup>
											<col class="w100">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="od_name">이름</label></th>
												<td><input type="text" name="name" value="관리자"
													id="od_name" required="" class="frm_input required"
													style="background-position: right top; background-repeat: no-repeat;"></td>
											</tr>
											<tr>
												<th scope="row"><label for="telephone">전화번호</label></th>
												<td><input type="text" name="telephone" value=""
													id="telephone" class="frm_input"></td>
											</tr>
											<tr>
												<th scope="row"><label for="cellphone">핸드폰</label></th>
												<td><input type="text" name="cellphone"
													value="010-0000-0000" id="cellphone" required=""
													class="frm_input required"
													style="background-position: right top; background-repeat: no-repeat;"></td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td><label for="zip" class="sound_only">우편번호</label> <input
													type="text" name="zip" value="54929" id="zip" required=""
													class="frm_input required" size="5" maxlength="5"
													style="background-position: right top; background-repeat: no-repeat;">
													<button type="button" class="btn_small grey"
														onclick="win_zip('frmorderform2', 'zip', 'addr1', 'addr2', 'addr3', 'addr_jibeon');">주소검색</button>
													<br> <span id="od_win_zip" style="display: block"></span>
													<input type="text" name="addr1"
													value="전북특별자치도 전주시 덕진구 건산로 12" id="addr1" required=""
													class="frm_input required" size="35"
													style="background-position: right top; background-repeat: no-repeat;">
													<label for="addr1">기본주소</label><br> <input type="text"
													name="addr2" value="ㄴㅇㄹ" id="addr2" class="frm_input"
													size="35"> <label for="addr2">상세주소</label><br>
													<input type="text" name="addr3" value=" (진북동)" id="addr3"
													class="frm_input" size="35"> <label for="addr3">참고항목</label><br>
													<input type="hidden" name="addr_jibeon" value="R">
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="od_email">E-mail</label></th>
												<td><input type="text" name="email"
													value="admin@demofran.com" id="od_email" required=""
													class="frm_input required" size="30"
													style="background-position: right top; background-repeat: no-repeat;"></td>
											</tr>
											<tr>
												<th scope="row"><span class="sound_only">주문하신 분
												</span>IP Address</th>
												<td>58.76.98.244</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>

							<section id="anc_sodr_taker" class="compare_right">
								<h3>받으시는 분</h3>

								<div class="tbl_frm01">
									<table>
										<colgroup>
											<col class="w100">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="b_name">이름</label></th>
												<td><input type="text" name="b_name" value="관리자"
													id="b_name" required="" class="frm_input required"
													style="background-position: right top; background-repeat: no-repeat;"></td>
											</tr>
											<tr>
												<th scope="row"><label for="b_telephone">전화번호</label></th>
												<td><input type="text" name="b_telephone" value=""
													id="b_telephone" class="frm_input"></td>
											</tr>
											<tr>
												<th scope="row"><label for="b_cellphone">핸드폰</label></th>
												<td><input type="text" name="b_cellphone"
													value="010-0000-0000" id="b_cellphone" required=""
													class="frm_input required"
													style="background-position: right top; background-repeat: no-repeat;"></td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td><label for="b_zip" class="sound_only">우편번호</label>
													<input type="text" name="b_zip" value="54929" id="b_zip"
													required="" class="frm_input required" size="5"
													maxlength="5"
													style="background-position: right top; background-repeat: no-repeat;">
													<button type="button" class="btn_small grey"
														onclick="win_zip('frmorderform2', 'b_zip', 'b_addr1', 'b_addr2', 'b_addr3', 'b_addr_jibeon');">주소검색</button>
													<br> <input type="text" name="b_addr1"
													value="전북특별자치도 전주시 덕진구 건산로 8" id="b_addr1" required=""
													class="frm_input required" size="35"
													style="background-position: right top; background-repeat: no-repeat;">
													<label for="b_addr1">기본주소</label><br> <input
													type="text" name="b_addr2" value="ㅁㄴㅇㄹ" id="b_addr2"
													class="frm_input" size="35"> <label for="b_addr2">상세주소</label><br>
													<input type="text" name="b_addr3" value=" (진북동)"
													id="b_addr3" class="frm_input" size="35"> <label
													for="b_addr3">참고항목</label><br> <input type="hidden"
													name="b_addr_jibeon" value="R"></td>
											</tr>
											<tr>
												<th scope="row">전달 메세지</th>
												<td>없음</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>

						</div>

						<div class="btn_confirm">
							<input type="submit" value="주문자/배송지 정보 수정" class="btn_medium">
							<a href="javascript:window.close();" class="btn_medium bx-white">닫기</a>
						</div>
					</form>
				</section>

			</div>

			<script>
				$(function() {
					// 부분취소창
					$(".orderpartcancel")
							.on(
									"click",
									function() {
										var href = this.href;
										window
												.open(href, "partcancelwin",
														"left=100, top=100, width=600, height=350, scrollbars=yes");
										return false;
									});
				});

				function form_submit(f) {
					var status = document.pressed;

					if (!is_checked("chk[]")) {
						alert("처리할 자료를 하나 이상 선택해 주십시오.");
						return false;
					}

					if (status == "운송장번호수정") {
						f.action = "./pop_orderbaesongupdate.php";
						return true;
					}

					var $chk = $("input[name='chk[]']");
					var chk_cnt = $chk.size();
					var chked_cnt = $chk.filter(":checked").size();

					if (status == "입금완료" || status == "입금대기"
							|| status == "주문취소" || status == "전체환불"
							|| status == "전체반품") {
						if (chk_cnt != chked_cnt) {
							alert("처리할 자료를 모두 선택해주세요.\n\n일부 상품만 처리할 수 없습니다.");
							return false;
						}
					}

					if (confirm("주문상태를 변경하시겠습니까?")) {
						return true;
					} else {
						return false;
					}
				}
			</script>


			<div id="ajax-loading">
				<img src="http://demofran.com/img/ajax-loader.gif">
			</div>

			<script
				src="http://demofran.com/admin/js/admin.js?ver=20240430173216"></script>

			<script src="http://demofran.com/js/wrest.js"></script>

			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>