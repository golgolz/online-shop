package user.wishlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import admin.review.ReviewBoardVO;
import admin.review.SearchVO;
import database.DbConnection;


public class WishlistDAO {

  private static WishlistDAO wishlistDAO;

  private WishlistDAO() {

  }

  public static WishlistDAO getInstance() {
    if (wishlistDAO == null) {
      wishlistDAO = new WishlistDAO();
    }
    return wishlistDAO;
  }

  public int selectTotalCount(SearchVO sVO) throws SQLException {
    int totalCnt = 0;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1. JNDI 사용객체 생성
      // 2. DataSource 얻기
      // 3. Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4. 쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder selectCnt = new StringBuilder();
      selectCnt.append("select count(*) cnt from review");

      pstmt = con.prepareStatement(selectCnt.toString());
      // 5. 바인트변수에 값 설정
      // 6. 쿼리문 수행 후 결과 얻기
      rs = pstmt.executeQuery();
      if (rs.next()) {
        totalCnt = rs.getInt("cnt");
      }
    } finally {
      // 7. 연결 끊기
      db.closeCon(rs, pstmt, con);
    }
    return totalCnt;
  }// selectTotalCount

  public List<WishlistVO> selectWishlist(String id) throws SQLException {
    List<WishlistVO> wishlist = new ArrayList<WishlistVO>();

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder selectWishlist = new StringBuilder();
      selectWishlist.append(
          "   SELECT c.id, g.default_img, g.name, g.price, g.delivery_charge, f.input_date, (g.price + g.delivery_charge) total    ")
          .append("     FROM favorite f   ")
          .append("     JOIN customer c ON f.id = c.id JOIN goods g ON f.code = g.code   ");

      selectWishlist.append("WHERE c.id =? ORDER BY f.input_date ");

      pstmt = con.prepareStatement(selectWishlist.toString());
      // 5.바인드 변수 값 설정
      pstmt.setString(1, id);
      // 6.쿼리문 수행 후 결과 얻기
      rs = pstmt.executeQuery();

      WishlistVO wVO = new WishlistVO();
      while (rs.next()) {
        wVO = null;
        wVO = WishlistVO.builder().id(rs.getString("id")).defaultImg(rs.getString("default_img"))
            .name(rs.getString("name")).price(rs.getString("price")).deliveryCharge(rs.getString("delivery_charge"))
            .inputDate(rs.getDate("input_date")).build();

        wishlist.add(wVO);
      } // end while

    } finally {
      // 7.연결 끊기
      db.closeCon(rs, pstmt, con);
    }

    return wishlist;
  }// selectReviewBoard

  public void insertWishlist(WishlistVO wVO) throws SQLException {

    Connection con = null;
    PreparedStatement pstmt = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder insertWishlist = new StringBuilder();
      insertWishlist.append(
          "insert into review(review_id, id, cart_id, title, content, code, input_date, remove_flag) values(?, ?, ?, ?, ?, ?, ?, ?)");
      pstmt = con.prepareStatement(insertWishlist.toString());

      // 바인드 변수에 값 설정
      /*
       * pstmt.setInt(1, wVO.getReviewId()); pstmt.setString(2, wVO.getId()); pstmt.setString(3,
       * wVO.getCartId()); pstmt.setString(4, wVO.getTitle()); pstmt.setString(5, wVO.getContent());
       * pstmt.setString(6, wVO.getCode()); pstmt.setDate(7, wVO.getInputDate()); pstmt.setString(8,
       * wVO.getRemoveFlag());
       */


      pstmt.executeUpdate();
    } finally {
      // 7.연결 끊기
      db.closeCon(null, pstmt, con);
    }

  }// insertReview

  public void insertCart(WishlistVO wVO) throws SQLException {

    Connection con = null;
    PreparedStatement pstmt = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder insertCart = new StringBuilder();
      insertCart.append(
          "insert into review(review_id, id, cart_id, title, content, code, input_date, remove_flag) values(?, ?, ?, ?, ?, ?, ?, ?)");
      pstmt = con.prepareStatement(insertCart.toString());

      // 바인드 변수에 값 설정
      /*
       * pstmt.setInt(1, wVO.getReviewId()); pstmt.setString(2, wVO.getId()); pstmt.setString(3,
       * wVO.getCartId()); pstmt.setString(4, wVO.getTitle()); pstmt.setString(5, wVO.getContent());
       * pstmt.setString(6, wVO.getCode()); pstmt.setDate(7, wVO.getInputDate()); pstmt.setString(8,
       * wVO.getRemoveFlag());
       */


      pstmt.executeUpdate();
    } finally {
      // 7.연결 끊기
      db.closeCon(null, pstmt, con);
    }

  }// insertReview

  public int deleteReview(ReviewBoardVO rVO) throws SQLException {

    int cnt = 0;

    Connection con = null;
    PreparedStatement pstmt = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)

      StringBuilder deleteBoard = new StringBuilder();
      deleteBoard.append("  delete from review    ").append("  where review_id=? and id=?   ");
      pstmt = con.prepareStatement(deleteBoard.toString());

      // 바인드 변수에 값 설정
      pstmt.setInt(1, rVO.getReviewId());
      pstmt.setString(2, rVO.getId());

      cnt = pstmt.executeUpdate();

    } finally {
      // 7.연결 끊기
      db.closeCon(null, pstmt, con);
    }

    return cnt;

  }// deleteReview

}
