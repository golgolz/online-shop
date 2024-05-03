<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.212/jsp_prj/common/favicon/favicon.ico"/>
<!--bootstrap 시작--> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝--> 
<link rel="stylesheet" href="http://192.168.10.212/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.212/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
.pay-area{
	border: 1px solid #dedede;
}
.container {
	width: 530px; height: 550px; border: 1px solid #dedede; padding: 0;
}
.top-title{
	background-color: #dedede;
	padding: 10px;
	padding-right : 15px;
	text-align: right;
}
.middle-title{
	padding: 20px;
	font-size: 20px;
}
.middle-right{
	float: right;
	font-size: 25px;
	margin-bottom: 10px;
}
.middle-left{
	float: left;
}
input-payarea{
	text-align: center;
}
.input-payarea-tab{
	border: 1px solid #dedede;
}
th,td{
	border-bottom: 1px solid #dedede;
	padding: 5px;
}
th{
	width: 130px;
}
input{
	width: 350px;
	height: 50px;
	border: none;
	font-size: 20px;
}
.input-payarea{
	text-align: center;
	margin: 20px;
}
.payarea-btn{
	text-align: center;
	vertical-align: bottom;
	margin-top: 190px;
	font-size: 0;
	display: grid; 
	grid-template-columns: 1fr 1fr;
}
.btn-success, .btn-cancle{
	width: 265px;
	height: 60px;
	padding: 0;
	margin: 0;
	border: 1px solid #dedede;
}
.btn-cancle{
	background-color: #dedede;
}
</style>
<script type="text/javascript">
	$(function() {
		
	});//ready	
</script>
</head>
<body>
<div class="container">
		<div class="top-title">
        <h6>카드 결제</h6>
		</div>
        <form id="payment-form">
        	<div class="middle-title">
	           <span class="middle-left"><label>(주)오브젝트 생활연구소</label></span>
	           <span class="middle-right"><label><strong>23,000원</strong></label></span>
        	</div>
        	
        	<div class="input-payarea">
 				<table class="input-payarea-tab">
					<tr>
						<th>카드번호</th>
						<td><input type="text"  maxlength="16" placeholder="[-]없이 입력"></td>
					</tr> 				
					<tr>
						<th>카드식별번호</th>
						<td><input type="text" maxlength="3" placeholder="카드 뒷면 3자리"></td>
					</tr> 				
					<tr>
						<th>휴대폰 번호</th> 
						<td><input type="text" maxlength="11" placeholder="[-]없이 입력"></td>
					</tr> 				
 				</table>       	
        	</div>
        	
        	<div class="payarea-btn">
        		<input type="button" value="결제취소"  class="btn-cancle">
        		<input type="button" value="결제하기" class="btn-success">
        	</div>
        </form>
    </div>
</body>
</html>