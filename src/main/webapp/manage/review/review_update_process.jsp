<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글 변경 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${empty sessionScope.loginData }">
<c:redirect url="http://192.168.10.216/jsp_prj/index.jsp"/>
</c:if> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.216/jsp_prj/common/favicon.ico"/>
<!--bootstrap시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap끝-->
<link rel="stylesheet" href="http://192.168.10.216/jsp_prj/common/css/main.css" media="all" />
<link rel="stylesheet" href="http://192.168.10.216/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">

</style>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- parameter받기 -->
<jsp:useBean id="rVO" class="admin.review.ReviewBoardVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<script type="text/javascript">
		
		
		
		<%
		try{
		  
		UserReviewDAO rDAO=UserReviewDAO.getInstance();
		int num=rDAO.selectReviewId(rVO);    
		num=19;
		String userId="haa";
		    
	    session.setAttribute("userId", userId);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		rVO.setTitle(title);
		rVO.setContent(content);
		rVO.setReviewId(num);
		/* rVO.setId(((ReviewBoardVO)session.getAttribute("userId")).getId()); */

		rVO.setId((String)session.getAttribute("userId"));
		;
		int cnt=rDAO.updateReview(rVO);
		System.out.println(cnt);
		if(cnt==1){
		  
		%>
		alert("글을 수정했습니다.");
		location.href="http://localhost/online-shop/manage/review/review_my_list.jsp?currentPage=${param.currentPage}";
		<%
		}else{
		%>
		alert("글 수정 실패");
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