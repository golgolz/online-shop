package admin.goods;

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
    private int field;
    private String code;
    private String name;
    private int priceMin;
    private int priceMax;
    private String date;
    private String updateDate;
    private String sort;
    private int start;
    private int end;
}
