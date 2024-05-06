package user.main;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class GoodsSimpleVO {
    private String code;
    private String name;
    private String defaultImage;
    private String detailImage;
    private String detailDescription;
    private int price;
}
