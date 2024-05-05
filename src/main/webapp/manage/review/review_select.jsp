<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#review_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<body class="mainlayout">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="125" valign="top"><link type="text/css" href="https://demo01.swm.whoismall.com/common/css/admin_general.css?v=202008110000" rel="stylesheet">
		
<link rel="stylesheet" href="https://demo01.swm.whoismall.com/common/css/admin_community.css?v=202008110000" type="text/css" />
<link href="https://demo01.swm.whoismall.com/common/css/bbs_data_naver.css?v=202008110000" type="text/css" rel="stylesheet" >
<!-- <script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/jquery.min.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/jquery-ui.min.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/sky.jquery.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/durian.common.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/sky.timer.js?v=202008110000"></script>

<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/durian.buy_good.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/durian.buy_good_list.js?v=202008110000"></script>

<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/durian.buy_dlv_addr.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/durian.buy_memo.js?v=202008110000"></script>
<script type="text/javascript" src="https://demo01.swm.whoismall.com/common/js/durian.user_memo.js?v=202008110000"></script> -->

<!-- golgolz end -->
</head>
<body>
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
							class="opacity-5 text-dark" href="http://localhost/online-shop/manage/index.jsp">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page"><a href="http://localhost/online-shop/manage/review/review.jsp">리뷰 관리</a></li>
					</ol>
					<h6 class="font-weight-bolder mb-0"><a href="http://localhost/online-shop/manage/review/review_select.jsp">리뷰 상세 보기</a></h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div class="contents">
		<!--begin of submain-->
		<form name="dataForm" action="./" method="post">
		<input type="hidden" name="act"  value="community.index">
		<input type="hidden" name="ch"   value="community">
		<input type="hidden" name="mode" value="">
		<input type="hidden" name="oc"   value="">
		<input type="hidden" name="os"   value="">
		<input type="hidden" name="bbs_code"  value="user_review">
		<input type="hidden" name="bbs_mode" value="view">
		<input type="hidden" name="bbs_seq"  value="23">

		<!-- 검색 -->
		<!-- <div class="subtitle"><img src="/admin/images/community/bul_subtitle.gif"> 게시물 보기</div> -->
		<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
			<col width="120">
		    <col width="*">
			<col width="120">
		    <col width="*">
			<tr><td colspan="4" class="top5"></td></tr>
			<tr>
				<td class="label">작성자</td>

				<td class="box text"><a href="#" ui_user="imean882" user_id="imean882" style="color:;">최고관리자 (imean882 - )</a></td>
				<td class="label">작성시각</td>
				<td class="box text">2023년 04월 25일 11:13:13 <span class="fc_red">(210.107.65.112)</span></td>
			</tr>
						<tr>
				<td class="label">관련 상품</td>
				<td class="box text" colspan="3">
					<a href="/?act=shop.goods_view&GS=9" target="_blank"><img src="https://demo01.swm.whoismall.com/data/goods/0/9/16242333.list.jpg" onerror="Durian.imgDefault(this, '/data/file/no_image.png');" class="imgborder" width="50" height="50">히말라야 장벽 수분 크림(G638D9CD4CCBFA)</a>
				</td>
			</tr>
						<!-- <tr>
				<td class="label">이메일</td>
				<td class="box text">
					imean00@whois.co.kr					<a href="#" id="user_email" email="imean00@whois.co.kr" user_name='최고관리자'><img src="/admin/images/common/icon_email_x.gif"></a>				</td>
				<td class="label">휴대전화</td>
				<td class="box text">
														</td>
			</tr> -->
			<!-- <tr>
				<td class="label">조회수</td>
				<td class="box text">11</td>
				<td class="label">추천수</td>
				<td class="box text">0</td>
			</tr> -->
									<!-- <tr>
				<td class="label">평가</td>
				<td class="box text" colspan="3">
										<img src="/admin/images/community/icon_star05.gif">
									</td>
			</tr> -->
						<tr>
				<td class="label">제목</td>
				<td class="box text" colspan="3">반신반의하면서 샀거든요? 효과 짱이에요.</td>
			</tr>
			<tr>
				<td class="label">내용</td>
				<td width="745" class="box text se2_inputarea" colspan="3"><p><span style="color: rgb(0, 0, 0);">﻿요즘 피부가 너무 건조해서 이것저것 사서 써보고 있는데 다들 그냥 그렇더라구요.</span>&nbsp;</p><p>더 강력한 걸 사고 싶어서 찾다가 이건 괜찮은가 싶어서 샀는데 너무 좋아요!</p><p>자기 전에 잔뜩 바르고 자면 그 다음날 화장 너무 잘 먹어요.</p><p>피부 장벽도 좀 튼튼해진 거 같고! 저한텐 너무 잘 맞아서 좋네요. 평생 쓸거예요!</p></td>
			</tr>
									<!-- <tr>
				<td class="label">공지글 여부</td>
				<td class="box text" colspan="3">X</td>
			</tr>
			<tr>
				<td class="label">베스트글 여부</td>
				<td class="box text" colspan="3">O</td>
			</tr> -->
			<tr>
				<td class="label">승인 여부</td>
				<td class="box text" colspan="3">O</td>
			</tr>
		</table>

		<!-- 하단 처리 버튼 -->
		<div class="alignCenter">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="left"><a href="http://localhost/online-shop/manage/review/review.jsp#" id="mode_bbs1" mode="list"><img src="https://demo01.swm.whoismall.com/admin/images/community/btn_list.gif" alt="목록"></a></td>
					<td align="right">
						<!-- <a href="#" id="mode_bbs2" mode="modify"><img src="/admin/images/community/btn_change.gif" alt="수정"></a> -->
						<a href="#" id="mode_bbs3" mode="delete"><img src="https://demo01.swm.whoismall.com/admin/images/community/btn_del.gif" alt="삭제"></a>
						<!-- <a href="#" id="mode_bbs4" mode="reply"><img src="/admin/images/community/btn_answer.gif" alt="답변"></a>
						<a href="#" id="mode_bbs5" mode="write"><img src="/admin/images/community/btn_regist.gif" alt="등록"></a> -->
					</td>
				</tr>
			</table>
		</div>
		</form>

				<!--  댓글등록
		<form name="dataForm3" action="./" method="post">
		<input type="hidden" name="act" value="community.board_comment_write">
		<input type="hidden" name="ch" value="community">
		<input type="hidden" name="mode" value="">
		<input type="hidden" name="bbs_code" value="user_review">
		<input type="hidden" name="bbs_seq" value="23">

		<div class="alignCenter" style="display:inline-block; margin-bottom:10px; padding:5px 5px 5px 5px; width:100%; border:1px solid #ddd;">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				<col width="8%" align="left">
				<col width="12%" align="center">
				<col width="70%" align="center">
				<col width="10%" align="center">
				<tr>
					<th>이름</th>
					<td><input type="text" name="bbs_cmt_name" class="inputbox" style="width:100px;" value="최고관리자"></td>
					<td rowspan="2"><textarea name="bbs_cmt_content" class="textarea" style="height:50px;width:98%;background-color:whitesmoke;"></textarea></td>
					<td rowspan="2" align="center"><a href="#" id="write_cmt1"><img src="/admin/images/button/btn_regist04.gif"></a></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" autocomplete="off" name="bbs_cmt_passwd" value="" class="inputbox" style="width:100px;"></td>
				</tr>
			</table>
		</div>

		</form> -->

		<!-- 댓글목록 -->
		<!-- <form name="dataForm2" action="./" method="post">
		<input type="hidden" name="act" value="community.board_comment_act">
		<input type="hidden" name="ch" value="community">
		<input type="hidden" name="mode" value="">
		<input type="hidden" name="bbs_code" value="user_review">
		<input type="hidden" name="bbs_seq" value="23">
		<input type="hidden" name="bbs_cmt_seq" value="">

		<div>
			<ul>
							</ul>
		</div>

		</form> -->
		
		<!-- End of submain -->
	</div>
</div></td>
				</tr>
			</table>
		</td>
	</tr>
	<!-- <tr>
		<td height="61">begin of bottom
<div id="footer"><span class="bottomlayout "><img src="/admin/images/common/img_bottom.gif" alt="후이즈몰은 고객님의 성공과 함께합니다"></span></div>
end of bottom</td>
	</tr> -->
</table>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>