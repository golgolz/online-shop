<%@page import="java.util.List"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$("#btnSearch").click(function() {
			chkNull;
	});//click
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
			<div id="container">
				<div id="contents">
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sVO" class="notice.SearchVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="sVO"/>
<%
try{
    NoticeDAO nDAO=NoticeDAO.getInstance();
    int totalCount = nDAO.SelectTotalCount(sVO);
    int pageScale=10;
    int totalPage=(int)Math.ceil((double)totalCount/pageScale);
    String tempPage=sVO.getCurrentPage();
    int currentPage=1;
    if(tempPage !=null) {
        try{
        currentPage=Integer.parseInt(tempPage);
        }catch(NumberFormatException nfe){
        }//end catch
    }//end if
    int startNum=currentPage *pageScale-pageScale+1;
    int endNum=startNum+pageScale-1;
    
    sVO.setStartNum(startNum);
    sVO.setEndNum(endNum);
    
    List<NoticeVO> list=nDAO.selectNotice(sVO);
    pageContext.setAttribute("list", list);
    pageContext.setAttribute("totalCount", totalCount);
    pageContext.setAttribute("pageScale", pageScale);
    pageContext.setAttribute("currentPage", currentPage);
    
	}catch (Exception e){
	    e.printStackTrace();
	    out.println("다시 시도해주세요.");
	}
%>

					<div
						class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
						<div
							class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
							<!-- <div class="path">
								<span>현재 위치</span>
								<ol>
									<li><a href="/">홈</a></li>
									<li title="현재 위치"><strong>NOTICE</strong></li>
								</ol>
							</div> -->
							<div class="main_pro_title width1240 cboth" style="margin-top: 0px ; padding-top : 3px " >
								<div class="txt_01">
									<font color="#555555">NOTICE</font>
								</div>
								<div class="txt_02">공지사항을 확인해주세요.</div>
							</div>
							<div class="boardSort">
								<span
									class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
							</div>
							<div class="ec-base-table typeList gBorder">
								<table id="table_01" border="1" summary="">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 70px;" />
										<col style="width: 135px;" class="displaynone" />
										<col style="width: auto;" />
										<col style="width: 84px;" />
										<col style="width: 77px;" class="" />
										<col style="width: 55px;" class="" />
										<col style="width: 55px;" class="displaynone" />
										<col style="width: 80px;" class="displaynone" />
									</colgroup>
									<thead
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<tr style="">
											<th scope="col">번호</th>
											<th scope="col" class="displaynone">카테고리</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col" class="">작성일</th>
											<th scope="col" class="">조회</th>

										</tr>
									</thead>
									<tbody
										class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
										
										<c:forEach var="nVO" items="${list}" varStatus="i">
										<tr>
										<td> <c:out value="${totalCount-(currentPage-1)*pageScale -i.index }"/></td>
										<td> <a href="notice_read_frm.jsp?seq=${nVO.notice_id}&currentPage=${empty param.currentPage ?1:param.currentPage }"><c:out value="${nVO.title }"/></a></td>
										<td> <c:out value="${nVO.author}"/></td>
										<td> <c:out value="${nVO.input_date}"/></td>
										<td> <c:out value="${nVO.view_count}"/></td>
										
										</tr>
										</c:forEach>
										
									</tbody>
								</table>
								<p
									class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
							</div>
							<!-- <div class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ec-base-button typeBG displaynone "><span class="gRight">
            <a href="/board/free/write.html?board_no=1" class="btnSubmitFix sizeS displaynone">글쓰기</a>
        </span> -->
						</div>
					</div>
					<div
						class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
						<a href="?board_no=1&page=1"><img
							src="https://img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
							alt="이전 페이지" /></a>
						<ol>
							<li class="xans-record-"><a href="?board_no=1&page=1"
								class="this">1</a></li>
							<li class="xans-record-"><a href="?board_no=1&page=2"
								class="other">2</a></li>
							<li class="xans-record-"><a href="?board_no=1&page=3"
								class="other">3</a></li>
							<li class="xans-record-"><a href="?board_no=1&page=4"
								class="other">4</a></li>
						</ol>
						<a href="?board_no=1&page=2"><img
							src="https://img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
							alt="다음 페이지" /></a>
					</div>
					<form id="boardSearchForm" name="" action="/board/free/list.html"
						method="get" target="_top" enctype="multipart/form-data">
						<input id="board_no" name="board_no" value="1" type="hidden" />
						<input id="page" name="page" value="1" type="hidden" /> <input
							id="board_sort" name="board_sort" value="" type="hidden" />
						<div
							class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
							<fieldset class="boardSearch">
								<!-- <legend>게시물 검색</legend> -->
								<p>
									
									<!-- <select id="search_key" name="search_key" fw-filter=""
										fw-label="" fw-msg="">
										<option value="subject">제목</option>
										<option value="content">내용</option>
										<option value="writer_name">글쓴이</option>
										<option value="member_id">아이디</option>
										<option value="nick_name">별명</option>
									</select>  -->
										<input id="keyword" name="keyword" fw-filter="" fw-label=""fw-msg="" class="inputTypeText" placeholder="" value="${param.keyword}"
										type="text" /> 
										<input type="button" class="btnEmFix" id="btnSearch" value="검색">
										<!-- <a href="#none" class="btnEmFix2" onclick="BOARD.form_submit('boardModifyForm');">수정</a> 
										<a href="#none" class="btnEmFix3" onclick="BOARD.form_submit('boardDeleteForm');">삭제</a>  -->
										<a id="btnInsert" href="notice_write.jsp" class="btnEmFix4">작성</a>
							</fieldset>
						</div>
			
					<%
					String param="";
					%>
					<c:if test="${not empty param.keyword }">
					<%
					param="&field="+request.getParameter("field")+"&keyword="
					+request.getParameter("keyword");
					%>
					<c:set var="link2" value="&field =${param.field }&keyword=${param.ketword }"/>
					</c:if>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>