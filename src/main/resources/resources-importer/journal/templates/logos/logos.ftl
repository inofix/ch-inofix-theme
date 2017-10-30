<#--
    logos.ftl: Format the logos structure
    
    Created:    2017-07-05 23:13 by Christian Berndt
    Modified:   2017-10-30 16:25 by Christian Berndt
    Version:    1.0.8
-->

<#assign color_scheme = "white" />
<#assign css_class = "" />
<#assign is_gallery = false />
<#assign smaller_headline = false />
<#assign smaller_logos = false />

<#if colorScheme?? && colorScheme.getData()?has_content>
    <#assign color_scheme = colorScheme.getData() />
</#if>
<#if isGallery?? && isGallery.getData()?has_content >
    <#assign is_gallery = getterUtil.getBoolean(isGallery.getData()) />   
</#if>
<#if smallerHeadline?? && smallerHeadline.getData()?has_content >
    <#assign smaller_headline = getterUtil.getBoolean(smallerHeadline.getData()) />   
</#if>
<#if smallerLogos?? && smallerLogos.getData()?has_content >
    <#assign smaller_logos = getterUtil.getBoolean(smallerLogos.getData()) />   
</#if>

<#if smaller_logos>
    <#assign css_class = "smaller-logos" />
</#if>

<div class="logos ${css_class} ${color_scheme}">
    <div class="container">
        <#if headline?? && headline.getData()?has_content>
            <#if smaller_headline>
                <h2>${headline.getData()}</h2>
            <#else>
                <h1>${headline.getData()}</h1>
            </#if>
        </#if>
        <#if subHeadline?? && subHeadline.getData()?has_content>
            <#if smaller_headline>
                <p>${subHeadline.getData()}</p>
            <#else>
                <h4>${subHeadline.getData()}</h4>
            </#if>        
        </#if>
        <div class="row">
            <#if logo.getSiblings()?has_content>
                <#if is_gallery>
                    <#list logo.getSiblings() as cur_logo>
                        <#if cur_logo.getData()?? && cur_logo.getData() != "">
                        
                            <#assign title=""/>
                            
                            <#if cur_logo.copyright?? && cur_logo.copyright.getData()?has_content>
                                <#assign title= cur_logo.copyright.getData() />
                            </#if>
                            
                            <#assign href=""/>
                            
                            <#if cur_logo.href?? && cur_logo.href.getData()?has_content>
                                <#assign href= cur_logo.href.getData() />
                            </#if>

                            <div class="col-sm-3 col-md-2">
                                <div class="logo-wrapper">
                                    <#if href?has_content>
                                        <a href="${href}" target="_blank"><img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" title="${title}" /></a>                       
                                    <#else>
                                        <img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" title="${title}" />   
                                    </#if>
                                </div>
                            </div>
                        </#if>
                    </#list>
                <#else>
                    <div class="logos-bar">
                        <#list logo.getSiblings() as cur_logo>
                        
                            <#assign title=""/>
                            
                            <#if cur_logo.copyright?? && cur_logo.copyright.getData()?has_content>
                                <#assign title= cur_logo.copyright.getData() />
                            </#if>
                            
                            <#assign href=""/>
                            
                            <#if cur_logo.href?? && cur_logo.href.getData()?has_content>
                                <#assign href= cur_logo.href.getData() />
                            </#if>                       

                            <#if cur_logo.getData() != "">
                                <#if href?has_content>
                                    <a href="${href}" target="_blank"><img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" title="${title}" /></a>                       
                                <#else>
                                    <img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" title="${title}" />   
                                </#if>                                
                            </#if>
                        </#list>
                    </div>
                </#if>
            </#if>
        </div>
    </div>
</div>
