<%@page import="user.login.FindIdPwDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 찾기 프로세스"%>

<%

    request.setCharacterEncoding("UTF-8");

    // 캐시 제어문 (세션 보안, 실시간 데이터 업데이트를 위해)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // 폼 데이터에서 아이디, 이름, 휴대폰 번호를 가져오기
    String id = request.getParameter("member_id");
    String name = request.getParameter("name");
    String tel = request.getParameter("mobile1") + "-" + request.getParameter("mobile2") + "-" + request.getParameter("mobile3");

    // 디버깅을 위한 출력
    System.out.println("아이디: " + id);
    System.out.println("이름: " + name);
    System.out.println("휴대폰 번호: " + tel);

    // FindIdPwDAO 객체 생성
    FindIdPwDAO findIdPwDAO = new FindIdPwDAO();

    // 비밀번호 찾기 시도
    String foundUserPw = findIdPwDAO.findUserPw(id, name, tel);

    // 결과를 JSP 페이지에 전달
    request.setAttribute("foundUserPw", foundUserPw);

    // 결과에 따른 처리
    if (foundUserPw != null) {
        // 비밀번호를 찾은 경우
        // 결과 페이지로 포워딩
        request.getRequestDispatcher("findPwResult.jsp").forward(request, response);
    } else {
        // 비밀번호를 찾지 못한 경우
        // 에러 메시지를 출력하거나, 다시 비밀번호 찾기 화면으로 리다이렉트할 수 있습니다.
        // 여기서는 간단히 에러 메시지를 출력하겠습니다.
        out.println("<script>alert('비밀번호를 찾을 수 없습니다.');</script>");
    }
%>