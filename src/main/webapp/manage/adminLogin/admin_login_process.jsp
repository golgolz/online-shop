<%@page import="admin.login.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그인 과정"%>
    
    
    <%
	//캐시 제어문 (세션 보안, 실시간 데이터 업데이트 위해)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies 
    
    
	HttpSession adminSession = request.getSession();
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    System.out.println("세션 로그인 상태: " + isLoggedIn);
    
    if (Boolean.TRUE.equals(isLoggedIn)) {
      	System.out.println("이미 로그인된 상태입니다. 리다이렉트 중...");
        response.sendRedirect("../index.jsp");
        return;
    }

    String adminId = request.getParameter("adminId");
    String adminPassword = request.getParameter("adminPassword");
    System.out.println("받은 adminId: " + adminId);
    System.out.println("받은 adminPassword: " + adminPassword);

    AdminDAO adminDAO = new AdminDAO();
    boolean loginSuccess = adminDAO.adminLogin(adminId, adminPassword);
    System.out.println("로그인 시도 결과: " + loginSuccess);

%>
<% 
    if (loginSuccess) {
        // 로그인 성공 시 처리, 예: 관리자 페이지로 리다이렉트
        adminSession.setAttribute("adminId", adminId);
        adminSession.setAttribute("adminPassword", adminPassword);
        adminSession.setAttribute("isLoggedIn", true);
        System.out.println("세션에 adminId와 adminPassword 저장 완료");
        
        String loginMessage = "로그인 성공";
        %>
        <script type='text/javascript'>
            alert('<%= loginMessage %>');
            location = '../index.jsp';
        </script>
        <%
        
        //response.sendRedirect("../index.jsp");
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