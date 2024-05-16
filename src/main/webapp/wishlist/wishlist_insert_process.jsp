<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, user.wishlist.*, java.util.*, java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String userId = (String) session.getAttribute("userId");


if (userId == null) {
    System.out.println("로그인이 필요합니다.");
%>
    <script type="text/javascript">
        alert('로그인이 필요합니다.');
        window.location.href = '../user/login/userLogin.jsp'; // 경로 수정 필요

    </script>
<%
    return;
}
%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="wVO" class="user.wishlist.WishlistVO" scope="page"/>
<jsp:setProperty property="*" name="wVO"/>

<script type="text/javascript">
<%

try {
    /* wVO.setId(((WishlistVO)session.getAttribute("userId")).getId()); */
  
	WishlistDAO wDAO = WishlistDAO.getInstance();
	
	String id=(String)session.getAttribute("userId");
	String code=request.getParameter("code");
   	LocalDate currentDate = LocalDate.now();
   	
   	int cnt=wDAO.selectFavoriteId(wVO);
    wVO.setCode(code);
    wVO.setInputDate(Date.valueOf(currentDate));
    wVO.setId(id);
    wVO.setFavoriteId(cnt);

    wDAO.insertWishlist(wVO);
  %>
    /* alert("관심 상품이 성공적으로 추가되었습니다."); */
    location.href="http://192.168.10.211/wishlist/wishlist.jsp";
  <%

} catch (SQLException e) {
    out.println("관심 상품 추가에 실패했습니다: " + e.getMessage());
    e.printStackTrace();
}
%>
</script>