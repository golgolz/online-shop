<%@page import="user.login.UserVO"%>
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

 // 비밀번호를 입력한 경우 로그인 시도에 실패한 경우
    if (!loginSuccess) {
        String errorMessage = "아이디 또는 비밀번호가 올바르지 않습니다.";
        %>
        <script type='text/javascript'>
            alert('<%= errorMessage %>');
            location='userLogin.jsp';
        </script> 
        
        <%
    } else {
        // 로그인 시도 및 검증
        UserVO loginResult = userDAO.verifyLogin(userId);

        // 로그인 결과에 따른 처리
        if (loginResult != null) {
            if (loginResult.getWithdrawalFlag().equals("T")) {
                // 탈퇴한 회원
                String errorMessage = "탈퇴한 회원입니다.";
                %>
                <script type='text/javascript'>
                    alert('<%= errorMessage %>');
                    location='userLogin.jsp';
                </script>
                <%
            } else if (loginResult.getAccessLimitFlag().equals("T")) {
                // 접근 제한 회원
                String errorMessage = "접근 제한 회원입니다.";
                %>
                <script type='text/javascript'>
                    alert('<%= errorMessage %>');
                    location='userLogin.jsp';
                </script>
                <%
            } else {
                // 로그인 성공 시 세션에 정보를 저장하고, 메인 페이지로 리다이렉트
                session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("isLoggedIn", true);
        
                System.out.println("세션에 userId 저장 완료");
        
                // 메인 페이지로 리다이렉트
                response.sendRedirect("../../index.jsp");
            }
        }
    }
%>