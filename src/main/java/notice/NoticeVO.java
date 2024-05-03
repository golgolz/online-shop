package notice;

import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class NoticeVO {
    private int notice_id;
    private Date input_date;
    private String author, view_count, title, content;
}
