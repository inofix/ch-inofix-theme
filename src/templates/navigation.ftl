<#--
    navigation.ftl: header navigation.
    
    Created:    2017-03-05 23:01 by Christian Berndt
    Modified:   2017-07-10 17:37 by Christian Berndt
    Version:    0.2.8
-->

<#assign home_url = ""/>

<#if themeDisplay.getThemeSetting("home-url")?? && themeDisplay.getThemeSetting("home-url")?has_content>
    <#assign home_url = themeDisplay.getThemeSetting("home-url")/>
</#if>

<#if !home_url?has_content>
    <#assign home_url = company_url />
</#if>

<nav class="${nav_css_class} navbar navbar-default" id="navigation" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".site-navigation" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
           
            <a class="navbar-brand ${logo_css_class}" href="${home_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                <img alt="${logo_description}" src="${company_logo}?v.1" />
            
                <#if show_site_name>
                    <span class="brand-name site-name" title="<@liferay.language_format arguments="${company_name}" key="go-to-x" />">
                        ${company_name}
                    </span>
                </#if>
            </a>

        </div>
 
        <#if layout.isPublicLayout() >
            <ul aria-label="<@liferay.language key="site-pages" />" class="collapse nav navbar-collapse navbar-nav navbar-right site-navigation" role="menubar">
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
                <#if theme_display.isSignedIn() >
                    <#if user.hasPrivateLayouts()>
                        <li>
                            <a class="btn btn-info btn-my-account" href="${user.getDisplayURL(theme_display, true)}">
                                <span><@liferay.language key="my-account" /></span>
                            </a>
                        </li>
                    </#if>
                </#if>
            </ul>
        <#else>           
            <ul class="my-account nav navbar-nav navbar-right" role="menubar">
                <li>
                    <#if user.hasPrivateLayouts() >
                        <#if theme_display.scopeGroupId == user.groupId >
                            <a href="${user.getDisplayURL(theme_display, true)}">
                                <span class="user-name">${user.fullName}</span>
                            </a>
                        <#else>
                            <a class="btn btn-info btn-my-account" href="${user.getDisplayURL(theme_display, true)}">
                                <span><@liferay.language key="my-account" /></span>
                            </a>
                        </#if>
                    <#else>
                        <span class="user-name text-muted">${user.fullName}</span>                
                    </#if>
                </li>
            </ul>            
        </#if> 
    </div>
</nav>
