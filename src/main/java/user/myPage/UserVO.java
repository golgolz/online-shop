package user.myPage;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter

public class UserVO {
  private String id;
  private String name;
  private String email;
  private String tel;
  private String zipcode;
  private String defaultAddr;
  private String additionalAddr;
}
