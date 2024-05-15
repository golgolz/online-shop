<%@page import="java.util.Iterator"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.order.AdminOrderDAO"%>
<%@page import="admin.order.OrderDetailGoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
	trimDirectiveWhitespaces="true"    
%>
<%
	JSONObject resultObj = new JSONObject();
	resultObj.put("flag", false);
	
	String cartId = request.getParameter("cartId");
	
	AdminOrderDAO adminOrderDAO = AdminOrderDAO.getInstance();
	try{
	    if(request.getParameter("method") != "" && request.getParameter("method") != null){
		    int count = adminOrderDAO.updateDelivery(cartId, request.getParameter("method"));
	    }
	    
		List<OrderDetailGoodsVO> goodsList = adminOrderDAO.selectDetailGoods(cartId);
		resultObj.put("flag", true);
		
		Iterator<OrderDetailGoodsVO> goodsIta = goodsList.iterator();
		JSONArray goods = new JSONArray();
		JSONObject tempJSON = null;
		OrderDetailGoodsVO goodsVO = null;
		
		while(goodsIta.hasNext()){
		    goodsVO = goodsIta.next();
		    tempJSON = new JSONObject();
		    tempJSON.put("code", goodsVO.getCode());
		    tempJSON.put("defaultImage", goodsVO.getDefaultImage());
		    tempJSON.put("name", goodsVO.getName());
		    tempJSON.put("orderStatus", goodsVO.getOrderStatus());
		    tempJSON.put("purchaseStatus", goodsVO.getPurchaseStatus());
		    tempJSON.put("amount", goodsVO.getAmount());
		    tempJSON.put("price", goodsVO.getPrice());
		    tempJSON.put("deliveryCharge", goodsVO.getDeliveryCharge());
		    
		    goods.add(tempJSON);
		}
		
		resultObj.put("data", goods);
	} catch(SQLException e){
	    e.printStackTrace();
	}
%>
<%= resultObj.toJSONString() %>