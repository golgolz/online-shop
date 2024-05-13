package user.goods;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class SearchVO {
    private String category;
    private String sort;
    private int start;
    private int end;
}
