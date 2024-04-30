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
    <ol><li><a href="/">회원 정보</a></li>
        <li title="현재 위치"><strong>비밀번호 변경</strong></li>
    </ol></div>

<form id="findIdForm" name="findIdForm" action="/exec/front/Member/findId/" method="post" target="_self" enctype="multipart/form-data">
<input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden"><div class="xans-element- xans-member xans-member-findid"><!--
	$returnURL = /member/id/find_id_result.html
 -->
<div class="findId">
		<h4>비밀번호 변경</h4>
        <fieldset>
            <p id="name_view" class="name" style=""><strong id="name_lable">비밀번호</strong> <input id="name" name="name" fw-filter="" fw-label="이름" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>
            <p id="name_view" class="name" style=""><strong id="name_lable">비밀번호 확인</strong> <input id="name" name="name" fw-filter="" fw-label="이름" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>
            
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