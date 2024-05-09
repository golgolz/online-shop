<%@page import="admin.login.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그인 과정"%>
<%
    String adminId = request.getParameter("adminId");
    String adminPassword = request.getParameter("adminPassword");

    AdminDAO adminDAO = new AdminDAO();
    boolean loginSuccess = adminDAO.adminLogin(adminId, adminPassword);

    if (loginSuccess) {
        // 로그인 성공 시 처리, 예: 관리자 페이지로 리다이렉트
        response.sendRedirect("../index.jsp");
    } else {
        // 로그인 실패 시 처리, 예: 로그인 페이지로 에러 메시지와 함께 리다이렉트
      %>
      <script type='text/javascript'>
      alert('로그인 실패!');
      location='adminLogin.jsp';
      </script>
      <%
    }
%>