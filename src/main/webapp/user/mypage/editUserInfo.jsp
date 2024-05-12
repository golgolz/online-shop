<%@page import="user.myPage.MyPageDAO"%>
<%@page import="user.myPage.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../../assets/jsp/user/lib.jsp" />
    <!-- golgolz start -->
    
    <%
        UserVO userDetails = (UserVO) session.getAttribute("userDetails");
    
    %>
    <!-- golgolz end -->
    <%
    request.setCharacterEncoding("UTF-8");

    // 요청에서 userId 파라미터를 가져옵니다.
    String userId = (String) session.getAttribute("userId");
    System.out.println("요청에서 가져온 userId: " + userId);

    // DAO 객체를 생성합니다.
    MyPageDAO dao = new MyPageDAO();
    UserVO userInfo = null;
    
    try {
      userInfo = userDetails;
      System.out.println("가져온 userInfo: " + userInfo);
     
  } catch (Exception e) {
      System.out.println("DAO selectUserDetailById(userId) 호출 중 예외 발생: " + e.getMessage());
      e.printStackTrace();
  }
    if (request.getParameter("saveBtn") != null) {
      
      String mobile1 = request.getParameter("mobile1");
      String mobile2 = request.getParameter("mobile2");
      String mobile3 = request.getParameter("mobile3");

      String newTel = mobile1 + "-" + mobile2 + "-" + mobile3;
      System.out.println("새로운 사용자 전화번호: " + newTel);
      
    String newId = request.getParameter("member_id");
    String newEmail = request.getParameter("email1");
    String newName = request.getParameter("name");
    //String newTel = request.getParameter("mobile1") + "-" + request.getParameter("mobile2") + "-" + request.getParameter("mobile3");
    System.out.println("새로운 사용자 전화번호: " + newTel);
    String newZipcode = request.getParameter("postcode1");
    String newDefaultAddr = request.getParameter("addr1");
    String newAdditionalAddr = request.getParameter("addr2");
    
    // 사용자 정보를 업데이트
    try {
    boolean isUpdated = dao.updateUser(userId, newName, newEmail, newTel, newZipcode, newDefaultAddr, newAdditionalAddr);
    if(isUpdated) {
        System.out.println("사용자 정보 업데이트 완료");
        
        userDetails.setName(newName);
        userDetails.setEmail(newEmail);
        userDetails.setTel(newTel);
        userDetails.setZipcode(newZipcode);
        userDetails.setDefaultAddr(newDefaultAddr);
        userDetails.setAdditionalAddr(newAdditionalAddr);
        
     	// 세션에 새로운 사용자 정보를 반영한 후 리다이렉트
        session.setAttribute("userDetails", userDetails);
        
    	 
     
        // 업데이트가 완료되면 메시지를 출력하고 리다이렉트합니다.
        //response.sendRedirect("mypage.jsp");
        
        
		 %>
	        <script type='text/javascript'>
	            alert('개인정보 수정완료!');
	            location='mypage.jsp';
	        </script>
	        <%
    } else {
        System.out.println("사용자 정보 업데이트 실패");
        // 업데이트가 실패했을 때 처리할 내용을 추가합니다.
    }
} catch (Exception e) {
    System.out.println("DAO updateUserDetails 호출 중 예외 발생: " + e.getMessage());
    e.printStackTrace();
}
    }

if (request.getParameter("cancelBtn") != null) {
    // userInfoManage.jsp로 리다이렉트합니다.
    response.sendRedirect("mypage.jsp");
}
    
    
    %>

    
</head>
<body>
    <jsp:include page="../../assets/jsp/user/header.jsp" />
    <div id="wrap">
        <div id="main">
            마이 페이지 입니다.
            <!-- golgolz start -->
            
            <div id="wrap">
                <div id="container">
                    <div id="contents">
                    
                        <div class="path">
                            <span>현재 위치</span>
                            <ol><li><a href="/">홈</a></li>
                                <li title="현재 위치"><strong>회원 정보 수정</strong></li>
                            </ol>
                        </div>

                        <div class="titleArea">
                            <h2>회원 정보 수정</h2>
                        </div>

                        <div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
                            <div class="ec-base-box typeMember gMessage ">
                                <div class="information">
                                    <div class="description">
                                        <p>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong class="txtEm"><span><span class="xans-member-var-name"><%= userDetails.getName() %></span></span></strong>님 </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form id="editForm" name="editForm" action="editUserInfo.jsp" method="post">

                            <div class="xans-element- xans-member xans-member-edit"><!-- $login_page = /member/login.html -->

                                <h3 class="displaynone ">기본정보</h3>
                                <p class="required displaynone"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"> 필수입력사항</p>
                                <div class="ec-base-table typeWrite">
                                    <table border="1" summary="">
                                        <caption>회원 기본정보</caption>
                                        <colgroup>
                                            <col style="width:150px;">
                                            <col style="width:auto;">
                                        </colgroup>
                                        <tbody>
                                          <tr>
