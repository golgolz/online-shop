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
    String tel1 = request.getParameter("mobile1");
    String tel2 = request.getParameter("mobile2");
    String tel3 = request.getParameter("mobile3");
    String tel = request.getParameter("mobile1") +"-" + request.getParameter("mobile2") +"-" + request.getParameter("mobile3");
    String email = request.getParameter("email1");
    String zipcode = request.getParameter("postcode1");
    String defaultAddr = request.getParameter("addr1");
    String additionalAddr = request.getParameter("addr2");
    
    
    // 빈 값이 있는지 확인
    if (id == null || id.trim().isEmpty() || password == null || password.trim().isEmpty() || confirmPassword == null || confirmPassword.trim().isEmpty() || name == null || name.trim().isEmpty() || tel1 == null || tel1.trim().isEmpty() || tel2 == null || tel2.trim().isEmpty() || tel3 == null || tel3.trim().isEmpty() || email == null || email.trim().isEmpty() ) {
%>
    <script>
        // JavaScript alert 창을 이용하여 빈 값 경고 메시지 출력
        alert("모든 필수 항목을 입력해주세요.");
        // 회원가입 페이지로 되돌아감
        history.back();
    </script>
<%
        return;
    }
    
    //비밀번호 확인
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
    // 아이디 조건 검증
    if (!id.matches("[a-zA-Z0-9]{4,16}")) {
%>
    <script>
        // JavaScript alert 창을 이용하여 아이디 조건 불만족 메시지 출력
        alert("아이디는 영문 소문자 또는 숫자로 이루어진 4~16자여야 합니다.");
        // 회원가입 페이지로 되돌아감
        history.back();
    </script>
<%
        return;
    }
    
    // 비밀번호 조건 검증
    if (!password.matches("(?=.*[a-zA-Z])(?=.*[0-9!@#$%^&*()-_=+]).{10,16}")) {
%>
    <script>
        // JavaScript alert 창을 이용하여 비밀번호 조건 불만족 메시지 출력
        alert("비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상을 조합하여 10~16자여야 합니다.");
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