<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, user.wishlist.*, java.util.*, java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty sessionScope.loginData }">
<c:redirect url="http://localhost/online-shop/user/login/userLogin.jsp"/>
</c:if>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="wVO" class="user.wishlist.WishlistVO" scope="page"/>
<jsp:setProperty property="*" name="wVO"/>

<script type="text/javascript">
<%

try {
    wVO.setId(((WishlistVO)session.getAttribute("loginData")).getId());
  
	WishlistDAO wishlistDAO = WishlistDAO.getInstance();

    wishlistDAO.insertWishlist(wVO);
    out.println("관심 상품이 성공적으로 추가되었습니다.");
    
    
} catch (SQLException e) {
    out.println("관심 상품 추가에 실패했습니다: " + e.getMessage());
    e.printStackTrace();
}
%>
</script>