<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<!-- golgolz end -->
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

<form id="member_form_1401611517" name="" action="/exec/front/Member/login/" method="post" target="_self" enctype="multipart/form-data">
<input id="returnUrl" name="returnUrl" value="https://insideobject.com/" type="hidden">
<input id="forbidIpUrl" name="forbidIpUrl" value="/index.html" type="hidden">
<input id="certificationUrl" name="certificationUrl" value="/intro/adult_certification.html" type="hidden">
<input id="sIsSnsCheckid" name="sIsSnsCheckid" value="" type="hidden">
<input id="sProvider" name="sProvider" value="" type="hidden"><div class="xans-element- xans-member xans-member-login "><!--
        $defaultReturnUrl = /index.html
        $forbidIpUrl = member/adminFail.html
    -->
<div class="login">
        <h3>MEMBER LOGIN</h3>
		<p class="sub_txt">
		쇼핑몰의 회원이 되시면 다양한 혜택을 누리실 수 있습니다.
		</p>

        <fieldset>
<legend>회원로그인</legend>
            <label class="id"><span>아이디</span><input id="member_id" name="member_id" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"></label>
            <label class="password"><span>비밀번호</span><input id="member_passwd" name="member_passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off" value="" type="password"></label>
			<a href="#none" onclick="MemberAction.login('member_form_1401611517'); return false;" class="btn_login">로그인</a>
			<div class="find_area">
				<ul>
<li><a href="/member/id/find_id.html">아이디찾기</a></li>
					<li>&nbsp;|&nbsp;</li>
					<li><a href="/member/passwd/find_passwd_info.html">비밀번호찾기</a></li>
				</ul>
</div>
			
        </fieldset>
</div>
<div class="join_area">
		<div class="join">
<div class="join_title">회원가입</div>아직 회원이 아니십니까?<br>회원을 위한 다양한 혜택이 준비되어 있습니다.</div>
		<div class="join_btn"><a href="/member/join.html">회원가입</a></div>
	</div>
<div class="nonmember_area displaynone" id="noMemberWrap">
		<div class="join">
<div class="join_title">비회원주문</div>
			본 쇼핑몰에서는 비회원님도 구매가 가능합니다.<br>
			단, 비회원 주문시 쇼핑몰에서제공하는 다양한<br>
			회원혜택에서 제외될 수 있습니다.
		</div>
		<div class="join_btn"><a href="" onclick="">비회원구매</a></div>
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