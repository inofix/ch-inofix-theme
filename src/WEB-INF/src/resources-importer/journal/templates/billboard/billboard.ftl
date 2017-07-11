<#--
    billboard.ftl: Format the billboard structure
    
    Created:    2017-06-27 22:23 by Christian Berndt
    Modified:   2017-07-11 16:43 by Christian Berndt
    Version:    1.0.6
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
                        <#if image.getSiblings()?size gt 1>
                            <div class="image-wrapper">
                                <div class="carousel slide" id="carousel-billboard" data-interval="10000" data-ride="carousel">
                                    <ol class="carousel-indicators"> 
                                        <#list image.getSiblings() as cur_image>
                                            <#assign idx = cur_image?index />
                                            <#assign initial = "active" />
                                            <#if idx gt 0>
                                                <#assign initial = "" /> 
                                            </#if>                                            
                                            <li data-target="#carousel-billboard" data-slide-to="${idx}" class="${initial}"></li>
                                        </#list>
                                    </ol> 
                                    <div class="carousel-inner" role="listbox"> 
                                        <#list image.getSiblings() as cur_image> 
                                            <#assign idx = cur_image?index />
                                            <#assign initial = "active" />
                                            <#if idx gt 0>
                                                <#assign initial = "" /> 
                                            </#if>                                                                         
                                            <div class="item ${initial}"> 
                                                <img alt="${cur_image.getAttribute("alt")}" src="${cur_image.getData()}"> 
                                                <#if image.getAttribute("alt")?has_content>
                                                    <div class="caption">${image.getAttribute("alt")}</div>
                                                </#if>
                                            </div>
                                        </#list>
                                    </div>
                                </div> 
                            </div>                        
                        <#else>
                            <div class="image-wrapper">
                                <img alt="${image.getAttribute("alt")}" src="${image.getData()}" />
                                <#if image.getAttribute("alt")?has_content>
                                    <div class="caption">${image.getAttribute("alt")}</div>
                                </#if>
                            </div>
                        </#if>
                    </div>                  
                </div>                
            </#if>
        </div>
    </div>
</div>
