<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="admin.userManage.UserManageDAO" %>
<%@ page import="admin.userManage.UserDetailedVO" %>
<%@ page import="java.util.List" %>

<%

request.setCharacterEncoding("UTF-8");

// 요청에서 userId 파라미터를 가져옵니다.
String userId = request.getParameter("userId");
System.out.println("요청에서 가져온 userId: " + userId);

// DAO 객체를 생성합니다.
UserManageDAO dao = new UserManageDAO();
UserDetailedVO userInfo = null;

// 파라미터에서 가져온 사용자 ID를 사용하여 사용자의 상세 정보를 가져옵니다.
try {
    userInfo = dao.selectUserDetailById(userId);
    System.out.println("가져온 userInfo: " + userInfo);

    if (userInfo == null) {
        out.println("<p>사용자 정보를 찾을 수 없습니다. 유효한 사용자 ID를 확인하십시오.</p>");
    }
} catch (Exception e) {
    System.out.println("DAO selectUserDetailById(userId) 호출 중 예외 발생: " + e.getMessage());
    e.printStackTrace();
}

// "저장" 버튼이 클릭되었는지 확인합니다.
if (request.getParameter("saveBtn") != null) {
    // 파라미터에서 사용자 수정 정보를 가져옵니다.

    String newEmail = request.getParameter("email");
    System.out.println("새로운 사용자 이메일: " + newEmail);

    String newTel = request.getParameter("cellphone");
    System.out.println("새로운 사용자 전화번호: " + newTel);

    String newZipcode = request.getParameter("zip");
    System.out.println("새로운 사용자 우편번호: " + newZipcode);

    String newDefaultAddr = request.getParameter("addr1");
    System.out.println("새로운 사용자 기본 주소: " + newDefaultAddr);

    String newAdditionalAddr = request.getParameter("addr2");
    System.out.println("새로운 사용자 추가 주소: " + newAdditionalAddr);

    String newAdminMemo = request.getParameter("memo");
    System.out.println("새로운 사용자 관리자 메모: " + newAdminMemo);

    // 사용자 정보를 업데이트합니다.
    try {
            dao.updateUserDetails(userId, newEmail, newTel, newZipcode, newDefaultAddr, newAdditionalAddr, newAdminMemo);
            System.out.println("사용자 정보 업데이트 완료");
            
            // 업데이트가 완료되면 메시지를 출력하고 리다이렉트합니다.
            out.println("<script>alert('수정이 완료되었습니다.'); window.location.href='userInfoManage.jsp';</script>");
            
            // 업데이트된 정보를 다시 가져옵니다.
            userInfo = dao.selectUserDetailById(userId);
            System.out.println("업데이트 후 가져온 userInfo: " + userInfo);
        } catch (Exception e) {
            System.out.println("DAO updateUserDetails 호출 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
        }
	}
	if (request.getParameter("cancelBtn") != null) {
  		// userInfoManage.jsp로 리다이렉트합니다.
  		response.sendRedirect("userInfoManage.jsp");
	}

    // 이후 코드는 수정된 userInfo 객체의 값을 사용하여 JSP 페이지에 데이터를 출력합니다.
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
 
    <section class="new_win_desc marb50">
        <ul class="anchor">
            <li><a href="./pop_memberform.php?mb_id=tubeweb3">회원정보수정</a></li>
        </ul>

        <h3 class="anc_tit">기본정보</h3>
        <form id="updateForm" action="detailedInfoManage.jsp" method="post">
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
                        <th scope="row">회원명</th>
                        <td>
                            <input type="hidden" name="name" value="<%= userInfo.getName() %>"   class="frm_input required" style="background-position: right top; background-repeat: no-repeat;">
                            <%= userInfo.getName() %>
                        </td>
                        <th scope="row">아이디</th>
                        <td>
                        <input type="hidden" name="userId" value="<%= userId %>"><%= userInfo.getId() %>
                        </td>
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
                            <input type="text" name="zip" value="<%= userInfo.getZipcode() != null ? userInfo.getZipcode() : "" %>" class="frm_input" size="8" maxlength="5">
                            <a href="javascript:win_zip('fmemberform', 'zip', 'addr1', 'addr2', 'addr3', 'addr_jibeon');" class="btn_small grey">주소검색</a>
                            <p class="mart5"><input type="text" name="addr1" value="<%= userInfo.getDefaultAddr() != null ? userInfo.getDefaultAddr() : "" %>" class="frm_input" size="60"> 기본주소</p>
                            <p class="mart5"><input type="text" name="addr2" value="<%= userInfo.getAdditionalAddr() != null ? userInfo.getAdditionalAddr() : "" %>" class="frm_input" size="60"> 상세주소</p>
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
                        <td><%= userInfo.getTotalPriceRecode() != null ? userInfo.getTotalPriceRecode() : "" %></td>
                    </tr>
                    <tr>
                        <th scope="row">접근차단여부</th>
                        <td>
                        <% 
        					String accessLimitDisplay = "";

        					String accessLimitFlag = userInfo.getAccessLimitFlag();

        					if ("T".equals(accessLimitFlag)) {
            					accessLimitDisplay = "O";
        					} else if ("F".equals(accessLimitFlag)) {
            					accessLimitDisplay = "X";
       						}
       					 %>
                            <input type="text" name="intercept_date" value="<%= accessLimitDisplay %>" class="frm_input" size="1" maxlength="8" readonly>
                            <a href="" class="btn_small grey">접근차단</a>
                            
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">관리자메모</th>
                         <td colspan="3">
                         <textarea name="memo" class="frm_textbox" rows="3"><%= userInfo.getAdminMemo() != null ? userInfo.getAdminMemo() : "" %></textarea></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="btn_confirm">
            <input type="submit" name="saveBtn" value="저장" class="btn_medium" accesskey="s">
            <input type="submit" name="cancelBtn" value="취소" class="btn_medium bx-white" >
        </div>
        </form>
    </section>
   

</body>
</html>