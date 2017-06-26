<#--
    navigation.ftl: header navigation.
    
    Created:    2017-03-05 23:01 by Christian Berndt
    Modified:   2017-06-26 17:00 by Christian Berndt
    Version:    0.2.0
-->

<#assign show_header_search = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header-search"))>
<#assign layout_url = portalUtil.getLayoutFriendlyURL(layout, theme_display) />
<#assign sign_up_url = layout_url + "?p_p_id=com_liferay_login_web_portlet_LoginPortlet&p_p_lifecycle=0&p_p_state=maximized&p_p_mode=view&saveLastPath=false&_com_liferay_login_web_portlet_LoginPortlet_mvcRenderCommandName=%2Flogin%2Fcreate_account" />

<nav class="${nav_css_class} navbar navbar-default" id="navigation" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
           
            <a class="navbar-brand ${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                <img alt="${logo_description}" src="${site_logo}" />
            
                <#if show_site_name>
                    <span class="brand-name site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                        ${site_name}
                    </span>
                </#if>
            </a>

        </div>
        
        <ul aria-label="<@liferay.language key="site-pages" />" class="nav navbar-nav" role="menubar">
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
        
        <#--
        <div class="nav-form search-form" role="search">
            <@liferay.search default_preferences="${freeMarkerPortletPreferences}" />
        </div>
        -->
           
        <div class="account-actions navbar-right">
            <#if is_signed_in>
                <#if user.hasPublicLayouts() >
                    <a href="${user.getDisplayURL(theme_display)}">
                        <span class="user-name">${user.fullName}</span>
                    </a>
                <#else>
                    <span class="user-name text-muted">${user.fullName}</span>                
                </#if>
                <a href="${sign_out_url}" id="sign-out" rel="nofollow" title="<@liferay.language key="sign-out" />">
                    <span class="icon-signout"></span>
                </a>
            <#else>
                <a class="btn btn-default" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
                <a class="btn btn-success" href="${sign_up_url}" id="sign-up" rel="nofollow"><@liferay.language key="sign-up" /></a>
            </#if>
        </div>
    </div>
</nav>