<%@page import="user.order.CartDAO"%>
<%@page import="org.apache.catalina.authenticator.jaspic.PersistentProviderRegistrations.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="장바구니 정보 전송"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<jsp:useBean id="opVO" class="order.vo.OrderProductVO" scope="page" />
	<jsp:setProperty property="*" name="opVO" />
<%
	CartDAO cDAO = CartDAO.getInstance();

	int cnt = cDAO.updateCart(opVO);
	
	if(cnt != 0){
	    pageContext.setAttribute("msg", "수량이 변경되었습니다.");
	    pageContext.setAttribute("url", "http://localhost/online-shop/cart/cart.jsp");
	}//end if
%>

<script type="text/javascript">
	alert("${ pageScope.msg }");
	location.href="${ pageScope.url }";
</script>

