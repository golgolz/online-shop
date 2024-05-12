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
                            <ol>
                                <li><a href="/">홈</a></li>
                                <li title="현재 위치"><strong>아이디 찾기</strong></li>
                            </ol>
                        </div>
                        <form id="findIdForm" name="findIdForm" action="findId_process.jsp" method="post" >
                            <input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.jsp" type="hidden">
                            <div class="xans-element- xans-member xans-member-findid">
                                <!-- $returnURL = /member/id/find_id_result.jsp -->
                                <div class="findId">
                                    <h3>Forgot ID</h3>
                                    <fieldset>
                                        <legend>아이디 찾기</legend>
                                        <p class="name">
                                            <strong>이름</strong>
                                            <input id="name" name="name" fw-filter="" fw-label="이름" fw-msg="" class="lostInput" type="text">
                                        </p>
                                        <p class="mobile">
                                            <strong>휴대폰 번호로 찾기</strong>
                                            <input id="mobile1" name="mobile1" class="mobile1" maxlength="3" type="text"> -
                                            <input id="mobile2" name="mobile2" class="mobile2" maxlength="4" type="text"> -
                                            <input id="mobile3" name="mobile3" class="mobile3" maxlength="4" type="text">
                                        </p>
                                        <p class="button">
                                        	 <a href="#" id="confirm">확인</a>
                                        </p>
                                        
                                        <script>
                                       	 document.addEventListener('DOMContentLoaded', function() {
                                        		  var confirmationLink = document.getElementById('confirm');
                                        		  confirmationLink.addEventListener('click', function(event) {
                                            	  event.preventDefault(); // 기본 이벤트 동작 방지

                                              // 폼을 제출
                                             	 var form = document.getElementById('findIdForm');
                                             	 if (form) {
                                                 	 form.submit();
                                           	  	 }
                                         	 });
                                     	 });
                                  		</script>
                                        
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