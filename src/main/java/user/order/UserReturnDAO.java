package user.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;
import order.vo.ReturnDetailVO;

public class UserReturnDAO {
    private static UserReturnDAO urDAO;

    private UserReturnDAO() {}

    public static UserReturnDAO getInstance() {
        if (urDAO == null) {
            urDAO = new UserReturnDAO();
        }
        return urDAO;
    }

    public ReturnDetailVO selectDetailReturn(String cartId) throws SQLException {
        ReturnDetailVO rdVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append("   select    ").append("   from    ").append("   where    ");

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        } // end finally

        return rdVO;
    }
}
