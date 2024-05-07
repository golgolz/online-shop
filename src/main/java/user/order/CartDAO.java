package user.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import database.DbConnection;
import order.vo.OrderProductVO;

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

            StringBuilder insertQuery = new StringBuilder();

            insertQuery.append("   insert into order_goods(order_goods_id,cart_id,code,amount) values(?,?,?,?);    ");

            pstmt = con.prepareStatement(insertQuery.toString());
            // 4.바인드변수에 값 설정
            pstmt.setInt(1, 54); // 추후 시퀀스로 변경
            pstmt.setString(2, opVO.getCartId()); // cartId
            pstmt.setString(3, opVO.getCode()); // code
            pstmt.setInt(4, opVO.getQuantity()); // quantity

            // 5.쿼리문 수행 후 결과 얻기
            pstmt.execute();

        } finally {
            // 6.연결 끊기
            dbCon.closeCon(null, pstmt, con);
        } // end finally

    }// insertOrderProduct


    public void insertCart(List<OrderProductVO> productList) throws SQLException {

    }// insertCart

    public int updateCart(OrderProductVO opVO) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update order_goods    ").append("   set amount=?    ")
                    .append("   where cart_id=?    ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setInt(1, opVO.getQuantity());
            pstmt.setString(2, "20240401154913");

            cnt = pstmt.executeUpdate();


        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateCart

}
