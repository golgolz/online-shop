package notice;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SearchVO {
    private String field, keyword, currentPage;
    private int startNum, endNum;
    // private String sort; // 삭제하든가..
}
