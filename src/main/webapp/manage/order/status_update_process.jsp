<%@page import="user.order.UserReturnDAO"%>
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
	String method = request.getParameter("method");
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	
	AdminOrderDAO adminOrderDAO = AdminOrderDAO.getInstance();
	UserReturnDAO userReturnDAO = UserReturnDAO.getInstance();
	try{
	    if(method != "" && method != null){
	        switch(method){
	            case "반품접수":
	                userReturnDAO.updateReturn(cartId);
	                userReturnDAO.insertReturn(cartId, quantity);
	                break;
	            case "배송시작":
	            case "배송완료":
	    		    adminOrderDAO.updateDelivery(cartId, method);
	        }
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