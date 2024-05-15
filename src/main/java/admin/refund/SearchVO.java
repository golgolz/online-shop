package admin.refund;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SearchVO {
    private int field;
    private String keyword;
    private String date;
    private String refund;
    private int start;
    private int end;
}
