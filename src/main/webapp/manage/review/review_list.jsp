<%@page import="java.sql.SQLException"%>
<%@page import="admin.review.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.review.AdminReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="https://demo01.swm.whoismall.com/common/css/admin_community.css?v=202008110000" type="text/css" />
	<link href="https://demo01.swm.whoismall.com/common/css/bbs_data_naver.css?v=202008110000" type="text/css" rel="stylesheet" >
<body class="mainlayout">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="125" valign="top"><link type="text/css" href="https://demo01.swm.whoismall.com/common/css/admin_general.css?v=202008110000" rel="stylesheet">
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
					<!-- <h6 class="font-weight-bolder mb-0"><a href="http://localhost/online-shop/manage/review/review.jsp">리뷰 관리</a></h6> -->
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
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
		
		<!-- <div class="subtitle"><img src="/admin/images/event/bul_subtitle.gif"> 사용후기 리스트</div> -->
		
		<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
			<col width="120">
		    <col width="*">
			<tr><td colspan="2" class="top5"></td></tr>
		    <tr>
		    	<td class="label">상품검색</td>
		        <td class="box text">
					<input type='radio' name='category' value='apple' />애플
					<input type='radio' name='category' value='samsung' />삼성
		        </td>
		    </tr>
			<tr>
				<td class="label">등록일</td>
				<td class="box text">
				<input type="text" id="bbs_sdate" name="bbs_sdate" style="width:68px;" class="inputbox" value=""> ~ <input type="text" id="bbs_edate" name="bbs_edate" style="width:68px;" class="inputbox" value="">
				<a href="#" id="date_term1" mode="yesterday"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_yesterday.gif"></a>
				<a href="#" id="date_term2" mode="this_day"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_today.gif"></a>
				<a href="#" id="date_term3" mode="this_week"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_thisWeek.gif"></a>
				<a href="#" id="date_term4" mode="this_month"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_thisMonth.gif"></a>
				<a href="#" id="date_term5" mode=""><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_total.gif"></a></td>
			</tr>
			<tr>
				<td class="label">검색 키워드</td>
				<td class="box text">
					<select id="sc" name="sc" style="width:75px;">
						<option value="good_name">상품명</option>
						<option value="good_code">상품코드</option>
						<option value="user_id">아이디</option>
						<!-- <option value="bbs_name">이름</option>
						<option value="user_nick">닉네임</option> -->
						<option value="bbs_title">제목</option>
						<option value="bbs_content">내용</option>
					</select>
					<input type="text" id="ss" name="ss" value="" style="width:145px;" class="inputbox">
				</td>
			</tr>
		</table>
		
		<!--검색버튼-->
		<div class="alignCenter"><input type="image" src="https://demo01.swm.whoismall.com/admin/images/button/btn_Search.gif" id="submit1" mode="search"></div>
		
		<!-- 리스트 -->
		<div class="boxContainer">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td class="left"> 
						<!-- <select id="bbs_cate_code" name="bbs_cate_code" style="width:100px;">
							<option value="">전체</option>
														<option value="01">기본</option>
													</select> -->
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
						<a href="#" id="change_order00" oc="bbs_reg_date" os="desc"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_arrowDown.gif"></a>
						<a href="#" id="change_order01" oc="bbs_reg_date" os="asc"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_arrowUp.gif"></a>
						|
						제목
						<a href="#" id="change_order02" oc="bbs_title" os="desc"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_arrowDown.gif"></a>
						<a href="#" id="change_order03" oc="bbs_title" os="asc"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_arrowUp.gif"></a>
						|
						작성자
						<a href="#" id="change_order04" oc="bbs_name" os="desc"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_arrowDown.gif"></a>
						<a href="#" id="change_order05" oc="bbs_name" os="asc"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_arrowUp.gif"></a>
					</td>
					<!-- <td width="20"></td>
					<td><a href="#" id="change_order06" oc="" os=""><img src=""></a></td> -->
				</tr>
			</table>
		</div>
		
		<%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="sVO" class="admin.review.SearchVO" scope="page"/>
	<jsp:setProperty property="*" name="sVO"/>
	<%
	try{
	    AdminReviewDAO rDAO=AdminReviewDAO.getInstance();
	    
		int totalCount = rDAO.selectTotalCount(sVO);
	    
	    //2.한 화면에 보여줄 게시물의 수
	    int pageScale=10;
	    //3.총 페이지 수
	    /*
	    int totalPage=totalCount/pageScale;
	    if(totalPage % pageScale !=0){
	        totalPage++;
	    }//end if
	    */
	    int totalPage=(int)Math.ceil((double)totalCount/pageScale);
	    //4.게시물의 시작번호
	    String tempPage=sVO.getCurrentPage();
	    int currentPage=1;
	    if(tempPage !=null) {
	        try{
	        currentPage=Integer.parseInt(tempPage);
	        }catch(NumberFormatException nfe){
	        }
	    }//end if
	    int startNum=currentPage *pageScale-pageScale+1;
	    //5.게시물의 끝 번호
	    int endNum=startNum+pageScale-1;
	    
	    sVO.setStartNum(startNum);
	    sVO.setEndNum(endNum);
	    
	    List<ReviewVO> review=rDAO.selectAllReview(sVO);
	   	pageContext.setAttribute("review", review);
	   	
	   	pageContext.setAttribute("totalCount", totalCount);
	    pageContext.setAttribute("pageScale", pageScale);
	    pageContext.setAttribute("currentPage", currentPage);
	    %>
		
		<!--테이블 header-->
		<div class="bgtbheader01">
		
	    <div>
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
		            <th class="thR">조회</th>
		        </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="rVO" items="${ review }" varStatus="i">
		  	<tr>
		  	<td><c:out value ="${rVO.reviewId}"/></td>
		  	<td><c:out value="${ rVO.defaultImg }"/><c:out value="${ rVO.name }"/></td>
		  	<td><c:out value="${ rVO.title }"/></td>
		  	<td><c:out value="${ rVO.inputDate }"/></td>
		  	<td><c:out value="${ rVO.id }"/></td>
		  	</tr>
		  	</c:forEach>
			</tbody>
		</table>
		</div>
		</div>  
		<!-- 페이징 -->
		<div class="alignCenter">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<!-- <td width="25%"></td> -->
				<td width="50%"><span class="paging">
					<a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="first">
						<img src="https://demo01.swm.whoismall.com/data/images/default/button/btn_navi_arrLL.gif" border="0" align="absmiddle"></a>
					<a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="pre">
						<img src="https://demo01.swm.whoismall.com/data/images/default/button/btn_navi_arrL.gif" border="0" align="absmiddle"></a>
					<a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="on"> 1 </a>
					<a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="next">
						<img src="https://demo01.swm.whoismall.com/data/images/default/button/btn_navi_arrR.gif" border="0" align="absmiddle"></a>
					<a href="/admin/?act=community&ch=community&bbs_code=user_review&bbs_mode=list&page=1" class="last">
						<img src="https://demo01.swm.whoismall.com/data/images/default/button/btn_navi_arrRR.gif" border="0" align="absmiddle"></a></span></td>
				<!-- <td width="25%" align="right"><a href="#" id="write"><img src="/admin/images/community/btn_regist.gif" alt="등록"></a></td> -->
			</tr>
		</table>
		<%
		}catch (SQLException se){
			se.printStackTrace();
			out.println("ㅈㅅ");
		}
	%>
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
	</main>
</body>
</html>