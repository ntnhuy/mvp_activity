package ${packageName};

import ${applicationPackage?replace(".mockup", "")}.app.bases.MvpView;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 *Time: ${.now?string('h:mm a')}
 */
 
public interface ${activityClass?replace('Activity', '')}View extends MvpView {

}
