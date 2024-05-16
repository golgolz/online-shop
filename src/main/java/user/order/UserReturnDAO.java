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
}
