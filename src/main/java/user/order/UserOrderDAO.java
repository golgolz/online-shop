package user.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;
import order.vo.DeliveryVO;
import order.vo.OrderDetailVO;
import order.vo.OrderProductVO;
import order.vo.PaymentInfoVO;

public class UserOrderDAO {
    private static UserOrderDAO uoDAO;

    private UserOrderDAO() {}

    public static UserOrderDAO getInstance() {
        if (uoDAO == null) {
            uoDAO = new UserOrderDAO();
        }
        return uoDAO;
    }// getInstance

    public OrderDetailVO selectDetailOrder(String cartId) throws SQLException {
        OrderDetailVO odVO = null;
        OrderProductVO opVO = null;
        List<OrderProductVO> list = new ArrayList<OrderProductVO>();
        CartDAO cDAO = CartDAO.getInstance();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append(
                    "   select ct.cart_id,ct.input_date,og.order_goods_id,gd.default_img,gd.name,og.code,gd.price,og.amount,gd.delivery_charge,(gd.price*og.amount+gd.delivery_charge) total,dv.receiver,dv.zipcode,dv.default_addr,dv.additional_addr,dv.tel,dv.request,ct.purchase_state,ct.order_flag,ct.delivery_state   ")
                    .append("   from cart ct,delivery dv,order_goods og,payment_info pi,goods gd   ")
                    .append("   where ((og.code=gd.code) and (ct.cart_id=dv.cart_id) and (ct.cart_id=og.cart_id) and (ct.cart_id=pi.cart_id)) and ct.cart_id=?   ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            list = cDAO.selectOrderProduct(cartId);

            if (rs.next()) {

                odVO = new OrderDetailVO(cartId, rs.getDate("input_date"), list, rs.getString("delivery_state"),
                        rs.getString("purchase_state"), rs.getString("zipcode"), rs.getString("default_addr"),
                        rs.getString("additional_addr"), rs.getString("tel"), rs.getString("request"),
                        rs.getString("receiver"), rs.getString("order_flag"));
            }
        } finally {
            dbCon.closeCon(rs, pstmt, con);
        } // end finally

        return odVO;
    }// selectDetailOrder

    public int updatePurchase(String cartId) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update cart    ").append("   set purchase_state='구매확정'    ")
                    .append("   where cart_id=?   ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, cartId);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        }

        return cnt;
    }// updatePurchase

    public int updateOrderStatus(String cartId) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update cart    ").append("   set order_flag='반품'   ")
                    .append("   where cart_id=?   ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, cartId);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        }

        return cnt;
    }// updateOrderStatus

    public DeliveryVO selectDelivery(String cartId) throws SQLException {
        DeliveryVO dVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append("   select cart_id,receiver,zipcode,default_addr,additional_addr,tel,request   ")
                    .append("   from delivery   ").append("   where cart_id=?   ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dVO = new DeliveryVO(cartId, rs.getString("zipcode"), rs.getString("default_addr"),
                        rs.getString("additional_addr"), rs.getString("tel"), rs.getString("request"),
                        rs.getString("receiver"));
            }

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        }

        return dVO;
    }// selectDelivery

    public PaymentInfoVO selectPaymentInfo(String cartId) throws SQLException {
        PaymentInfoVO piVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append("   select cart_id,card_id,id,purchase_date  ").append("   from payment_info   ")
                    .append("   where cart_id=?   ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();


            if (rs.next()) {
                piVO = new PaymentInfoVO(cartId, rs.getString("card_id"), rs.getString("id"),
                        rs.getDate("purchase_date"));
            } // end if

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        }

        return piVO;
    }// selectPaymentInfo

}
