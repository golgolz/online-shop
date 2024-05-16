package order.vo;

import java.sql.Date;
import java.util.List;
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
public class ReturnDetailVO {
    private Date orderDate;
    private Date returnDate;
    private String cartId;
    private String customerName;
    private int total;
    private String paymentMethod;
    private int refundAmount;
    private String returnStatus;
    private List<OrderProductVO> productList;
    private int statusFlag;

    public ReturnDetailVO(String cartId, Date returnDate, String customerName, String returnStatus, int refundAmount,
            List<OrderProductVO> productList) {
        super();
        this.cartId = cartId;
        this.returnDate = returnDate;
        this.customerName = customerName;
        this.returnStatus = returnStatus;
        this.refundAmount = refundAmount;
        this.productList = productList;
    }



}
