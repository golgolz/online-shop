<%@page import="user.login.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="유저 로그인 프로세스"%>

<%
    // 캐시 제어문 (세션 보안, 실시간 데이터 업데이트를 위해)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

 // 폼 데이터에서 유저 아이디와 비밀번호를 가져옴
    String userId = request.getParameter("member_id");
    String password = request.getParameter("member_passwd");

    // 디버깅을 위한 출력
    System.out.println("받은 userId: " + userId);
    System.out.println("받은 password: " + password);
    
    
    // UserDAO 객체 생성
    UserDAO userDAO = new UserDAO();

    // 로그인 시도
    boolean loginSuccess = userDAO.userLogin(userId, password);

    // 로그인 결과에 따른 처리
    if (loginSuccess) {
        // 로그인 성공 시 세션에 정보를 저장하고, 메인 페이지로 리다이렉트
        session = request.getSession();
        
        session.setAttribute("userId", userId);
        session.setAttribute("isLoggedIn", true);

        System.out.println("세션에 userId 저장 완료");

        // 메인 페이지로 리다이렉트
        response.sendRedirect("../../index.jsp");
    } else {
        // 로그인 실패 시 로그인 페이지로 리다이렉트
        %>
        <script type='text/javascript'>
            alert('로그인 실패야!');
        	<%System.out.println("받은 userId: " + userId);
        	System.out.println("받은 password: " + password);
        	System.out.println("---------------------------- " );%>
            location='userLogin.jsp';
        </script>
        <%
    }
%>