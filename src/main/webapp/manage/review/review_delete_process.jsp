<%@page import="admin.review.AdminReviewDAO"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글 삭제 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${empty sessionScope.loginData }"><!-- 로그인 한 사람만 삭제 가능 -->
</c:if> --%>

<% request.setCharacterEncoding("UTF-8"); %>
<!-- parameter받기 -->
<jsp:useBean id="rVO" class="admin.review.ReviewBoardVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<script type="text/javascript">
		
		<%
		try{
		    //아이디는 세션에 저장된 값을 받아서 설정(외부에서 조작 불가)
		AdminReviewDAO rDAO=AdminReviewDAO.getInstance();
		
		int reviewId=Integer.parseInt(request.getParameter("reviewId"));
		
		/* rVO.setId(((ReviewBoardVO)session.getAttribute("loginData")).getId()); */
	    rVO.setReviewId(reviewId);
	    System.out.print("reviewId : "+reviewId);
		int cnt=rDAO.deleteReview(rVO);
		System.out.print("cnt : "+cnt);
		if(cnt==1){
		  
		%>
		alert("글을 삭제했습니다.");
		location.href="http://object.sist.co.kr/manage/review/review_board_list.jsp?currentPage=${param.currentPage}";
		<%
		}else{
		%>
		alert("글 삭제 실패");
		history.back();
		<%
		}
		}catch(SQLException se) {
		    se.printStackTrace();
		}//end catch
		%>
		$(function(){
			
		});//ready
</script>
</head>
<body>
<div>
	
</div>
</body>
</html>