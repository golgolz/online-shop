package admin.dashboard;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class DashboardOrderProgressVO {
    private int orderDone;
    private int deliveryReady;
    private int deliveryInProgress;
    private int deliveryDone;
    private int orderConfirmed;
}
