<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = (String) session.getAttribute("userId");
JSONObject resultObj = new JSONObject();
resultObj.put("flag", false);
if (userId == null) {
    return;
}
resultObj.put("flag", true);
%> 
<%= resultObj.toJSONString() %>