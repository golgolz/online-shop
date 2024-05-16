<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
	trimDirectiveWhitespaces="true"    
%>
<%
	String userId = (String) session.getAttribute("userId");
	JSONObject resultObj = new JSONObject();
	
	resultObj.put("flag", userId != null);
%> 
<%= resultObj.toJSONString() %>