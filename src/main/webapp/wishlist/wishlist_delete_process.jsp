<%@page import="user.wishlist.WishlistDAO"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글 삭제 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!-- parameter받기 -->
<jsp:useBean id="wVO" class="user.wishlist.WishlistVO" scope="page"/>
<jsp:setProperty property="*" name="wVO"/>
<script type="text/javascript">
		
		<%
		try{
		    //아이디는 세션에 저장된 값을 받아서 설정(외부에서 조작 불가)
		WishlistDAO wDAO=WishlistDAO.getInstance();
		
		int favoriteId=Integer.parseInt(request.getParameter("favoriteId"));
		
		/* rVO.setId(((ReviewBoardVO)session.getAttribute("loginData")).getId()); */
	    wVO.setFavoriteId(favoriteId);
		
		int cnt=wDAO.deleteWishlist(wVO);
		System.out.print(cnt);
		if(cnt==1){
		  
		%>
		location.href="http://localhost/online-shop/wishlist/wishlist.jsp?currentPage=${param.currentPage}";
		<%
		}else{
		%>
		alert("관심상품 삭제 실패");
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