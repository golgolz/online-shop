package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class UserNoticeDAO {
    public static UserNoticeDAO noticeDAO;
    private String[] columnNames;

    private UserNoticeDAO() {
        columnNames = new String[] {"title", "content"};

    }

    public static UserNoticeDAO getInstance() {
        if (noticeDAO == null) {
            noticeDAO = new UserNoticeDAO();
        }
        return noticeDAO;
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
            selectCnt.append("select count(*) view_count from notice");

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                selectCnt.append("where").append(columnNames[Integer.parseInt(sVO.getField())])
                        .append("like  '%'||?||'%'");
            }
            pstmt = con.prepareStatement(selectCnt.toString());

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                pstmt.setString(1, sVO.getKeyword());
            } // end if

            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalCnt = rs.getInt("view_count");
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

    public void insertNotice(NoticeVO nVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbConn = DbConnection.getInstance();
        try {
            String insertNotice = " insert into notice (notice_id, input_date, author, view_count, title, content)\r\n"
                    + "values (? ,? ,? ,? ,? ,?) ";
            pstmt.setString(1, nVO.getNotice_id());
            pstmt.setDate(2, nVO.getInput_date());
            pstmt.setString(3, nVO.getAuthor());
            pstmt.setInt(4, nVO.getView_count());
            pstmt.setString(5, nVO.getTitle());
            pstmt.setString(6, nVO.getContent());

            pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(null, pstmt, con);
        }
    }// insertNotice

    public NoticeVO selectDetailNotice(int seq) throws SQLException {
        NoticeVO nVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection db = DbConnection.getInstance();

        try {
            StringBuilder selectNotice = new StringBuilder();
            selectNotice.append("select notice_id, input_date, author, view_count, title, content ")
                    .append("from notice").append("where notice_id=?");

            pstmt = con.prepareStatement(selectNotice.toString());

            pstmt.setInt(1, seq);
            rs = pstmt.executeQuery();

        } finally {
            db.closeCon(rs, pstmt, con);
        }
        return nVO;
    }// selectDetailNotice



}// class
