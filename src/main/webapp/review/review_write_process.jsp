<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글쓰기 db추가 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <c:if test="${empty sessionScope.loginData }">
<c:redirect url="http://192.168.10.216/jsp_prj/index.jsp"/>
</c:if> --%>

<% request.setCharacterEncoding("UTF-8"); %>
<!-- parameter받기 -->
<jsp:useBean id="rVO" class="admin.review.ReviewBoardVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<script type="text/javascript">
		
		<%
		try{
		    //아이디는 세션에 저장된 값을 받아서 설정(외부에서 조작 불가)
		    
		UserReviewDAO rDAO=UserReviewDAO.getInstance();
		String code=request.getParameter("code");
		String cartId=request.getParameter("cartId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String) session.getAttribute("userId");
		
		int num=rDAO.selectReviewId(rVO);
		
		LocalDate currentDate = LocalDate.now();
		
		rVO.setReviewId(num);
		rVO.setId(id);
		rVO.setCartId(cartId);
		rVO.setTitle(title);
		rVO.setContent(content);
		rVO.setCode(code);
		rVO.setInputDate(Date.valueOf(currentDate));
		rVO.setRemoveFlag("F");
		rDAO.insertReview(rVO);
		System.out.println(title);
		%>
		alert("리뷰를 작성했습니다.");
		location.href="http://localhost/online-shop/review/review_my_list.jsp";
		<%
		}catch(SQLException se) {
		    se.printStackTrace();
		    %>
		    location.href="http://192.168.10.216/jsp_prj/error/err_500.html";
		    <%
		}//end catch
		%>
		$(function(){
			
		});//ready
</script>
