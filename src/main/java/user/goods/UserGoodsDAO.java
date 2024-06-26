package user.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;
import user.main.GoodsSimpleVO;

public class UserGoodsDAO {
    private static UserGoodsDAO userGoodsDAO;

    private UserGoodsDAO() {}

    public static UserGoodsDAO getInstance() {
        if (userGoodsDAO == null) {
            userGoodsDAO = new UserGoodsDAO();
        }

        return userGoodsDAO;
    }

    public String createSelectQuery(String category, String sort, boolean isCount) {
        StringBuilder selectQuery = new StringBuilder();

        if (isCount) {
            selectQuery.append(" select count(*) as count from ( select row_number() over(order by ");
        } else {
            selectQuery.append(
                    " select rnum, code, name, price, default_img, description, detail_description from ( select row_number() over(order by ");
        }

        switch (sort) {
            case "NEW":
                selectQuery.append("input_date desc) ");
                break;
            case "BEST":
                selectQuery.append("sold_count desc) ");
                break;
            case "HIGH_PRICE":
                selectQuery.append("price desc) ");
                break;
            case "LOW_PRICE":
                selectQuery.append("price asc) ");
                break;
            case "MOST_REVIEW":
                selectQuery.append("review_count desc) ");
                break;
            case "":
                selectQuery.append("input_date desc) ");
                break;
            default:
                return null;
        }

        selectQuery.append(
                " as rnum, code, name, price, default_img, description, detail_description, delete_flag from goods where delete_flag = 'F' ");
        switch (category) {
            case "SAMSUNG":
                selectQuery.append(" and maker='삼성'");
                break;
            case "APPLE":
                selectQuery.append(" and maker='애플'");
                break;
            case "ZFLIP":
                selectQuery.append(" and model='ZFLIP'");
                break;
            case "S24":
                selectQuery.append(" and model='S24'");
                break;
            case "아이폰14":
                selectQuery.append(" and model='IPHONE14'");
                break;
            case "아이폰15":
                selectQuery.append(" and model='IPHONE15'");
                break;
            case "실리콘":
                selectQuery.append(" and material='실리콘'");
                break;
            case "하드":
                selectQuery.append(" and material='하드'");
                break;
        }

        if (isCount) {
            selectQuery.append(" ) ");
        } else {
            selectQuery.append(" ) where rnum between ? and ? ");
        }

        return selectQuery.toString();
    }

    public GoodsSimpleVO selectOneGoods(String code) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        GoodsSimpleVO goods = null;

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(
                    "select code, name, price, default_img, description, detail_description from goods where code=?");
            pstmt = conn.prepareStatement(selectQuery.toString());
            pstmt.setString(1, code);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                goods = new GoodsSimpleVO(rs.getString("code"), rs.getString("name"), rs.getString("default_img"),
                        rs.getString("description"), rs.getString("detail_description"), rs.getInt("price"));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return goods;
    }

    public int selectGoodsCount(String category, String sort) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            pstmt = conn.prepareStatement(createSelectQuery(category, sort, true));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }

    public List<GoodsSimpleVO> selectGoodsSort(SearchVO searchVO) throws SQLException {
        List<GoodsSimpleVO> goods = new ArrayList<GoodsSimpleVO>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            pstmt = conn.prepareStatement(createSelectQuery(searchVO.getCategory(), searchVO.getSort(), false));
            pstmt.setInt(1, searchVO.getStart());
            pstmt.setInt(2, searchVO.getEnd());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                goods.add(new GoodsSimpleVO(rs.getString("code"), rs.getString("name"), rs.getString("default_img"),
                        rs.getString("description"), rs.getString("detail_description"), rs.getInt("price")));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return goods;
    }
}
