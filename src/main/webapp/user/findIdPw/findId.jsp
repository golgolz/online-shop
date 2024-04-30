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
			<div id="FindId">
    

    <div id="container">
		<div id="contents">
		
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="/">홈</a></li>
        <li title="현재 위치"><strong>아이디 찾기</strong></li>
    </ol></div>

<form id="findIdForm" name="findIdForm" action="/exec/front/Member/findId/" method="post" target="_self" enctype="multipart/form-data">
<input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden"><div class="xans-element- xans-member xans-member-findid"><!--
	$returnURL = /member/id/find_id_result.html
 -->
<div class="findId">
		<h3>Forgot ID</h3>
        <fieldset>
<legend>아이디 찾기</legend>
            


            <p id="name_view" class="name" style=""><strong id="name_lable">이름</strong> <input id="name" name="name" fw-filter="" fw-label="이름" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>
            <p id="mobile_view" class="mobile" style=""><strong>휴대폰 번호로 찾기</strong> <input id="mobile1" name="mobile1" fw-filter="isMin[3]&amp;isMax[3]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile1" placeholder="" maxlength="3" value="" type="text"> - <input id="mobile2" name="mobile2" fw-filter="isMin[3]&amp;isMax[4]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile2" placeholder="" maxlength="4" value="" type="text"> - <input id="mobile3" name="mobile3" fw-filter="isMin[4]&amp;isMax[4]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile2" placeholder="" maxlength="4" value="" type="text"></p>
            
            <p class="button ">
                <a href="#none" onclick="findId.action('lifelab0301' , 'kcp'); return false;">확인</a>
            </p>
        </fieldset>
</div>
</div>
</form><div style="padding-top:30px;"></div>
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