<#--
    logos.ftl: Format the logos structure
    
    Created:    2017-07-05 23:13 by Christian Berndt
    Modified:   2017-07-05 23:13 by Christian Berndt
    Version:    1.0.0
-->

<#assign css_class = "" />
<#assign smaller_logos = false />

<#if smallerLogos?? && smallerLogos.getData()?has_content >
    <#assign smaller_logos = getterUtil.getBoolean(smallerLogos.getData()) />   
</#if>

<#if smaller_logos>
    <#assign css_class = "smaller-logos" />
</#if>

<div class="logos ${css_class}">
    <div class="container">
        <#if headline?? && headline.getData()?has_content>
            <h1>${headline.getData()}</h1>
        </#if>
        <#if subHeadline?? && subHeadline.getData()?has_content>
            <h4>${subHeadline.getData()}</h4>
        </#if>
        <div class="row">
            <#if logo.getSiblings()?has_content>
                <#list logo.getSiblings() as cur_logo>
                    <#if cur_logo.getData()?? && cur_logo.getData() != "">
                        <img alt="${cur_logo.getAttribute("alt")}" class="logo" src="${cur_logo.getData()}" />
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
</div>