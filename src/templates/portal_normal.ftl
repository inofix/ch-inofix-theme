<#--
    portal_normal.ftl: base template of the inofix-theme.
    
    Created:    2017-03-05 23:01 by Christian Berndt
    Modified:   2017-03-05 23:01 by Christian Berndt
    Version:    0.1.0
-->

<!DOCTYPE html>

<#include init />

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
    
<div class="container" id="wrapper">
    
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
    </div>
</footer>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>