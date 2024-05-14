package user.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;
import order.vo.CardVO;
import order.vo.DeliveryVO;
import order.vo.OrderProductVO;
import order.vo.OrderVO;
import order.vo.PaymentInfoVO;

public class CartDAO {
    private static CartDAO cDAO;

    private CartDAO() {}

    public static CartDAO getInstance() {
        if (cDAO == null) {
            cDAO = new CartDAO();
        }
        return cDAO;
    }// getInstance


    public void insertOrderProduct(OrderProductVO opVO) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");
            // 1.JNDI 생성 객체 얻기
            // 2.DataSource 얻기
            // 3.쿼리문 생성 객체 얻기

            String insertQuery =
                    ("insert into order_goods(order_goods_id,cart_id,code,amount) values(or_gds_seq.nextval,?,?,?)");

            pstmt = con.prepareStatement(insertQuery);
            // 4.바인드변수에 값 설정
            /* pstmt.setInt(1, 55); */ // 시퀀스로 변경
            pstmt.setString(1, opVO.getCartId()); // cartId
            pstmt.setString(2, opVO.getCode()); // code
            pstmt.setInt(3, opVO.getQuantity()); // quantity

            // 5.쿼리문 수행 후 결과 얻기
            pstmt.execute();

        } finally {
            // 6.연결 끊기
            dbCon.closeCon(null, pstmt, con);
        } // end finally

    }// insertOrderProduct


    public void insertCart(OrderVO oVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery =
                    "insert into cart(cart_id,id,name,input_date,purchase_state,order_flag,default_addr_flag,delivery_state) values(to_char(sysdate,'YYYYMMDDHHMMSS'),?,?,sysdate,?,?,?,?)";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, oVO.getUserId());
            pstmt.setString(2, oVO.getUserName());
            pstmt.setString(3, "구매미확정");
            pstmt.setString(4, "장바구니");
            pstmt.setString(5, "T");
            pstmt.setString(6, "불필요");

        } finally {
            dbCon.closeCon(null, pstmt, con);
        }
    }// insertCart

    /**
     * 수량을 변경하는 일을 하는 method
     * 
     * @param opVO
     * @return
     * @throws SQLException
     */
    public int updateCart(OrderProductVO opVO) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update order_goods    ").append("   set amount=?    ")
                    .append("  where order_goods_id=?  ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setInt(1, opVO.getQuantity());
            pstmt.setInt(2, opVO.getOrderGoodsId());

            cnt = pstmt.executeUpdate();


        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateCart

    public void insertDelivery(DeliveryVO dVO) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery =
                    "insert into delivery(cart_id,receiver,zipcode,default_addr,additional_addr,tel,request) values(?,?,?,?,?,?,?)";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, dVO.getCartId());
            pstmt.setString(2, dVO.getRecipient());
            pstmt.setString(3, dVO.getZipcode());
            pstmt.setString(4, dVO.getDefaultAddr());
            pstmt.setString(5, dVO.getDetailAddr());
            pstmt.setString(6, dVO.getTel());
            pstmt.setString(7, dVO.getDeliveryMsg());

            pstmt.execute();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
    }// insertDelivery

    public void insertCard(CardVO cVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery = "insert into card(card_id,id,input_date) values(?,?,sysdate)";


            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, cVO.getCardId());
            pstmt.setString(2, cVO.getUserId());

            pstmt.execute();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
    }// insertCard

    public void insertPayment(PaymentInfoVO piVO) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery = "insert into payment_info(cart_id,card_id,id,purchase_date) values(?,?,?,?)";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, piVO.getCartId());
            pstmt.setString(2, piVO.getCardId());
            pstmt.setString(3, piVO.getUserId());
            pstmt.setDate(4, piVO.getPurchaseDate());

            pstmt.execute();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
    }// insertPayment

    /**
     * 주문 상태를 변경하는 일을 하는 method
     * 
     * @param cartId
     * @param orderFlag
     * @return
     * @throws SQLException
     */
    public int updateOrderStatus(String cartId, String orderFlag) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update cart    ").append("   set order_flag=?, input_date=sysdate    ")
                    .append("   where cart_id=?   ");

            /*
             * if (orderFlag == "반품") { updateQuery.append(" and order_flag='주문' and purchase_state='구매미확정' ");
             * }
             */

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, orderFlag); // 주문/반품으로 변경
            pstmt.setString(2, cartId); // 주문번호

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateOrderStatus

    /**
     * 배송 상태를 변경하는 일을 하는 method
     * 
     * @param cartId
     * @param deliveryStatus
     * @return
     * @throws SQLException
     */
    public int updateDeliveryStatus(String cartId, String deliveryStatus) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("    update cart   ").append("    set delivery_status=?    ")
                    .append("    where cart_id=?    ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, deliveryStatus);
            pstmt.setString(2, cartId);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateDeliveryStatus

    /**
     * 장바구니 상품 리스트의 단일 상품을 삭제하는 method
     * 
     * @param opVO
     * @return
     * @throws SQLException
     */
    public int deleteCart(OrderProductVO opVO) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder deleteQuery = new StringBuilder();

            deleteQuery.append("    delete from order_goods   ").append("    where order_goods_id=?    ");


            pstmt = con.prepareStatement(deleteQuery.toString());

            pstmt.setInt(1, opVO.getOrderGoodsId());

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end fianlly
        return cnt;
    }// deleteShopCart

    /**
     * 장바구니의 모든 상품 리스트를 삭제하는 method
     * 
     * @param opVO
     * @return
     * @throws SQLException
     */
    public int deleteAllCart(OrderProductVO opVO) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {

            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder deleteQuery = new StringBuilder();

            deleteQuery.append("   delete from order_goods    ").append("   where cart_id=?    ");

            pstmt = con.prepareStatement(deleteQuery.toString());

            pstmt.setString(1, opVO.getCartId());

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
        return cnt;
    }


    public List<OrderProductVO> selectCart(String cartId) throws SQLException {
        List<OrderProductVO> list = new ArrayList<OrderProductVO>();
        OrderProductVO opVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            // 해당 주문번호의 모든 장바구니 상품 조회
            selectQuery.append(
                    "    select og.order_goods_id,gd.default_img,gd.name,og.code,gd.price,og.amount,gd.delivery_charge,(gd.price*og.amount+gd.delivery_charge) total    ")
                    .append("    from goods gd, order_goods og, cart ct   ")
                    .append("    where ((og.code=gd.code) and (ct.cart_id=og.cart_id)) and og.cart_id=? and order_flag='장바구니'    ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                opVO = new OrderProductVO(rs.getInt("order_goods_id"), rs.getString("default_img"),
                        rs.getString("name"), rs.getString("code"), rs.getInt("price"), rs.getInt("amount"),
                        rs.getInt("delivery_charge"), rs.getInt("total"), cartId);

                list.add(opVO);
            } // end while

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        } // end finally

        return list;
    }// selectCart

    public boolean checkCartId(String userId) throws SQLException {

        boolean flag = false;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append("   select cart_id   ").append("   from cart   ")
                    .append("   where id=? and order_flag='장바구니'  ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                flag = true;
            } // end if

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        }

        return flag;
    }// checkCartId

    public boolean isEmptyList(List<OrderProductVO> list, String cartId) throws SQLException {
        boolean flag = false;

        list = selectCart(cartId);

        if (list.size() != 0) {
            flag = true;
        } // end if

        return flag;
    }// isEmptyList

    public String selectCartId(String userId) throws SQLException {

        String cartId = "";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            selectQuery.append("   select cart_id   ").append("   from cart   ")
                    .append("   where id=? and order_flag='장바구니'  ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                cartId = rs.getString("cart_id");
            } // end if

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        }

        return cartId;
    }// selectCartId

    /**
     * 주문 상태가 변경되었을 경우 실행되어야 하는 method(input_date를 update)
     * 
     * @param userId
     * @return
     * @throws SQLException
     */
    public int updateInputDate(String userId) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update cart     ").append("   set input_date=sysdate     ")
                    .append("   where id=?   ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, userId);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateInputDate


}
