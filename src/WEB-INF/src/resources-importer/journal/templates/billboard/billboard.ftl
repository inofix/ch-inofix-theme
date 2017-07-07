<#--
    billboard.ftl: Format the billboard structure
    
    Created:    2017-06-27 22:23 by Christian Berndt
    Modified:   2017-07-07 16:13 by Christian Berndt
    Version:    1.0.5
-->

<#assign color_scheme = "darkgray" />
<#assign css_class = "col-md-6 col-md-offset-3 text-only" />
<#assign format_blowing = false />
<#assign has_images = image?? && image.getData()?? && image.getData() != ""/>

<#if colorScheme?? && colorScheme.getData()?has_content>
    <#assign color_scheme = colorScheme.getData() />
</#if>

<#if formatBlowing?? && formatBlowing.getData()?has_content >
    <#assign format_blowing = getterUtil.getBoolean(formatBlowing.getData()) />
    <#if format_blowing>
        <#assign color_scheme = color_scheme + " format-blowing" />
    </#if>   
</#if>

<#if has_images>
    <#assign css_class = "col-md-6" />
</#if>

<div class="billboard ${color_scheme}">
    <div class="container">
        <div class="row">
            <div class="${css_class} first">
                <div class="claim">
                    <h1>${claim.getData()}</h1>
                </div>
            </div>
            <#if has_images>
                <div class="col-md-6 last">
                    <div class="keyvisual">
                        <div class="image-wrapper">
                            <img alt="${image.getAttribute("alt")}" src="${image.getData()}" />
                            <#if image.getAttribute("alt")?has_content>
                                <div class="caption">${image.getAttribute("alt")}</div>
                            </#if>
                        </div>
                    </div>                  
                </div>                
            </#if>
        </div>
    </div>
</div>
