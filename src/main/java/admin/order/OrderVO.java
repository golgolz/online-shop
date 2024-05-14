package admin.order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderVO {
    private String orderDate;
    private String cartId;
    private String customerId;
    private String customerName;
    private String purchaseStatus;
    private String deliveryStatus;
    private String receiver;
    private String payment;
    private int purchaseSum;
}
