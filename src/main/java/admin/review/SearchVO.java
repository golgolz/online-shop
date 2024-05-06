package admin.review;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SearchVO {
  private StringBuilder field, keyword;
  private String currentPage;
  private int startNum, endNum;
}
