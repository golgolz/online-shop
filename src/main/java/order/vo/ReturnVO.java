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
public class ReturnVO {
    private Date orderDate;
    private Date returnDate;
    private String cartId;
    private String customerName;
    private String customerId;
    private String paymentMethod;
    private String returnStatus;
    private int statusFlag;
}