<th scope="row">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td>
                    <input id="member_id" name="member_id"  fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""  value="<%=userDetails.getId() %>" type="text">                     (영문소문자/숫자, 4~16자)
                </td>
            </tr>
<tr>
<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                    (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)                </td>
            </tr>
<tr class="">
<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" disabled="1" value="" type="password"> <span id="pwConfirmMsg"></span>
                	<input type="button" value="비밀번호 변경" onclick="window.location.href='http://localhost/online-shop/user/mypage/editPw.jsp';">
</td>

            </tr>
<tr class="displaynone">
<th scope="row">새 비밀번호</th>
                <td>
                    <div class="eTooltip">
                        <input id="new_passwd" name="new_passwd" fw-filter="isMin[4]&amp;isMax[16]" fw-label="새 비밀번호" fw-msg="" maxlength="16" disabled="1" value="" type="password">                        <div class="ec-base-tooltip typeUpper">
                            <div class="content">
                                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                                <ul class="ec-base-help typeDash gBlank10 txtWarn">
                                    - 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자<br>- 입력 가능 특수문자 <br>&nbsp;&nbsp;&nbsp;  ~ ` ! @ # $ % ^ ( ) * _ - = { } [ ] | ; : &lt; &gt; , . ? /<br>- 공백 입력 불가능<br>- 연속된 문자, 숫자 사용 불가능<br>- 동일한 문자, 숫자를 반복해서 사용 불가능<br>- 아이디 포함 불가능                                </ul>
</div>
                            <a href="#none" class="btnClose" tabindex="-1"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"></a>
                            <span class="edge"></span>
                        </div>
                    </div>
                    (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)                </td>
            </tr>
<tr class="displaynone">
<th scope="row">새 비밀번호 확인</th>
                <td><input id="new_passwd_confirm" name="new_passwd_confirm" fw-filter="isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg="" maxlength="16" disabled="1" value="" type="password"> <span id="new_pwConfirmMsg"></span>
</td>
            </tr>
<tr style="display:1">
<th scope="row" id="">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="name" name="name" fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" value="<%= userDetails.getName() %>" type="text"></td>
            </tr>

<tr class="">
<th scope="row">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                    <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="<%= userDetails.getZipcode() != null ? userDetails.getZipcode() : "" %>" type="text">                    
                    <a href="#none" class="btnNormal" onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');" id="postBtn">우편번호</a><br>
                    <input id="addr1" name="addr1"  class="inputTypeText"  readonly="readonly" value="<%= userDetails.getDefaultAddr() != null ? userDetails.getDefaultAddr() : "" %>" type="text"> 기본주소<br>
                    <input id="addr2" name="addr2" class="inputTypeText"  value="<%= userDetails.getAdditionalAddr() != null ? userDetails.getAdditionalAddr() : "" %>" type="text"> 나머지주소                 </td>
            </tr>

<tr class="">
<th scope="row">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                    <% String[] mobile = userDetails.getTel().split("-"); %>
                    <select id="mobile1" name="mobile1" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">
                        <option value="010" <%= mobile[0].equals("010") ? "selected" : "" %>>010</option>
                        <option value="011" <%= mobile[0].equals("011") ? "selected" : "" %>>011</option>
                        <option value="016" <%= mobile[0].equals("016") ? "selected" : "" %>>016</option>
                        <option value="017" <%= mobile[0].equals("017") ? "selected" : "" %>>017</option>
                        <option value="018" <%= mobile[0].equals("018") ? "selected" : "" %>>018</option>
                        <option value="019" <%= mobile[0].equals("019") ? "selected" : "" %>>019</option>
                    </select>
                    -
                    <input id="mobile2" name="mobile2" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="<%= mobile[1] != null ? mobile[1] : "" %>" type="text">-
                    <input id="mobile3" name="mobile3" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="<%= mobile[2] != null ? mobile[2] : "" %>" type="text">
                </td>
            </tr>

<tr>
<th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td>
                    <input id="email1" name="email1" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N"  value="<%=userDetails.getEmail() %>" type="text"> <span id="emailMsg"></span>
                    <p class="displaynone">이메일 주소 변경 시 로그아웃 후 재인증을 하셔야만 로그인이 가능합니다.<br>인증 메일은 24시간 동안 유효하며, 유효 시간이 만료된 후에는 가입 정보로 로그인 하셔서 재발송 요청을 해주시기 바랍니다.</p>
                </td>
            </tr>


</tbody>
                                    </table>
                                </div>

                            </div>

                            <div class="ec-base-button justify">
                                <input type="submit" name="saveBtn" id="saveBtn" class="btnSubmitFix sizeM" value="회원정보수정" >
                                <a href="mypage.jsp" name="cancelBtn" id="cancelBtn" class="btnEmFix sizeM">취소</a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <!-- golgolz end -->
        </div>
    </div>
</body>
</html>
