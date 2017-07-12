<#--
    teaser.ftl: Format the teaser structure
    
    Created:    2017-07-02 23:29 by Christian Berndt
    Modified:   2017-07-12 17:32 by Christian Berndt
    Version:    1.0.3
-->

<#assign background_style = ""/>
<#assign color_scheme = "lightgray" />
<#assign css_class = "" />
<#assign icon_class = "" />
<#assign teaser_left = false />

<#if backgroundImage?? && backgroundImage.getData()?has_content>
    <#assign background_style = "background-image: url(" + backgroundImage.getData() + ");"/>
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
                <div class="image-wrapper">
                    <#if icon_class?has_content>
                        <div class="icon-wrapper">
                            <span class="icon ${icon_class}"></span>
                        </div>
                    </#if>
                    <#if headline?? && headline.getData()?has_content>
                        <h1>${headline.getData()}</h1>
                    </#if>
                </div>
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
