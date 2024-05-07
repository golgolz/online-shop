package admin.goods;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class AdminGoodsSimpleVO {
    private String code;
    private String name;
    private String defaultImage;
    private Date inputDate;
    private int price;
    private int amount;
}
