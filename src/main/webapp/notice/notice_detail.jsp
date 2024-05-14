<%@page import="notice.UserNoticeDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="notice.NoticeVO"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404251303" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tdRLTsQwDAbgfcuWc3hGiHsgcYI83NYaJ47ipDC3J2UQiHWTXR7V5-iXa9gkIKCbq2JWYFqQjb28XK6QqmVy81YCg3qcPSqtEfRG8foKThWC-MoIVkz2kNH4N-NuZsWndvkM3WQnIWAsY_AgOx56Z3ap0RWSeI5lc5dawBol913jiKI7-jjojKKb2ganSoPgIsKF0iB9Qx5Fp9waxY3KO5mVoik4KnVjB8m2ltK9tX9x-RwXCI8Ku33mztF-YZEMiWvrirabMu6EH3-rQS9vF5i7jdSfMqG2H143Se8bpURx7V3ASdyb0cZ2Opl7kIxxvz9q9Bja_0HVQ_sC&type=css&k=ef968b0deb8cbb1fbf1859bc8f5e97b965334d9e&t=1678165953&user=T"  />

<script async src="https://www.googletagmanager.com/gtag/js?id=G-7QY24C4QPH"></script>

<script type="text/javascript">
	$(function(){
		/* $("#btn-update").click(function(){
			$("#content").text("안녕안녕요");
		}); */
	});
</script>
	<!-- golgolz end -->
</head>
<style type="text/css">

#pscroller1{width: 100%; height: 20px !important; padding: 13px 0px !important;  background-color: #000;
 text-align:center; color:#fff; font-weight:500; font-size:13px;}
.someclass{ }
.etcArea{height:40px; vertical-align:middle;}
</style>

<body>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	<%
	// 1. detail notice 불러오기 (이전 페이지에서 넘겨받은 id로) -> 조회수도 + 1 해주는 로직 같이 들어가야해요 oㅋ 검색 ㅇㅋ
	// 2. NoticeVO -> title, content, 조회수 ?를 담은 객체 생성
	// 3. 아래 html 코드 안에서 EL script 이용해서 적당한 위치에 제목/내용/조회수 넣기
	%>
	
			<!-- golgolz start -->
			<div>
	<hr class="layout"/><div id="wrap">

    <div id="container">
		<div id="contents">
<%
UserNoticeDAO unDAO= UserNoticeDAO.getInstance();
try{
    String seq=request.getParameter("id");
    NoticeVO nVO=unDAO.selectDetailNotice(Integer.parseInt(seq));
    unDAO.updateCnt(Integer.parseInt(seq));
    
    pageContext.setAttribute("nVO", nVO);
    
}catch(SQLException se){
    se.printStackTrace();
%>		
   alert("오류가 발생했습니다.");
   <%
	}//end catch
   %>
   
<!-- <div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 "><div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 "><div class="path">
            <span>현재 위치</span>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>NOTICE</strong></li>
            </ol>
</div> -->
<div class="main_pro_title width1240 cboth">
		<div class="txt_01"><font color="#555555">NOTICE</font></div>
		<div class="txt_02">공지사항을 확인해주세요.</div>
	</div>
</div>
<form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post">
<input id="board_no" name="board_no" value="1" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  /><div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">

<!-- <input id="no" name="no" value="27192" type="hidden"  /> -->
<!-- <input id="bulletin_no" name="bulletin_no" value="28137" type="hidden"  /> -->
<!-- <input id="member_id" name="member_id" value="lifelab0301" type="hidden"  /> -->
<!-- <input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden"  /> -->
<!-- <input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=27192&amp;board_no=1" type="hidden"  /> -->
<!-- <input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden"  /> -->
<!--
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
<td class="txt_03">${nVO.title}</td>
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
                                <strong>작성일</strong> <span class="txtNum" style="font-size : 12px ; vertical-align:middle" >${nVO.input_date}</span>
                            </li>
                            <!-- <li class="displaynone">
                                <strong>추천</strong> <span class="txtNum"> <a href="#none" class="btnNormal" onclick="BOARD_READ.article_vote('/exec/front/Board/vote/1?no=27192&return_url=%2Farticle%2Fnotice%2F1%2F27192%2F&20da70bfbe4b016c1e1aae3fd60bc6=8555725c2e7fda1dea51ded0ff9526a0&board_no=1');"><img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_recommend.gif" alt=""/> 추천하기</a></span>
                            </li> -->
                            <li class="" style="font-size : 12px ; vertical-align:middle">
                                <strong>조회수</strong> <span class="txtNum" style="font-size : 12px ; vertical-align:middle">${nVO.view_count}</span>
                            <!-- </li> -->
                        </ul>
<div class="detail"><div class="fr-view fr-view-article">
	<p style
			='margin: 0px; padding: 0px; display: block; line-height: 1.5; color: rgb(53, 53, 53); 
			font-family: NanumBarunGothic, "Noto Sans KR", Verdana, Dotum, AppleGothic, sans-serif; 
			font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; 
			font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; 
			widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; 
			background-color: rgb(255, 255, 255); text-decoration-thickness: initial; 
			text-decoration-style: initial; text-decoration-color: initial;'
	   id="content"
		>${nVO.content }</p>
	<!-- <input type="button" value="내용수정테스트" class="btn btn-warning btn-sm" id="btn-update" /> -->
                </tr>
<tr class="attach displaynone">
<th scope="row">첨부파일</th>
                    <td></td>
                </tr>

</tbody>
</table>
</div>
<div class="ec-base-button ">
            <span class="gLeft">
                <!-- <span class="displaynone">
                    <a href="#none" onclick="" class="btnNormalFix sizeS admin displaynone"></a>
                    <a href="#none" onclick="" class="btnNormalFix sizeS admin displaynone"></a>
                    <a href="#none" onclick="" class="btnNormalFix sizeS ">스팸신고</a>
                    <a href="#none" onclick="" class="btnNormalFix sizeS ">스팸해제</a>
                </span> -->
                <a href="notice.jsp" class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gRight">
                <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');" class="btnNormalFix sizeS displaynone">삭제</a>
                <a href="/board/free/modify.html?board_act=edit&no=27192&board_no=1" class="btnEmFix sizeS displaynone">수정</a>
                <!-- <a href="/board/free/reply.html" class="btnSubmitFix sizeS displaynone">답변</a> -->
            </span>
        </div>
</div>
</form></div>

        </div>
    </div>
    <hr class="layout"/><div id="banner"></div>
</div>
			<!-- golgolz end -->
		

</body>
</html>