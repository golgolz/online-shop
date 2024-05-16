<%@page import="user.wishlist.WishlistDAO"%>
<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글 삭제 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${empty sessionScope.loginData }"><!-- 로그인 한 사람만 삭제 가능 -->
<c:redirect url="#void"/>
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