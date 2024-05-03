<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<div id="mheader" class="cboth">
      <div class="header_sec02">
        <div class="inner">
          <!-- 상단 로고 -->
          <div class="top_logo">
            <a href="http://localhost/online-shop/index.jsp"
              ><img src="http://localhost/online-shop/assets/images/top_logo.png"
            /></a>
          </div>
          <div class="top_comm">
            <ul>
              <!-- 상단 추가메뉴 01 -->
              <li class="xans-element- xans-layout xans-layout-statelogoff">
                <a href="http://localhost/online-shop/user/login/login.jsp">LOGIN</a>
              </li>
              <li>
                <a href="http://localhost/online-shop/user/mypage/mypage.jsp">MYPAGE</a>
              </li>
              <li>
                <a href="http://localhost/online-shop/order/order.jsp"
                  >ORDER</a
                >
              </li>
              <li>
                <a href="http://localhost/online-shop/cart/cart.jsp">CART</a>
              </li>
              <li>
                <a href="http://localhost/online-shop/notice/notice.jsp">NOTICE</a>
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
                      href="http://localhost/online-shop/goods/category.jsp?category=new"
                      class="cate"
                      cate="?cate_no=427"
                      >NEW</a
                    >
                  </li>
                  <li class="noChild">
                    <a
                      href="http://localhost/online-shop/goods/category.jsp?category=best"
                      class="cate"
                      cate="?cate_no=428"
                      >BEST</a
                    >
                  </li>
                  <li class="xans-record-">
                    <a
                      href="http://localhost/online-shop/goods/category.jsp?category=model"
                      class="cate"
                      cate="?cate_no=44"
                      >MODEL</a
                    >
                    <ul class="slideSubMenu">
                      <li class="xans-record-" id="cate119">
                        <a
                      	  href="http://localhost/online-shop/goods/category.jsp?category=samsung"
                          class="cate"
                          cate="?cate_no=119"
                          onmouseover="subMenuon(this);"
                          >삼성</a
                        >
                        <ul class="slideSubMenu">
                          <li class="xans-record-" id="cate119">
                            <a
                      	  	  href="http://localhost/online-shop/goods/category.jsp?category=samsung&sub_category=zflip"
                              class="cate"
                              cate="?cate_no=119"
                              onmouseover="subMenuon(this);"
                              >ZFLIP</a
                            >
                          </li>
                          <li class="noChild" id="cate71">
                            <a
                      	  	  href="http://localhost/online-shop/goods/category.jsp?category=samsung&sub_category=s24"
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
                      	  href="http://localhost/online-shop/goods/category.jsp?category=apple"
                          class="cate"
                          cate="?cate_no=71"
                          onmouseover="subMenuon(this);"
                          >애플</a
                        >
                        <ul class="slideSubMenu">
                          <li class="noChild">
                            <a
                              href="http://localhost/online-shop/goods/category.jsp?category=apple&sub_category=아이폰14"
                              class="cate"
                              cate="?cate_no=119"
                              onmouseover="subMenuon(this);"
                              >아이폰14</a
                            >
                          </li>
                          <li class="noChild" id="cate71">
                            <a
                              href="http://localhost/online-shop/goods/category.jsp?category=apple&sub_category=아이폰15"
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
                      href="http://localhost/online-shop/goods/category.jsp?category=material"
                      class="cate"
                      cate="?cate_no=44"
                      >MATERIAL</a
                    >
                    <ul class="slideSubMenu">
                      <li class="noChild">
                        <a
                          href="http://localhost/online-shop/goods/category.jsp?category=material&sub_category=실리콘"
                          class="cate"
                          cate="?cate_no=45"
                          >실리콘</a
                        >
                      </li>
                      <li class="noChild">
                        <a
                          href="http://localhost/online-shop/goods/category.jsp?category=material&sub_category=하드"
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