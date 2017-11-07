package ${packageName};

import ${applicationPackage?replace(".mockup", "")}.R;
import ${applicationPackage?replace(".mockup", "")}.datas.models.EventBusModel;
import ${applicationPackage?replace(".mockup", "")}.app.bases.BasePresenter;
import ${applicationPackage?replace(".mockup", "")}.datas.DataManager;
import javax.inject.Inject;
import ${applicationPackage?replace(".mockup", "")}.datas.models.EventBusModel;

<#if includeRetrofit || includeDB>
import ${applicationPackage?replace(".mockup", "")}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Consumer;
</#if>

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/**
 * Created by tohuy on 9/14/17.
 */

public class ${activityClass?replace('Activity', '')}Presenter extends BasePresenter<${activityClass?replace('Activity', '')}View> {

    @Inject
    public ${activityClass?replace('Activity', '')}Presenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(dataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
        if (!EventBus.getDefault().isRegistered(this)) {
            EventBus.getDefault().register(this);
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onEvent(EventBusModel eventBusModel) {
        switch (eventBusModel.getBusEnum()) {
            
        }
    }

    public void onResume() {
        if (!EventBus.getDefault().isRegistered(this)) {
            EventBus.getDefault().register(this);
        }
    }

    public void onDestroy() {
        EventBus.getDefault().unregister(this);
    }

}
