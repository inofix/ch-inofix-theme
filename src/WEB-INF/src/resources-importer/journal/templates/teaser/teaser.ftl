<#--
    teaser.ftl: Format the teaser structure
    
    Created:    2017-07-02 23:29 by Christian Berndt
    Modified:   2017-07-05 16:57 by Christian Berndt
    Version:    1.0.1
-->

<#assign color_scheme = "lightgray" />
<#assign css_class = "teaser-right" />
<#assign icon_class = "" />
<#assign teaser_left = false />


<#if colorScheme?? && colorScheme.getData()?has_content >
    <#assign color_scheme = colorScheme.getData() />    
</#if>
<#if iconClass?? && iconClass.getData()?has_content >
    <#assign icon_class = iconClass.getData() />    
</#if>

<#if teaserLeft?? && teaserLeft.getData()?has_content >
    <#assign teaser_left = getterUtil.getBoolean(teaserLeft.getData()) />   
</#if>

<#if teaser_left>
    <#assign css_class = "teaser-left" />
</#if>

<#macro image_wrapper>
    <div class="image-wrapper">
        <#if icon_class?has_content>
            <div class="icon-wrapper">
                <span class="icon ${icon_class}"></span>
            </div>
        </#if>
        <#if headline?? && headline.getData()?has_content>
            <h2>${headline.getData()}</h2>
        </#if>
    </div>
</#macro>

<#macro text_wrapper>
    <div class="text-wrapper">
        <#if subHeadline?? && subHeadline.getData()?has_content>
            <h3>${subHeadline.getData()}</h3>
        </#if>
        <#if claim?? && claim.getData()?has_content>
            <h2>${claim.getData()}</h2>
        </#if>
        <#if content?? && content.getData()?has_content>
            <div>
                ${content.getData()}
            </div>
        </#if>
        <#if link?? && link.getFriendlyUrl()?has_content>
            <a class="btn btn-default" href="${link.getFriendlyUrl()}">
                <@liferay.language key="learn-more" />
            </a>
        </#if>
    </div>
</#macro>

<div class="teaser ${color_scheme} ${css_class}">
    <div class="container-fluid">
        <div class="row">
             <div class="col-md-6 left">
                <@image_wrapper/>
            </div> 
            <div class="col-md-6 right">
                <@text_wrapper/>                
            </div>      
        </div>
    </div>
</div>
