<%@page import="notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<!-- golgolz end -->
</head>

<style type="text/css">
.txt_01 {text-align: center}
.txt_02 {text-align: center}
#table_01 {margin: auto;border: 1px solid #b3b3b3}
th {background-color: #F5F5F5; text-align: center}
.btnInsert {float: right}
</style>
<script type="text/javascript">
	$(function() {
		$("#btn")
	});//ready
</script>

<body>

	<jsp:include page="../assets/jsp/user/header.jsp" />
		
	<div id="wrap">
		<div id="main">
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
	
} catch (Exception e) {
   	 e.printStackTrace(); 
   	out.println("다시 시도해주세요.");
}
%>
					<div
						class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
						<div
							class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
						<!-- 	<div class="path">
								<span>현재 위치</span>
								<ol>
									<li><a href="/">홈</a></li>
									<li title="현재 위치"><strong>NOTICE</strong></li>
								</ol>
							</div> -->
							<div class="main_pro_title width1240 cboth">
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
										
										<!--
                    $login_page_url = /member/login.html
                    $deny_access_url = /index.html
                -->
										<!-- <tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>37</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/27192/" style="color: #555555;">2023
													추석 명절 택배 출고 일정 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2023-09-25</span></td>
											<td class=""><span class="txtNum">155</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>36</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/24908/" style="color: #555555;">2023
													설 명절 택배 출고 일정 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2023-01-17</span></td>
											<td class=""><span class="txtNum">258</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>35</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/23878/" style="color: #555555;">2022
													추석 명절 택배 출고 일정 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2022-09-05</span></td>
											<td class=""><span class="txtNum">299</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>34</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/23767/" style="color: #555555;">오브젝트
													워크샵 기간 온라인 스토어 배송 공지</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2022-08-19</span></td>
											<td class=""><span class="txtNum">387</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>33</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/21538/" style="color: #555555;">CJ대한통운
													택배사 파업으로 인한 배송 지연 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2021-12-29</span></td>
											<td class=""><span class="txtNum">653</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>32</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/20264/" style="color: #555555;">2021
													추석 명절 택배 출고 일정 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2021-09-13</span></td>
											<td class=""><span class="txtNum">418</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>31</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/19367/" style="color: #555555;">CJ대한통운으로
													파업으로 인한 성남 지역 배송 불가 및 지연 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2021-07-15</span></td>
											<td class=""><span class="txtNum">382</span></td>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>30</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/19048/" style="color: #555555;">택배사
													파업으로 인한 배송 지연 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2021-06-15</span></td>
											<td class=""><span class="txtNum">1073</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>29</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/18260/" style="color: #555555;">택배비
													변경 안내</a> <span class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2021-03-26</span></td>
											<td class=""><span class="txtNum">1357</span></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td>28</td>
											<td class="displaynone"></td>
											<td class="subject left txtBreak"><a
												href="/article/notice/1/18055/" style="color: #555555;">[온라인몰]
													사무실 이전으로 인한 고객센터 운영 시간 변경 및 출고 안내 (3월15일)</a> <span
												class="txtEm"></span></td>
											<td>object</td>
											<td class=""><span class="txtNum">2021-03-10</span></td>
											<td class=""><span class="txtNum">545</span></td>
										</tr>
									</tbody> -->
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
							<!-- <li class="xans-record-"><a href="?board_no=1&page=2"
								class="other">2</a></li>
							<li class="xans-record-"><a href="?board_no=1&page=3"
								class="other">3</a></li>
							<li class="xans-record-"><a href="?board_no=1&page=4"
								class="other">4</a></li> -->
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
								<legend>게시물 검색</legend>
								<p style="padding-bottom:30px">
								<!-- 	<select id="search_date" name="search_date" fw-filter=""
										fw-label="" fw-msg="">
										<option value="week">일주일</option>
										<option value="month">한달</option>
										<option value="month3">세달</option>
										<option value="all">전체</option>
									</select>  -->
									<select id="search_key" name="search_key" fw-filter=""
										fw-label="" fw-msg="">
										<option value="subject">제목</option>
										<option value="content">내용</option>
										<!-- <option value="writer_name">글쓴이</option>
										<option value="member_id">아이디</option>
										<option value="nick_name">별명</option> -->
									</select> <input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text" /> 
										<input type="button" class="btnEmFix" id="btnSearch" value="검색">
										<!-- <a href="#none" class="btnEmFix" onclick="BOARD.form_submit('boardSearchForm');">검색</a> 
										<a href="#none" class="btnEmFix2" onclick="BOARD.form_submit('boardModifyForm');">수정</a> 
										<a href="#none" class="btnEmFix3" onclick="BOARD.form_submit('boardDeleteForm');">삭제</a> --> 
										<!-- <input type="button" class="btnEmFix4" id="btnInsert" value="글 작성"href="notice_write.jsp" ></a> -->
							</fieldset>
						</div>
				</div>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>