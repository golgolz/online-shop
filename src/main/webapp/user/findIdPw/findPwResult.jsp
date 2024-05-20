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
                                <li title="현재 위치"><strong>아이디 찾기</strong></li>
                            </ol>
                        </div>

                        <div class="xans-element- xans-member xans-member-findidresult">
                            <div class="findId">
                                <h3>Forgot ID</h3>
                                <div class="memberInfo">
                                    <p class="info">저희 쇼핑몰를 이용해주셔서 감사합니다.<br>비밀번호는 다음과 같습니다.</p>
                                    <ul>
                                        <li>
                                            <label>
                                                <input type="radio" name="fid" onclick="set_findpwdid( '' , 'indi' );" checked="">
                                                <span class="id"><%= request.getAttribute("foundUserPw") %></span>
                                            </label><br>
                                        </li>
                                        <li>고객님 즐거운 쇼핑 하세요!</li>
                                    </ul>
                                </div>
                                <p class="button1 ">
                                    <a href="http://localhost/user/login/userLogin.jsp">로그인</a>
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- golgolz end -->
        </div>
    </div>
</body>
</html>