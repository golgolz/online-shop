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
            <div id="wrap">
                <div id="container">
                    <div id="contents">
                        <div class="path">
                            <span>현재 위치</span>
                            <ol>
                                <li><a href="/">홈</a></li>
                                <li title="현재 위치"><strong>비밀번호 찾기</strong></li>
                            </ol>
                        </div>

                        <form id="findPasswdForm" name="findPasswdForm" action="findPw_process.jsp" method="post">
                            <input id="nextUrl" name="nextUrl" value="/member/passwd/find_passwd_question.html" type="hidden">
                            <input id="resultURL" name="resultURL" value="" type="hidden">
                            <div class="xans-element- xans-member xans-member-findpasswd">
                                <!-- $nextURL = /member/passwd/find_passwd_question.html -->
                                <div class="findPw">
                                    <h3>Forgot Password</h3>
                                    <fieldset>
                                        <legend>비밀번호 찾기 1단계 정보 입력</legend>
                                        <p class="check">
                                            <input id="check_method0" name="check_method" fw-filter="" fw-label="찾는방법" fw-msg="" value="1" type="radio" style="display: none;">
                                            <label for="check_method0" style="display: none;">
                                                <span id="ssn_lable" style="display: none;"></span>
                                            </label>
                                        </p>
                                        <p class="id"><strong>아이디</strong> <input id="member_id" name="member_id" fw-filter="isFill&amp;isIdentity" fw-label="아이디" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>
                                        <p id="name_view" class="name" style=""><strong id="name_lable">이름</strong> <input id="name" name="name" fw-filter="" fw-label="이름" fw-msg="" class="lostInput ec-member-name" placeholder="" value="" type="text"></p>
                                        <p id="mobile_view" class="mobile" style=""><strong>휴대폰 번호로 찾기</strong> <input id="mobile1" name="mobile1" fw-filter="isMin[3]&amp;isMax[3]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile1" placeholder="" maxlength="3" value="" type="text"> - <input id="mobile2" name="mobile2" fw-filter="isMin[3]&amp;isMax[4]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile2" placeholder="" maxlength="4" value="" type="text"> - <input id="mobile3" name="mobile3" fw-filter="isMin[4]&amp;isMax[4]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile2" placeholder="" maxlength="4" value="" type="text"></p>
                                        <p class="button">
                                            <a href="#" onclick="document.getElementById('findPasswdForm').submit();">확인</a>
                                        </p>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                        <div style="padding-top:30px;"></div>
                    </div>
                </div>
            </div>
            <!-- golgolz end -->
        </div>
    </div>
</body>
</html>