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
			<form id="joinForm" name="joinForm" action="/exec/front/Member/join/" method="post" target="_self" enctype="multipart/form-data">
<input id="useSimpleSignin" name="useSimpleSignin" value="T" type="hidden">
<input id="member_name_cert_flag" name="member_name_cert_flag" value="F" type="hidden">
<input id="is_name_auth_use" name="is_name_auth_use" value="F" type="hidden">
<input id="is_ipin_auth_use" name="is_ipin_auth_use" value="F" type="hidden">
<input id="is_mobile_auth_use" name="is_mobile_auth_use" value="F" type="hidden">
<input id="is_email_auth_use" name="is_email_auth_use" value="F" type="hidden">
<input id="default_auth_reg_page_flag" name="default_auth_reg_page_flag" value="E" type="hidden">
<input id="realNameEncrypt" name="realNameEncrypt" value="" type="hidden">
<input id="add1_name" name="add1_name" value="" type="hidden">
<input id="add2_name" name="add2_name" value="" type="hidden">
<input id="add3_name" name="add3_name" value="" type="hidden">
<input id="add4_name" name="add4_name" value="" type="hidden">
<input id="is_display_register_foreign" name="is_display_register_foreign" value="F" type="hidden">
<input id="idDuplCheck" name="idDuplCheck" value="" type="hidden">
<input id="emailDuplCheck" name="emailDuplCheck" value="" type="hidden">
<input id="login_id_type" name="login_id_type" value="id" type="hidden">
<input id="display_agree_privacy_required_check_flag" name="display_agree_privacy_required_check_flag" value="T" type="hidden">
<input id="display_agree_information_check_flag" name="display_agree_information_check_flag" value="F" type="hidden">
<input id="display_agree_consignment_check_flag" name="display_agree_consignment_check_flag" value="F" type="hidden">
<input id="display_agree_privacy_optional_check_flag" name="display_agree_privacy_optional_check_flag" value="F" type="hidden">
<input id="display_flag_marketing_consent_check" name="display_flag_marketing_consent_check" value="F" type="hidden">
<input id="display_flag_check_user_defined" name="display_flag_check_user_defined" value="F" type="hidden">
<input id="is_display_register_name" name="is_display_register_name" value="T" type="hidden">
<input id="display_required_name" name="display_required_name" value="T" type="hidden">
<input id="is_display_register_name_phonetic" name="is_display_register_name_phonetic" value="" type="hidden">
<input id="display_required_name_phonetic" name="display_required_name_phonetic" value="" type="hidden">
<input id="is_display_register_eng_name" name="is_display_register_eng_name" value="" type="hidden">
<input id="display_required_name_en" name="display_required_name_en" value="" type="hidden">
<input id="passwd_type" name="passwd_type" value="C" type="hidden">
<input id="is_display_register_addr" name="is_display_register_addr" value="" type="hidden">
<input id="is_display_register_addr2" name="is_display_register_addr2" value="" type="hidden">
<input id="__addr1" name="__addr1" value="" type="hidden">
<input id="__city_name" name="__city_name" value="" type="hidden">
<input id="__state_name" name="__state_name" value="" type="hidden">
<input id="__isRuleBasedAddrForm" name="__isRuleBasedAddrForm" value="F" type="hidden">
<input id="address_direct_input_check" name="address_direct_input_check" value="F" type="hidden">
<input id="display_required_address" name="display_required_address" value="" type="hidden">
<input id="display_required_address2" name="display_required_address2" value="" type="hidden">
<input id="is_display_register_mobile" name="is_display_register_mobile" value="T" type="hidden">
<input id="display_required_cell" name="display_required_cell" value="T" type="hidden">
<input id="display_register_mobile" name="display_register_mobile" value="T" type="hidden">
<input id="use_checking_mobile_number_duplication" name="use_checking_mobile_number_duplication" value="F" type="hidden">
<input id="isMobileVerify" name="isMobileVerify" value="F" type="hidden">
<input id="is_display_register_phone" name="is_display_register_phone" value="" type="hidden">
<input id="display_required_phone" name="display_required_phone" value="" type="hidden">
<input id="display_register_phone" name="display_register_phone" value="T" type="hidden">
<input id="is_display_password_hint" name="is_display_password_hint" value="F" type="hidden">
<input id="required_is_sms_flag" name="required_is_sms_flag" value="T" type="hidden">
<input id="required_is_news_mail_flag" name="required_is_news_mail_flag" value="T" type="hidden">
<input id="is_display_register_birthday" name="is_display_register_birthday" value="" type="hidden">
<input id="display_required_is_birthday" name="display_required_is_birthday" value="" type="hidden">
<input id="display_required_sex" name="display_required_sex" value="" type="hidden">
<input id="nick_name_flag" name="nick_name_flag" value="F" type="hidden">
<input id="nick_name_confirm" name="nick_name_confirm" value="F" type="hidden">
<input id="display_required_nick_name_flag" name="display_required_nick_name_flag" value="" type="hidden">
<input id="is_display_register_wedding" name="is_display_register_wedding" value="" type="hidden">
<input id="display_required_is_wedding_anniversary" name="display_required_is_wedding_anniversary" value="" type="hidden">
<input id="is_display_register_life_partner" name="is_display_register_life_partner" value="" type="hidden">
<input id="display_required_is_life_partner" name="display_required_is_life_partner" value="" type="hidden">
<input id="is_display_bank" name="is_display_bank" value="" type="hidden">
<input id="display_required_bank_account_no" name="display_required_bank_account_no" value="" type="hidden">
<input id="display_required_job" name="display_required_job" value="" type="hidden">
<input id="display_required_job_class" name="display_required_job_class" value="" type="hidden">
<input id="display_required_school" name="display_required_school" value="" type="hidden">
<input id="display_required_interest" name="display_required_interest" value="" type="hidden">
<input id="display_required_region" name="display_required_region" value="" type="hidden">
<input id="display_required_internet" name="display_required_internet" value="" type="hidden">
<input id="display_required_child" name="display_required_child" value="" type="hidden">
<input id="display_required_car" name="display_required_car" value="" type="hidden">
<input id="display_required_earning" name="display_required_earning" value="" type="hidden">
<input id="display_required_reco_id" name="display_required_reco_id" value="" type="hidden">
<input id="display_required_add1" name="display_required_add1" value="" type="hidden">
<input id="display_required_add2" name="display_required_add2" value="" type="hidden">
<input id="display_required_add3" name="display_required_add3" value="" type="hidden">
<input id="display_required_add4" name="display_required_add4" value="" type="hidden">
<input id="returnUrl" name="returnUrl" value="/member/join_result.html" type="hidden">
<input id="sUseCountryNumberFlag" name="sUseCountryNumberFlag" value="F" type="hidden">
<input id="sUseSeparationNameFlag" name="sUseSeparationNameFlag" value="F" type="hidden">
<input id="is_use_checking_join_info" name="is_use_checking_join_info" value="F" type="hidden"><div class="xans-element- xans-member xans-member-join"><!--
        $returnUrl = /member/join_result.html
        $checkIdUrl = /member/check_id.html
        $personalName = 이름
        $companyName = 법인명
        $companySsn = 법인번호
        $foreignerSsn1 = 외국인 등록번호
        $foreignerSsn2 = 여권번호
        $foreignerSsn3 = 국제운전면허증번호
     -->
