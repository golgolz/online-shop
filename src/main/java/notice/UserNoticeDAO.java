package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class UserNoticeDAO {
    public static UserNoticeDAO unDAO;
    private String[] columnNames;

    private UserNoticeDAO() {
        columnNames = new String[] {"title", "content"};

    }

    public static UserNoticeDAO getInstance() {
        if (unDAO == null) {
            unDAO = new UserNoticeDAO();
        }
        return unDAO;
    }// getInstance

    // 조회수
    public int SelectTotalCount(SearchVO sVO) throws SQLException {
        int totalCnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();

        try {
            con = dbConn.getConn("online-shop-dbcp");

            StringBuilder selectCnt = new StringBuilder();
            selectCnt.append("select count(*) as count from notice");

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword()) && sVO.getField() != null
                    && !"".equals(sVO.getField())) {
                selectCnt.append(" where ").append(columnNames[Integer.parseInt(sVO.getField())])
                        .append(" like '%' || ? || '%'");
            }

            pstmt = con.prepareStatement(selectCnt.toString());

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword()) && sVO.getField() != null
                    && !"".equals(sVO.getField())) {
                pstmt.setString(1, sVO.getKeyword());
            } // end if

            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalCnt = rs.getInt("count");
            } // end if
        } finally {
            dbConn.closeCon(rs, pstmt, con);
        }
        return totalCnt;
    }// SelectTotalCount

    // 공지사할 조회
    public List<NoticeVO> selectNotice(SearchVO sVO) throws SQLException {
        List<NoticeVO> list = new ArrayList<NoticeVO>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();
        try {
            con = dbConn.getConn("online-shop-dbcp");
            StringBuilder selectNotice = new StringBuilder();
            selectNotice.append("select notice_id, input_date, author, view_count, title, content ")
                    .append("from (select notice_id, input_date, author, view_count, title, content,")
                    .append("row_number() over (order by input_date desc) as rnum from notice)");

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                selectNotice.append("where instr(").append(columnNames[Integer.parseInt(sVO.getField())])
                        .append(",?)>0");
            } // end if
            selectNotice.append("where rnum between ? and ?");

            pstmt = con.prepareStatement(selectNotice.toString());
            int bindIndex = 0;
            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                pstmt.setString(++bindIndex, sVO.getKeyword());
            } // end if
            pstmt.setInt(++bindIndex, sVO.getStartNum());
            pstmt.setInt(++bindIndex, sVO.getEndNum());
            rs = pstmt.executeQuery();
            NoticeVO nVO = null;

            while (rs.next()) {
                // String, date, string, int, string,string
                nVO = new NoticeVO(rs.getString("notice_id"), rs.getDate("input_date"), rs.getString("author"),
                        rs.getInt("view_count"), rs.getString("title"), "");
                list.add(nVO);
            } // end while
        } finally {
            dbConn.closeCon(rs, pstmt, con);
        }
        return list;
    }// selectNotice

    public NoticeVO selectDetailNotice(int id) throws SQLException {

        NoticeVO nVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection db = DbConnection.getInstance();

        try {
            con = db.getConn("online-shop-dbcp");
            StringBuilder selectNotice = new StringBuilder();
            selectNotice.append("select notice_id, input_date, author, view_count, title, content ")
                    .append(" from notice ").append(" where notice_id= ?");

            pstmt = con.prepareStatement(selectNotice.toString());

            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // nVO = new NoticeVO(); //기본생성자를 이용해서 객체 생성
                nVO = new NoticeVO(rs.getString("notice_id"), rs.getDate("input_date"), rs.getString("author"),
                        rs.getInt("view_count"), rs.getString("title"), rs.getString("content"));// setter는 값을 하나식만 할당되기
                // 때문에
                System.out.println(nVO.toString());
            }
        } finally {
            db.closeCon(rs, pstmt, con);
        }
        return nVO;
    }// selectDetailNotice

    public int updateCnt(int num) throws SQLException {
        int cnt = 0;
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection db = DbConnection.getInstance();

        try {
            con = db.getConn("online-shop-dbcp");

            StringBuilder updateCnt = new StringBuilder();
            updateCnt.append("update notice set view_count = view_count+1");
            updateCnt.append("where notice_id=? ");

            pstmt = con.prepareStatement(updateCnt.toString());

            pstmt.setInt(1, num);

            cnt = pstmt.executeUpdate();
        } finally {
            db.closeCon(null, pstmt, con);
        }
        return cnt;
    }// updateCnt


}// class
