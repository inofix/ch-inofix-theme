<#--
    logos.ftl: Format the logos structure
    
    Created:    2017-07-05 23:13 by Christian Berndt
    Modified:   2017-07-08 17:50 by Christian Berndt
    Version:    1.0.4
-->

<#assign css_class = "" />
<#assign is_gallery = false />
<#assign smaller_headline = false />
<#assign smaller_logos = false />

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

<div class="logos ${css_class}">
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
                            <div class="col-sm-3 col-md-2">
                                <div class="logo-wrapper">
                                    <img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" />
                                </div>
                                <#-- <p class="description"></p> -->
                            </div>
                        </#if>
                    </#list>  
                <#else>
                    <div class="logos-bar">
                        <#list logo.getSiblings() as cur_logo>
                            <#if cur_logo.getData()?? && cur_logo.getData() != "">
                                <img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" />
                            </#if>
                        </#list>
                    </div>
                </#if>
            </#if>
        </div>
    </div>
</div>
