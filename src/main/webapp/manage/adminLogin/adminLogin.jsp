<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="http://www.treehospital.or.kr/board/_jns/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://www.treehospital.or.kr/board/_jns/css/top.css"/>

<script type="text/javascript">
	$(function(){
    	$("#user_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<!-- golgolz end -->
</head>
<body>
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<div class="container-fluid py-4">
			<!-- golgolz start -->

<div id="container">
    <div id="body">
        <h3><img src="http://www.treehospital.or.kr/board/_jns/img/main/h3Title_01.jpg" alt="ADMIN LOGIN"></h3>
        <form class="memberLogin" name="flogin" method="post" onsubmit="return flogin_submit(this);" autocomplete="off">
            <input type="hidden" name="url" value="%2Fboard%2F_jns%2Findex.php%3F">
            <div class="login-wrapper">
                <div class="row-input">
                    <ul>
                        <li>
                            <label for="user_id"><img src="http://www.treehospital.or.kr/board/_jns/img/main/imgId.gif" alt="아이디"></label>
                            <input id="user_id" type="text" name="mb_id" class="inputText login" itemname="아이디" required="" value="">
                        </li>
                        <li>
                            <label for="password"><img src="http://www.treehospital.or.kr/board/_jns/img/main/imgPw.gif" alt="비밀번호"></label>
                            <input id="password" type="password" name="mb_password" class="inputText login" itemname="패스워드" required="" value="">
                        </li>
                    </ul>
                </div>
               
                <div class="login">
                    <input type="image" src="http://www.treehospital.or.kr/board/_jns/img/main/btLogin.gif" alt="로그인">
                </div>
                <p><img src="http://www.treehospital.or.kr/board/_jns/img/main/imgMain_01.gif" alt="사이트 관리자인증을 위하여 아이디와 비밀번호를 입력해야 합니다."></p>
            </div>
        </form>
    </div>
    <hr>
</div>
<script type="text/javascript">
    document.flogin.mb_id.focus();

    function flogin_submit(f) {
        if (f.mb_id.value == "") {
            alert("아이디를 입력해주세요.");
            f.mb_id.focus();
            return false;
        }

        if (f.mb_password.value == "") {
            alert("패스워드를 입력해주세요.");
            f.mb_password.focus();
            return false;
        }

        f.action = "./login_check.php";
        return true;
    }
</script>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>