<%@page import="javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar"%>
<%@page import="order.vo.PaymentInfoVO"%>
<%@page import="order.vo.DeliveryVO"%>
<%@page import="order.vo.CardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="user.order.CartDAO"%>
<%@page import="order.vo.OrderProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
pageContext.setAttribute("msg", "주문 실패");
pageContext.setAttribute("url", "http://localhost/online-shop/order/order_complete.jsp");
String userId = (String)session.getAttribute("userId");
String cartId = (String)session.getAttribute("cartId");

List<OrderProductVO> list = (List<OrderProductVO>)session.getAttribute("data");

CartDAO cDAO = CartDAO.getInstance();
OrderProductVO opVO = null;
CardVO cVO = null;
DeliveryVO dVO = null;
PaymentInfoVO piVO = null;

dVO = (DeliveryVO)session.getAttribute("dVO");
String userName = (String)request.getParameter("recipient");
String cardNum = (String)request.getParameter("cardNum");
String cardId = (String)request.getParameter("cardNum");
String zipcode = (String)request.getParameter("zipcode");
String defaultAddr = (String)request.getParameter("defaultAddr");
String detailAddr = (String)request.getParameter("detailAddr");
String recipient = (String)request.getParameter("recipient");
String tel = (String)request.getParameter("tel1")+"-"+(String)request.getParameter("tel2")+"-"+(String)request.getParameter("tel3");
String deliveryMsg = (String)request.getParameter("deliveryMsg");
if(deliveryMsg ==""){
    deliveryMsg = "없음";
}
System.out.println("시작 전");
System.out.println(cartId+"|"+zipcode+"|"+defaultAddr+"|"+detailAddr+"|"+tel+"|"+deliveryMsg+"|"+recipient);	

if(list == null){// cartId가 생성되지 않은 데이터일 경우
    
    String code = request.getParameter("code");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
	
	try{
	    cDAO.insertOrder(userId, userName);
	    cartId = cDAO.selectFirstOrderId(userId);
	    
	    opVO = new OrderProductVO(cartId,code,quantity);
	    cVO = new CardVO(cardId,userId);
	    dVO = new DeliveryVO(cartId,zipcode,defaultAddr,detailAddr,tel,deliveryMsg,recipient);
	    piVO = new PaymentInfoVO(cartId,cardId,userId);
	    
	    cDAO.insertDelivery(dVO);
	    cDAO.insertCard(cVO);
	    cDAO.insertOrderProduct(opVO);
	    cDAO.insertPayment(piVO);
	    
	    System.out.println("주문 1");
	}catch(SQLException se){
	    se.printStackTrace();
	}//end catch
	    pageContext.setAttribute("msg", "주문 성공");
	    pageContext.setAttribute("url", "http://localhost/online-shop/order/order_complete.jsp");
}//end if

if(list != null){// 장바구니에서 주문을 진행한 경우
	
	try{
	    cDAO.updateOrderStatus(cartId, "주문");
	    cDAO.updateInputDate(cartId);
	    cDAO.updateDeliveryStatus(cartId, "배송 준비중");
	    
	    cVO = new CardVO(cardId,userId);
	    dVO = new DeliveryVO(cartId,zipcode,defaultAddr,detailAddr,tel,deliveryMsg,recipient);
	    piVO = new PaymentInfoVO(cartId,cardId,userId);
	    
	    cDAO.insertDelivery(dVO);
	    cDAO.insertCard(cVO);
	    cDAO.insertPayment(piVO);
	    
	    System.out.println("주문 2");
	}catch(SQLException se){
	    se.printStackTrace();
	}//end catch
	
	    pageContext.setAttribute("msg", "주문 성공");
	    pageContext.setAttribute("url", "http://localhost/online-shop/order/order_complete.jsp");
}//end if

System.out.println("주문완료");

%>

<script type="text/javascript">
alert("${ pageScope.msg }");
location.href="${ pageScope.url }";
</script>