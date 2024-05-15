package admin.refund;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class RefundDetailInfoVO {
    private String id;
    private Date refundDate;
    private int refundAmount;
}
