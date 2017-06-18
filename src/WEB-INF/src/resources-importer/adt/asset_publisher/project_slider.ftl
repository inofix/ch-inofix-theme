<#--
    project_slider.ftl: Display a list of projects with the flexslider widget.
    
    Created:    2015-12-12 13:32 by Christian Berndt
    Modified:   2017-06-16 23:51 by Christian Berndt
    Version:    1.0.1
    
    Please note: the flexslider is configured in js/main.js.
-->

<#assign journalArticleService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService") />

<div class="container">
    <div class="projects-min flexslider slider">
        <#if entries?has_content>
            <ul class="slides">
            <#list entries as curEntry>
                <li>
                    <#assign article = journalArticleService.getLatestArticle(curEntry.getClassPK()) />
                    <#assign content = article.getContentByLocale(themeDisplay.getLocale()) />
                    ${content}
                </li>
            </#list>
            </ul>
        </#if>
    </div>
</div>