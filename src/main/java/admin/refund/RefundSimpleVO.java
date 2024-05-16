package admin.refund;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class RefundSimpleVO {
    private Date orderDate;
    private String cartId;
    private String id;
    private String name;
    private String refundStatus;
    private Date refundDate;
    private int refundAmount;
    private String payment;
}
