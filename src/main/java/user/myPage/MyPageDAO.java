package user.myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;

public class MyPageDAO {
  public static MyPageDAO myPageDAO;

  public MyPageDAO() {}

  public static MyPageDAO getInstance() {
    if (myPageDAO == null) {
      myPageDAO = new MyPageDAO();
    }

    return myPageDAO;
  }


  // 배송 상태 확인 메소드
  public DeliveryStatusVO getDeliveryStatus(String userId) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      StringBuilder sqlBuilder = new StringBuilder();
      sqlBuilder.append("SELECT ")
          .append("(SELECT COUNT(*) FROM cart WHERE delivery_state = '배송 준비중' AND id=?) AS ready, ")
          .append("(SELECT COUNT(*) FROM cart WHERE delivery_state = '배송중' AND id=?) AS progress, ")
          .append("(SELECT COUNT(*) FROM cart WHERE delivery_state = '배송 완료' AND id=?) AS done ").append("FROM dual");

      pstmt = conn.prepareStatement(sqlBuilder.toString());
      pstmt.setString(1, userId);
      pstmt.setString(2, userId);
      pstmt.setString(3, userId);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        int ready = rs.getInt("ready");
        int progress = rs.getInt("progress");
        int done = rs.getInt("done");

        return new DeliveryStatusVO(ready, progress, done);
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return null; // No data found
  }// getDeliveryStatus

  // 개인 정보 수정을 위해 사용자 정보 검증 및 로드
  public UserVO verifyUserAndGetDetails(String userId, String password) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection dbConn = DbConnection.getInstance();


    try {
      conn = dbConn.getConn("online-shop-dbcp");

      StringBuilder sql = new StringBuilder();
      sql.append("SELECT id, name, email, tel, zipcode, DEFAULT_ADDR, ADDITIONAL_ADDR ")
          .append("FROM customer WHERE id = ? AND password = ?");

      pstmt = conn.prepareStatement(sql.toString());
      pstmt.setString(1, userId);
      pstmt.setString(2, password);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        return new UserVO(rs.getString("id"), rs.getString("name"), rs.getString("email"), rs.getString("tel"),
            rs.getString("zipcode"), rs.getString("DEFAULT_ADDR"), rs.getString("ADDITIONAL_ADDR"));
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn); // 리소스 해제
    }
    return null; // 아이디와 비밀번호가 일치하는 사용자가 없을 경우 null 반환
  }// verifyUserAndGetDetails

  // 개인정보 수정
  public boolean updateUser(String userId, String newName, String newEmail, String newTel, String newZipcode,
      String newDefaultAddr, String newAdditionalAddr) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DbConnection dbConn = DbConnection.getInstance();


    try {
      conn = dbConn.getConn("online-shop-dbcp");
      StringBuilder sql = new StringBuilder();
      sql.append(
          "UPDATE customer SET name = ?, email = ?, tel = ?, zipcode = ?, DEFAULT_ADDR = ?, ADDITIONAL_ADDR = ? ")
          .append("WHERE id = ? ");

      pstmt = conn.prepareStatement(sql.toString());
      pstmt.setString(1, newName);
      pstmt.setString(2, newEmail);
      pstmt.setString(3, newTel);
      pstmt.setString(4, newZipcode);
      pstmt.setString(5, newDefaultAddr);
      pstmt.setString(6, newAdditionalAddr);
      pstmt.setString(7, userId);

      int affectedRows = pstmt.executeUpdate();
      return affectedRows > 0; // 업데이트가 성공했는지 여부를 반환
    } finally {
      dbConn.closeCon(null, pstmt, conn); // 리소스 해제
    }
  }// updateUser

  // 비밀번호 변경
  public boolean updatePassword(String userId, String newPassword) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;


    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");


      StringBuilder sql = new StringBuilder();
      sql.append("UPDATE customer SET PASSWORD = ? WHERE ID = ?");

      pstmt = conn.prepareStatement(sql.toString());
      pstmt.setString(1, newPassword);
      pstmt.setString(2, userId);

      int affectedRows = pstmt.executeUpdate();
      return affectedRows > 0; // 업데이트가 성공했는지 여부를 반환
    } finally {
      dbConn.closeCon(null, pstmt, conn); // 리소스 해제
    }
  }// updatePassword

}
