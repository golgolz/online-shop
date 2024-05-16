package user.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;
import order.vo.OrderProductVO;
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

    public ReturnDetailVO selectReturnDetail(String cartId) throws SQLException {
        ReturnDetailVO rdVO = null;
        List<OrderProductVO> list = new ArrayList<OrderProductVO>();
        CartDAO cDAO = CartDAO.getInstance();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append("   select  rh.input_date,ct.name,rh.refund_state,rh.refund_amount   ")
                    .append("   from cart ct,refund_history rh   ")
                    .append("   where (ct.cart_id=rh.cart_id) and ct.cart_id=?   ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            list = cDAO.selectOrderProduct(cartId, "반품");

            if (rs.next()) {
                rdVO = new ReturnDetailVO(cartId, rs.getDate("input_date"), rs.getString("name"),
                        rs.getString("refund_state"), rs.getInt("refund_amount"), list);
            } // end if

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        } // end finally

        return rdVO;
    }// selectReturnDetail

    public int updateReturn(String cartId) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update cart    ").append("   set order_flag='반품',delivery_state='불필요'   ")
                    .append("   where cart_id=?   ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, cartId);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        }

        return cnt;
    }// updateReturn

    public void insertReturn(String cartId, int quantity) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery =
                    "   insert into refund_history(cart_id,input_date,refund_amount,refund_state,reason) values(?,sysdate,?,'반품 접수','불량')   ";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, cartId);
            pstmt.setInt(2, quantity);

            pstmt.executeQuery();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

    }// insertReturn



}
