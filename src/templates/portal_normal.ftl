<#--
    portal_normal.ftl: base template of the inofix-theme.
    
    Created:    2017-03-05 23:01 by Christian Berndt
    Modified:   2017-07-10 17:48 by Christian Berndt
    Version:    0.1.8
-->

<!DOCTYPE html>

<#include init />

<#assign full_width = getterUtil.getBoolean(themeDisplay.getThemeSetting("full-width"), false)>

<#assign wrapper_class = "container"/>

<#if full_width>
    <#assign wrapper_class = "container-fluid full-width"/>
</#if>

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
    <title>${the_title} - ${company_name}</title>

    <meta content="initial-scale=1.0, width=device-width" name="viewport" />

    <@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<header id="banner" role="banner">
    <#if has_navigation && is_setup_complete>
        <#include "${full_templates_path}/navigation.ftl" />
    </#if>
</header>

<#if layout.isPrivateLayout() >
    <div class="pagehead">
        <div class="container">
        
            <h3>
                ${site_name}
            </h3>
        
            <ul aria-label="<@liferay.language key="site-pages" />" class="collapse navbar-collapse nav navbar-nav site-navigation" role="menubar">
                <#list nav_items as nav_item>
                    <#assign
                        nav_item_attr_has_popup = ""
                        nav_item_attr_selected = ""
                        nav_item_css_class = ""
                        nav_item_layout = nav_item.getLayout()
                    />
        
                    <#if nav_item.isSelected()>
                        <#assign
                            nav_item_attr_has_popup = "aria-haspopup='true'"
                            nav_item_attr_selected = "aria-selected='true'"
                            nav_item_css_class = "active"
                        />
                    </#if>
                    
                    <li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
                        <a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>
                    </li>                
                </#list>
            </ul>        
        </div>
    </div>
</#if>
    
<div class="${wrapper_class}" id="wrapper">
    
    <section id="content">
    
        <#if selectable>
            <@liferay_util["include"] page=content_include />
        <#else>
            ${portletDisplay.recycle()}
    
            ${portletDisplay.setTitle(the_title)}
    
            <@liferay_theme["wrap-portlet"] page="portlet.ftl">
                <@liferay_util["include"] page=content_include />
            </@>
        </#if>
    </section>
    
</div>

<footer id="footer" role="contentinfo">
    <div class="container">
        &copy; 2017 <a href="http://www.inofix.ch" target="_blank">www.inofix.ch</a>
        
        <div class="pull-right">
            <#if !is_signed_in>
                <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
            <#else>
                <a href="${sign_out_url}" id="sign-out" rel="nofollow" title="<@liferay.language key="sign-out" />"><@liferay.language key="sign-out" /></a>              
            </#if>
<#--            <a class="btn btn-success" href="${sign_up_url}" id="sign-up" rel="nofollow"><@liferay.language key="sign-up" /></a> -->
        </div>
    </div>
</footer>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>