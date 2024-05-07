<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404180600" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733" />
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRBbsQgDEX3k257Ds-o6j0q9QTEcYI1gBGGTOf2dTtVq64DO8DwvvX1MXiJBIRTUyoKgVcKbj6_nC-Q2xwYJ19jAF1oWkh5S6BXTpdXQFWIsrRAMIsriz3V-ubw6jZ6suIzdCMruYK-MxRdpSh7717XlrCypGPY4O7SKsxOGb81UGLsDn0cdIYSnmxDp8aDwFUkVM6D6J7CKHQuFhQc5Xd2GyfL9CjX3TyIPLdau0f7Fy4f4wwJo8y2a3gMvaxBpEAOzVJhu1Ohnen2txrUuRWodBupPzKx2YdXL_ndc86ctt4CKGk3ho3tfND3KIXSfn9o9Bja_4GqX7RP&type=css&k=d664d08dad9a7052b47cd7d6e8a0a70935bed9eb&t=1678165953&user=T" />

<script type="text/javascript">
	$(function(){
    	$("#notice_menu").addClass("bg-gradient-primary");
	});
</script>

<!-- golgolz start -->
<!-- golgolz end -->

</head>
<style type="text/css">
	.txt_01{text-align:center}
	.txt_02{text-align:center}
	#table_01{margin: auto ; border:1px solid #b3b3b3}
	th{background-color: #F5F5F5; text-align:center}
	.btnInsert{float:right}
	
</style>

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
							aria-current="page">공지사항 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">공지사항 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
				<hr class="layout"/><div id="wrap">

    <div id="container">
		<div id="contents">
		
<!-- <div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 "><div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 "><div class="path">
            <span>현재 위치</span>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>NOTICE</strong></li>
            </ol>
</div> -->

<div class="main_pro_title width1240 cboth" style="margin-top: 0px ; padding-top : 3px ">
		<div class="txt_01"><font color="#555555">NOTICE</font></div>
		<div class="txt_02">공지사항을 확인해주세요.</div>
	</div>
</div>
<form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self" enctype="multipart/form-data" >
<input id="no" name="no" value="27192" type="hidden"  />
<input id="bulletin_no" name="bulletin_no" value="28137" type="hidden"  />
<input id="board_no" name="board_no" value="1" type="hidden"  />
<input id="member_id" name="member_id" value="lifelab0301" type="hidden"  />
<input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden"  />
<input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=27192&amp;board_no=1" type="hidden"  />
<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  /><div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002"><!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/free/list.html
        -->
<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>게시판 상세</caption>
            <colgroup>
<col style="width:auto;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<tr>
<td class="txt_03">2023 추석 명절 택배 출고 일정 안내</td>
                </tr>
<!--
                <tr>
                    <th scope="row">작성자</th>
                    <td> object <span class="displaynone">(ip:)</span> </td>
                </tr>
--><tr>
<td colspan="2">
                        <ul class="etcArea" >
<!-- <li class="displaynone">
                                <strong>평점</strong> <img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"/>
                             </li> -->
                            <li class="" style="font-size : 12px ; vertical-align:middle">
                                <strong>작성일</strong> <span class="txtNum" style="font-size : 12px ; vertical-align:middle" >2023-09-25</span>
                            </li>
                            <!-- <li class="displaynone">
                                <strong>추천</strong> <span class="txtNum"> <a href="#none" class="btnNormal" onclick="BOARD_READ.article_vote('/exec/front/Board/vote/1?no=27192&return_url=%2Farticle%2Fnotice%2F1%2F27192%2F&20da70bfbe4b016c1e1aae3fd60bc6=8555725c2e7fda1dea51ded0ff9526a0&board_no=1');"><img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_recommend.gif" alt=""/> 추천하기</a></span>
                            </li> -->
                            <li class="" style="font-size : 12px ; vertical-align:middle">
                                <strong>조회수</strong> <span class="txtNum" style="font-size : 12px ; vertical-align:middle">159</span>
                            <!-- </li> -->
                        </ul>
<div class="detail"><div class="fr-view fr-view-article"><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>안녕하세요 오브젝트입니다.</p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>곧 다가올 추석 명절 오브젝트 온라인몰 택배 출고 일정 안내드립니다.</p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>■ 제주 및 긴급 발송 마감일 : 9월 25일(월)</p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>■ 일반 택배 &nbsp;발송 마감일 : 9월 26일(화)<span style="background-color: rgb(255, 239, 0);"><strong style="font-weight: bolder;"><ins>&nbsp;(추석 연휴 이후 배송 예정)</ins></strong></span></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>■ 업무 재개: 10월 4일(수)</p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>택배 마감일은<span style="background-color: rgb(255, 239, 0);"><ins>&nbsp;</ins></span><strong style="font-weight: bolder;"><span style="font-size: 16px; background-color: rgb(255, 239, 0);"><ins>9월 26일(화)이며 26일(화) 12시 이후 주문 건은 10월 4일(수)부터 순차 배송 됩니다.</ins></span></strong></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>26일 12시 이전 주문건중 미출고 발생할 경우 별도 연락 예정입니다.</p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>이용에 착오 없으시길 바라며, 풍요롭고 행복한 명절 연휴 보내시길 바랍니다.</p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><br></p><p style='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>감사합니다.</p><p><br></p></div></div>
                    </td>
                </tr>
<tr class="attach displaynone">
<th scope="row">첨부파일</th>
                    <td></td>
                </tr>

</tbody>
</table>
</div>

<div class="ec-base-button">
            <span class="gLeft">
                <a href="notice.jsp" class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gLeft" style="float:right ; margin-right:100px">
                <a href="#void" class="btnNormalFix sizeS" id="btnMod">수정</a>
                <a href="#void" class="btnNormalFix sizeS" id="btnDel">삭제</a>
            </span>
          <!--   <span class="gRight">
                <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');" class="btnNormalFix sizeS displaynone">삭제</a>
                <a href="/board/free/modify.html?board_act=edit&no=27192&board_no=1" class="btnEmFix sizeS displaynone">수정</a>
                <a href="/board/free/reply.html" class="btnSubmitFix sizeS displaynone">답변</a>
            </span> -->
        </div>
</div>
</form></div>

        </div>
    </div>
    <hr class="layout"/><div id="banner"></div>
</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>