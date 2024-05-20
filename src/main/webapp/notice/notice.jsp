<%@page import="util.PageController"%>
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
	<link href="http://localhost/assets/css/pagenation.css" rel="stylesheet" />
	<!-- golgolz start -->
	<!-- golgolz end -->

<script type="text/javascript">
	$(function() {
		$("#btnSearch").click(function() {
    		chkNull();
    	});//click
		$("#btnAllSearch").click(function() {
			location.href="http://localhost/notice/notice.jsp";
    	});//click
	});//ready
	
	function chkNull() {
		if($("#keyword").val().trim() !="") {
			$("#searchForm").submit();
		}//end if
	}
</script>

</head>

<style type="text/css">
.txt_01 {text-align: center}
.txt_02 {text-align: center}
#table_01 {margin: auto;border: 1px solid #b3b3b3}
th {background-color: #F5F5F5; text-align: center}
.btnInsert {float: right}
</style>

<body>
		
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
		String pageOrg = request.getParameter("page");
		
		if(pageOrg == null || pageOrg.equals("")) {
		    pageOrg = "1";
		}
		//pagenation
		int pageScale = 10;
		int currentPage = Integer.parseInt(pageOrg);
		int startNum = pageScale * (currentPage -1)+1;
		int endNum = startNum + pageScale -1;
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		PageController pageController = PageController.getInstance();
		String params = pageController.createQueryStr(request);
	%>
<%
	try{
    NoticeDAO nDAO=NoticeDAO.getInstance();
    int searchResultCount = nDAO.SelectTotalCount(sVO);
    
    /* int totalCount = nDAO.SelectTotalCount(sVO);
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
    sVO.setEndNum(endNum);  */
    
    List<NoticeVO> list=nDAO.selectNotice(sVO);
    pageContext.setAttribute("list", list);
    pageContext.setAttribute("totalCount", searchResultCount);
    pageContext.setAttribute("pageScale", pageScale);
    pageContext.setAttribute("currentPage", currentPage);

%>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	
		<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
			<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
				<div class="main_pro_title width1240 cboth">
					<div class="txt_01">
					<font color="#555555">NOTICE</font>
					</div>
					<div class="txt_02">공지사항을 확인해주세요.</div>
					</div>
					<div class="boardSort">
						<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
					</div>
					<div class="ec-base-table typeList gBorder">
						<table id="table_01" border="1" summary="">
							<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
								<col style="width: 70px;" />
								<col style="width: 135px;" class="displaynone" />
								<col style="width: auto;" />
								<col style="width: 84px;" />
								<col style="width: 77px;" class="" />
								<col style="width: 55px;" class="" />
								<col style="width: 55px;" class="displaynone" />
								<col style="width: 80px;" class="displaynone" />
							</colgroup>
								<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
									<tr style="">
										<th scope="col">번호</th>
										<th scope="col" class="displaynone">카테고리</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col" class="">작성일</th>
										<th scope="col" class="">조회</th>
									</tr>
								</thead>
									<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
										<c:forEach var="nVO" items="${list}" varStatus="i">
										<tr>
										<td> <c:out value="${tartNum+1 + i.index + (currentPage-1) * pageScale}"/></td>
										<td> <a href="notice_detail.jsp?id=${nVO.notice_id}"><c:out value="${nVO.title }"/></a></td>
										<td> <c:out value="${nVO.author}"/></td>
										<td> <c:out value="${nVO.input_date}"/></td>
										<td> <c:out value="${nVO.view_count}"/></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
							</div>
						</div>
					</div>
					<!-- <div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
						<a href="?board_no=1&page=1">\
						<img src="https://img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지" /></a>
						<ol>
							<li class="xans-record-"><a href="?board_no=1&page=1"
								class="this">1</a></li>
						</ol>
						<a href="?board_no=1&page=2">
						<img src="https://img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지" /></a>
					</div> -->
					<form id="searchForm" name="" method="get" target="_top">
						<input id="board_no" name="board_no" value="1" type="hidden" />
						<input id="page" name="page" value="1" type="hidden" />
						<input id="board_sort" name="board_sort" value="" type="hidden" />
						<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
							<!-- <legend>게시물 검색</legend> -->
								<p style="padding-bottom:30px ; margin-top : 20px">

									<select id="field" name="field">
										<option value="0">제목+내용</option>
									</select>
									<input id="keyword" name="keyword" class="inputTypeText" placeholder="" value="${param.keyword}" type="text" />
								<!-- 	<input id="search" name="search" class="inputTypeText" placeholder="" value="" type="text" />  -->
									<input type="button" class="btnEmFix" id="btnSearch" value="검색">
									<input type="button" class="btnEmFix" id="btnAllSearch" value="전체글" >
							</fieldset>
						</div>
					</form>
				</div>
					<%
					String pageNation = 
						pageController.createPagingBtns("http://localhost/notice/notice.jsp", params
						     ,Integer.parseInt(pageOrg),(searchResultCount / pageScale) +1);
					%>
					<div id="pageNation">
						<%= pageNation %>
					</div>
			<!-- golgolz end -->
		</div>
	</div>
	</div>
	
	<%
	} catch (Exception e) {
  		e.printStackTrace(); 
  		out.println("다시 시도해주세요.");
	}
	%>
	
</body>
</html>