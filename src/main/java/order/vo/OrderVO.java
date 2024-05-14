package order.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
@ToString
public class OrderVO {
    private String cartId;
    private Date orderDate;
    private String userName;
    private String userId;
    private String deliveryStatus;
    private String purchaseStauts;
    private String paymetMethod;
    private int defaultAddrFlag;
    private String statusFlag;
}
