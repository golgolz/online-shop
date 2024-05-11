package user.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;

public class UserDAO {

  public static UserDAO userDAO;

  public UserDAO() {}

  public static UserDAO getInstance() {
    if (userDAO == null) {
      userDAO = new UserDAO();
    }

    return userDAO;
  }

  // 유저 로그인
  public boolean userLogin(String userId, String password) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();

    boolean loginSuccess = false;

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      if (conn == null) {
        System.err.println("Error: Connection is null. Check your DbConnection settings.");
        return false; // 데이터베이스 연결이 null이면 메서드를 종료
      }

      selectQuery.append("SELECT id, name FROM customer WHERE id = ? AND password = ?");

      pstmt = conn.prepareStatement(selectQuery.toString());

      pstmt.setString(1, userId);
      pstmt.setString(2, password);

      rs = pstmt.executeQuery();

      // 결과가 존재한다면 로그인 성공
      if (rs.next()) {
        loginSuccess = true;
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return loginSuccess;
  }// userLogin

  // 회원가입 메소드
  public boolean userSignUp(String id, String password, String name, String tel, String email, String zipcode,
      String defaultAddr, String additionalAddr) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    boolean result = false;

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      StringBuilder sqlBuilder = new StringBuilder();
      sqlBuilder.append(
          "INSERT INTO customer (ID, PASSWORD, NAME, TEL, EMAIL, INPUT_DATE, ZIPCODE, DEFAULT_ADDR, ADDITIONAL_ADDR, WITHDRAWAL_FLAG, ACCESS_LIMIT_FLAG) ")
          .append("VALUES (?, ?, ?, ?, ?, TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD'), ?, ?, ?, 'F', 'F')");

      pstmt = conn.prepareStatement(sqlBuilder.toString());
      pstmt.setString(1, id);
      pstmt.setString(2, password);
      pstmt.setString(3, name);
      pstmt.setString(4, tel);
      pstmt.setString(5, email);
      pstmt.setString(6, zipcode);
      pstmt.setString(7, defaultAddr);
      pstmt.setString(8, additionalAddr);

      int affectedRows = pstmt.executeUpdate();
      result = affectedRows > 0; // 성공적으로 추가되었는지 결과 반환
    } finally {
      dbConn.closeCon(null, pstmt, conn); // 리소스 해제
    }

    return result;
  }

}
