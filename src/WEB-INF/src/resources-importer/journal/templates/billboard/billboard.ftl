<#--
    billboard.ftl: Format the billboard structure
    
    Created:    2017-06-27 22:23 by Christian Berndt
    Modified:   2017-06-27 22:23 by Christian Berndt
    Version:    1.0.0
-->

<div class="billboard">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="claim">
                    <h1>${claim.getData()}</h1>
                </div>
            </div>
            <#if image.getData()?? && image.getData() != "">
                <div class="col-md-6">
                    <div class="image-wrapper">
                        <img alt="${image.getAttribute("alt")}" src="${image.getData()}" />
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div>
