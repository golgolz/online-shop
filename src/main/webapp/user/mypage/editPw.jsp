<%@page import="user.myPage.MyPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../../assets/jsp/user/lib.jsp" />
    <!-- golgolz start -->
    <!-- golgolz end -->
   <%
    request.setCharacterEncoding("UTF-8");

    // 요청에서 userId 파라미터를 가져옵니다.
    String userId = (String) session.getAttribute("userId");
    System.out.println("요청에서 가져온 userId: " + userId);

    if (request.getParameter("confirmBtn") != null) {
        String newPassword = request.getParameter("password");
        System.out.println("불러온 패스워드 : " +  newPassword);
        
        // Java로 비밀번호 업데이트 메소드 호출
        boolean isUpdated = false;
        try {
            MyPageDAO dao = new MyPageDAO();
            isUpdated = dao.updatePassword(userId, newPassword);
        } catch (Exception e) {
            System.out.println("MyPageDAO 생성 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
        
        if (isUpdated) {
            System.out.println("비밀번호가 성공적으로 변경되었습니다.");
            out.println("<script>alert('비밀번호가 성공적으로 변경되었습니다.');</script>");
        } else {
            System.out.println("비밀번호 변경에 실패했습니다.");
            out.println("<script>alert('비밀번호 변경에 실패했습니다.');</script>");
        }
    }
%>
</head>
<body>
    <jsp:include page="../../assets/jsp/user/header.jsp" />
    <div id="wrap">
        <div id="main">
            <!-- golgolz start -->
            
            <div id="FindId">
    

    <div id="container">
        <div id="contents">
        
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="/">회원 정보</a></li>
        <li title="현재 위치"><strong>비밀번호 변경</strong></li>
    </ol></div>

<form id="findIdForm" name="findIdForm"  method="post" action="editPw.jsp">
<input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden"><div class="xans-element- xans-member xans-member-findid"><!--
    $returnURL = /member/id/find_id_result.html
 -->
<div class="findId">
        <h4>비밀번호 변경</h4>
                            <fieldset>
                                <p><strong>비밀번호</strong> <input id="password" name="password" class="lostInput" placeholder="비밀번호를 입력하세요" type="password"></p>
                                <p><strong>비밀번호 확인</strong> <input id="confirmPassword" name="confirmPassword" class="lostInput" placeholder="비밀번호를 다시 입력하세요" type="password"></p>

                                <p>
                                <input type="submit" name="confirmBtn" id="confirmBtn" class="btn btn-middle " value="확인" >
                                </p>
                            </fieldset>
</div>
</div>
</form><div style="padding-top:30px;"></div>
        </div>
    </div>
    <hr class="layout"><div id="banner"></div>
<div id="quick"></div>
</div>
            <!-- golgolz end -->
        </div>
    </div>
</body>
</html>
