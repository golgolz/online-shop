<%@page import="user.myPage.DeliveryStatusVO"%>
<%@page import="user.myPage.MyPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733">
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRBbsQgDEX3Sbc9h2dU9SRzAiBOYsVghCGd3L5Mp2rVRVeBHcboffj6GFbxCOjGopgUmGZkYy9vlyvEYpncuGbPoBOOEyotAXSjcH0HpwpepsII_tBVIlgMOFN-qZ1XaIg1YbMiW2uupAnTLZuMrcneUDjHZHNIyfXpSu5LwIn30hr63GgMRTfUAodCncBZhDPFTvQVuRc6ppoS18vvaBYKp8P8v-vGdiLbknPzaP_A5d7PEO5ldj3mzqGnmUUSRC41FbUaEu6EH7-rTjevDUzN5um3jC_1wz8m622lGCksrQWchL0ySEI86buXhGE_nhothvZfoOqD9gk&type=css&k=ab67e2fa620286c172dbe449ac662e9828ecc1cd&t=1678165953&user=T" />

	<jsp:include page="../../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/user/header.jsp" />
	
	<%
    // 세션에서 사용자 ID 가져오기
    String userId = (String)session.getAttribute("userId");

    // DAO 객체 생성 및 배송 상태 조회
    MyPageDAO dao = new MyPageDAO();
    DeliveryStatusVO deliveryStatus = dao.getDeliveryStatus(userId);
    
    %>

	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			
			<div class="main_pro_title width1240 cboth">
		<div class="txt_01">MY PAGE</div>
		<div class="txt_02">포인트적립 및 배송확인 등</div>
</div>

<div class="xans-element- xans-myshop xans-myshop-asyncbenefit"><div class="ec-base-box typeMember gMessage ">
        <div class="information">
            <div class="description">
                <span>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong class="txtEm"><span><span class="xans-member-var-name"><%= userId %></span></span></strong> 님
                <p class="displaynone myshop_benefit_display_no_benefit"><strong class="txtEm"><span class="myshop_benefit_dc_pay"></span> <span class="myshop_benefit_dc_min_price">0원 이상</span></strong> 구매시 <strong class="txtEm"><span class="myshop_benefit_dc_price">0원</span><span class="myshop_benefit_dc_type"></span></strong>을 <span class="myshop_benefit_use_dc">추가할인없음</span> 받으실 수 있습니다. <span class="myshop_benefit_dc_max_percent"></span></p>
                <p class="displaynone myshop_benefit_display_with_all"><strong class="txtEm"><span class="myshop_benefit_dc_pay"></span> <span class="myshop_benefit_dc_min_price_mileage">0원 이상</span></strong> 구매시 <strong class="txtEm"><span class="myshop_benefit_dc_price_mileage">0원</span><span class="myshop_benefit_dc_type_mileage"></span></strong>을 <span class="myshop_benefit_use_dc_mileage"></span> 받으실 수 있습니다. <span class="myshop_benefit_dc_max_mileage_percent"></span></p>
                <div class="displaynone gBlank5" id="">
                </div>
            </div>
        </div>
     </div>

</div>

<div class="xans-element- xans-myshop xans-myshop-orderstate "><div class="title">
        <h3>나의 주문처리 현황 </h3>
    </div>
<div class="state">
        <ul class="order">
            <li>
                        <strong>배송준비중</strong>
                        <a  class="count"><span><%= deliveryStatus.getReadyCount() %></span></a>
                    </li>
                    <li>
                        <strong>배송중</strong>
                        <a class="count"><span><%= deliveryStatus.getProgressCount() %></span></a>
                    </li>
                    <li>
                        <strong>배송완료</strong>
                        <a  class="count"><span><%= deliveryStatus.getDoneCount() %></span></a>
                    </li>
        </ul>

</div>
</div>

<div id="myshopMain" class="xans-element- xans-myshop xans-myshop-main"><ul>
<li class="shopMain order">
            <h3><a href="http://localhost/user/OrderReturn/order_list.jsp"><strong>Order</strong><span>주문내역 조회</span></a></h3>
            <p><a href="http://localhost/user/OrderReturn/order_list.jsp">고객님께서 주문하신 상품의<br> 주문내역을 확인하실 수 있습니다.</a></p>
        </li>
        <li class="shopMain profile">
            <h3><a href="http://localhost/user/mypage/pwConfirm.jsp"><strong>Profile</strong><span>회원 정보</span></a></h3>
            <p><a href="http://localhost/user/mypage/pwConfirm.jsp">회원이신 고객님의 개인정보를<br> 관리하는 공간입니다.</a></p>
        </li>
       
        
        <li class="shopMain board">
            <h3><a href="../../wishlist/wishlist.jsp"><strong>Board</strong><span>관심 상품</span></a></h3>
            <p><a href="/myshop/board_list.html">고객님의 관심상품을<br> 확인하실 수 있습니다.</a></p>
        </li>
        
            </ul>
</div>

			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>