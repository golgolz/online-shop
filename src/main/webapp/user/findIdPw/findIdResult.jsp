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
    <ol><li><a href="/">홈</a></li>
        <li title="현재 위치"><strong>아이디 찾기</strong></li>
    </ol></div>

<div class="xans-element- xans-member xans-member-findidresult"><div class="findId">
        <h3>Forgot ID</h3>
        <div class="memberInfo">
            <%-- 아이디를 찾은 경우에만 출력 --%>
            <% if (request.getAttribute("foundUserId") != null) { %>
                <p class="info">저희 쇼핑몰를 이용해주셔서 감사합니다.<br>
                다음정보로 가입된 아이디가 총 <span>1</span>개 있습니다.</p>
                <ul>
                    <li>
                        <label>
                            <input type="radio" name="fid" onclick="set_findpwdid( '' , 'indi' );" checked=""> 
                            <span class="id"><%= request.getAttribute("foundUserId") %></span> 
                        </label><br>
                    </li>
                    <li>고객님 즐거운 쇼핑 하세요!</li>
                </ul>
            <% } else { %>
                <%-- 아이디를 찾지 못한 경우 --%>
                <p class="info">아이디를 찾을 수 없습니다.</p>
            <% } %>
        </div>
        <p class="button1 ">
            <a href="../login/userLogin.jsp">로그인</a>
        </p>
        <p class="button2 ">
            <a href="http://localhost/user/findIdPw/findPw.jsp">비밀번호 찾기</a>
        </p>
    </div>
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