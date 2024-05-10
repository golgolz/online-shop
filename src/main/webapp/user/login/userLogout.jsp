<%@ page import="java.util.logging.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>

<% 
// Logger 인스턴스를 얻습니다.
Logger logger = Logger.getLogger("LogoutDebug");

// 로그아웃 전 세션에 저장된 userId를 로깅
String userIdBeforeLogout = (String) session.getAttribute("userId");
logger.info("Before logout, userId: " + userIdBeforeLogout);

// 세션을 종료합니다.
session.invalidate();

// 로그아웃 프로세스 성공 메시지를 로깅
logger.info("Logout successful: User session has been invalidated.");

// 사용자를 로그인 페이지로 리다이렉트합니다.
response.sendRedirect("userLogin.jsp");
%>