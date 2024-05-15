<%@page import="java.sql.SQLException"%>
<%@page import="admin.refund.AdminRefundDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%
	String cartId = request.getParameter("cartId");
	JSONObject updateResult = new JSONObject();
	updateResult.put("flag", false);
	
	try{
	    AdminRefundDAO adminRefundDAO = AdminRefundDAO.getInstance();
	    int count = adminRefundDAO.updateRefund(cartId);
	    updateResult.put("flag", count == 1 ? true : false);
	} catch(SQLException e){
	    e.printStackTrace();
	}
%>
<%= updateResult.toJSONString() %>