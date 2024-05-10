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

}
