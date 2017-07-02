<#--
    billboard.ftl: Format the billboard structure
    
    Created:    2017-06-27 22:23 by Christian Berndt
    Modified:   2017-07-02 22:31 by Christian Berndt
    Version:    1.0.3
-->

<#assign css_class = "col-md-12 text-only" />
<#assign has_images = image?? && image.getData()?? && image.getData() != ""/>

<#if has_images>
    <#assign css_class = "col-md-6" />
</#if>

<div class="billboard">
    <div class="text-wrapper">
        <div class="container">
            <div class="row">
                <div class="${css_class}">
                    <div class="claim">
                        <h1>${claim.getData()}</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#if has_images>
        <div class="image-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-6">
                        <img alt="${image.getAttribute("alt")}" src="${image.getData()}" />
                    </div>
                </div>
            </div>
        </div>
        
        <#if image.getAttribute("alt")?has_content>    
            <div class="caption-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-6">
                            <div class="caption muted">${image.getAttribute("alt")}</div>
                        </div>
                    </div>
                </div>
            </div>
        </#if>
    </#if>
</div>
