<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />
    <@kt.addAllKotlinDependencies />

    <#include "../common/recipe_simple.xml.ftl" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

<#if generateKotlin>
    <instantiate from="root/src/app_package/SimpleActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.kt" />
<#else>
    <instantiate from="root/src/app_package/MainActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <instantiate from="root/src/app_package/MainPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass?replace('Activity', '')}Presenter.java" />

    <instantiate from="root/src/app_package/MainView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass?replace('Activity', '')}View.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</#if>

</recipe>
