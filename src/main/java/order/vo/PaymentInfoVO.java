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
public class PaymentInfoVO {
    private String cartId;
    private String cardId;
    private String userId;
    private Date purchaseDate;
}
