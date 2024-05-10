<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<!-- golgolz end -->
	
<style type="text/css">
/* input-group 클래스 스타일 조정 */
.input-group {
    display: flex; /* 입력 필드와 버튼을 같은 줄에 배치 */
    align-items: center; /* 높이를 동일하게 정렬 */
}

/* 입력 필드와 로그인 버튼의 높이를 동일하게 맞춤 */
.inputTypeText, /* 아이디 입력 필드 */
input[type="password"], /* 비밀번호 입력 필드 */
.btn_login { /* 로그인 버튼 */
    height: 40px; /* 높이 값을 동일하게 조정 */
    padding: 0 10px; /* 입력 필드 및 버튼에 패딩 추가 */
}

</style>
</head>
<body>
	<jsp:include page="../../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div id="loginFrm">
    <div id="container">
		<div id="contents">
		
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="/">홈</a></li>
        <li title="현재 위치"><strong>로그인</strong></li>
    </ol></div>

<form id="member_form_1401611517" name="loginForm" action="/user_login_process.jsp" method="post" target="_self" enctype="multipart/form-data">
    <input id="returnUrl" name="returnUrl" value="https://insideobject.com/" type="hidden">
    <input id="forbidIpUrl" name="forbidIpUrl" value="/index.html" type="hidden">
    <input id="certificationUrl" name="certificationUrl" value="/intro/adult_certification.html" type="hidden">
    <input id="sIsSnsCheckid" name="sIsSnsCheckid" value="" type="hidden">
    <input id="sProvider" name="sProvider" value="" type="hidden">

    <div class="xans-element- xans-member xans-member-login">
        <div class="login">
            <h3>MEMBER LOGIN</h3>
            <p class="sub_txt">
                쇼핑몰의 회원이 되시면 다양한 혜택을 누리실 수 있습니다.
            </p>

            <fieldset>
                <legend>회원로그인</legend>
                
                 <div class="input-group">
                    <label class="id">
                        <span>아이디</span>
                        <input id="member_id" name="member_id" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text">
                    </label>
                    <label class="password">
                        <span>비밀번호</span>
                        <input id="member_passwd" name="member_passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off" value="" type="password">
                    </label>
                    <!-- 로그인 버튼을 같은 줄에 배치 -->
                    <input type="submit" value="로그인" class="btn_login">
                </div>
                
                <div class="find_area">
                    <ul>
                        <li><a href="/member/id/find_id.html">아이디찾기</a></li>
                        <li>&nbsp;|&nbsp;</li>
                        <li><a href="/member/passwd/find_passwd_info.html">비밀번호찾기</a></li>
                    </ul>
                </div>
            </fieldset>
        </div>
        
        <!-- 회원가입 섹션 -->
         <div class="join_area">
            <div class="join">
                <div class="join_title">회원가입</div>
                아직 회원이 아니십니까?<br>회원을 위한 다양한 혜택이 준비되어 있습니다.
            </div>
            <!-- 회원가입 버튼의 디자인 개선 -->
            <div class="join_btn">
                <a href="/member/join.html" class="join_btn_link">회원가입</a>
            </div>
    </div>
</form>

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