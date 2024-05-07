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
    private String notice_id, author, title, content;
    private Date input_date;
    private int view_count;

    private int startNum, endNum;
}
