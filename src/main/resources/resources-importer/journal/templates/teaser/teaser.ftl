<#--
    teaser.ftl: Format the teaser structure
    
    Created:    2017-07-02 23:29 by Christian Berndt
    Modified:   2017-11-06 12:15 by Christian Berndt
    Version:    1.0.45
-->

<#assign background_style = ""/>
<#assign color_scheme = "lightgray" />
<#assign css_class = "" />
<#assign has_image = false />
<#assign icon_class = "" />
<#assign teaser_left = false />
<#assign use_as_background_image = false />

<#if image?? && image.getData()?has_content>
    <#assign has_image = true />    
</#if>

<#if useAsBackgroundImage?? && useAsBackgroundImage.getData()?has_content >
    <#assign use_as_background_image = getterUtil.getBoolean(useAsBackgroundImage.getData()) />   
</#if>

<#if has_image && use_as_background_image >
    <#assign background_style = "background-image: url(" + image.getData() + ");"/>
    <#assign css_class = "background-image"/>
</#if>

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
    <#assign css_class = css_class + " teaser-left" />
</#if>

<div class="teaser ${color_scheme} ${css_class}">
    <div class="container-fluid">
        <div class="row">
             <div class="col-md-6" style="${background_style}">
                
                <#if has_image && !use_as_background_image >
                    <div class="image-wrapper">
                        <img src="${image.getData()}" />
                        <#if headline?? && headline.getData()?has_content>
                            <h1>${headline.getData()}</h1>
                        </#if>                     
                    </div>
                </#if>
                
                <#if icon_class?has_content>
                    <div class="icon-wrapper">
                        <span class="icon ${icon_class}"></span>
                        <#if headline?? && headline.getData()?has_content>
                            <h1>${headline.getData()}</h1>
                        </#if>                        
                    </div>
                </#if>
                <#if background_style?has_content>
                    <div class="icon-wrapper">
                        <#if headline?? && headline.getData()?has_content>
                            <h1>${headline.getData()}</h1>
                        </#if>                        
                    </div>                
                    <#if image.getAttribute("alt")?has_content>
                        <div class="caption">${image.getAttribute("alt")}</div>
                    </#if>
                </#if>
            </div> 
            <div class="col-md-6">
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
            </div>      
        </div>
    </div>
</div>
