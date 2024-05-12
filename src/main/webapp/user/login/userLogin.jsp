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

<form id="loginForm" name="loginForm" action="user_login_process.jsp" method="post" >
    <div class="xans-element- xans-member xans-member-login">
        <div class="login">
            <h3>MEMBER LOGIN</h3>
            <p class="sub_txt">
                쇼핑몰의 회원이 되시면 다양한 혜택을 누리실 수 있습니다.
            </p>

             <fieldset>
                <legend>회원로그인</legend>
                <label class="id"><span>아이디</span>
                    <input id="member_id" name="member_id" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text">
                </label>
                <label class="password"><span>비밀번호</span>
                    <input id="member_passwd" name="member_passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off" value="" type="password">
                </label>
 					<a href="javascript:void(0)" class="btn_login">로그인</a>
                
                
                <div class="find_area">
                    <ul>
                        <li><a href="../findIdPw/findId.jsp">아이디찾기</a></li>
                        <li>&nbsp;|&nbsp;</li>
                        <li><a href="../findIdPw/findPw.jsp">비밀번호찾기</a></li>
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
                <a href="../signUp/signUp.jsp" class="join_btn_link">회원가입</a>
            </div>
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
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            var loginButton = document.querySelector('.btn_login');
            loginButton.addEventListener('click', function(event) {
                console.log('Form submitted');
                var form = document.getElementById('loginForm');
                form.submit();
                event.preventDefault();
            });
        });
    </script> 
</body>
</html>