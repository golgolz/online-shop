package admin.userManage;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter

public class UserManageVO {
  private String name;
  private String id;
  private String tel;
  private String input_date;
  private int total_amount;
  private String withdrawal_flag;
  private String access_limit_flag;

}