<div class="ec-base-table typeWrite">
        <table border="1" summary="">
<caption>회원가입</caption>
        <colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>
<tbody>
<tr class="displaynone">
<th scope="row">회원구분 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="member_type0" name="member_type" fw-filter="isFill" fw-label="회원구분" fw-msg="" value="p" type="radio" checked="checked" autocomplete="off"><label for="member_type0">개인회원</label>
<input id="member_type1" name="member_type" fw-filter="isFill" fw-label="회원구분" fw-msg="" value="c" type="radio" autocomplete="off" style="display: none;"><label for="member_type1" style="display: none;">사업자회원</label></td>
            </tr>

<br>
<strong> 회원가입</strong>

</tbody>
</table>
</div>
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
                <td><input id="member_id" name="member_id" fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> <span id="idMsg" class="error">아이디를 입력해 주세요.</span> (영문소문자/숫자, 4~16자)</td>
            </tr>
<tr>
<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td>
                    <div class="eTooltip">
                        <input id="passwd" name="passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value="" type="password">                        <div class="ec-base-tooltip typeUpper">
                            <div class="content">
                                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                                <ul class="ec-base-help typeDash gBlank10 txtWarn">
                                    - 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자<br>- 입력 가능 특수문자 
                                    <br>&nbsp;&nbsp;&nbsp;  ~ ` ! @ # $ % ^ ( ) * _ - = { } [ ] | ; : &lt; &gt; , . ? /
                                    <br>- 공백 입력 불가능<br>- 연속된 문자, 숫자 사용 불가능<br>- 동일한 문자, 숫자를 반복해서 사용 불가능
                                    <br>- 아이디 포함 불가능                                
                                    </ul>
<</div>
                            <a href="#none" class="btnClose" tabindex="-1"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"></a>
                            <span class="edge"></span>
                        </div>
                    </div>
                    (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)                </td>
            </tr>
<tr>
<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="" type="password"> <span id="pwConfirmMsg"></span> </td>
            </tr>

<tr class="displaynone">
<th scope="row">비밀번호 확인 답변 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="hint_answer" name="hint_answer" fw-filter="" fw-label="비밀번호 확인시 답변" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"></td>
            </tr>
<tr>
<th scope="row" id="nameTitle">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td>
                    <span id="nameContents"><input type="text" name="name" id="name" maxlength="20"></span>
                    <span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span>
                </td>
            </tr>
<tr class="displaynone">



<tr class="">
<th scope="row">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td><select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">-<input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text"></td>
            </tr>
<tr>
<th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="email1" name="email1" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="" type="text"> <span id="emailMsg"></span>
</td>
            </tr>
            
            
           
</tbody>
</table>
<br>
<strong> 배송정보</strong>
<table>
 <tr class="">
<th scope="row">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                    <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text">                    <a href="#none" class="btnNormal" onclick="" id="postBtn">우편번호</a><br>
                    <input id="addr1" name="addr1" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"> 기본주소<br>
                    <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 나머지주소                 </td>
            </tr>
</table>

</div>


    <div class="ec-base-button">
        <a href="#none" class="btnSubmitFix sizeS" id="ec_shop_confirm-checkingjoininfo_action">회원가입</a>
        <a href="#none" class="btnNormalFix sizeS" onclick="CheckingJoinInfoLayerClose()">닫기</a>
    </div>
    <a href="#none" class="close"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기" onclick="CheckingJoinInfoLayerClose()"></a>
</div>
</div>
</form>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>