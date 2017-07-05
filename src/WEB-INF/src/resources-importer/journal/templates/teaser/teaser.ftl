<#--
    teaser.ftl: Format the teaser structure
    
    Created:    2017-07-02 23:29 by Christian Berndt
    Modified:   2017-07-02 23:29 by Christian Berndt
    Version:    1.0.0
-->

<#assign color_scheme = "lightgray" />

<div class="teaser ${color_scheme}">
    <div class="container-fluid">
        <div class="row">
             <div class="col-md-6 left">
                <div class="image-wrapper">
                    <div class="icon-wrapper">
                        <span class="icon icon-comments"></span>
                    </div>
                    <h2>${headline.getData()}</h2>
                </div>
            </div> 
            <div class="col-md-6 right">
                <div class="text-wrapper">
                    <h3>Strategie und Technik</h3>
                    <h2>Technologie ganzheitlich betrachtet</h2>
                    <div>
                        ${content.getData()}
            		</div>
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