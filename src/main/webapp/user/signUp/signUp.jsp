<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function zipcodeapi() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#postcode1').val(data.zonecode); //5자리 새우편번호 사용
                $('#addr1').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('#addr2').focus();
            }
        }).open();
    }
</script>
	<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			
			<form id="joinForm" name="joinForm" action="signUp_process.jsp" method="post">
                <input type="hidden" id="useSimpleSignin" name="useSimpleSignin" value="T">
                

<div class="ec-base-table typeWrite">
        <table border="1" summary="">
<caption>회원가입</caption>
        <colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>
<tbody>

<br>
<strong> 회원가입</strong> <br/>
(<img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"> 는 필수 입력입니다.)

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
                <td><input id="member_id" name="member_id" fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> <span id="idMsg" class="error">아이디를 입력해 주세요.</span> 
                (영문소문자/숫자, 4~16자)</td>
            </tr>
<tr>
<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td>
                    <div class="eTooltip">
                        <input id="passwd" name="passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16"  type="password">                        <div class="ec-base-tooltip typeUpper">
                           
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

<tr>
<th scope="row" id="nameTitle">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                <td>
                    <span id="nameContents"><input type="text" name="name" id="name" maxlength="20"></span>
                    <span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span>
                </td>
            </tr>
<tr class="displaynone">



<tr class="">
<th scope="row">휴대전화 
<img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                <td>
                <select id="mobile1" name="mobile1" >
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>
-<input id="mobile2" name="mobile2" maxlength="4"  type="text">-
<input id="mobile3" name="mobile3" maxlength="4"  type="text"></td>
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
<th scope="row">주소 </th>
                <td>
                    <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text">                    
                   <a href="#" class="btnNormal" onclick="zipcodeapi();" id="postBtn">우편번호</a><br>
                    <input id="addr1" name="addr1" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"> 기본주소<br>
                    <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 나머지주소                 </td>
            </tr>
</table>

</div>


   <div class="ec-base-button">
                    <button type="submit" class="btnSubmitFix sizeS" id="ec_shop_confirm-checkingjoininfo_action">회원가입</button>
                    <a href="../login/userLogin.jsp" class="btnNormalFix sizeS" onclick="CheckingJoinInfoLayerClose()">닫기</a>
                </div>
            </form>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>