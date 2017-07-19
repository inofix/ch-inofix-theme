<#--
    article.ftl: Format the article structure

    Created:    2015-12-29 17:36 by Christian Berndt
    Modified:   2017-07-19 12:03 by Christian Berndt
    Version:    1.0.1
-->

<#assign displayToc = false />

<#if showToc?? && showToc.getData()?has_content>
    <#assign displayToc = getterUtil.getBoolean(showToc.getData()) />
</#if>

<div class="article">
    <div class="container">
        <div class="row">
            <#assign cssClass = "col-md-8 col-md-offset-2" />
            
            <#if displayToc >
                <#assign cssClass = "col-md-8" />       
            </#if>    
    
            <div class="${cssClass}">
                
                <#if headline?? && headline.getData()?has_content>
                    <h1 id="section-0">${headline.getData()}</h1>
                </#if>
                
                <#if summary?? && summary.getData()?has_content>
                    <p class="lead">${summary.getData()}</p>
                </#if>
                
                <#if section?? >
                    <#if section.getSiblings()?has_content>
                        <#assign i = 1 />
                        <#list section.getSiblings() as cur_section>
                            <div class="section" id="section-${i}">                       
                                <#if cur_section.getData()?has_content>
                                    <h2>${cur_section.getData()}</h2>
                                </#if>
                                <#if cur_section.content.getData()?has_content>
                                    <div class="section-content">${cur_section.content.getData()}</div>
                                </#if>
                            </div>
                            <#assign i = i+1 />
                        </#list>
                    </#if>
                </#if>             
            </div> <#-- / .col-md-8 -->
            
            <#if displayToc>        
                <div class="col-md-3 col-md-offset-1">
                    <div class="toc" id="toc">
                        <ul class="nav nav-list">                        
                            <#if section.getSiblings()?has_content>
                                <#assign i = 1 />
                                <#list section.getSiblings() as cur_section >
                                    <#if cur_section.getData()?has_content >
                                        <li class="">
                                            <a href="#section-${i}">${cur_section.getData()}</a>
                                        </li>
                                    </#if>
                                    <#assign i = i+1 />
                                </#list>
                            </#if>
                        </ul>
                    </div> <#-- / .toc -->
                </div> <#-- / .col-md-4 -->
            </#if>
        </div> <#-- / .row -->
    </div> <#-- / .container -->
</div> <#-- / .article -->

<script>

    // affix toc
    function affixToc() {
        $('#toc').affix({
            offset: {
                top: 60,
                bottom: function () {
                    return (this.bottom = $('#footer').outerHeight(true))
                }
            }
        });
    }; 
    
    affixToc(); 

    Liferay.on('endNavigate', function() {
        // re-affix toc
        affixToc(); 
    });

</script>