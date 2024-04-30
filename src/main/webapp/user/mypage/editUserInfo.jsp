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
			마이 페이지 입니다.
			<!-- golgolz start -->
			
			<div id="wrap">
    <div id="container">
		<div id="contents">
		
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="/">홈</a></li>
        <li title="현재 위치"><strong>회원 정보 수정</strong></li>
    </ol></div>

<div class="titleArea">
    <h2>회원 정보 수정</h2>
</div>

<div class="xans-element- xans-myshop xans-myshop-asyncbenefit"><div class="ec-base-box typeMember gMessage ">
        <div class="information">
            <div class="description">
                <p>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong class="txtEm"><span><span class="xans-member-var-name">홍성강</span></span></strong>님 </p>
            </div>
        </div>
     </div>
</div>



<form id="editForm" name="editForm" action="/exec/front/Member/edit/" method="post" target="_self" enctype="multipart/form-data">
<input id="useSimpleSignin" name="useSimpleSignin" value="T" type="hidden">
<input id="is_certification" name="is_certification" value="F" type="hidden">
<input id="is_email_auth_use" name="is_email_auth_use" value="F" type="hidden">
<input id="emailDuplCheck" name="emailDuplCheck" value="T" type="hidden">
<input id="login_id_type" name="login_id_type" value="id" type="hidden">
<input id="display_flag_marketing_consent_check" name="display_flag_marketing_consent_check" value="F" type="hidden">
<input id="display_flag_check_user_defined" name="display_flag_check_user_defined" value="F" type="hidden">
<input id="is_display_register_name" name="is_display_register_name" value="T" type="hidden">
<input id="display_required_name" name="display_required_name" value="T" type="hidden">
<input id="is_display_register_name_phonetic" name="is_display_register_name_phonetic" value="F" type="hidden">
<input id="display_required_name_phonetic" name="display_required_name_phonetic" value="F" type="hidden">
<input id="is_display_register_eng_name" name="is_display_register_eng_name" value="F" type="hidden">
<input id="display_required_name_en" name="display_required_name_en" value="F" type="hidden">
<input id="passwd_type" name="passwd_type" value="C" type="hidden">
<input id="is_display_register_addr" name="is_display_register_addr" value="T" type="hidden">
<input id="is_display_register_addr2" name="is_display_register_addr2" value="T" type="hidden">
<input id="__addr1" name="__addr1" value="" type="hidden">
<input id="__city_name" name="__city_name" value="" type="hidden">
<input id="__state_name" name="__state_name" value="" type="hidden">
<input id="__isRuleBasedAddrForm" name="__isRuleBasedAddrForm" value="F" type="hidden">
<input id="address_direct_input_check" name="address_direct_input_check" value="F" type="hidden">
<input id="display_required_address" name="display_required_address" value="T" type="hidden">
<input id="display_required_address2" name="display_required_address2" value="T" type="hidden">
<input id="is_display_register_mobile" name="is_display_register_mobile" value="T" type="hidden">
<input id="display_required_cell" name="display_required_cell" value="T" type="hidden">
<input id="display_register_mobile" name="display_register_mobile" value="T" type="hidden">
<input id="use_checking_mobile_number_duplication" name="use_checking_mobile_number_duplication" value="F" type="hidden">
<input id="isMobileVerify" name="isMobileVerify" value="F" type="hidden">
<input id="is_display_register_phone" name="is_display_register_phone" value="F" type="hidden">
<input id="display_required_phone" name="display_required_phone" value="F" type="hidden">
<input id="display_register_phone" name="display_register_phone" value="T" type="hidden">
<input id="is_display_password_hint" name="is_display_password_hint" value="F" type="hidden">
<input id="required_is_sms_flag" name="required_is_sms_flag" value="T" type="hidden">
<input id="required_is_news_mail_flag" name="required_is_news_mail_flag" value="T" type="hidden">
<input id="is_display_register_birthday" name="is_display_register_birthday" value="F" type="hidden">
<input id="display_required_is_birthday" name="display_required_is_birthday" value="F" type="hidden">
<input id="display_required_sex" name="display_required_sex" value="T" type="hidden">
<input id="nick_name_flag" name="nick_name_flag" value="F" type="hidden">
<input id="nick_name_confirm" name="nick_name_confirm" value="F" type="hidden">
<input id="display_required_nick_name_flag" name="display_required_nick_name_flag" value="F" type="hidden">
<input id="is_display_register_wedding" name="is_display_register_wedding" value="F" type="hidden">
<input id="display_required_is_wedding_anniversary" name="display_required_is_wedding_anniversary" value="F" type="hidden">
<input id="is_display_register_life_partner" name="is_display_register_life_partner" value="F" type="hidden">
<input id="display_required_is_life_partner" name="display_required_is_life_partner" value="F" type="hidden">
<input id="bank_account_owner" name="bank_account_owner" value="" type="hidden">
<input id="refund_bank_code" name="refund_bank_code" value="" type="hidden">
<input id="bank_account_no" name="bank_account_no" value="" type="hidden">
<input id="display_required_bank_account_no" name="display_required_bank_account_no" value="T" type="hidden">
<input id="display_required_job" name="display_required_job" value="F" type="hidden">
<input id="display_required_job_class" name="display_required_job_class" value="F" type="hidden">
<input id="display_required_school" name="display_required_school" value="F" type="hidden">
<input id="display_required_interest" name="display_required_interest" value="F" type="hidden">
<input id="display_required_region" name="display_required_region" value="F" type="hidden">
<input id="display_required_internet" name="display_required_internet" value="F" type="hidden">
<input id="display_required_child" name="display_required_child" value="F" type="hidden">
<input id="display_required_car" name="display_required_car" value="F" type="hidden">
<input id="display_required_earning" name="display_required_earning" value="F" type="hidden">
<input id="display_required_reco_id" name="display_required_reco_id" value="F" type="hidden">
<input id="display_required_add1" name="display_required_add1" value="F" type="hidden">
<input id="display_required_add2" name="display_required_add2" value="F" type="hidden">
<input id="display_required_add3" name="display_required_add3" value="F" type="hidden">
<input id="display_required_add4" name="display_required_add4" value="F" type="hidden">
<input id="returnUrl" name="returnUrl" value="/" type="hidden">
<input id="sUseCountryNumberFlag" name="sUseCountryNumberFlag" value="F" type="hidden">
<input id="sUseSeparationNameFlag" name="sUseSeparationNameFlag" value="F" type="hidden">
<input id="sEData" name="sEData" value="ciFuJBs68TsNmtui7lM4SYSMzTU8LtHNAgJ125S1cDnyb2c+KvuO3ILHM1AgzLZ2FJao2e6/sES0n0ovnWGvC5L9i1QSAh5MDDwuMTBZUbm6HAwvm/RgiD2jmr0byiauSs4bfqsePrjyPWLQbdxMFHbetl96DxfMxakdh+M0pD01+3w0E88+c5J6nTiUPJyLMQ8uIrjoejaAK/HXef2oYlKeq2jBukuvINkLJ1MwbLAk8NjCj3ds5behPoQ9i+AJyCjkAzn4PEbnENWX+xBHt/3lwb49mrgsX/6kSbo6lDGdUtXVoZnsma5/MU0hHdL5jfYFoyFc8jn6TqGY8K20q6q+wDOXXBqunxEt+WX/fz8Cm6OBE/2L2oZUukBdZOrEgPaJhUqYtcf3SRvL6HuPCi/4cpHD+vM+6Icl9YirUvtoZh33QVtSG+ulNufuDPD2Hz4E4THkJ2zxuD+EJqJFigwEw7vxLlfK6Pqs14a7HBA1COtzrvQxtS30wcR02A96XwBC4+c44Di0kaPimjLMonnKO+BXAP0aDwS1+0tzPTR3TvhAff6Z+C3K9w2GkghA9nxKfR1B5BnqaekhtpfX/TgtSYlOhrhzO6j+y/x+E8MQRimBhf2EVQF4/N8C0gD/akA7FSkmg02ibh1TgVQSflfW7RPIHKDvFsKDh/DZjUlHR4cnZSnvFlS4333XZP1VRdsPWQkFwYg/Zp07pJgjvyhXK4nf7Ipl9e9fkxMU75s39orO1mZFTzhS9omX/VZJe7grnSTAAyzB86T3NA6pSHre4P7ksmUsdSufyhemvj2gL2L9RDfae2poLRzHosc6sEmw7a2BHb1psOABnzmUx4HmyTlvgua5DiO74XD5EVkF7DT3pt4NXzghA39wJLBlWe+8s4htrcDAdWpnXDhuiBzpc1b5cGEt/a1HbdXYtlPyWgQNn4gfsG94IvvAxkMQKHcmNyIlj/KahhqAo3g49+ZRR6jCo/1GrXsjibQ0bJyqddb6znBxFbk6M84Ukr5NAv4/SGVsI/N0f/M+HeypUWe7hyL4FzVABjyp7g7sgHRMJJJMqlax4CRfXG9UnJdOZ+4DBJKas3ok7adxs4ECGl9TIhYcgac8T3QldMlBbdFSsL4UmgX3kAv3r+Vnv7VES3WmDpoRtsv9/P+NWNMTYNaVM85rUI1Dq5JdTFtYAuqOC1YFXELmi/jnrFxNSGgPjKKECd4UxrN3L6r+bv3rYlLmolPoL/rba10BUMUtEqoDmr1qRS/5hG4c/D34cQU2NJ/WGfQSHV1vZRMm9h0rhHVtWUiXljTyQHlzP9TBMfQFjuINfsYPoiNmcBSxDFzVGKvtesJeYOWre8D8VmLhtA==" type="hidden">
<input id="sEDataDiff" name="sEDataDiff" value="eyJhZGQxIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJhZGQyIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJhZGQzIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJhZGQ0IjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJtZW1iZXJfaWQiOiI2ZDJhZDU2ZDcxNjNiY2QwYzFiMDdjYzExOTViNWUyMCIsImhpbnRfYW5zd2VyIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJuYW1lX2NvbnRlbnRzIjoiNmYxMjVjYThkZGU0MWFlODFjYzk0MTdhMzdlZDk0NDAiLCJzc25fY29udGVudHMiOiI1OGE0YTQ3YzQ3ZGRhMTE1MmFjNGYxOGIwZjE2M2U3NCIsInBvc3Rjb2RlMSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwicG9zdGNvZGUyIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJhZGRyMSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiYWRkcjIiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImNpdHlfbmFtZSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwic3RhdGVfbmFtZSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwic3RyZWV0X25hbWUiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsInBob25lMSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwicGhvbmUyIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJwaG9uZTMiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsIm1vYmlsZTEiOiJlYTIwYTA0M2MwOGY1MTY4ZDQ0MDlmZjQxNDRmMzJlMiIsIm1vYmlsZTIiOiIzMjllNjU4MWVmYmM5MGJkOTJhMWYyMmM0YmEyMTAzZCIsIm1vYmlsZTMiOiI2ZmI1MmU3MWI4Mzc2MjhhYzE2NTM5YzFmZjkxMTY2NyIsImVtYWlsMSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiZW1haWwyIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJlbWFpbDMiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImJpcnRoX3llYXIiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImJpcnRoX21vbnRoIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJiaXJ0aF9kYXkiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsIm1hcnJ5X3llYXIiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsIm1hcnJ5X21vbnRoIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJtYXJyeV9kYXkiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsInBhcnRuZXJfeWVhciI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwicGFydG5lcl9tb250aCI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwicGFydG5lcl9kYXkiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsIl9fYWRkcjEiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsIl9fY2l0eV9uYW1lIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJfX3N0YXRlX25hbWUiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsIm5pY2tfbmFtZSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiaXNfbmV3c19tYWlsIjoiODAwNjE4OTQzMDI1MzE1Zjg2OWU0ZTFmMDk0NzEwMTIiLCJpc19zbXMiOiI4MDA2MTg5NDMwMjUzMTVmODY5ZTRlMWYwOTQ3MTAxMiIsInNleCI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiaXNfc29sYXJfY2FsZW5kYXIiOiJiOWVjZTE4Yzk1MGFmYmZhNmIwZmRiZmE0ZmY3MzFkMyIsInJlZ2lvbiI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiaW50ZXJlc3QiOiI4NTNhZTkwZjAzNTEzMjRiZDczZWE2MTVlNjQ4NzUxNyIsImludGVybmV0IjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJjaGlsZCI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiY2FyIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJhdmFpbF9taWxlYWdlIjoiMzEyNWZmMjMwMWViM2M5ZjI3N2RjMmU3NmFiNGY5NzEiLCJyZWNvX2lkIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJ6aXBjb2RlIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJtZW1iZXJfdHlwZSI6IjgzODc4YzkxMTcxMzM4OTAyZTBmZTBmYjk3YThjNDdhIiwiY29tcGFueV90eXBlIjoiNzIxNWVlOWM3ZDlkYzIyOWQyOTIxYTQwZTg5OWVjNWYiLCJjc3NuIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJibmFtZSI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwiY25hbWUiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImJzc24xIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJmb3JlaWduZXJfdHlwZSI6IjcyMTVlZTljN2Q5ZGMyMjlkMjkyMWE0MGU4OTllYzVmIiwiY2l0aXplbnNoaXAiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsInBlcnNvbmFsX3R5cGUiOiI3MjE1ZWU5YzdkOWRjMjI5ZDI5MjFhNDBlODk5ZWM1ZiIsInJlZnVuZF9iYW5rX2NvZGUiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImNvdW50cnlfY29kZSI6IjBhZTE2NmRmZmRlMGUzNjhlOWM3MTM5NjhlYTgzZmM3IiwiaXNfYWdyZWVkX3Byb3ZpZGluZ19pbmZvcm1hdGlvbiI6IjgwMDYxODk0MzAyNTMxNWY4NjllNGUxZjA5NDcxMDEyIiwiaXNfYWdyZWVkX2NvbnNpZ25pbmdfaW5mb3JtYXRpb24iOiI4MDA2MTg5NDMwMjUzMTVmODY5ZTRlMWYwOTQ3MTAxMiIsImlzX2F1dGhlbnRpY2F0ZWRfYnlfZW1haWwiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsInRvdGFsX2RlcG9zaXQiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImRpcmVjdF9pbnB1dF9jaGVjayI6ImQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0MjdlIiwicmVnaXN0X2RhdGUiOiJkNjMyYTJiMDhkYzMyYThkYTBiMmExNDMxMmU2NTk0OSIsImlzX2pvaW5fcHJpdmFjeV9wb2xpY3lfb3B0aW9uYWwiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImNvbXBhbnlfY29uZGl0aW9uIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJjb21wYW55X2xpbmUiOiJkNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIsImlzX21hcmtldGluZ19jb25zZW50IjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UifQ==" type="hidden">
<input id="display_agree_information_check_flag" name="display_agree_information_check_flag" value="F" type="hidden">
<input id="display_agree_consignment_check_flag" name="display_agree_consignment_check_flag" value="F" type="hidden">
<input id="display_agree_privacy_optional_check_flag" name="display_agree_privacy_optional_check_flag" value="F" type="hidden"><div class="xans-element- xans-member xans-member-edit"><!--
        $login_page = /member/login.html
     -->

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
                    <input id="member_id" name="member_id" fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text">                     (영문소문자/숫자, 4~16자)
                </td>
            </tr>
