<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="admin.userManage.UserManageDAO" %>
<%@ page import="admin.userManage.UserDetailedVO" %>
<%@ page import="java.util.List" %>

<%
    // 요청에서 userId 파라미터를 가져옵니다.
    String userId = request.getParameter("userId");

    // 디버깅: 요청에서 가져온 userId를 콘솔에 출력합니다.
    System.out.println("요청에서 가져온 userId: " + userId);

    // DAO 객체를 생성합니다.
    UserManageDAO dao = new UserManageDAO();
    UserDetailedVO userInfo = null;

    try {
        // DAO를 사용하여 userId에 해당하는 사용자 상세 정보를 가져옵니다.
        userInfo = dao.selectUserDetailById(userId);
        
        // 디버깅: DAO를 사용한 후의 userInfo 객체 상태를 콘솔에 출력합니다.
        System.out.println("가져온 userInfo 객체: " + userInfo);
    } catch (Exception e) {
        // 예외 발생 시 스택 트레이스를 출력합니다.
        e.printStackTrace();
    }

    // userInfo가 null인 경우, 사용자에게 정보를 찾을 수 없음을 표시합니다.
    if (userInfo == null) {
        out.println("<p>사용자 정보를 찾을 수 없습니다. 유효한 사용자 ID를 확인하십시오.</p>");
    }
%>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240430213218">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#user_menu").addClass("bg-gradient-primary");
        });
    </script>
</head>
<body>

    <!-- 페이지 로딩 시 사용자의 상세 정보를 불러오는 로직 -->
    <%
        // 전달받은 userId 파라미터 가져오기
         userId = request.getParameter("userId");
        
        // DAO를 통해 사용자 정보를 가져옵니다.
         dao = new UserManageDAO();
         userInfo = null;
        
        try {
            // userId를 이용하여 사용자를 가져옵니다.
            userInfo = dao.selectUserDetailById(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <section class="new_win_desc marb50">
        <ul class="anchor">
            <li><a href="./pop_memberform.php?mb_id=tubeweb3">회원정보수정</a></li>
        </ul>

        <h3 class="anc_tit">기본정보</h3>
        <div class="tbl_frm01">
            <table class="tablef">
            <%
    // 전달받은 userId 파라미터 가져오기
     userId = request.getParameter("userId");
    
    // DAO를 통해 사용자 정보를 가져옵니다.
     dao = new UserManageDAO();
     userInfo = null;
    
    try {
        // userId를 이용하여 사용자를 가져옵니다.
        userInfo = dao.selectUserDetailById(userId);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    // userInfo가 null인 경우 오류 메시지 표시
    if (userInfo == null) {
        out.println("<p>사용자 정보를 찾을 수 없습니다. 유효한 사용자 ID를 확인하세요.</p>");
    }
%>
                <colgroup>
                    <col class="w130">
                    <col>
                    <col class="w130">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">회원명</th>
                        <td>
                            <input type="text" name="name" value="<%= userInfo.getName() %>"   class="frm_input required" style="background-position: right top; background-repeat: no-repeat;">
                        </td>
                        <th scope="row">아이디</th>
                        <td><%= userInfo.getId() %></td>
                    </tr>
                    <tr>
                        <th scope="row">비밀번호</th>
                        <td><input type="text" name="passwd" value="" class="frm_input"></td>
                    </tr>
                    <tr>
                        <th scope="row">E-Mail</th>
                        <td><input type="text" name="email" value="<%= userInfo.getEmail() %>" class="frm_input" size="30"></td>
                    </tr>
                    <tr>
                        <th scope="row">휴대전화</th>
                        <td><input type="text" name="cellphone" value="<%= userInfo.getTel() %>" class="frm_input"></td>
                    </tr>
                    <tr>
                        <th scope="row">주소</th>
                        <td colspan="3">
                            <input type="text" name="zip" value="<%= userInfo.getZipcode() %>" class="frm_input" size="8" maxlength="5">
                            <a href="javascript:win_zip('fmemberform', 'zip', 'addr1', 'addr2', 'addr3', 'addr_jibeon');" class="btn_small grey">주소검색</a>
                            <p class="mart5"><input type="text" name="addr1" value="<%= userInfo.getDefaultAddr() %>" class="frm_input" size="60"> 기본주소</p>
                            <p class="mart5"><input type="text" name="addr2" value="<%= userInfo.getAdditionalAddr() %>" class="frm_input" size="60"> 상세주소</p>
                            <input type="hidden" name="addr_jibeon" value="R"></p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <h3 class="anc_tit mart30">기타정보</h3>
        <div class="tbl_frm01">
            <table class="tablef">
                <colgroup>
                    <col class="w130">
                    <col>
                    <col class="w130">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">회원가입일</th>
                        <td><%= userInfo.getInputDate() %></td>
                    </tr>
                    <tr>
                        <th scope="row">총구매금액</th>
                        <td><%= userInfo.getTotalPriceRecode() %></td>
                    </tr>
                    <tr>
                        <th scope="row">접근차단여부</th>
                        <td>
                            <input type="text" name="intercept_date" value="<%= userInfo.getAccessLimitFlag() %>" class="frm_input" size="1" maxlength="8">
                            <a href="" class="btn_small grey">접근차단</a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">관리자메모</th>
                        <td colspan="3"><textarea name="memo" class="frm_textbox" rows="3"><%= userInfo.getAdminMemo() %></textarea></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="btn_confirm">
            <input type="submit" value="저장" class="btn_medium" accesskey="s">
            <button type="button" class="btn_medium bx-white" onclick="window.close();">닫기</button>
        </div>
    </section>

</body>
</html>