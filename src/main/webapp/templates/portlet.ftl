<#--
    portlet.ftl: portlet template of the inofix-theme.
    
    Created:    2017-07-02 15:18 by Christian Berndt
    Modified:   2017-10-11 22:16 by Christian Berndt
    Version:    1.0.2
-->

<#assign
    portlet_display = portletDisplay

    portlet_back_url = htmlUtil.escapeHREF(portlet_display.getURLBack())
    portlet_content_css_class = "portlet-content"
    portlet_display_name = htmlUtil.escape(portlet_display.getPortletDisplayName())
    portlet_display_root_portlet_id = htmlUtil.escapeAttribute(portlet_display.getRootPortletId())
    portlet_id = htmlUtil.escapeAttribute(portlet_display.getId())
    portlet_title = htmlUtil.escape(portlet_display.getTitle())
    
/>

<#assign show_title = "false" />

<#if request.getAttribute("_ch_inofix_contact_web_internal_portlet_ContactManagerPortlet_showTitle")??>
    <#assign show_title = request.getAttribute("_ch_inofix_contact_web_internal_portlet_ContactManagerPortlet_showTitle") />
<#elseif request.getAttribute("_ch_inofix_newsletter_web_internal_portlet_NewsletterManagerPortlet_showTitle")??>
    <#assign show_title = request.getAttribute("_ch_inofix_newsletter_web_internal_portlet_NewsletterManagerPortlet_showTitle") />
<#elseif request.getAttribute("_ch_inofix_timetracker_web_internal_portlet_TimetrackerPortlet_showTitle")??>
    <#assign show_title = request.getAttribute("_ch_inofix_timetracker_web_internal_portlet_TimetrackerPortlet_showTitle") />
</#if>

<section class="portlet" id="portlet_${portlet_id}">
    <#if portlet_display.isPortletDecorate() && !portlet_display.isStateMax() && portlet_display.getPortletConfigurationIconMenu()?? && portlet_display.getPortletToolbar()??>
        <#assign
            portlet_configuration_icon_menu = portlet_display.getPortletConfigurationIconMenu()
            portlet_toolbar = portlet_display.getPortletToolbar()

            portlet_configuration_icons = portlet_configuration_icon_menu.getPortletConfigurationIcons(portlet_display_root_portlet_id, renderRequest, renderResponse)
            portlet_title_menus = portlet_toolbar.getPortletTitleMenus(portlet_display_root_portlet_id, renderRequest, renderResponse)
        />

        <#if (portlet_configuration_icons?has_content || portlet_title_menus?has_content)>
            <header class="portlet-topper">
                <div class="portlet-title-default">
                    <span class="portlet-name-text">${portlet_display_name}</span>
                </div>

                <#foreach portletTitleMenu in portlet_title_menus>
                    <menu class="portlet-title-menu portlet-topper-toolbar" id="portlet-title-menu_${portlet_id}_${portletTitleMenu_index + 1}" type="toolbar">
                        <@liferay_ui["menu"] menu=portletTitleMenu />
                    </menu>
                </#foreach>

                <#if portlet_configuration_icons?has_content>
                    <menu class="portlet-topper-toolbar" id="portlet-topper-toolbar_${portlet_id}" type="toolbar">
                        <@liferay_portlet["icon-options"] portletConfigurationIcons=portlet_configuration_icons />
                    </menu>
                </#if>
            </header>

            <#assign portlet_content_css_class = portlet_content_css_class + " portlet-content-editable" />
        </#if>
    </#if>

    <div class="${portlet_content_css_class}">
        <#if portlet_display.isShowBackIcon()>
            <a class="icon-monospaced portlet-icon-back text-default" href="${portlet_back_url}" title="<@liferay.language key="return-to-full-page" />">
                <@liferay_ui["icon"]
                    icon="angle-left"
                    markupView="lexicon"
                />
            </a>
        </#if>

        <#if "true" == show_title >
            <h2 class="portlet-title-text">${portlet_title}</h2>
        </#if>

        ${portlet_display.writeContent(writer)}
    </div>
</section>