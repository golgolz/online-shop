package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestDAO {
    public void start() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();

        try {
            // 1. JDNI 사용 객체 생성

            // 2. DBCP에서 DataSource 얻기
            // 3. Connection 얻기
            conn = dbConn.getConn("online-shop-dbcp");

            // 4. 쿼리문 생성 객체 얻기
            StringBuilder selectUser = new StringBuilder();
            selectUser.append(" select * from maker_model ");
            pstmt = conn.prepareStatement(selectUser.toString());

            // 5. 쿼리문 수행 후 결과 얻기
            rs = pstmt.executeQuery();

            while (rs.next()) { // 입력된 아이디와 비번으로 조회 결과 있음
                System.out.print(rs.getString("maker"));
                System.out.print(rs.getString("model"));
                System.out.print(rs.getString("amount"));
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 6. 연결 끊기
            try {
                dbConn.closeCon(rs, pstmt, conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
