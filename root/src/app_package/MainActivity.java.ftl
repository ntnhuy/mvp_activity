package ${packageName};

import android.content.Context;
import android.os.Bundle;
import android.content.Intent;

import ${applicationPackage?replace(".mockup", "")}.app.bases.BaseActivity;
import ${applicationPackage?replace(".mockup", "")}.widgets.ToolBarPlus;
import ${applicationPackage?replace(".mockup", "")}.utils.Utils;
import ${applicationPackage?replace(".mockup", "")}.R;

import javax.inject.Inject;

public class ${activityClass} extends BaseActivity implements ${activityClass?replace('Activity', '')}View {


    @Inject
    public ${activityClass?replace('Activity', '')}Presenter presenter;

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
