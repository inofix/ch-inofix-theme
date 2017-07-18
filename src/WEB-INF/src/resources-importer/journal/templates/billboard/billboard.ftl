<#--
    billboard.ftl: Format the billboard structure
    
    Created:    2017-06-27 22:23 by Christian Berndt
    Modified:   2017-07-18 17:46 by Christian Berndt
    Version:    1.1.0
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
            <div class="${css_class}">
                <div class="claim">
                    <h1>${claim.getData()}</h1>
                </div>
            </div>
            <#if has_images>
                <div class="col-md-6">
                    <div class="keyvisual">
                        <#if image.getSiblings()?size gt 1>
                            <div class="image-wrapper">
                                <div class="carousel slide carousel-fade" id="carousel-billboard">
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
                                                    <div class="caption">${cur_image.getAttribute("alt")}</div>
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

<script>

    // init billboard carousel
    $('#carousel-billboard').carousel({})

    Liferay.on('endNavigate', function() {
        // re-init after senna navigation event
        $('#carousel-billboard').carousel({})
    });

</script>
