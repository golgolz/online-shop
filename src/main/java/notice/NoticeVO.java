package notice;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
    private String notice_id;
    private Date input_date;
    private String author;
    private int view_count;
    private String title, content;


}

// , NOTICE_ID, INPUT_DATE, AUTHOR, VIEW_COUNT, TITLE, CONTENT
