package admin.order;

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
    private String cartId;
    private String id;
    private String name;
    private String receiver;
    private String date;
    private String delivery;
    private String purchase;
    private int start;
    private int end;
}
