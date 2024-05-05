package admin.dashboard;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class DashboardOrderVO {
    private int today;
    private int week;
    private int month;
    private int refund;
}
