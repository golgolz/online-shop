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
public class CardVO {
    private String cardId;
    private String userId;
    private Date inputDate;

    public CardVO(String cardId, String userId) {
        super();
        this.cardId = cardId;
        this.userId = userId;
    }

}
