package admin.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;

public class AdminDAO {

  public static AdminDAO adminDAO;

  public AdminDAO() {}

  public static AdminDAO getInstance() {
    if (adminDAO == null) {
      adminDAO = new AdminDAO();
    }

    return adminDAO;
  }

  // admin 로그인 기능 수행
  public boolean adminLogin(String adminId, String adminPassword) throws SQLException {
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
        return false; // 데이터베이스 연결이 null이면 메서드를 종료.
      }

      selectQuery.append("SELECT id, password FROM admin WHERE id = ? AND password = ?");

      pstmt = conn.prepareStatement(selectQuery.toString());

      pstmt.setString(1, adminId);
      pstmt.setString(2, adminPassword);

      rs = pstmt.executeQuery();

      // 결과가 존재한다면 로그인 성공
      if (rs.next()) {
        loginSuccess = true;
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return loginSuccess;
  }// adminLogin


}