<tr>
<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                    <div class="eTooltip">
                        <input id="passwd" name="passwd" fw-filter="isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" disabled="1" value="" type="password">                        <div class="ec-base-tooltip typeUpper ">
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
<tr class="">
<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td><input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" disabled="1" value="" type="password"> <span id="pwConfirmMsg"></span>
                	<input type="button" value="비밀번호 변경">
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
                <td><input id="name" name="name" fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" readonly="readonly" value="홍성강" type="text"></td>
            </tr>

<tr class="">
<th scope="row">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                    <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text">                    <a href="#none" class="btnNormal" onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');" id="postBtn">우편번호</a><br>
                    <input id="addr1" name="addr1" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"> 기본주소<br>
                    <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 나머지주소                 </td>
            </tr>

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
                <td>
                    <input id="email1" name="email1" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="" type="text"> <span id="emailMsg"></span>
                    <p class="displaynone">이메일 주소 변경 시 로그아웃 후 재인증을 하셔야만 로그인이 가능합니다.<br>인증 메일은 24시간 동안 유효하며, 유효 시간이 만료된 후에는 가입 정보로 로그인 하셔서 재발송 요청을 해주시기 바랍니다.</p>
                </td>
            </tr>


</tbody>
</table>
</div>


<div class="ec-base-button justify">
        <a href="#none" class="btnSubmitFix sizeM" onclick="memberEditAction()">회원정보수정</a>
        <a href="/index.html" class="btnEmFix sizeM">취소</a>
        
    </div>

			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>