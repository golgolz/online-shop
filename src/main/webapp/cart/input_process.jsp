<%@page import="order.vo.OrderVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.vo.OrderProductVO"%>
<%@page import="java.util.List"%>
<%@page import="user.order.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="opVO" class="order.vo.OrderProductVO" scope="page" />
<jsp:setProperty property="*" name="opVO" />
<jsp:useBean id="orVO" class="order.vo.OrderVO" scope="page" />
<jsp:setProperty property="*" name="orVO" />
<%
String userId = (String)session.getAttribute("userId");
String code = request.getParameter("code");
int quantity = Integer.parseInt(request.getParameter("quantity"));
String cartId = "";
String userName="";

orVO.setUserId(userId);
opVO.setCode(code);
opVO.setQuantity(quantity);

CartDAO cDAO = CartDAO.getInstance();

try{
	cartId = cDAO.selectCartId(userId);
	
	if(cartId == ""){
	    userName = cDAO.selectUserName(userId);
	    OrderVO oVO = new OrderVO();
	    oVO.setUserId(userId);
	    oVO.setUserName(userName);
	    cDAO.insertCart(oVO);
	    cartId = cDAO.selectCartId(userId);
	}
	
	orVO.setCartId(cartId);
	opVO.setCartId(cartId);
	List<OrderProductVO> temp = new ArrayList<OrderProductVO>();
    temp = cDAO.selectCart(cartId);

	//해당 장바구니 번호에 상품이 존재하지 않을 경우
	boolean chkFlag = cDAO.isEmptyList(temp, cartId);
	
    // 장바구니에 상품을 추가하는 작업을 수행
	cDAO.insertOrderProduct(opVO);
	
	if(chkFlag == false){// 장바구니 번호에 상품 리스트가 존재하지 않을 시 OrderProduct table의 input_date를 update
	     cDAO.updateInputDate(cartId);
		}//end if 
	
	//값 설정
	/* session.setAttribute("cartData", opVO);  */
	pageContext.setAttribute("url", "http://localhost/cart/cart.jsp");
			
	}catch(Exception e){
	    e.printStackTrace();
	}//end catch
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<script type="text/javascript">
location.href="${ pageScope.url }";
</script>
</html>
