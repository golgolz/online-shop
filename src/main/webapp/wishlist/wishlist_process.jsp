<%@page import="order.vo.OrderProductVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.order.CartDAO"%>
<%@page
	import="org.apache.catalina.authenticator.jaspic.PersistentProviderRegistrations.Property"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info="장바구니 정보 전송"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="opVO" class="order.vo.OrderProductVO" scope="page" />
<jsp:setProperty property="*" name="opVO" />
<%

String cartId= request.getParameter("cartId");
String method = request.getParameter("method");

if(method == "deleteOne" || method == "modify"){
int orderGoodsId = Integer.parseInt(request.getParameter("orderGoodsId"));
opVO.setOrderGoodsId(orderGoodsId);
}

%>
<%
CartDAO cDAO = CartDAO.getInstance();
JSONObject jsonObj = new JSONObject();
jsonObj.put("result",false);

switch(method){
    case "deleteOne":
        try{
            int cnt = cDAO.deleteCart(opVO);
            if(cnt != 0){
                jsonObj.put("result",true);
            }
        }catch(Exception e){
            e.printStackTrace();
        }//end catch
        break;
    case "deleteAll":
        try{
            int cnt = cDAO.deleteAllCart(opVO);
            
            if(cnt != 0){
                jsonObj.put("result",true);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        break;
}
%>
<%= jsonObj.toJSONString() %>


