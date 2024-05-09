package admin.goods;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SearchVO {
    private int field;
    private String code;
    private String name;
    private int priceMin;
    private int priceMax;
    private String date;
    private String sort;
}