package user.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class UserMainDAO {
    private static UserMainDAO userMainDAO;

    private UserMainDAO() {}

    public static UserMainDAO getInstance() {
        if (userMainDAO == null) {
            userMainDAO = new UserMainDAO();
        }

        return userMainDAO;
    }

    public List<GoodsSimpleVO> selectGoods(boolean isNew) throws SQLException {
        List<GoodsSimpleVO> goods = new ArrayList<GoodsSimpleVO>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(" select rnum, code, name, price, default_img, detail_description ");
            if (isNew) {
                selectQuery.append(" , input_date from ( select row_number() over(order by input_date desc) ");
            } else {
                selectQuery.append(" , sold_count from ( select row_number() over(order by sold_count desc) ");
            }
            selectQuery.append(
                    " as rnum, code, name, price, default_img, detail_description, sold_count, input_date from goods)where rnum between 1 and 15 ");

            pstmt = conn.prepareStatement(selectQuery.toString());
            rs = pstmt.executeQuery();

            GoodsSimpleVO tempVO = null;
            while (rs.next()) {
                goods.add(new GoodsSimpleVO(rs.getString("code"), rs.getString("name"), rs.getString("default_img"),
                        rs.getString("detail_description"), 0, 0, 0, rs.getInt("price"), null));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return goods;
    }
}
