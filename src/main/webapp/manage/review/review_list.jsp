<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/jsp/admin/lib.jsp" />
	<!-- golgolz start -->
	<link rel="stylesheet" href="https://demo01.swm.whoismall.com/common/css/admin_community.css?v=202008110000" type="text/css" />
	<link href="https://demo01.swm.whoismall.com/common/css/bbs_data_naver.css?v=202008110000" type="text/css" rel="stylesheet" >
	<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
	<div id="spot" class=""> 
		<h3><img src="/admin/images/common/sub/contents_title_icon.gif" alt=""> 사용후기</h3>
		<div id="" class="path"><img src="/admin/images/common/sub/home_icon.gif" alt="홈"> &gt; 게시판 관리 &gt; 상점 게시물 관리 &gt; <b>사용후기</b></div>
	</div>
	
	<div class="contents">
		<!--begin of submain-->
		<form name="dataForm" action="./" method="post">
		<input type="hidden" name="act"  value="community">
		<input type="hidden" name="ch"   value="community">
		<input type="hidden" name="mode" value="search">
		<input type="hidden" name="oc"   value="">
		<input type="hidden" name="os"   value="">
		<input type="hidden" name="bbs_code"  value="user_review">
		<input type="hidden" name="bbs_mode"  value="list">
		<input type="hidden" name="cate_code" value="GD">
		<input type="hidden" name="seq"  value="">
		
		<div class="subtitle"><img src="/admin/images/event/bul_subtitle.gif"> 사용후기 리스트</div>
		
		<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
			<col width="120">
		    <col width="*">
			<tr><td colspan="2" class="top5"></td></tr>
		    <tr>
		    	<td class="label">상품검색</td>
		        <td class="box text">
					<select id="good_cate1" name="good_cate1" size="1">
						<option value="">1차분류</option>
					</select>
					<select id="good_cate2" name="good_cate2" size="1" class="off" disabled>
						<option value="">2차분류</option>
					</select>
					<select id="good_cate3" name="good_cate3" size="1" class="off" disabled>
						<option value="">3차분류</option>
					</select>
					<select id="good_cate4" name="good_cate4" size="1" class="off" disabled>
						<option value="">4차분류</option>
					</select>
		        </td>
		    </tr>
			<tr>
				<td class="label">등록일</td>
				<td class="box text">
				<input type="text" id="bbs_sdate" name="bbs_sdate" style="width:68px;" class="inputbox" value=""> ~ <input type="text" id="bbs_edate" name="bbs_edate" style="width:68px;" class="inputbox" value="">
				<a href="#" id="date_term1" mode="yesterday"><img src="/admin/images/button/btn_yesterday.gif"></a>
				<a href="#" id="date_term2" mode="this_day"><img src="/admin/images/button/btn_today.gif"></a>
				<a href="#" id="date_term3" mode="this_week"><img src="/admin/images/button/btn_thisWeek.gif"></a>
				<a href="#" id="date_term4" mode="this_month"><img src="/admin/images/button/btn_thisMonth.gif"></a>
				<a href="#" id="date_term5" mode=""><img src="/admin/images/button/btn_total.gif"></a></td>
			</tr>
		    <tr>
		    	<td class="label">평점</td>
		        <td class="box text">
		        	<input type="checkbox" id="bbs_review_grade1" name="bbs_review_grade[]" value="100"> <img src="/admin/images/community/icon_star05.gif"> 
		            <input type="checkbox" id="bbs_review_grade2" name="bbs_review_grade[]" value="80"> <img src="/admin/images/community/icon_star04.gif"> 
		            <input type="checkbox" id="bbs_review_grade3" name="bbs_review_grade[]" value="60"> <img src="/admin/images/community/icon_star03.gif"> 
		            <input type="checkbox" id="bbs_review_grade4" name="bbs_review_grade[]" value="40"> <img src="/admin/images/community/icon_star02.gif"> 
		            <input type="checkbox" id="bbs_review_grade5" name="bbs_review_grade[]" value="20"> <img src="/admin/images/community/icon_star01.gif"> 
		        </td>
		    </tr>
			<tr>
				<td class="label">검색 키워드</td>
				<td class="box text">
					<select id="sc" name="sc" style="width:75px;">
						<option value="good_name">상품명</option>
						<option value="good_code">상품코드</option>
						<option value="user_id">아이디</option>
						<option value="bbs_name">이름</option>
						<option value="user_nick">닉네임</option>
						<option value="bbs_title">제목</option>
						<option value="bbs_content">내용</option>
					</select>
					<input type="text" id="ss" name="ss" value="" style="width:145px;" class="inputbox">
				</td>
			</tr>
		</table>
		
		<!--검색버튼-->
		<div class="alignCenter"><input type="image" src="/admin/images/button/btn_Search.gif" id="submit1" mode="search"></div>
		
		<!-- 리스트 -->
		<div class="boxContainer">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td class="left"> 
						<select id="bbs_cate_code" name="bbs_cate_code" style="width:100px;">
							<option value="">전체</option>
														<option value="01">기본</option>
													</select>
												&nbsp;
						<span class="bul">검색결과 : </span><span class="fc_red"><strong>2</strong>건</span>
					</td>
					<td align="right" class="right">
						<select id="list_num" name="list_num" style="width:95px;">
							<option value="5">5개 출력</option>
		                    <option value="10">10개 출력</option>
		                    <option value="20">20개 출력</option>
		                    <option value="50">50개 출력</option>
		                    <option value="100">100개 출력</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		
		<!--정렬-->
		<div class="alignContainer">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="bul04">
						정렬 :
						등록일
						<a href="#" id="change_order00" oc="bbs_reg_date" os="desc"><img src="/admin/images/button/btn_arrowDown.gif"></a>
						<a href="#" id="change_order01" oc="bbs_reg_date" os="asc"><img src="/admin/images/button/btn_arrowUp.gif"></a>
						|
						제목
						<a href="#" id="change_order02" oc="bbs_title" os="desc"><img src="/admin/images/button/btn_arrowDown.gif"></a>
						<a href="#" id="change_order03" oc="bbs_title" os="asc"><img src="/admin/images/button/btn_arrowUp.gif"></a>
						|
						작성자
						<a href="#" id="change_order04" oc="bbs_name" os="desc"><img src="/admin/images/button/btn_arrowDown.gif"></a>
						<a href="#" id="change_order05" oc="bbs_name" os="asc"><img src="/admin/images/button/btn_arrowUp.gif"></a>
					</td>
					<td width="20"></td>
					<td><a href="#" id="change_order06" oc="" os=""><img src="/admin/images/button/btn_reset.gif"></a></td>
				</tr>
			</table>
		</div>
		
		
		
		<!--테이블 header-->
		<div class="bgtbheader01">
		<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tablelistH31">
		    <col width="30" >
		    <col width="50" >
		    <col width="230" >
		    <col width="*" >
		    <col width="100" >
		    <col width="130" >
		    <col width="80" >
		    <col width="50" >
		    <col width="50" >
		    <thead>
		        <tr>
		            <th class="thL"><input type="checkbox" id="check_all" name="check_all" value="bbs_seq[]"></th>
		            <th>번호</th>
					<th>상품정보</th>
		            <th>제목</th>
		            <th>작성시각</th>
		            <th>글쓴이</th>
					<th>평점</th>
					<th>승인</th>
		            <th class="thR">조회</th>
		        </tr>
		    </thead>
		    <tbody>
								<tr>
		        	<td class="tdL" align="center"><input type="checkbox" name="bbs_seq[]" value="23"></td>
					<td class="tdL" align="center">2</td>
					<td class="tdL" align="center">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="50" align="center"><a href="/?act=shop.goods_view&GS=9" target="_blank"><img src="/data/goods/0/9/16242333.list.jpg" class="imgborder" onerror="Durian.imgDefault(this, '/data/file/no_image.png');" width="40" height="40"></a></td>
								<td align="left" ><a href="/?act=shop.goods_view&GS=9" target="_blank" >히말라야 장벽 수분 크림</a></td>
							</tr>
						</table>			
					</td>
		            <td class="tdL" align="left">
												<a href="?act=community&bbs_code=user_review&bbs_mode=view&bbs_seq=23&list_num=10&page=1" class="fc_blue"><u>반신반의하면서 샀거든요? 효과 짱이에요.</u></a> 
																		<img src="/admin/images/community/icon_best.gif">																													</td>
		            <td class="tdL" align="center">23.04.25 11:13</td>
		            <td class="tdL" align="center"><a href="#" class="fc_gray77" seq="imean882" ui_user="imean882" style="color:;">최고관리자 (imean882)</a></td>
		            <td class="tdL" align="center">
												<img src="/admin/images/community/icon_star05.gif">
											</td>
		            <td class="tdL" align="center">O</td>
		            <td class="tdR" align="center">11</td>
				</tr>
								<tr>
		        	<td class="tdL" align="center"><input type="checkbox" name="bbs_seq[]" value="21"></td>
					<td class="tdL" align="center">1</td>
					<td class="tdL" align="center">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="50" align="center"><a href="/?act=shop.goods_view&GS=19" target="_blank"><img src="/data/goods/0/19/3048903.list.jpg" class="imgborder" onerror="Durian.imgDefault(this, '/data/file/no_image.png');" width="40" height="40"></a></td>
								<td align="left" ><a href="/?act=shop.goods_view&GS=19" target="_blank" >블랑쉬 오드 드 퍼퓸</a></td>
							</tr>
						</table>			
					</td>
		            <td class="tdL" align="left">
												<a href="?act=community&bbs_code=user_review&bbs_mode=view&bbs_seq=21&list_num=10&page=1" class="fc_blue"><u>향이 너무 좋아요.</u></a> 
																																															</td>
		            <td class="tdL" align="center">23.04.21 17:50</td>
		            <td class="tdL" align="center"><a href="#" class="fc_gray77" seq="imean882" ui_user="imean882" style="color:;">최고관리자 (imean882)</a></td>
		            <td class="tdL" align="center">
												<img src="/admin/images/community/icon_star05.gif">
											</td>
		            <td class="tdL" align="center">O</td>
		            <td class="tdR" align="center">15</td>
				</tr>
						    </tbody>
		</table>
		</div>  
		
		<!-- 페이징 -->
		<div class="alignCenter">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="25%"></td>
				<td width="50%" align="center"><span class="paging"><a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="first"><img src="/data/images/default/button/btn_navi_arrLL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="pre"><img src="/data/images/default/button/btn_navi_arrL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="on"> 1 </a><a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="next"><img src="/data/images/default/button/btn_navi_arrR.gif" border="0" align="absmiddle"></a><a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="last"><img src="/data/images/default/button/btn_navi_arrRR.gif" border="0" align="absmiddle"></a></span></td>
				<td width="25%" align="right"><a href="#" id="write"><img src="/admin/images/community/btn_regist.gif" alt="등록"></a></td>
			</tr>
		</table>
		</div>
		
		<!-- 하단 처리 버튼 -->
		<div class="boxContainer02">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td>
						<img src="/admin/images/common/bul_07.gif">
						선택한 게시물
						<select id="bbs_code_new" name="bbs_code_new" style="width:150px;">
							<option value="">선택</option>
														<option value="faq">FAQ</option>
														<option value="freeboard">자유게시판</option>
														<option value="gallery">갤러리</option>
														<option value="goods_qna">상품문의</option>
														<option value="notice">공지사항</option>
													</select>
						으로
						<a href="#" id="edit_bbs1" mode="move"><img src="/admin/images/community/btn_move.gif" vspace="1"></a> 
						<a href="#" id="edit_bbs2" mode="copy"><img src="/admin/images/community/btn_copy.gif"></a> 
						<a href="#" id="edit_bbs3" mode="best"><img src="/admin/images/community/btn_best.gif"></a> 
						<a href="#" id="edit_bbs4" mode="delete_all"><img src="/admin/images/community/btn_del.gif"></a> 
										
											</td>
				</tr>
			</table>
		</div>
		
		</form>
		<!-- End of submain -->
	</div>
</div></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="61"><!--begin of bottom-->
<div id="footer"><span class="bottomlayout "><img src="/admin/images/common/img_bottom.gif" alt="후이즈몰은 고객님의 성공과 함께합니다"></span></div>
<!--end of bottom--></td>
	</tr>
</table>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>