<%@page import="admin.review.AdminReviewDAO"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%
WebMemberVO wmVo=(WebMemberVO)session.getAttribute("loginData");
if(wmVo == null) { //로그인 하지 않았음
    
}//end if
%> --%>
<%-- <%/* 로그인한 사람만 읽게 하려면 쓰고 아니면 지우기 */
//개발의 편의성을 위해 로그인한 것처럼 코드를 작성항 후 작업 진행
rVO.setId("haa");
session.setAttribute("loginData", rVO);
%>
<c:if test="${empty sessionScope.loginData }">
<c:redirect url="http://object.sist.co.kr/index.jsp"/>
</c:if> --%>
<%
ReviewBoardVO rVO=new ReviewBoardVO();

Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
System.out.println("세션 로그인 상태: " + isLoggedIn);

if (!Boolean.TRUE.equals(isLoggedIn)) {

%>
  <script type="text/javascript">
      alert('로그인이 필요합니다.');
      window.location.href = '../../adminLogin/adminLogin.jsp'; // 경로 수정 필요
  </script>
<%
  return;
}
%>
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

<!-- golgolz end -->
  
<style type="text/css">
	#wrap{width: 1462px; height:749; margin:0px auto;}
	    	
</style>
<script type="text/javascript">
	$(function(){
	    $("#btnDelete").click(function () {
			if(confirm("글을 정말 삭제하시겠습니까?")){
	    	//<form태그의 action 변경
	    	//var frm=document.frmDetail.action="back-end URL"
	    	$("#frmDetail")[0].action="board_delete_frm_process.jsp";
	    	$("#frmDetail").submit();	
			}//end if
	    
	    });//click
	});//ready
	
</script>
<script>
$(function(){
	
      $('#content').summernote({
        tabsize: 2,
        width:600,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });//summernote
})//ready
    </script>
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
							class="opacity-5 text-dark" href="http://object.sist.co.kr/manage/index.jsp">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page"><a href="http://object.sist.co.kr/manage/review/review.jsp">리뷰 관리</a></li>
					</ol>
					<h6 class="font-weight-bolder mb-0"><a href="http://object.sist.co.kr/manage/review/review_select.jsp">리뷰 상세 보기</a></h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
<div id="wrap">
<div id="header"></div>
<div id="boardContent">
<%
	AdminReviewDAO rDAO=AdminReviewDAO.getInstance();
	try{
	  String seq=request.getParameter("reviewId");
	  
	  rVO=rDAO.selectDetailReview(Integer.parseInt(seq));//상세보기
	 /*  rDAO.updateCnt(Integer.parseInt(seq)); *///조회수 올려주기(중요도가 덜한것이 아래로 내려가는게 좋음)
	  System.out.println("seq : "+seq);
	  pageContext.setAttribute("rVO", rVO);
	}catch(SQLException se){
	  se.printStackTrace();
	}
%>
</div>
</div>	

			<div class="contents">
		<!--begin of submain-->
		<form name="frmDetail" action="review_delete_process.jsp" method="post">
		<input type="hidden" name="act"  value="community.index"/>
		<input type="hidden" name="ch"   value="community"/>
		<input type="hidden" name="mode" value=""/>
		<input type="hidden" name="oc"   value=""/>
		<input type="hidden" name="os"   value=""/>
		<input type="hidden" name="bbs_code"  value="user_review"/>
		<input type="hidden" name="bbs_mode" value="view"/>
		<input type="hidden" name="bbs_seq"  value="23"/>
		<input type="hidden" name="reviewId"  value="${rVO.reviewId}"/>

		<!-- 검색 -->
		<!-- <div class="subtitle"><img src="/admin/images/community/bul_subtitle.gif"> 게시물 보기</div> -->
		<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="80%">
			<col width="120">
		    <col width="*">
			<col width="120">
		    <col width="*">
			<tr><td colspan="4" class="top5"></td></tr>
			<tr>
				<td class="label">작성자</td>
				<td class="box text"><strong><c:out value="${rVO.id}"/></strong></td>
				<td class="label">작성시각</td>
				<td class="box text"><strong><fmt:formatDate value="${rVO.inputDate}" pattern="yyyy-MM-dd EEEE HH:mm:ss"/></strong></td>
			</tr>
						<tr>
				<td class="label">관련 상품</td>
				<td class="box text" colspan="3">
					<a href="#"><img src="http://object.sist.co.kr/assets/images/goods/<c:out value='${rVO.defaultImg}'/>" style="width:60px; height:60px"/><c:out value="${rVO.name}"/></a>
				</td>
			</tr>
						<tr>
				<td class="label">제목</td>
				<td class="box text" colspan="3"><span style="font-size: 13px"><c:out value="${rVO.title}"/></span></td>
			</tr>
			<tr>
				<td class="label">내용</td>
				<td width="745" class="box text se2_inputarea" colspan="3"><p style="font-size: 13px"><c:out value="${ rVO.content }"/></p></td>
			</tr>
		</table>

		<!-- 하단 처리 버튼 -->
		<div class="alignCenter">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="left"><a href="http://object.sist.co.kr/manage/review/review_board_list.jsp" id="mode_bbs1" mode="list"><img src="https://demo01.swm.whoismall.com/admin/images/community/btn_list.gif" alt="목록"></a></td>
					<td align="right">
						<a href="review_delete_process.jsp?reviewId=${rVO.reviewId }" id="mode_bbs3" mode="delete"  style="margin-right: 300px;"><img src="https://demo01.swm.whoismall.com/admin/images/community/btn_del.gif" alt="삭제"></a>
					</td>
				</tr>
			</table>
		</div>
		</form>
	</div>

			<!-- golgolz end -->
		</div>
	</main>

</body>
</html>