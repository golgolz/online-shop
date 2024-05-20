<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    
<div id="mheader" class="cboth">
      <div class="header_sec02">
        <div class="inner">
          <!-- 상단 로고 -->
          <div class="top_logo">
            <a href="http://localhost/index.jsp"
              ><img src="http://localhost/assets/images/top_logo.png"
            /></a>
          </div>
          <div class="top_comm">
            <ul>
              <!-- 상단 추가메뉴 01 -->
              <!-- 로그인 상태에 따라 링크를 동적으로 렌더링 -->
                    <%
                    String userId = (String) session.getAttribute("userId");
                    if (userId != null) {
                        // 사용자가 로그인한 경우: 로그아웃 링크를 포함
                        %>
                        <li class="xans-element- xans-layout xans-layout-statelogon">
                            <a href="http://localhost/user/login/userLogout.jsp">LOGOUT</a>
                        </li>
                    <%
                    } else {
                        // 사용자가 로그인하지 않은 경우: 로그인 링크를 포함
                        %>
                        <li class="xans-element- xans-layout xans-layout-statelogoff">
                            <a href="http://localhost/user/login/userLogin.jsp">LOGIN</a>
                        </li>
                    <%
                    }
                    %>
                    <%
                    if (userId != null) {
                    %>
              <li>
                <a href="http://localhost/user/mypage/mypage.jsp">MYPAGE</a>
              </li>
              <%
                    } else {
              %>
              <li>
                  <a href="#" onclick="loginAlert()">MYPAGE</a>
              </li>
              <script type="text/javascript">
                  function loginAlert() {
                      alert("로그인이 필요합니다.");
                      window.location.href = "http://localhost/user/login/userLogin.jsp";
                  }
              </script>
          <%
          }
          %>
              <li>
                <a href="http://localhost/user/OrderReturn/order_list.jsp"
                  >ORDER</a
                >
              </li>
              <li>
                <a href="http://localhost/cart/cart.jsp">CART</a>
              </li>
              <li>
                <a href="http://localhost/wishlist/wishlist.jsp">WISH</a>
              </li>
              <li>
                <a href="http://localhost/notice/notice.jsp">NOTICE</a>
              </li>
            </ul>
          </div>
        </div>
        <br />
      </div>
      <!-- header_sec02 -->

      <div class="header_sec03" id="comment_top">
        <div class="inner">
          <!-- 상단 카테고리 : 자동출력 -->
          <ul class="fleft top_cate">
            <div id="mcategory">
              <div id="slideCateList">
                <!-- 상단카테고리 자동출력 -->
                <ul
                  class="xans-element- xans-layout xans-layout-category categoryList"
                >
                  <li class="noChild">
                    <a
                      href="http://localhost/goods/category.jsp?category=new&page=1"
                      class="cate"
                      cate="?cate_no=427"
                      >NEW</a
                    >
                  </li>
                  <li class="noChild">
                    <a
                      href="http://localhost/goods/category.jsp?category=best&page=1"
                      class="cate"
                      cate="?cate_no=428"
                      >BEST</a
                    >
                  </li>
                  <li class="xans-record-">
                    <a
                      href="http://localhost/goods/category.jsp?category=samsung&page=1"
                      class="cate"
                      cate="?cate_no=44"
                      >MODEL</a
                    >
                    <ul class="slideSubMenu">
                      <li class="xans-record-" id="cate119">
                        <a
                      	  href="http://localhost/goods/category.jsp?category=samsung&page=1"
                          class="cate"
                          cate="?cate_no=119"
                          onmouseover="subMenuon(this);"
                          >삼성</a
                        >
                        <ul class="slideSubMenu">
                          <li class="xans-record-" id="cate119">
                            <a
                      	  	  href="http://localhost/goods/category.jsp?category=samsung&sub_category=zflip&page=1"
                              class="cate"
                              cate="?cate_no=119"
                              onmouseover="subMenuon(this);"
                              >ZFLIP</a
                            >
                          </li>
                          <li class="noChild" id="cate71">
                            <a
                      	  	  href="http://localhost/goods/category.jsp?category=samsung&sub_category=s24&page=1"
                              class="cate"
                              cate="?cate_no=71"
                              onmouseover="subMenuon(this);"
                              >S24</a
                            >
                          </li>
                        </ul>
                      </li>
                      <li class="xans-record-" id="cate71">
                        <a
                      	  href="http://localhost/goods/category.jsp?category=apple&page=1"
                          class="cate"
                          cate="?cate_no=71"
                          onmouseover="subMenuon(this);"
                          >애플</a
                        >
                        <ul class="slideSubMenu">
                          <li class="noChild">
                            <a
                              href="http://localhost/goods/category.jsp?category=apple&sub_category=아이폰14&page=1"
                              class="cate"
                              cate="?cate_no=119"
                              onmouseover="subMenuon(this);"
                              >아이폰14</a
                            >
                          </li>
                          <li class="noChild" id="cate71">
                            <a
                              href="http://localhost/goods/category.jsp?category=apple&sub_category=아이폰15&page=1"
                              class="cate"
                              cate="?cate_no=71"
                              onmouseover="subMenuon(this);"
                              >아이폰15</a
                            >
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li class="xans-record-">
                    <a
                      href="http://localhost/goods/category.jsp?category=실리콘&page=1"
                      class="cate"
                      cate="?cate_no=44"
                      >MATERIAL</a
                    >
                    <ul class="slideSubMenu">
                      <li class="noChild">
                        <a
                      	  href="http://localhost/goods/category.jsp?category=실리콘&page=1"
                          class="cate"
                          cate="?cate_no=45"
                          >실리콘</a
                        >
                      </li>
                      <li class="noChild">
                        <a
                      	  href="http://localhost/goods/category.jsp?category=하드&page=1"
                          class="cate"
                          cate="?cate_no=47"
                          >하드</a
                        >
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- //mcategory -->
          </ul>
        </div>
      </div>
      <!-- header_sec03 -->
    </div>