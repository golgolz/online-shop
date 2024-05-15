<%@page import="user.wishlist.WishlistDAO"%>
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

<jsp:useBean id="wVO" class="user.wishlist.WishlistVO" scope="page" />
<jsp:setProperty property="*" name="wVO" />
<%

String cartId= request.getParameter("cartId");
String method = request.getParameter("method");

if(method == "deleteOne"){
int favoriteId = Integer.parseInt(request.getParameter("favoriteId"));
wVO.setFavoriteId(favoriteId);
}

%>
<%
WishlistDAO wDAO = WishlistDAO.getInstance();
JSONObject jsonObj = new JSONObject();
jsonObj.put("result",false);

switch(method){
    case "deleteOne":
        try{
            int cnt = wDAO.deleteWishlist(wVO);
            if(cnt != 0){
                jsonObj.put("result",true);
            }
        }catch(Exception e){
            e.printStackTrace();
        }//end catch
        break;
    case "deleteAll":
        try{
            int cnt = wDAO.deleteAllWishlist(wVO);
            
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


