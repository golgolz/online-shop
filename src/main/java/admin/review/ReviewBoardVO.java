package admin.review;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ReviewBoardVO {
  private int reviewId, num, cnt;
  private String defaultImg, title, name, content, id, cartId, code, removeFlag;
  private Date inputDate;

}
