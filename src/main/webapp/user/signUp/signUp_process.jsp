<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ page import="user.login.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");

    // 폼 데이터 수신
    String id = request.getParameter("member_id");
    String password = request.getParameter("passwd");
    String confirmPassword = request.getParameter("user_passwd_confirm");
    String name = request.getParameter("name");
    String tel = request.getParameter("mobile1") +"-" + request.getParameter("mobile2") +"-" + request.getParameter("mobile3");
    String email = request.getParameter("email1");
    String zipcode = request.getParameter("postcode1");
    String defaultAddr = request.getParameter("addr1");
    String additionalAddr = request.getParameter("addr2");
    
    if (!password.equals(confirmPassword)) {
      %>
          <script>
              // 비밀번호와 비밀번호 확인이 일치하지 않을 경우 경고 메시지 출력
              alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
              // 회원가입 페이지로 되돌아감
              history.back();
          </script>
      <%
              return;
          }
    
    // UserDAO 객체 생성
    UserDAO userDAO = new UserDAO();

    // UserDAO의 userSignUp 메소드를 호출하여 회원가입 처리
    boolean signUpSuccess = userDAO.userSignUp(id, password, name, tel, email, zipcode, defaultAddr, additionalAddr);
    
    // 회원가입 결과에 따른 메시지 출력
   if (signUpSuccess) {
%>
    <script>
        // JavaScript alert 창을 이용하여 회원가입 성공 메시지 출력
        alert("회원가입이 성공적으로 처리되었습니다. 로그인 페이지로 이동하여 로그인해주세요.");
        // 회원가입 성공 시 로그인 페이지로 이동
        window.location.href = "../login/userLogin.jsp";
    </script>
<%
    } else {
%>
    <script>
        // JavaScript alert 창을 이용하여 회원가입 실패 메시지 출력
        alert("회원가입 중 오류가 발생하였습니다. 다시 시도해주세요.");
        // 회원가입 실패 시 회원가입 페이지로 되돌아감
        window.history.back();
    </script>
<%
    }
%>
</body>
</html>