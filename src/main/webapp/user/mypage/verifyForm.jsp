<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@page import="user.myPage.MyPageDAO"%>
<%@page import="user.myPage.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String userId = (String) session.getAttribute("userId");
    String password = request.getParameter("password");
    MyPageDAO dao = new MyPageDAO();
    UserVO user = dao.verifyUserAndGetDetails(userId, password);

    if (user != null) {
        session.setAttribute("userDetails", user);
        response.sendRedirect("editUserInfo.jsp");
    } else {
      %>
      <script>
          alert('Invalid password');
          window.location.href = 'pwConfirm.jsp'; // 비밀번호 확인 페이지로 다시 이동
      </script>
	<%
    }
%>