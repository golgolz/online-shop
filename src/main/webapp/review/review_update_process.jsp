<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글 변경 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!-- parameter받기 -->
<jsp:useBean id="rVO" class="admin.review.ReviewBoardVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<script type="text/javascript">
		
		
		
		<%
		try{
		  
		UserReviewDAO rDAO=UserReviewDAO.getInstance();
		/* int num=rDAO.selectReviewId(rVO);  */   
		/* String userId="haa";
		    
	    session.setAttribute("userId", userId); */
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		rVO.setTitle(title);
		rVO.setContent(content);
		rVO.setReviewId(reviewId);
		/* rVO.setId(((ReviewBoardVO)session.getAttribute("userId")).getId()); */
		
		System.out.print("reviewId : "+reviewId);
		
		rVO.setId((String)session.getAttribute("userId"));

		int cnt=rDAO.updateReview(rVO);
		System.out.println("cnt : "+cnt);
		if(cnt==1){
		  
		%>
		alert("리뷰를 수정했습니다.");
		location.href="http://localhost/online-shop/review/review_my_list.jsp?currentPage=${param.currentPage}";
		<%
		}else{
		%>
		alert("본인이 작성한 리뷰만 수정할 수 있습니다.");
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