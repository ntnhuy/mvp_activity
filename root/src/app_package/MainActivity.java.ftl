package ${packageName};

import android.content.Context;
import android.os.Bundle;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;

import ${applicationPackage?replace(".mockup", "")}.app.bases.BaseActivity;
import ${applicationPackage?replace(".mockup", "")}.widgets.ToolBarPlus;
import ${applicationPackage?replace(".mockup", "")}.utils.Utils;
import ${applicationPackage?replace(".mockup", "")}.R;
import ${applicationPackage?replace(".mockup", "")}.databinding.${layoutName?replace('_', ' ')?capitalize?replace(' ', '')}Binding;

import javax.inject.Inject;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 *Time: ${.now?string('h:mm a')}
 */
 
public class ${activityClass} extends BaseActivity implements ${activityClass?replace('Activity', '')}View {


    @Inject
    public ${activityClass?replace('Activity', '')}Presenter presenter;
    ${layoutName?replace('_', ' ')?capitalize?replace(' ', '')}Binding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
    }

    @Override
    public void onResume() {
        super.onResume();
        if (presenter != null) {
            presenter.onResume();
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        presenter.onDestroy();
        presenter.detachView();
    }

    @Override
    protected void initVariable() {
        View decorView = getWindow().getDecorView();
        ViewGroup contentView = (ViewGroup) decorView.findViewById(android.R.id.content);
        binding = ${layoutName?replace('_', ' ')?capitalize?replace(' ', '')}Binding.bind(contentView.getChildAt(0));
        getActivityComponent().inject(this);
        presenter.attachView(this);
    }

    @Override
    protected void initView() {

    }

    @Override
    protected void initEvent() {

    }

    @Override
    public void setActiveTitle(String title) {
        super.setActiveTitle(title);
    }

    public ToolBarPlus getToolbar() {
        return null;
    }

    @Override
    public Context getContext() {
        return this;
    }

    @Override
    public void resetView() {
        Utils.hideSoftKeyboard(this);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    public boolean hasTabBar() {
        return false;
    }
}
