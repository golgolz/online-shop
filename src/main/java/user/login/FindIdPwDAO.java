package user.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;

public class FindIdPwDAO {

  public static FindIdPwDAO findIdPwDAO;

  public FindIdPwDAO() {}

  public static FindIdPwDAO getInstance() {
    if (findIdPwDAO == null) {
      findIdPwDAO = new FindIdPwDAO();
    }

    return findIdPwDAO;
  }


  public String findUserId(String name, String tel) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();
    String maskedId = null;

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      if (conn == null) {
        System.err.println("Error: Connection is null. Check your DbConnection settings.");
        return null; // 데이터베이스 연결이 null이면 메서드를 종료
      }

      selectQuery.append("SELECT SUBSTR(ID, 1, 4) || LPAD('*', LENGTH(ID) - 4, '*') AS masked_id ")
          .append("FROM customer ").append("WHERE NAME = ? AND TEL = ?");

      pstmt = conn.prepareStatement(selectQuery.toString());
      pstmt.setString(1, name);
      pstmt.setString(2, tel);

      rs = pstmt.executeQuery();

      // 결과가 존재한다면 마스킹된 아이디를 반환
      if (rs.next()) {
        maskedId = rs.getString("masked_id");
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return maskedId;
  }// findUserId

  public String findUserPw(String id, String name, String tel) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();
    String maskedPassword = null;

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      if (conn == null) {
        System.err.println("Error: Connection is null. Check your DbConnection settings.");
        return null; // 데이터베이스 연결이 null이면 메서드를 종료
      }

      selectQuery.append("SELECT SUBSTR(PASSWORD, 1, 3) || LPAD('*', LENGTH(PASSWORD) - 3, '*') AS masked_password ")
          .append("FROM customer ").append("WHERE ID = ? AND NAME = ? AND TEL = ?");

      pstmt = conn.prepareStatement(selectQuery.toString());
      pstmt.setString(1, id);
      pstmt.setString(2, name);
      pstmt.setString(3, tel);

      rs = pstmt.executeQuery();

      // 결과가 존재한다면 마스킹된 비밀번호를 반환
      if (rs.next()) {
        maskedPassword = rs.getString("masked_password");
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return maskedPassword;
  }// findUserPw

}

